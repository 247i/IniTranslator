{@abstract(Parser for KeePass) }
{
keepass.sourceforge.net
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
// $Id: KeePassParserImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit KeePassParserImpl;
{$I ..\TRANSLATOR.INC}

interface
uses
  Classes, Types, TntClasses, TntSysUtils, TransIntf;

type
  TKeePassParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FIndex:integer;
    FFilename:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
  public

    function Capabilities:Integer; safecall;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items:ITranslationItems;
      const Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Windows, SysUtils, Forms,
{$IFDEF COMPILER_9_UP}WideStrUtils{$ELSE}TntWideStrUtils{$ENDIF},
  WideIniFiles, SingleImportFrm, PreviewExportFrm,
  KeePassParserLang;

{ TKeePassParser }

function TKeePassParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TKeePassParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

function TKeePassParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cKeePassImportTitle);
    CAP_EXPORT:
      Result := Translate(cKeePassExportTitle);
  else
    Result := '';
  end;
end;

procedure TKeePassParser.BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
var
  i:integer;
  S:WideString;
begin
  Strings.Clear;
  S := '';
  for i := 0 to Items.Count - 1 do
    S := S + WideFormat('|%s||%s|', [Items[i].Original, Items[i].Translation]);
  Strings.Add(S);
end;

function TKeePassParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
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
      if TfrmExport.Execute(GlobalAppServices, FFilename,
        Translate(cKeePassExportTitle), Translate(cKeePassFilter), '.', 'lng', S, true) then
      begin
        S.Text := Tnt_WideStringReplace(S.Text, CRLF, '', [rfReplaceAll]);
        S.AnsiStrings.SaveToFileEx(FFilename, CP_UTF8);
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

// format:
// |ORIGINAL||Translation||ORIGINAL||Translation|...

function TKeePassParser.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := cKeePassFilter;
    1:Value := cKeePassImportTitle;
    2:Value := cKeePassExportTitle;
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

function TKeePassParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;

  procedure ParseItems(P:PWideChar);
  const
    cNull = WideChar(#0);
    cBar = WideChar('|');
  type
    States = (Original, Translation);
  var
    R, S:PWideChar;

    AStates:States;
    TI:ITranslationItem;

  begin
    AStates := Original;
    TI := nil;
    S := WStrEnd(P);
    while P < S do
    begin
      if P^ = cBar then
      begin
        case AStates of
          Original:
            begin
              Inc(P);
              R := P;
              while P^ <> cBar do
                Inc(P);
              if P^ = cBar then
              begin
                P^ := cNull;
                TI := Items.Add;
                TI.Section := cSectionName;
                TI.Name := IntToStr(TI.Index);
                TI.Original := R;
              end;
              Inc(P);
              AStates := Translation;
            end;
          Translation:
            begin
              Inc(P);
              R := P;
              while P^ <> cBar do
                Inc(P);
              if P^ = cBar then
              begin
                P^ := cNull;
                if TI <> nil then
                begin
                  TI.Translation := R;
                  TI.Translated := TI.Translation <> '';
                end;
                TI := nil;
              end;
              Inc(P);
              AStates := Original;
            end;
        end;
      end
      else
        Inc(P);
    end;
  end;
begin
  LoadSettings;
  if TfrmSingleImport.Execute(GlobalAppServices, FFilename,
    Translate(cKeePassImportTitle), Translate(cKeePassFilter), '.', 'lng') then
  begin
    Items.Clear;
    Orphans.Clear;
    Items.Sort := stNone;
    S := TTntStringlist.Create;
    try
      S.LoadFromFile(FFilename);
      ParseItems(PWideChar(S.Text));
      Items.Modified := false;
      SaveSettings;
      Result := S_OK;
    finally
      S.Free;
    end;
  end
  else
    Result := S_FALSE;
end;

procedure TKeePassParser.Init(const ApplicationServices:IApplicationServices);
begin
  GlobalAppServices := ApplicationServices;
end;

procedure TKeePassParser.LoadSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FFilename := ReadString('Settings', 'Filename', FFilename);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TKeePassParser.SaveSettings;
begin
  try
    with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'Filename', FFilename);
      UpdateFile;
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.
