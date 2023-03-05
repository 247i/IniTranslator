{@abstract(Parser for Xilisoft language files) }
{
  Copyright © 2006 by Alexander Kornienko; all rights reserved

  Developer(s):
    Korney San - kora att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: XilisoftParserImpl.pas 250 2007-08-14 16:42:00Z peter3 $
unit XilisoftParserImpl;

interface
uses
  Classes, Types, TntClasses, TransIntf;

type
  TXilisoftParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FOrigFile:WideString;
    FTransFile:WideString;
    FSkip:Boolean;
    FStringIndex:integer;
    FAppServices:IApplicationServices;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items, Orphans:ITranslationItems; Strings:TTntStrings);
    function Translate(const Value:WideString):WideString;

    { ILocalizable }
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
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
    property SkipEmpty:Boolean read FSkip write FSkip;
  end;

implementation
uses
  XilisoftParserCfgForm, XiliSoftParserConsts, CommonUtils,
  Controls, Windows, SysUtils, Forms, IniFiles, DualImportFrm;

function GetLocaleInformation(Flag:Integer):WideString;
var
  pcLCA:array[0..20] of Char;
begin
  if (GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA, 19) <= 0) then
  begin
    pcLCA[0] := #0;
  end;
  Result := pcLCA;
end;

{ TXilisoftParser }

procedure TXilisoftParser.BuildPreview(Items, Orphans:ITranslationItems;
  Strings:TTntStrings);
var
  i:integer;
begin
  for i := 0 to Orphans.Count - 1 do
    Strings.Add(Orphans[i].Name + WideChar('=') + Orphans[i].Translation);
  for i := 0 to Items.Count - 1 do
    if Items[i].Translation <> '' then
    begin
      Strings.Add(WideChar('#') + Items[i].Name + WideString('# "') + Items[i].Translation + WideChar('"'));
      Items[i].Modified := false;
    end;
end;

function TXilisoftParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT or CAP_CONFIGURE;
end;

function TXilisoftParser.Configure(Capability:Integer):HRESULT;
begin
  Result := S_FALSE;
  case Capability of
    CAP_EXPORT:
      begin
        LoadSettings;
        if TXilisoftCfgForm.Edit(FAppServices, FSkip) then
          SaveSettings;
        Result := S_OK;
      end;
  else
    Result := S_OK;
  end;
end;

constructor TXilisoftParser.Create;
begin
  inherited Create;
  FOldAppHandle := Application.Handle;
end;

destructor TXilisoftParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TXilisoftParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(SXilisoftImportTitle);
    CAP_EXPORT:
      Result := Translate(SXilisoftExportTitle);
  else
    Result := '';
  end;
end;

function TXilisoftParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
begin
  Result := S_FALSE;
  try
    LoadSettings;
    if not FileExists(FTransFile) then
    begin
      WideMessageBox(0, PWideChar(Translate(SImportBeforeExport)), PWideChar(Translate(SFileNotFound)), MB_OK);
      Exit;
    end;
    S := TTntStringlist.Create;
    try
      BuildPreview(Items, Orphans, S);
      begin
        S.AnsiStrings.SaveToFile(FTransFile);
        Result := S_OK;
        SaveSettings;
      end;
    finally
      S.Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TXilisoftParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  SO, ST:TTntStringlist;
  i, j, k:integer;
  TI:ITranslationItem;
  ssi, sst, sName, sValue:WideString;
  IsInT:Boolean;
begin
  Result := S_FALSE;
  try
    Items.Clear;
    Orphans.Clear;
    TI := nil;
    LoadSettings;
    if TfrmDualImport.Execute(FAppServices, FOrigFile, FTransFile,
      Translate(SXilisoftImportTitle), Translate(SXilisoftFilter), '.', 'lang') then
    begin
      Items.Sort := stNone;
      SO := TTntStringlist.Create;
      ST := TTntStringlist.Create;
      try
        SO.LoadFromFile(FOrigFile);
        ST.LoadFromFile(FTransFile);
        for i := 0 to SO.Count - 1 do
        begin
          ssi := SO[i];
          if ssi = '' then
            Continue;
          if ssi[1] in [WideChar('/'), WideChar(';')] then
            Continue;
          k := Pos('=', ssi);
          if k > 0 then
          begin
            sName := Copy(ssi, 1, k - 1);
            sValue := Copy(ssi, k + 1, MaxInt);
            IsInT := false;
            for j := 0 to ST.Count - 1 do
            begin
              if ST[j] = '' then
                Continue;
              k := Pos('=', ST[j]);
              if k > 0 then
              begin
                sst := Copy(ST[j], 1, k - 1);
                if sst = sName then
                begin
                  sst := ST[j];
                  IsInT := true;
                  Break;
                end;
              end;
            end;
            TI := Orphans.Add;
            TI.Section := cSectionName;
            TI.Name := sName;
            TI.Original := sValue;
            if IsInT then
            begin
              k := Pos('=', sst);
              TI.Translation := Copy(sst, k + 1, MaxInt);
              TI.Translated := true;
            end
            else
            begin
              TI.Translation := '';
              TI.Translated := false;
            end;
            Continue;
          end;
          k := Pos('#', ssi);
          if k > 0 then
          begin
            k := Pos(' ', ssi);
            sName := Copy(ssi, 1, k - 1);
            sValue := Copy(ssi, k + 1, MaxInt);
            IsInT := false;
            for j := 0 to ST.Count - 1 do
            begin
              if ST[j] = '' then
                Continue;
              k := Pos('#', ST[j]);
              if k > 0 then
              begin
                k := Pos(' ', ST[j]);
                sst := Copy(ST[j], 1, k - 1);
                if sst = sName then
                begin
                  sst := ST[j];
                  IsInT := true;
                  Break;
                end;
              end;
            end;
            TI := Items.Add;
            TI.Section := cSectionName;
            TI.Name := Copy(sName, 2, Length(sName) - 2);
            TI.Original := Copy(sValue, 2, Length(sValue) - 2);
            if IsInT then
            begin
              ssi := Copy(sst, Pos(' ', sst) + 1, MaxInt);
              TI.Translation := Copy(ssi, 2, Length(ssi) - 2);
              TI.Translated := true;
            end
            else
            begin
              TI.Translation := '';
              TI.Translated := false;
            end;
            TI.Modified := false;
          end;
        end;
      finally
        SO.Free;
        ST.Free;
      end;
      SaveSettings;
      Result := S_OK;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TXilisoftParser.Translate(const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(SLocalizeSectionName, Value, Value)
  else
    Result := Value;
end;

procedure TXilisoftParser.Init(const ApplicationServices:IApplicationServices);
begin
  Application.Handle := ApplicationServices.AppHandle;
  FAppServices := ApplicationServices;
end;

procedure TXilisoftParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
      SkipEmpty := ReadBool('Settings', cSkip, false);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TXilisoftParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
      WriteBool('Settings', cSkip, SkipEmpty);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

function TXilisoftParser.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FStringIndex of
    0:
      Name := SXilisoftFilter;
    1:
      Name := SXilisoftImportTitle;
    2:
      Name := SXilisoftExportTitle;
    3:
      Name := SImportBeforeExport;
    4:
      Name := SFileNotFound;
    5:
      Name := SFormCaption;
    6:
      Name := SCheckBoxCaption;
    7:
      Name := SButtonCaption;
  else
    Result := false;
  end;
  if Result then
  begin
    Section := SLocalizeSectionName;
    Value := Name;
    Inc(FStringIndex);
  end
  else
    FStringIndex := 0;
end;

end.
