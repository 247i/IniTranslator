{@abstract(Implementaiton of ResX parser) }
{
  Copyright © 2007 by Peter Thornqvist; all rights reserved

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

// $Id: ResXParserImpl.pas 269 2007-10-21 15:49:52Z peter3 $
unit ResXParserImpl;

interface
uses
  SysUtils, TransIntf;

type
  TResXParser = class(TInterfacedObject, IInterface, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    Findex:integer;
    FApplicationServices:IApplicationServices;
    FOrigFilename, FTransFilename, FMimeTypes:WideString;
    FMetaData:boolean;
    procedure LoadSettings;
    procedure SaveSettings;
    function Translate(const Value:WideString):WideString;
  protected
    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function GetString(out Section: WideString; out Name: WideString;
      out Value: WideString): WordBool; safecall;
  public
    constructor Create;
    destructor Destroy; override;
  end;
{
 limitations:
 * since the original file is used as the template when saving, any special text or formatting
   in the translation file is lost
 * orphans in the translation are added to the orphans list but there is no way to add them back into
   the original or translation
}


implementation
uses
  Forms, Dialogs, xmldoc, xmldom, xmlintf,
  TntClasses, TntSysUtils, IniFiles,
  PreviewExportFrm, DualImportFrm, Math;

resourcestring
  cResXImportTitle = 'Import from ResX file';
  cResXExportTitle = 'Export to ResX file';
  cResXFilter = 'ResX files (*.resx)|*.resx|All files (*.*)|*.*';
  cSectionName = 'ResX';

var
  XML:WideString = '';
  Encoding:WideString = 'UTF-8';

const
  cTranslationItem:WideString = '%%%%%%%%T%d%%%%%%%%';

{ TResXParser }

function TResXParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TResXParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TResXParser.Create;
begin
  FOldAppHandle := Application.Handle;
  inherited Create;
end;

destructor TResXParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TResXParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cResXImportTitle);
    CAP_EXPORT:
      Result := Translate(cResXExportTitle);
  else
    Result := '';
  end;
end;

function TResXParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
  function WrapTags(const T:ITranslationItem):WideString;
  begin
    if T.Translation = '' then
      Result := #13#10#9#9'<value/>'
   else
     Result := WideFormat(#13#10#9#9'<value>%s</value>',[T.Translation]);
   if T.TransComments <> '' then
     Result := Result + WideFormat(#13#10#9#9'<comment>%s</comment>',[T.TransComments]);
   Result := Result + #13#10#9;
  end;

  procedure BuildPreview(const Items, Orphans:ITranslationItems; Strings:TTntStrings);
  var
    S:WideString;
    i:integer;
    TI:ITranslationItem;
  begin
    S := TnT_WideStringReplace(XML,'</root>','',[rfReplaceAll]); // preserve template in case user exports more than once
    for i := 0 to Items.Count - 1 do
    begin
      TI := Items[i];
      if TI.PreData = '' then
        S := S + #13#10#9 + TI.PostData;
      S := Tnt_WideStringReplace(S, WideFormat(cTranslationItem, [TI.Index]), WrapTags(TI), [rfReplaceAll]);
    end;
    S := S + #13#10'</root>';
    Strings.Text := S;
  end;
  var
    XmlDoc:IXMLDocument;
    Strings:TTntStringlist;
begin
  Result := S_FALSE;
  LoadSettings;
  Strings := TTntStringlist.Create;
  try
    try
      BuildPreview(Items, Orphans, Strings);
      if TfrmExport.Execute(FApplicationServices, FTransFilename, Translate(cResXExportTitle), Translate(cResXFilter), '.', '.resx', Strings) then
      begin
        SaveSettings;
        XmlDoc := NewXMLDocument();
        XmlDoc.Options := XmlDoc.Options + [doNodeAutoIndent]; 
        XmlDoc.LoadFromXml(Strings.Text);
        if Encoding = '' then
          Encoding := 'UTF-8';
        XmlDoc.Encoding := Encoding;
        
        XmlDoc.SaveToFile(FTransFilename);
        Result := S_OK;
      end;
    finally
      Strings.Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TResXParser.GetString(out Section, Name,
  Value: WideString): WordBool;
begin
  Result := true;
  case FIndex of
    0: Value := cResXFilter;
    1: Value := cResXImportTitle;
    2: Value := cResXExportTitle;
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

function TResXParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;

var
  NodeList:IDOMNodeList;
  ParentNode, TargetNode, CommentNode:IDOMNode;
  TI:ITranslationItem;
  FXMLImport:IXMLDocument;
  Name:WideString;

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
  
  function IsMatchingNode(ParentNode:IDOMNode; out ValueNode:IDOMNode; out CommentNode: IDOMNode; out Name:WideString):boolean;
  var
    NameNode:IDOMNode;
    i:integer;
  begin
    Result := false;
    ValueNode := nil;
    CommentNode := nil;
    Name := '';


    NameNode := ParentNode.attributes.getNamedItem('name');
    if NameNode <> nil then
      Name := NameNode.nodeValue
    else
      Exit;

    //NameNode := ParentNode.attributes.getNamedItem('type');
    //if NameNode <> nil then
    //  Exit;

    NameNode := ParentNode.attributes.getNamedItem('mimetype');
    if (NameNode <> nil) then
    begin
      // check if this is a mimetype the user wants to import
      if (FMimeTypes = '') or (NameNode.nodeValue = '') or (WideTextPos(NameNode.nodeValue, FMimeTypes) < 1) then
        Exit;
    end;

    for i := 0 to ParentNode.childNodes.length-1 do
      if ParentNode.childNodes[i].nodeName = 'value' then
      begin
        ValueNode := ParentNode.childNodes[i];
        Result := true;
      end
      else if ParentNode.childNodes[i].nodeName = 'comment' then
        CommentNode := ParentNode.childNodes[i];
  end;

  procedure RemoveContent(ParentNode, TargetNode, CommentNode:IDOMNode; XMLDoc:IXMLDocument; Index:integer);
  var j:integer;
  begin
    // preserve content of (meta)data node but remove any inner text nodes
    // we use this template in the translation when exporting (see ExportItems)
    if TargetNode <> nil then
      ParentNode.removeChild(TargetNode);
    if CommentNode <> nil then
      ParentNode.removeChild(CommentNode);
    // remove any redunant text nodes but leave any other nodes alone
    for j := ParentNode.childNodes.length - 1 downto 0 do
      if (ParentNode.childNodes[j].nodeType = TEXT_NODE) and (trim(ParentNode.childNodes[j].nodeValue) = '') then
        ParentNode.removeChild(ParentNode.childNodes[j]);
    TargetNode := XMLDoc.DOMDocument.createTextNode('');
    TargetNode.nodeValue := WideFormat(cTranslationItem, [Index]);
    ParentNode.appendChild(TargetNode);
  end;
  
  procedure GetOriginalNodes(TagName:WideString);
  var i:integer;
  begin
    NodeList := FXMLImport.DOMDocument.getElementsByTagName(TagName);
    for i := 0 to NodeList.length-1 do
    begin
      ParentNode := NodeList[i];

      if IsMatchingNode(ParentNode, TargetNode, CommentNode, Name) then
      begin
        TI := Items.Add;
        TI.Section := cSectionName;
        TI.Name := Name;
        if CommentNode <> nil then
          TI.OrigComments := StripTags((CommentNode as IDOMNodeEx).xml);
        TI.Original := StripTags((TargetNode as IDOMNodeEx).xml);
        RemoveContent(ParentNode, TargetNode, CommentNode, FXMLImport, TI.Index);
        TI.PostData := (ParentNode as IDOMNodeEx).xml; // template for missing items
      end;
    end;
  end;

  procedure GetTranslationNodes(TagName:WideString);
  var i,j:integer;
  begin
    NodeList := FXMLImport.DOMDocument.getElementsByTagName(TagName);
    for i := 0 to NodeList.length-1 do
    begin
      ParentNode := NodeList[i];
      if IsMatchingNode(ParentNode, TargetNode, CommentNode, Name) then
      begin
        j := Items.IndexOf(cSectionName,Name);
        if j >= 0 then
        begin
          TI := Items[j];
          if CommentNode <> nil then
            TI.TransComments := StripTags((CommentNode as IDOMNodeEx).xml);
          TI.Translation := StripTags((TargetNode as IDOMNodeEx).xml);
          TI.Translated := TI.Translation <> '';
          TI.PreData := '~'; // marker so we know that this was in the file from the beginning
          RemoveContent(ParentNode, TargetNode, CommentNode, FXMLImport, TI.Index);
        end
        else // not found in original, add to orphans
        begin
          TI := Orphans.Add;
          TI.Section := cSectionName;
          TI.Name := Name;
          if CommentNode <> nil then
            TI.OrigComments := StripTags((CommentNode as IDOMNodeEx).xml);
          TI.Original := StripTags((TargetNode as IDOMNodeEx).xml);
          TI.Translation := TI.Original;
          // remove this node altogether
          TargetNode := ParentNode;
          ParentNode := ParentNode.parentNode;
          if (ParentNode <> nil) and (TargetNode <> nil) then
            ParentNode.removeChild(TargetNode);
          TargetNode := nil;
        end;
      end;
    end;
  end;
begin
  Result := S_FALSE;
  try
    Items.Clear;
    Orphans.Clear;
    LoadSettings;
    if TfrmDualImport.Execute(FApplicationServices, FOrigFilename, FTransFilename, Translate(cResXImportTitle), Translate(cResXFilter), '.', '.resx') then
    begin
      SaveSettings;
      // read original file
      FXMLImport := LoadXMLDocument(FOrigFilename);
      if Assigned(FXMLImport) and Assigned(FXMLImport.DOMDocument) then
      begin
        GetOriginalNodes('data');
        if FMetaData then
          GetOriginalNodes('metadata');
      end;
      // read translation file
      FXMLImport := LoadXMLDocument(FTransFilename);
      if Assigned(FXMLImport) and Assigned(FXMLImport.DOMDocument) then
      begin
        GetTranslationNodes('data');
        if FMetaData then
          GetTranslationNodes('metadata');
      end;
      Encoding := FXMLImport.Encoding;
      FXMLImport.SaveToXML(XML); // save the translation in a string as our reference file
      SaveSettings;
      Items.Modified := false;

      Result := S_OK;
    end;
    FXMLImport := nil;
  except
    Application.HandleException(self);
  end;
end;

procedure TResXParser.Init(const ApplicationServices:IApplicationServices);
begin
  if FOldAppHandle = 0 then
    FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
  FApplicationServices := ApplicationServices;
end;

procedure TResXParser.LoadSettings;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    FOrigFilename := ReadString('Settings', 'OriginalFilename', FOrigFilename);
    FTransFilename := ReadString('Settings', 'TranslationFilename', FTransFilename);
    FMimeTypes := ReadString('Settings','MimeTypes', '');
    FMetaData  := ReadBool('Settings','MetaData', false);
  finally
    Free;
  end;
end;

procedure TResXParser.SaveSettings;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    WriteString('Settings', 'OriginalFilename', FOrigFilename);
    WriteString('Settings', 'TranslationFilename', FTransFilename);
    WriteString('Settings','MimeTypes', FMimeTypes);
    WriteBool('Settings','MetaData', FMetaData);
  finally
    Free;
  end;
end;

function TResXParser.Translate(const Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

end.
