{@abstract(Implementation for Wix Parser) }
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

// $Id: WixParserImpl.pas 269 2007-10-21 15:49:52Z peter3 $

unit WixParserImpl;

interface
uses
  Classes, SysUtils, Types, TransIntf, TntClasses;

type
  TWixParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FIndex:integer;
    FOrigFile, FTransFile:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;
  public
    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems; const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems; const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
  end;

implementation
uses
  Windows, Forms, xmldom, xmlintf, xmldoc,
  WixParserConsts, WideIniFiles, TntSysUtils,
  DualImportFrm, PreviewExportFrm;

{ TWixParser }

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

procedure TWixParser.BuildPreview(Items:ITranslationItems;
  Strings:TTntStrings);
var
  i:integer;
begin
  Strings.Clear;
  Strings.Add('<?xml version="1.0" encoding="UTF-8"?>');
  Strings.Add('<!--');
  Strings.Add('    Copyright (c) Microsoft Corporation.  All rights reserved.');
  Strings.Add('');
  Strings.Add('    The use and distribution terms for this software are covered by the');
  Strings.Add('    Common Public License 1.0 (http://opensource.org/licenses/cpl.php)');
  Strings.Add('    which can be found in the file CPL.TXT at the root of this distribution.');
  Strings.Add('    By using this software in any fashion, you are agreeing to be bound by');
  Strings.Add('    the terms of this license.');
  Strings.Add('');
  Strings.Add('    You must not remove this notice, or any other, from this software.');
  Strings.Add('-->');
  Strings.Add('<WixLocalization>');
  for i := 0 to Items.Count - 1 do
    Strings.Add(WideFormat('  <String Id="%s">%s</String>', [Items[i].Name, XMLEncode(Items[i].Translation)]));
  Strings.Add('</WixLocalization>');
end;

function TWixParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT or CAP_ITEM_DELETE or CAP_ITEM_EDIT or CAP_ITEM_INSERT;
end;

function TWixParser.Configure(Capability:Integer):HRESULT;
begin
  Result := S_FALSE;
end;

function TWixParser.DisplayName(Capability:Integer):WideString;
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

function TWixParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  ExportOrig:boolean;
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
      ExportOrig := FTransFile = '';
      if ExportOrig then
        FTransFile := FOrigFile;
      if TfrmExport.Execute(GlobalAppServices, FTransFile,
        Translate(cExportTitle), Translate(cWixFilter), '.', 'wxl', S) then
      begin
        // save as UTF-8
        S.AnsiStrings.SaveToFileEx(FTransFile, CP_UTF8);
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
      Items.Sort := FOldSort;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TWixParser.GetString(out Section, Name,
  Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := cImportTitle;
    1:Value := cExportTitle;
    3:Value := cWixFilter;
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

function TWixParser.ImportItems(const Items,
  Orphans:ITranslationItems):HRESULT;
var
  i, aIndex:integer;
  FOldSort:TTranslateSortType;
  TI:ITranslationItem;
  DualImport:boolean;
  xml:IXMLDocument;
  nodes:IDOMNodeList;
  node:IDOMNode;
begin
  LoadSettings;
  if TfrmDualImport.Execute(GlobalAppServices, FOrigFile, FTransFile,
    Translate(cImportTitle), Translate(cWixFilter), '.', 'wxl', true) then
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
        nodes := xml.DOMDocument.getElementsByTagName('String');
        if nodes <> nil then
          for i := 0 to nodes.length - 1 do
            if nodes[i].attributes <> nil then
            begin
              node := nodes[i].attributes.getNamedItem('Id');
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
          nodes := xml.DOMDocument.getElementsByTagName('String');
          if nodes <> nil then
            for i := 0 to nodes.length - 1 do
              if nodes[i].attributes <> nil then
              begin
                node := nodes[i].attributes.getNamedItem('Id');
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

procedure TWixParser.Init(const ApplicationServices:IApplicationServices);
begin
  GlobalAppServices := ApplicationServices;
end;

procedure TWixParser.LoadSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'FTransFile', FTransFile);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TWixParser.SaveSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'FTransFile', FTransFile);
      UpdateFile;
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.
