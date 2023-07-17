{@abstract(Parser for TMX) }
{
  Copyright © 2004-2005 by Peter Thornqvist; all rights reserved

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
// $Id: FoxitParser.pas 143 2006-12-01 16:23:53Z peter3 $

unit TMXParserImpl;

interface
uses
  Classes, Types, TntClasses, TntSysUtils, TransIntf;

type
  TTMXParser = class(TInterfacedObject, IUnknown, IFileParser)
  private
    FOldAppHandle: Cardinal;
    FOrigFile, FOrigLang, FTransLang: string;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items: ITranslationItems; Strings: TTntStrings);
  public
    constructor Create;
    destructor Destroy; override;

    function Capabilities: Integer; safecall;
    function Configure(Capability: Integer): HRESULT; safecall;
    function DisplayName(Capability: Integer): WideString; safecall;
    function ExportItems(const Items: ITranslationItems;
      const Orphans: ITranslationItems): HRESULT; safecall;
    function ImportItems(const Items: ITranslationItems;
      const Orphans: ITranslationItems): HRESULT; safecall;
    procedure Init(const ApplicationServices: IApplicationServices); safecall;
  end;

implementation
uses
  SysUtils, Forms, IniFiles, PreviewExportFrm, TMXImportFrm,
  xmlintf, xmldoc, xmldom;

const
  cTMXFilter = 'TMX Files (*.tmx)|*.tmx|All files (*.*)|*.*';
  cTMXImportTitle = 'Import from TMX file';
  cTMXExportTitle = 'Export to TMX file';
  cOriginalItem:WideString = '!!!!Original%d!!!!';
  cTranslationItem:WideString = '!!!!Translation%d!!!!';

var
  XML: WideString = '';

{ TTMXParser }

procedure TTMXParser.BuildPreview(Items: ITranslationItems; Strings: TTntStrings);
var
  i: integer;
  TI: ItranslationItem;
  S:WideString;
begin
  if XML = '' then
    raise Exception.Create('Building TMX file from scratch not supported. Please import from a TMX file before trying to export.');
  S := XML; // keep original import untouched so we can reuse it!
  for i := 0 to Items.Count - 1 do
  begin
    TI := Items[i];
    S := Tnt_WideStringReplace(S, WideFormat(cOriginalItem, [TI.Index]), '<seg>' + TI.Original + '</seg>', [rfReplaceall]);
    S := Tnt_WideStringReplace(S, WideFormat(cTranslationItem, [TI.Index]), '<seg>' + TI.Translation + '</seg>', [rfReplaceall]);
  end;
  Strings.Text := S;
end;

function TTMXParser.Capabilities: Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TTMXParser.Configure(Capability: Integer): HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TTMXParser.Create;
begin
  inherited;
  FOldAppHandle := Application.Handle;
end;

destructor TTMXParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TTMXParser.DisplayName(Capability: Integer): WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := cTMXImportTitle;
    CAP_EXPORT:
      Result := cTMXExportTitle;
  else
    Result := '';
  end;
end;

function TTMXParser.ExportItems(const Items, Orphans: ITranslationItems): HRESULT;
var
  S: TTntStringlist;
  FOldSort: TTranslateSortType;
begin
  Result := S_FALSE;
  FOldSort := Items.Sort;
  try
    LoadSettings;
    Items.Sort := stIndex;
    S := TTntStringlist.Create;
    try
      BuildPreview(Items, S);
      if TfrmExport.Execute(FOrigFile, cTMXExportTitle, cTMXFilter, '.', 'tmx', S) then
      begin
        S.SaveToFile(FOrigFile);
        Result := S_OK;
        SaveSettings;
      end;
    finally
      S.Free;
      Items.Sort := FOldSort;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TTMXParser.ImportItems(const Items, Orphans: ITranslationItems): HRESULT;
type
  TFoundItem = (fiOriginal, fiTranslation);
  TFoundItems = set of TFoundItem;

