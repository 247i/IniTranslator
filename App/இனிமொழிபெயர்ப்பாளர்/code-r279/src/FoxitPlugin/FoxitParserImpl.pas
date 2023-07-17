{@abstract(Parser for Foxit PDF Reader) }
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
// $Id: FoxitParserImpl.pas 278 2007-11-05 20:34:05Z peter3 $

unit FoxitParserImpl;

interface
uses
  Classes, Types, TntClasses, TntSysUtils, TransIntf;

type
  TFoxitParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FIndex:integer;
    FApplicationServices:IApplicationServices;
    FOrigFile, FTransFile:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
    function Translate(Value: WideString): WideString;
    function GetString(out Section: WideString; out Name: WideString;
      out Value: WideString): WordBool; safecall;
  public
    constructor Create;
    destructor Destroy; override;

    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
  end;

implementation
uses
  Windows, SysUtils, Forms, IniFiles, PreviewExportFrm, DualImportFrm,
  TntSystem, xmlintf, xmldoc, xmldom;

const
  cFoxitFilter = 'Foxit Files (*.xml)|*.xml|All files (*.*)|*.*';
  cFoxitImportTitle = 'Import from Foxit file';
  cFoxitExportTitle = 'Export to Foxit file';
  cSectionName  = 'Foxit';
  cDialogItem = 'dlgitem';
  cPopupItem = 'popup';
  cMenuItem = 'menuitem';
  cStringItem = 'string';

  cReplaceID = '!!!!%d!!!!';

var
  XML:WideString = '';

{ TFoxitParser }

