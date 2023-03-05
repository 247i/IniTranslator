{@abstract(php nuke and Joomla parser) }

{
  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved

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
// $Id: PHPNukeImpl.pas 250 2007-08-14 16:42:00Z peter3 $
unit PHPNukeImpl;

interface
uses
  Classes, Types, TransIntf;

type
  TPHPNukeParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldHandle:Cardinal;
    FAppServices:IApplicationServices;
    FCount:integer;
    FOrigFile, FTransFile:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    function Translate(const Value:WideString):WideString;
  public
    constructor Create;
    destructor Destroy; override;

    function Capabilities:integer; safecall;
    function Configure(Capability:integer):HRESULT; safecall;
    function DisplayName(Capability:integer):WideString; safecall;
    function ExportItems(const Items, Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items, Orphans:ITranslationItems):HRESULT; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function GetString(out Section, Name, Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Windows, SysUtils, StrUtils, Controls, Forms,
  IniFiles, CommonUtils, TntClasses, PreviewExportFrm, DualImportFrm;

const
  cPHPNukeFilter = 'PHP files (*.php)|*.php|All files (*.*)|*.*';
  cPHPNukeExportTitle = 'Export to phpNuke language file';
  cPHPNukeImportTitle = 'Import from phpNuke language file';
  cAppTitle = 'phpNuke Parser';
  cSectionName = 'phpNuke';
var
  FFooter:TTntStringlist;

procedure ErrMsg(const AText, ACaption:WideString);
begin
  WideMessageBox(GetFocus, PWideChar(AText), PWideChar(ACaption), MB_OK or MB_ICONERROR);
end;

procedure ExceptMsg(E:Exception);
var
  ATitle, AFilename:WideString;
begin
  AFilename := GetModuleName(hInstance);
  ATitle := ChangeFileExt(ExtractFilename(AFilename), '');
  WideMessageBox(GetActiveWindow, PWideChar(WideString(Format('Exception "%s" raised in %s:'#13#10#13#10'%s', [E.ClassName, AFilename, E.Message]))),
    PWideChar(WideString(Format('Error in %s', [ATitle]))), MB_OK or MB_ICONERROR or MB_TASKMODAL);
end;

{ TPHPNukeParser }

function TPHPNukeParser.Capabilities:integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TPHPNukeParser.Configure(Capability:integer):HRESULT;
begin
  Result := S_OK;
end;

constructor TPHPNukeParser.Create;
begin
  inherited Create;
  FOldHandle := Application.Handle;
end;

destructor TPHPNukeParser.Destroy;
begin
  if FOldHandle <> 0 then
    Application.Handle := FOldHandle;
  inherited;
end;

function TPHPNukeParser.DisplayName(Capability:integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cPHPNukeImportTitle);
    CAP_EXPORT:
      Result := Translate(cPHPNukeExportTitle);
  end;
end;

function TPHPNukeParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  i:integer;
  //  FOldSort: TTranslateSortType;

  function DefaultStr(const S:WideString; QuoteChar:WideChar):WideString;
  begin
    if QuoteChar = WideChar(#0) then
    begin
      QuoteChar := '"';
      Result := QuoteChar + S + QuoteChar;
    end
    else
      Result := S;
  end;

  function HasContinuation(Index:integer):boolean;
  begin
    Result := (Index < Items.Count - 1) and AnsiStartsText('.', trim(Items[Index + 1].TransComments));
  end;

begin
  Result := S_FALSE;
  try
    LoadSettings;
    //    FOldSort := Items.Sort;
    S := TTntStringlist.Create;
    try
      Items.Sort := stIndex;
      if FFooter.Count = 0 then
        FFooter.Add('?>');
      for i := 0 to Items.Count - 1 do
      begin
        if trim(Items[i].TransComments) <> '' then
          S.Add(Items[i].TransComments);
        if HasContinuation(i) then
          S.Add(Format('define("%s",%s', [Items[i].Name, DefaultStr(Items[i].Translation, Items[i].TransQuote)]))
        else
          S.Add(Format('define("%s",%s);', [Items[i].Name, DefaultStr(Items[i].Translation, Items[i].TransQuote)]));
      end;
      S.AddStrings(FFooter);
      if TfrmExport.Execute(FAppServices, FTransFile, Translate(cPHPNukeExportTitle), Translate(cPHPNukeFilter), '.', 'php', S) then
      begin
        S.AnsiStrings.SaveToFile(FTransFile);
        Result := S_OK;
      end;
    finally
      S.Free;
      //      Items.Sort := FOldSort;
      SaveSettings;
    end;
  except
    on E:Exception do
      ErrMsg(E.Message, Translate(cAppTitle));
  end;
end;

function TPHPNukeParser.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := cPHPNukeFilter;
    1:Value := cPHPNukeExportTitle;
    2:Value := cPHPNukeImportTitle;
    3:Value := cAppTitle;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;
end;

function WideStartsText(const ASubText, AText:WideString):boolean;
begin
  if (ASubText <> '') and (AText <> '') then
    Result := WideSameText(ASubText, Copy(AText, 1, Length(ASubText)))
  else
    Result := false;
end;

function WideEndsText(const ASubText, AText:WideString):boolean;
var
  L:integer;
begin
  L := Length(AText) - Length(ASubText);
  if (L > 0) and (ASubText <> '') then
    Result := WideSameText(ASubText, Copy(AText, L + 1, MaxInt))
  else
    Result := false;
end;

function TPHPNukeParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  T:ITranslationItem;
  S:TTntStringlist;
  Cmt:WideString;
  i:integer;

  function ParseLine(const S, Cmt:WideString; const Items:ITranslationItems; IsTranslation:boolean):ITranslationItem;
  var
    AName, AText, tmp:WideString;
    P:PWideChar;
    i:integer;
  begin
    // handle phpNuke as well as Joomla files:
    // format:
    // define('ID','Text');
    // or
    // define("ID","Text");
    // continue on next row:
    // . "Text"
    // . "Text2");
    // or
    // . 'Text'
    // . 'Text3');

    P := PWideChar(S);
    while not (P^ in [WideChar(#0), WideChar('('), WideChar('.'), WideChar('"'), WideChar('''')]) do
      Inc(P);
    if P^ = WideChar('(') then
      Inc(P);
    tmp := P;

    AName := trim(Copy(tmp, 1, Pos(',', tmp) - 1));
    AText := trim(Copy(tmp, Pos(',', tmp) + 1, MaxInt));

    if WideEndsText(');', AText) then
      SetLength(AText, Length(AText) - 2);
    if not IsTranslation then
    begin
      Result := Items.Add;
      Result.Name := AutoWideDequotedStr(AName);
      Result.Original := AutoWideDequotedStr(AText);
      Result.Section := cSectionName;
      Result.OrigComments := Cmt;
    end
    else
    begin
      i := Items.IndexOf(cSectionName, AutoWideDequotedStr(AName));
      if i > -1 then
      begin
        Result := Items[i];
        if Result <> nil then
        begin
          Result.Translation := AutoWideDequotedStr(AText);
          Result.Translated := Result.Translation <> '';
          Result.TransComments := Cmt;
        end;
      end;
    end;

  end;

  function IsContinuation(const S:WideString):boolean;
  begin
    Result := WideStartsText('.', trim(S));
  end;

  function GetContinuation(const S:WideString):WideString;
  var
    i:integer;
  begin
    i := Pos('.', S);
    if i > 0 then
      Result := AutoWideDequotedStr(trim(Copy(S, i + 1, MaxInt)))
    else
      Result := S;
  end;
begin
  Result := S_FALSE;
  try
    LoadSettings;
    //    Screen.Cursor := crHourGlass;
    try
      if TfrmDualImport.Execute(FAppServices, FOrigFile, FTransFile, Translate(cPHPNukeImportTitle), Translate(cPHPNukeFilter), '.', 'php') then
      begin
        Items.Clear;
        Orphans.Clear;
        FFooter.Clear;
        Items.Sort := stNone;
        Cmt := '';
        S := TTntStringlist.Create;
        try
          S.LoadFromFile(FOrigFile);
          for i := 0 to S.Count - 1 do
            if WideStartsText('define(', S[i]) then
            begin
              ParseLine(Copy(S[i], 8, MaxInt), Cmt, Items, false);
              Cmt := '';
            end
            else
            begin
              if Cmt <> '' then
                Cmt := Cmt + #13#10 + S[i]
              else
                Cmt := S[i];
            end;
//          Items.Sort := stSection;
          Cmt := '';
          S.LoadFromFile(FTransFile);
          T := nil;
          Items.Sort := stSection;
          for i := 0 to S.Count - 1 do
          begin
            if WideStartsText('define(', S[i]) then
            begin
              T := ParseLine(Copy(S[i], 8, MaxInt), Cmt, Items, true);
              Cmt := '';
            end
            else if IsContinuation(S[i]) and Assigned(T) then
              T.Translation := T.Translation + GetContinuation(S[i])
            else
            begin
              if Cmt <> '' then
                Cmt := Cmt + #13#10 + S[i]
              else
                Cmt := S[i];
            end;
          end;
          if Cmt <> '' then
            FFooter.Add(Cmt);
        finally
          S.Free;
        end;
        Result := S_OK;
      end;
      Items.Modified := false;
      Orphans.Modified := false;
    finally
      SaveSettings;
      Items.Sort := stIndex;
      //      Screen.Cursor := crDefault;
    end;
  except
    on E:Exception do
      ErrMsg(E.Message, cAppTitle);
  end;
end;

procedure TPHPNukeParser.Init(const ApplicationServices:IApplicationServices);
begin
  FOldHandle := Application.Handle;
  FAppServices := ApplicationServices;
  Application.Handle := ApplicationServices.AppHandle;
end;

procedure TPHPNukeParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    on E:Exception do
      ErrMsg(E.Message, cAppTitle);
  end;
end;

procedure TPHPNukeParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    on E:Exception do
      ErrMsg(E.Message, cAppTitle);
  end;
end;

function TPHPNukeParser.Translate(const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(ClassName, Value, Value)
  else
    Result := Value;
end;

initialization
  FFooter := TTntStringlist.Create;

finalization
  FreeAndNil(FFooter);
end.