var
  NodeList: IDOMNodeList;
  Node, ChildNode: IDOMNode;
  i: integer;
  TI: ITranslationItem;
  FFoundItems: TFoundItems;
  FXMLImport: IXMLDocument;

  function IsOriginal(const Attributes: IDOMNamedNodeMap): boolean;
  begin
    Result := (Attributes <> nil) and (Attributes.getNamedItem('xml:lang') <> nil)
      and WideSameText(Attributes.getNamedItem('xml:lang').nodeValue, FOrigLang);
  end;

  function IsTranslation(const Attributes: IDOMNamedNodeMap): boolean;
  begin
    Result := (Attributes <> nil) and (Attributes.getNamedItem('xml:lang') <> nil)
      and WideSameText(Attributes.getNamedItem('xml:lang').nodeValue, FTransLang);
  end;

  function RemoveTags(const S:WideString):WideString;
  begin
    Result := Tnt_WideStringReplace(S, '<seg>', '', [rfReplaceAll]);
    Result := Tnt_WideStringReplace(Result, '</seg>', '', [rfReplaceAll]);
  end;
begin
  Result := S_FALSE;
  FFoundItems := [];
  try
    Items.Clear;
    Orphans.Clear;
    LoadSettings;
    if TfrmTMXImport.Execute(FOrigFile, FOrigLang, FTransLang, cTMXImportTitle, cTMXFilter, '.', 'tmx') then
    begin
      FXMLImport := TXMLDocument.Create(nil);
      try
        FXMLImport.LoadFromFile(FOrigFile);

        if FXMLImport.DOMDocument <> nil then
        begin
          NodeList := FXMLImport.DOMDocument.getElementsByTagName('tuv');
          if NodeList <> nil then
            for i := 0 to NodeList.length - 1 do
            begin
              Node := NodeList.item[i];
              if IsOriginal(Node.attributes) then
              begin
                ChildNode := Node.firstChild;
                if (ChildNode <> nil) and (ChildNode.nodeName = 'seg') then
                begin
                  if TI = nil then
                    TI := Items.Add;
                  TI.Original := RemoveTags((ChildNode as IDOMNodeEx).xml);
                  Node.removeChild(ChildNode);
                  ChildNode := FXMLImport.DOMDocument.createTextNode('');
                  ChildNode.nodeValue := WideFormat(cOriginalItem,[TI.Index]);
                  Node.appendChild(ChildNode);
                  Include(FFoundItems, fiOriginal);
                end;
              end
              else if IsTranslation(Node.attributes) then
              begin
                ChildNode := Node.firstChild;
                if (ChildNode <> nil) and (ChildNode.nodeName = 'seg') then
                begin
                  if TI = nil then
                    TI := Items.Add;
                  TI.Translation := RemoveTags((ChildNode as IDOMNodeEx).xml);
                  Node.removeChild(ChildNode);
                  ChildNode := FXMLImport.DOMDocument.createTextNode('');
                  ChildNode.nodeValue := WideFormat(cTranslationItem,[TI.Index]);
                  Node.appendChild(ChildNode);
                  Include(FFoundItems, fiTranslation);
                end;
              end;
              if FFoundItems = [fiTranslation, fiOriginal] then
              begin
                if TI <> nil then
                  TI.Translated := TI.Translation <> '';
                TI := nil;
                FFoundItems := [];
              end;
            end;
        end;
        SaveSettings;
        Items.Modified := false;
        FXMLImport.SaveToXML(XML); // save the imported data in a string
        Result := S_OK;
      finally
        FXMLImport := nil;
      end;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TTMXParser.Init(const ApplicationServices: IApplicationServices);
begin
  Application.Handle := ApplicationServices.AppHandle;
end;

procedure TTMXParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FOrigLang := ReadString('Settings', 'OrigLang', FOrigLang);
      FTransLang := ReadString('Settings', 'TransLang', FTransLang);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TTMXParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'OrigLang', FOrigLang);
      WriteString('Settings', 'TransLang', FTransLang);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.

