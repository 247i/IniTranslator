{@abstract(Implementation for DC++ language file parser) }
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

// $Id: DCPPParserImpl.pas 269 2007-10-21 15:49:52Z peter3 $

unit DCPPParserImpl;

interface
uses
  Classes, SysUtils, Types, xmlintf, TransIntf, TntClasses;

type
  TDCPPParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FIndex:integer;
    FLanguageName, FAuthor, FVersion, FRevision, FRightToLeft, FEncoding,
      FOrigFile, FTransFile:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; xml:IXMLDocument);
  public
    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems; const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems; const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Windows, Forms, xmldom, xmldoc,
  DCPPParserConsts, WideIniFiles, TntSysUtils,
  DualImportFrm, PreviewExportFrm;

{ TDCPPParser }

function StripCRLF(const S:WideString):WideString;
begin
  Result := Tnt_WideStringReplace(S, CRLF, ' ', [rfReplaceAll]);
end;

function XMLEncode(const S:WideString):WideString;
begin
  Result := Tnt_WideStringReplace(S, '&', '&amp;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '''', '&apos;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := Tnt_WideStringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

procedure TDCPPParser.BuildPreview(Items:ITranslationItems; xml:IXMLDocument);
var
  i, OldSort:integer;
  node, node2:IXMLNode;
begin
  OldSort := Items.Sort;
  try
    xml.Active := true;
    xml.Options := [doNodeAutoCreate, doNodeAutoIndent, doAttrNull];
    Items.Sort := stIndex;
    node := xml.AddChild('Language');
    node.Attributes['Name'] := FLanguageName;
    node.Attributes['Author'] := FAuthor;
    node.Attributes['Version'] := FVersion;
    node.Attributes['Revision'] := FRevision;
    node.Attributes['RightToLeft'] := FRightToLeft;
    node := node.AddChild('Strings');
    for i := 0 to Items.Count - 1 do
    begin
      node2 := node.AddChild('String');
      node2.Attributes['Name'] := Items[i].Name;
      node2.NodeValue := Items[i].Translation;
    end;
    xml.Encoding := FEncoding;
    xml.StandAlone := 'yes';
  finally
    Items.Sort := OldSort;
  end;
end;

function TDCPPParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT or CAP_ITEM_DELETE or CAP_ITEM_EDIT or CAP_ITEM_INSERT;
end;

function TDCPPParser.Configure(Capability:Integer):HRESULT;
begin
  Result := S_FALSE;
end;

function TDCPPParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cImportTitle);
    CAP_EXPORT:
      Result := Translate(cExportTitle);
  else
    Result := '';
  end;
end;

function TDCPPParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  ExportOrig:boolean;
  FOldSort:TTranslateSortType;
  xml:IXMLDocument;
  S:TTntStringlist;
begin
  Result := S_FALSE;
  FOldSort := Items.Sort;
  try
    LoadSettings;
    Items.Sort := stIndex;
    xml := TXMLDocument.Create(nil);
    try
      BuildPreview(Items, xml);
      ExportOrig := FTransFile = '';
      if ExportOrig then
        FTransFile := FOrigFile;
      S := TTntStringlist.Create;
      try
        S.Assign(xml.XML);
        if TfrmExport.Execute(GlobalAppServices, FTransFile,
          Translate(cExportTitle), Translate(cDCPPFilter), '.', 'xml', S) then
        begin
          xml.LoadFromXML(S.Text);
          xml.SaveToFile(FTransFile);
          Result := S_OK;
          if ExportOrig then
          begin
            FOrigFile := FTransFile;
            FTransFile := '';
          end;
          SaveSettings;
        end;
      finally
        S.Free;
      end;
    finally
      Items.Sort := FOldSort;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TDCPPParser.GetString(out Section, Name,
  Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0: Value := cImportTitle;
    1: Value := cExportTitle;
    2: Value := cDCPPFilter;
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

function TDCPPParser.ImportItems(const Items,
  Orphans:ITranslationItems):HRESULT;
var
  i, aIndex:integer;
  FOldSort:TTranslateSortType;
  TI:ITranslationItem;
  DualImport:boolean;
  xml:IXMLDocument;
  nodes:IDOMNodeList;
  node:IDOMNode;

  procedure getSettings(const Nodes:IDOMNodeList);
  begin
    if (Nodes = nil) or (Nodes.length < 1) then
      Exit;
    node := Nodes[0].attributes.getNamedItem('Name');
    if node <> nil then
      FLanguageName := node.nodeValue;

    node := Nodes[0].attributes.getNamedItem('Author');
    if node <> nil then
      FAuthor := node.nodeValue;
    node := Nodes[0].attributes.getNamedItem('Version');
    if node <> nil then
      FVersion := node.nodeValue;
    node := Nodes[0].attributes.getNamedItem('Revision');
    if node <> nil then
      FRevision := node.nodeValue;
    node := Nodes[0].attributes.getNamedItem('RightToLeft');
    if node <> nil then
      FRightToLeft := node.nodeValue;
  end;
begin
  LoadSettings;
  if TfrmDualImport.Execute(GlobalAppServices, FOrigFile, FTransFile,
    Translate(cImportTitle), Translate(cDCPPFilter), '.', 'xml', true) then
  begin
    Items.Clear;
    Orphans.Clear;
    FOldSort := Items.Sort;
    DualImport := FTransFile <> '';
    xml := TXMLDocument.Create(FOrigFile);
    try
      Items.Sort := stNone;
      if xml.DOMDocument <> nil then
      begin
        FEncoding := xml.Encoding;
        if not DualImport then
          getSettings(xml.DOMDocument.getElementsByTagName('Language'));
        nodes := xml.DOMDocument.getElementsByTagName('String');
        if nodes <> nil then
          for i := 0 to nodes.length - 1 do
            if nodes[i].attributes <> nil then
            begin
              node := nodes[i].attributes.getNamedItem('Name');
              if node <> nil then
              begin
                TI := Items.Add;
                TI.Section := cSectionName;
                TI.Name := node.nodeValue;
                node := nodes[i].firstChild;
                if node <> nil then
                begin
                  if DualImport then
                    TI.Original := node.nodeValue
                  else
                  begin
                    TI.Original := TI.Name;
                    TI.Translation := node.nodeValue;
                  end;
                end;
                TI.Translated := TI.Translation <> '';
              end;
            end;
      end;
      if DualImport and FileExists(FTransFile) then
      begin
        Items.Sort := stIndex;
        xml.LoadFromFile(FTransFile);
        if xml.DOMDocument <> nil then
        begin
          getSettings(xml.DOMDocument.getElementsByTagName('Language'));
          nodes := xml.DOMDocument.getElementsByTagName('String');
          if nodes <> nil then
            for i := 0 to nodes.length - 1 do
              if nodes[i].attributes <> nil then
              begin
                node := nodes[i].attributes.getNamedItem('Name');
                if node <> nil then
                begin
                  aIndex := Items.IndexOf(cSectionName, node.nodeValue);
                  if aIndex >= 0 then
                  begin
                    TI := Items[aIndex];
                    node := nodes[i].firstChild;
                    if node <> nil then
                      TI.Translation := node.nodeValue;
                    TI.Translated := TI.Translation <> '';
                  end
                  else
                  begin
                    TI := Orphans.Add;
                    TI.Section := cSectionName;
                    TI.Name := node.nodeValue;
                    TI.Original := TI.Name;
                    node := nodes[i].firstChild;
                    if node <> nil then
                      TI.Translation := node.nodeValue;
                  end;
                end;
              end;
        end;
      end;
      Items.Modified := false;
      SaveSettings;
      Result := S_OK;
    finally
      xml := nil;
      Items.Sort := FOldSort;
    end;
  end
  else
    Result := S_FALSE;
end;

procedure TDCPPParser.Init(const ApplicationServices:IApplicationServices);
begin
  GlobalAppServices := ApplicationServices;
end;

procedure TDCPPParser.LoadSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
      FLanguageName := ReadString('Settings', 'LanguageName', 'en-us');
      FAuthor := ReadString('Settings', 'Author', 'Unknown');
      FVersion := ReadString('Settings', 'Version', '1.0');
      FRevision := ReadString('Settings', 'Revision', '0');
      FRightToLeft := ReadString('Settings', 'RightToLeft', '0');
      FEncoding := ReadString('Settings', 'Encoding', 'UTF-8');
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TDCPPParser.SaveSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
      WriteString('Settings', 'LanguageName', FLanguageName);
      WriteString('Settings', 'Author', FAuthor);
      WriteString('Settings', 'Version', FVersion);
      WriteString('Settings', 'Revision', FRevision);
      WriteString('Settings', 'RightToLeft', FRightToLeft);
      WriteString('Settings', 'Encoding', FEncoding);
      UpdateFile;
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.