function XMLEncode(const S:WideString):WideString;
begin
  Result := Tnt_WideStringReplace(S, '&', '&amp;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '''', '&apos;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

function TFoxitParser.Translate(Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

procedure TFoxitParser.BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
var
  i:integer;
  TI:ITranslationItem;
  S:WideString;
begin
  if XML = '' then
    raise Exception.Create('Building Foxit file from scratch not supported. Please import from a Foxit file before trying to export.');
  S := XML; // keep original import untouched so we can reuse it!
  Items.Sort := stIndex;
  for i := 0 to Items.Count - 1 do
  begin
    TI := Items[i];
    S := Tnt_WideStringReplace(S, WideFormat(cReplaceID, [TI.Index]), XMLEncode(TI.Translation), [rfReplaceall]);
  end;
  Strings.Text := S;
end;

function TFoxitParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TFoxitParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TFoxitParser.Create;
begin
  inherited;
  FOldAppHandle := Application.Handle;
end;

destructor TFoxitParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TFoxitParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cFoxitImportTitle);
    CAP_EXPORT:
      Result := Translate(cFoxitExportTitle);
  else
    Result := '';
  end;
end;

function TFoxitParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  FOldSort:TTranslateSortType;
begin
  Result := S_FALSE;
  FOldSort := Items.Sort;
  try
    LoadSettings;
    Items.Sort := stIndex;
    S := TTntStringlist.Create;
    try
      BuildPreview(Items, S);
      if TfrmExport.Execute(FApplicationServices, FTransFile, Translate(cFoxitExportTitle), Translate(cFoxitFilter), '.', 'xml', S) then
      begin
        S.Text := WideStringToUTF8(S.Text);
        S.AnsiStrings.SaveToFile(FTransFile);
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

function TFoxitParser.GetString(out Section, Name,
  Value: WideString): WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := cFoxitFilter;
    1:Value := cFoxitImportTitle;
    2:Value := cFoxitExportTitle;
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

function TFoxitParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
type
  TFoundItem = (fiOriginal, fiTranslation);
  TFoundItems = set of TFoundItem;

var
  NodeList:IDOMNodeList;
//  Node, ChildNode: IDOMNode;
//  i: integer;
  TI:ITranslationItem;
  FFoundItems:TFoundItems;
  FXMLImport:IXMLDocument;

  function FindItem(const Section, Name:WideString):ITranslationItem;
  var
    i:integer;
  begin
    for i := 0 to Items.Count - 1 do
      if WideSameText(Section, Items[i].Section) and WideSameText(Name, Items[i].Name) then
      begin
        Result := Items[i];
        Exit;
      end;
    Result := nil;
  end;

  function GetName(const ANode:IDOMNode):WideString;
  var
    N:IDOMNode;
  begin
    N := ANode;
    Result := '';
    while N <> nil do
    begin
      if Result <> '' then
        Result := '-' + Result;
      if (N.attributes <> nil) and (N.attributes.getNamedItem('id') <> nil) then
        Result := N.attributes.getNamedItem('id').nodeValue + Result;
      N := N.parentNode;
    end;
  end;

  procedure ImportOriginalItem(const ItemName:WideString);
  var
    i:integer;
  begin
    NodeList := FXMLImport.DOMDocument.getElementsByTagName(ItemName);
    if NodeList <> nil then
      for i := 0 to NodeList.length - 1 do
        if (NodeList[i].attributes <> nil) and (NodeList[i].attributes.getNamedItem('text') <> nil) and (NodeList[i].attributes.getNamedItem('id') <> nil) then
        begin
          TI := Items.Add;
          TI.Section := ItemName;
          TI.Original := NodeList[i].attributes.getNamedItem('text').nodeValue;
          NodeList[i].attributes.getNamedItem('text').nodeValue := Format(cReplaceID, [TI.Index]);
          TI.Name := GetName(NodeList[i]);
        end;

  end;

  procedure ImportTranslationItem(const ItemName:WideString);
  var
    i:integer;
  begin
    NodeList := FXMLImport.DOMDocument.getElementsByTagName(ItemName);
    if NodeList <> nil then
      for i := 0 to NodeList.length - 1 do
        if (NodeList[i].attributes <> nil) and (NodeList[i].attributes.getNamedItem('text') <> nil) and (NodeList[i].attributes.getNamedItem('id') <> nil) then
        begin
          TI := FindItem(ItemName, GetName(NodeList[i]));
          if TI <> nil then
          begin
            TI.Translation := NodeList[i].attributes.getNamedItem('text').nodeValue;
            TI.Translated := TI.Translation <> '';
            // NodeList[i].attributes.getNamedItem('text').nodeValue := Format(cReplaceID, [TI.Index]);
          end
          else // not found in original, so can be an orphan
          begin
            TI := Orphans.Add;
            TI.Section := ItemName;
            TI.Original := NodeList[i].attributes.getNamedItem('text').nodeValue;
            TI.Translation := TI.Original;
            TI.Name := GetName(NodeList[i]);
          end;
        end;
  end;
begin
  Result := S_FALSE;
  FFoundItems := [];
  try
    Items.Clear;
    Orphans.Clear;
    LoadSettings;
    if TfrmDualImport.Execute(FApplicationServices, FOrigFile, FTransFile, Translate(cFoxitImportTitle), Translate(cFoxitFilter), '.', 'xml') then
    begin
      FXMLImport := TXMLDocument.Create(FOrigFile);
      try
        // FXMLImport.LoadFromFile(FOrigFile);
        // TODO: load original items
        if FXMLImport.DocumentElement <> nil then
        begin
          ImportOriginalItem(cPopupItem);
          ImportOriginalItem(cMenuItem);
          ImportOriginalItem(cDialogItem);
          ImportOriginalItem(cStringItem);
        end;
        FXMLImport.SaveToXML(XML); // save the imported *original* data in a string - this will automatically adjust the translation so new items are added and old items are discarded

        FXMLImport := TXMLDocument.Create(FTransFile);
        FXMLImport.LoadFromFile(FTransFile);
        if FXMLImport.DocumentElement <> nil then
        begin
          ImportTranslationItem(cPopupItem);
          ImportTranslationItem(cMenuItem);
          ImportTranslationItem(cDialogItem);
          ImportTranslationItem(cStringItem);
        end;
        SaveSettings;
        Items.Modified := false;
        Orphans.Modified := false;
        Result := S_OK;
      finally
        FXMLImport := nil;
      end;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TFoxitParser.Init(const ApplicationServices:IApplicationServices);
begin
  Application.Handle := ApplicationServices.AppHandle;
  FApplicationServices := ApplicationServices;
end;

procedure TFoxitParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TFoxitParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.
