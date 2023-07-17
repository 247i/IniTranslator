{@abstract(Implementaiton of XLIFF parser) }
{
  Copyright © 2006 by Peter Thornqvist; all rights reserved

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}

// $Id: XLIFFParserImpl.pas 269 2007-10-21 15:49:52Z peter3 $
unit XLIFFParserImpl;

interface
uses
  SysUtils, TransIntf;

type
  TXLIFFParser = class(TInterfacedObject, IInterface, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FIndex:integer;
    FApplicationServices:IApplicationServices;
    FFilename:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    function Translate(const Value:WideString):WideString;
    function GetString(out Section: WideString; out Name: WideString;
      out Value: WideString): WordBool; safecall;
  protected
    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;

  public
    constructor Create;
    destructor Destroy; override;
  end;
{
 limitations:
 * does not handle "alt-trans" tags (and it shouldn't)
 * always chooses the first source and the first target in each trans-unit (there should really only be one of each) even if there are more
 * does not work with MSXML 4.0 (getelementsbyTagName always returns empty lists for default NS)
}

implementation
uses
  Forms, Dialogs, xmldoc, xmldom, xmlintf,
  TntClasses, TntSysUtils, IniFiles,
  PreviewExportFrm, SingleImportFrm, Math;

resourcestring
  cXLIFFImportTitle = 'Import from XLIFF file';
  cXLIFFExportTitle = 'Export to XLIFF file';
  cXLIFFFilter = 'XLIFF files (*.xlf)|*.xlf|All files (*.*)|*.*';
  cSectionName = 'XLIFF';

var
  XML:WideString = '';
const
  cTranslationItem:WideString = '%%%%%%%%T%d%%%%%%%%';
  cOriginalItem:WideString = '%%%%%%%%O%d%%%%%%%%';

{ TXLIFFParser }

function TXLIFFParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TXLIFFParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TXLIFFParser.Create;
begin
  FOldAppHandle := Application.Handle;
  inherited Create;
end;

destructor TXLIFFParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TXLIFFParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cXLIFFImportTitle);
    CAP_EXPORT:
      Result := Translate(cXLIFFExportTitle);
  else
    Result := '';
  end;
end;

function TXLIFFParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  Strings:TTntStringlist;

  function WrapTags(const T:ITranslationItem; IsOriginal:boolean):WideString;
  begin
    if IsOriginal then
      Result := WideFormat('%s%s</source>', [T.PreData, T.Original])
    else
      Result := WideFormat('%s%s</target>', [T.PostData, T.Translation])
  end;
  procedure BuildPreview(const Items, Orphans:ITranslationItems; Strings:TTntStrings);
  var
    S:WideString;
    i:integer;
    TI:ITranslationItem;
  begin
    S := XML;
    for i := 0 to Items.Count - 1 do
    begin
      TI := Items[i];
      S := Tnt_WideStringReplace(S, WideFormat(cOriginalItem, [TI.Index]), WrapTags(TI, true), [rfReplaceAll]);
      S := Tnt_WideStringReplace(S, WideFormat(cTranslationItem, [TI.Index]), WrapTags(TI, false), [rfReplaceAll]);
    end;
    Strings.Text := S;
  end;
begin
  Result := S_FALSE;
  LoadSettings;
  Strings := TTntStringlist.Create;
  try
    try
      BuildPreview(Items, Orphans, Strings);
      if TfrmExport.Execute(FApplicationServices, FFilename, Translate(cXLIFFExportTitle), Translate(cXLIFFFilter), '.', '.xlf', Strings) then
      begin
        SaveSettings;
        Strings.SaveToFile(FFilename);
        Result := S_OK;
      end;
    finally
      Strings.Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TXLIFFParser.GetString(out Section, Name,
  Value: WideString): WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := cXLIFFFilter;
    1:Value := cXLIFFImportTitle;
    2:Value := cXLIFFExportTitle;
  else
    Result := false;
  end;
  if Result then
  begin
    Section := cSectionName;
    Name := Value;
    Inc(FIndex);
  end
  else
    FIndex := 0;
end;

function TXLIFFParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
type
  TFoundItem = (fiOriginal, fiTranslation);
  TFoundItems = set of TFoundItem;

var
  NodeList, SourceNodes, TargetNodes:IDOMNodeList;
  ParentNode, SourceNode, TargetNode:IDOMNode;
  i:integer;
  TI:ITranslationItem;
  FFoundItems:TFoundItems;
  FXMLImport:IXMLDocument;

  function SaveTag(const S:WideString):WideString;
  var
    i:integer;
  begin
    Result := S;
    i := 1;
    while i <= Length(Result) do
    begin
      if Result[i] = '>' then
      begin
        Result := Copy(Result, 1, i);
        Exit;
      end;
      Inc(i);
    end;
    Result := '';
  end;
  function StripTags(const S:WideString):WideString;
  var
    i:integer;
  begin
    Result := S;
    // strip start tag
    i := 1;
    while i <= Length(Result) do
    begin
      if Result[i] = '>' then
      begin
        Result := Copy(Result, i + 1, MaxInt);
        Break;
      end;
      Inc(i);
    end;
    // strip end tag
    i := Length(Result);
    while i >= 1 do
    begin
      if Result[i] = '<' then
      begin
        SetLength(Result, i - 1);
        Break;
      end;
      Dec(i);
    end;
  end;
begin
  Result := S_FALSE;
  FFoundItems := [];
  try
    Items.Clear;
    Orphans.Clear;
    LoadSettings;
    if TfrmSingleImport.Execute(FApplicationServices, FFilename, Translate(cXLIFFImportTitle), Translate(cXLIFFFilter), '.', '.xlf') then
    begin
      SaveSettings;
      FXMLImport := LoadXMLDocument(FFilename);
      if Assigned(FXMLImport) and Assigned(FXMLImport.DOMDocument) then
      begin
        NodeList := FXMLImport.DOMDocument.getElementsByTagName('trans-unit');
        if Assigned(NodeList) then
        begin
          for i := 0 to NodeList.length - 1 do
          begin
            ParentNode := NodeList.item[i];
            SourceNodes := (ParentNode as IDOMElement).getElementsByTagName('source');
            TargetNodes := (ParentNode as IDOMElement).getElementsByTagName('target');
            if (SourceNodes.length > 0) then
              SourceNode := SourceNodes[0]
            else
              SourceNode := nil;
            if TargetNodes.length > 0 then
              TargetNode := TargetNodes[0]
            else
              TargetNode := nil;

            TI := Items.Add;
            TI.Section := cSectionName;

            if Assigned(SourceNode) then
            begin
              TI.Original := StripTags((SourceNode as IDOMNodeEx).xml);
              TI.PreData := SaveTag((SourceNode as IDOMNodeEx).xml);
              if TI.PreData = '' then
                TI.PreData := '<source>';
              ParentNode := SourceNode.parentNode;
              ParentNode.removeChild(SourceNode);
            end;
            SourceNode := FXMLImport.DOMDocument.createTextNode('');
            SourceNode.nodeValue := WideFormat(cOriginalItem, [TI.Index]);
            ParentNode.appendChild(SourceNode);

            if Assigned(TargetNode) then
            begin
              TI.Translation := StripTags((TargetNode as IDOMNodeEx).xml);
              TI.PostData := SaveTag((TargetNode as IDOMNodeEx).xml);
              if TI.PostData = '' then
                TI.PostData := '<target>';
              ParentNode := TargetNode.ParentNode;
              ParentNode.removeChild(TargetNode);
            end;
            TargetNode := FXMLImport.DOMDocument.createTextNode('');
            TargetNode.nodeValue := WideFormat(cTranslationItem, [TI.Index]);
            ParentNode.appendChild(TargetNode);
            TI.Translated := TI.Translation <> '';
          end;
        end;
      end;
      SaveSettings;
      Items.Modified := false;
      FXMLImport.SaveToXML(XML); // save the imported data in a WideString
      Result := S_OK;
    end;
    FXMLImport := nil;
  except
    Application.HandleException(self);
  end;
end;

procedure TXLIFFParser.Init(const ApplicationServices:IApplicationServices);
begin
  if FOldAppHandle = 0 then
    FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
  FApplicationServices := ApplicationServices;
end;

procedure TXLIFFParser.LoadSettings;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    FFilename := ReadString('Settings', 'Filename', FFilename);
  finally
    Free;
  end;
end;

procedure TXLIFFParser.SaveSettings;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    WriteString('Settings', 'Filename', FFilename);
  finally
    Free;
  end;
end;

function TXLIFFParser.Translate(const Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

end.
