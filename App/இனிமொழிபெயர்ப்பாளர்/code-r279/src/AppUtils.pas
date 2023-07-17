{@abstract(Application specific utility functions and procedures) }
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
// $Id: AppUtils.pas 256 2007-10-17 20:57:18Z peter3 $
unit AppUtils;
{$I TRANSLATOR.INC}

interface
uses
  SysUtils, Classes, Controls, ActnList, ActnMan,
  MsgTranslate, AppConsts, AppOptions, TransIntf,
  TntClasses, TBXExtItems;

type
  TAppUtils = class
  public
    class procedure TBMRULoadFromIni(MRU:TTBXMRUList);
    class procedure TBMRUSaveToIni(MRU:TTBXMRUList);
    class procedure TBMRULoadFromReg(MRU:TTBXMRUList; RootKey:Cardinal; const Path:WideString);
    class procedure TBMRUSaveToReg(MRU:TTBXMRUList; RootKey:Cardinal; const Path:WideString);

    class function DetectEncoding(const FileName:WideString):TEncoding;
    class function GetAppVersion:WideString;
    class function GetCurrentYear:Integer;

    class function ActionShortCutInUse(AM:TActionList; ShortCut:Word):boolean;
    class function FindActionShortCut(AM:TActionList; ShortCut:Word):TCustomAction;
    class function RemoveActionShortCut(AM:TActionList; ShortCut:Word):integer;
    class function _(const ASection, AMsg:WideString):WideString;
    class function MyShortCutToText(ShortCut:TShortCut):WideString;

    class function GlobalLanguageFile:TAppLanguage;
    class function GlobalAppOptions:TAppOptions;
    class function GlobalApplicationServices:IApplicationServices;

    class function GetUserAppDataFolder(const Default:WideString):WideString;
    class function GetUserShortcutFile:WideString;
    class function GetUserAppOptionsFile:WideString;
    class procedure HandleFileCreateException(Sender:TObject; E:Exception; const Filename:WideString);

    class function GetAppStoragePath:WideString;
    class function AutoDetectCharacterSet(Stream:TStream):TEncoding; overload;
    class function AutoDetectCharacterSet(const Filename:WideString):TEncoding; overload;
    class function FileCharSetToEncoding(CharSet:TTntStreamCharSet):TEncoding;

    class procedure FixXPStyles(AControl:TWinControl);
    class function GetPluginsFolder:WideString;
  end;

procedure TBMRULoadFromIni(MRU:TTBXMRUList);
procedure TBMRUSaveToIni(MRU:TTBXMRUList);
procedure TBMRULoadFromReg(MRU:TTBXMRUList; RootKey:Cardinal; const Path:WideString);
procedure TBMRUSaveToReg(MRU:TTBXMRUList; RootKey:Cardinal; const Path:WideString);

function DetectEncoding(const FileName:WideString):TEncoding;
function GetAppVersion:WideString;
function GetCurrentYear:Integer;

function ActionShortCutInUse(AM:TActionList; ShortCut:Word):boolean;
function FindActionShortCut(AM:TActionList; ShortCut:Word):TCustomAction;
function RemoveActionShortCut(AM:TActionList; ShortCut:Word):integer;
function _(const ASection, AMsg:WideString):WideString;
function MyShortCutToText(ShortCut:TShortCut):WideString;

function GlobalLanguageFile:TAppLanguage;
function GlobalAppOptions:TAppOptions;
function GlobalApplicationServices:IApplicationServices;

function GetUserAppDataFolder(const Default:WideString):WideString;
function GetUserShortcutFile:WideString;
function GetUserAppOptionsFile:WideString;
procedure HandleFileCreateException(Sender:TObject; E:Exception; const Filename:WideString);

function GetAppStoragePath:WideString;
function AutoDetectCharacterSet(Stream:TStream):TEncoding; overload;
function AutoDetectCharacterSet(const Filename:WideString):TEncoding; overload;
function FileCharSetToEncoding(CharSet:TTntStreamCharSet):TEncoding;

procedure FixXPStyles(AControl:TWinControl);
function GetPluginsFolder:WideString;

type
  TApplicationServicesFunc = function:IApplicationServices;

var
  GlobalApplicationServicesFunc:TApplicationServicesFunc = nil;

implementation
uses
  Windows, Forms, Dialogs, Math, Registry, StdCtrls, ExtCtrls, TypInfo,
  Menus, Consts, StrUtils, ShFolder,
  CommonUtils, WideIniFiles,
  TbxUxThemes,
  TntWindows, TntSysUtils, TntWideStrUtils;

var
  FLanguageFile:TAppLanguage = nil;
  FAppOptions:TAppOptions = nil;

function AutoDetectCharacterSet(Stream:TStream):TEncoding;
begin
  case TntClasses.AutoDetectCharacterSet(Stream) of
    csAnsi:Result := feAnsi;
    csUnicode:Result := feUnicode;
    csUnicodeSwapped:Result := feUnicodeSwapped;
    csUtf8:Result := feUtf8;
  else
    Result := feAnsi;
  end;
end;

function AutoDetectCharacterSet(const Filename:WideString):TEncoding;
var
  F:TTntFileStream;
begin
  F := TTntFileStream.Create(Filename, fmOpenRead or fmShareDenyNone);
  try
    Result := AutoDetectCharacterSet(F);
  finally
    F.Free;
  end;
end;

function FileCharSetToEncoding(CharSet:TTntStreamCharSet):TEncoding;
begin
  case CharSet of
    csUnicode:Result := feUnicode;
    csUnicodeSwapped:Result := feUnicodeSwapped;
    csUtf8:Result := feUtf8;
  else
    Result := feAnsi;
  end;
end;

function GlobalLanguageFile:TAppLanguage;
begin
  if FLanguageFile = nil then
    FLanguageFile := TAppLanguage.Create('');
  Result := FLanguageFile;
end;

function GlobalAppOptions:TAppOptions;
begin
  if FAppOptions = nil then
    FAppOptions := TAppOptions.Create(GetUserAppOptionsFile);
  Result := FAppOptions;
end;

function GlobalApplicationServices:IApplicationServices;
begin
  if Assigned(GlobalApplicationServicesFunc) then
    Result := GlobalApplicationServicesFunc
  else
    Result := nil;
end;

function GetUserAppDataFolder(const Default:WideString):WideString;
begin
  SetLength(Result, MAX_PATH + 1);
  // DONE: it seems SHGetFolderPathW in SHFolder doesn't use PWideChar...
  if not Succeeded(WideSHGetFolderPath(0, CSIDL_APPDATA, 0, 0, PWideChar(Result))) then
    Result := '';
  if Result = '' then
    Result := Default;
  Result := WideString(PWideChar(Result)); // strip excessive characters
end;

function GetUserShortcutFile:WideString;
begin
  Result := GetUserAppDataFolder('');
  if (Result <> '') and WideDirectoryExists(Result) then
    Result := WideIncludeTrailingPathDelimiter(Result) + 'IniTranslator'
  else
    Result := WideExtractFilePath(Application.ExeName);

  WideForceDirectories(Result);
  Result := WideIncludeTrailingPathDelimiter(Result) + 'translator.alf';
end;

function GetUserAppOptionsFile:WideString;
begin
  Result := GetUserAppDataFolder('');
  if (Result <> '') and WideDirectoryExists(Result) then
    Result := WideIncludeTrailingPathDelimiter(Result) + 'IniTranslator'
  else
    Result := WideExtractFilePath(Application.ExeName);
  WideForceDirectories(Result);
  Result := WideIncludeTrailingPathDelimiter(Result) + 'translator.ini';
end;

function _(const ASection, AMsg:WideString):WideString;
begin
  if GlobalLanguageFile <> nil then
    Result := GlobalLanguageFile.Translate(ASection, AMsg, AMsg)
  else
    Result := AMsg;
end;

function WideUpperCaseFirst(const S:WideString):WideString;
var
  i:integer;
begin
  if S = '' then
    Result := ''
  else
    Result := WideUpperCase(S[1]) + WideLowerCase(Copy(S, 2, MaxInt));
  for i := 2 to Length(Result) do
    if (Result[i - 1] in [WideChar(#0)..WideChar(#32), WideChar('_'),
      WideChar('-'), WideChar('+'), WideChar('\'), WideChar('/'), WideChar(':'),
        WideChar(';'), WideChar('.')]) then
      Result[i] := WideUpperCase(Result[i])[1];
end;

function MyShortCutToText(ShortCut:TShortCut):WideString;
var
  ACtrl, AShift, AAlt:WideString;
  i:integer;
begin
  Result := ShortCutToText(ShortCut);
  if Pos('+', Result) > 0 then
  begin
    if Pos(SmkcShift, Result) > 0 then
      AShift := SmkcShift
    else
      AShift := '';
    if Pos(SmkcCtrl, Result) > 0 then
      ACtrl := SmkcCtrl
    else
      ACtrl := '';
    if Pos(SmkcAlt, Result) > 0 then
      AAlt := SmkcAlt
    else
      AAlt := '';
    for i := Length(Result) - 1 downto 1 do // skip the last char to avoid removing something like "Ctrl++"
      if (Result[i] = '+') then
        Break;
    Result := ACtrl + AShift + AAlt + Copy(Result, i + 1, Maxint);
  end;
  Result := WideUpperCaseFirst(Result);
end;

function DetectEncoding(const FileName:WideString):TEncoding;
begin
  { DONE : Fix this later }
  Result := AutoDetectCharacterSet(Filename);
end;

procedure TBMRULoadFromReg(MRU:TTBXMRUList; RootKey:DWORD; const Path:WideString);
var
  ini:TRegIniFile;
begin
  ini := TRegIniFile.Create('');
  try
    ini.RootKey := RootKey;
    ini.OpenKey(Path, true);
    MRU.LoadFromRegIni(ini, cIniMRUKey);
  finally
    ini.Free;
  end;
end;

procedure TBMRUSaveToReg(MRU:TTBXMRUList; RootKey:DWORD; const Path:WideString);
var
  ini:TRegIniFile;
begin
  ini := TRegIniFile.Create('');
  try
    ini.RootKey := RootKey;
    ini.OpenKey(Path, true);
    MRU.SaveToRegIni(ini, cIniMRUKey);
  finally
    ini.Free;
  end;
end;

procedure TBMRULoadFromIni(MRU:TTBXMRUList);
var
  ini:TWideMemIniFile;
  i:Integer;
  S:WideString;
begin
  ini := TWideMemIniFile.Create(GetUserAppOptionsFile);
  try
    MRU.Items.Clear;

    for i := 1 to MRU.MaxItems do
    begin
      S := ini.ReadString(cIniMRUKey, MRU.Prefix + IntToStr(i), '');
      if S <> '' then
        MRU.Items.Add(S);
    end;
  finally
    ini.Free;
  end;
end;

procedure TBMRUSaveToIni(MRU:TTBXMRUList);
var
  ini:TWideMemIniFile;
  i:Integer;
begin
  ini := TWideMemIniFile.Create(GetUserAppOptionsFile);
  try
    for i := 1 to MRU.MaxItems do
    begin
      if i <= MRU.Items.Count then
        ini.WriteString(cIniMRUKey, MRU.Prefix + IntToStr(i), MRU.Items[i - 1])
      else
        ini.DeleteKey(cIniMRUKey, MRU.Prefix + IntToStr(i));
      ini.UpdateFile;
    end;
  finally
    ini.Free;
  end;
end;

function GetCurrentYear:Integer;
var
  Y, M, D:Word;
begin
  DecodeDate(Date, Y, M, D);
  Result := Y;
end;

function GetAppVersion:WideString;
var
  FileName:WideString;
  InfoSize, Wnd:DWORD;
  VerBuf:Pointer;
  FI:PVSFixedFileInfo;
  VerSize:DWORD;
begin
  Result := '1.0.0.0';
  FileName := Application.ExeName;
  InfoSize := Tnt_GetFileVersionInfoSizeW(PWideChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if Tnt_GetFileVersionInfoW(PWideChar(FileName), Wnd, InfoSize, VerBuf) then
        if Tnt_VerQueryValueW(VerBuf, '\', Pointer(FI), VerSize) then
          Result := Format('%d.%d.%d.%d', [HiWord(FI.dwFileVersionMS), LoWord(FI.dwFileVersionMS), HiWord(FI.dwFileVersionLS), LoWord(FI.dwFileVersionLS)]);
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

function ActionShortCutInUse(AM:TActionList; ShortCut:Word):boolean;
begin
  Result := FindActionShortCut(AM, ShortCut) <> nil;
end;

function FindActionShortCut(AM:TActionList; ShortCut:Word):TCustomAction;
var
  i, j:integer;
begin
  Result := nil;
  if ShortCut = 0 then
    Exit;
  for i := 0 to AM.ActionCount - 1 do
    if AM.Actions[i] is TCustomAction then
    begin
      Result := TCustomAction(AM.Actions[i]);
      if Result.ShortCut = ShortCut then
        Exit;
      j := Result.SecondaryShortCuts.IndexOfShortCut(ShortCut);
      if j >= 0 then
        Exit;
    end;
  Result := nil;
end;

function RemoveActionShortCut(AM:TActionList; ShortCut:Word):integer;
var
  Action:TCustomAction;
  i:integer;
begin
  Result := 0;
  if ShortCut = 0 then
    Exit;
  Action := FindActionShortCut(AM, ShortCut);
  while Action <> nil do
  begin
    if Action.ShortCut = ShortCut then
    begin
      Action.ShortCut := 0;
      Inc(Result);
    end;
    i := Action.SecondaryShortCuts.IndexOfShortCut(ShortCut);
    if i >= 0 then
    begin
      Action.SecondaryShortCuts.Delete(i);
      Inc(Result);
    end;
    Action := FindActionShortCut(AM, ShortCut);
  end;
end;

procedure HandleFileCreateException(Sender:TObject; E:Exception; const Filename:WideString);
begin
  if E is EFCreateError then
    ErrMsg(WideFormat(_(Sender.ClassName, SFmtErrCreateFile), [Filename]), _(Sender.ClassName, SErrorCaption))
  else
    Application.HandleException(Sender);
end;

function GetAppStoragePath:WideString;
begin
  // try to get path to \Documents and Settings\<user>\Application Data
  // if that fails, use application install folder
  Result := GetSpecialFolderLocation(CSIDL_APPDATA);
  if Result = '' then
    Result := WideIncludeTrailingPathDelimiter(WideExtractFilePath(Application.ExeName))
  else
    Result := WideIncludeTrailingPathDelimiter(Result) + 'IniTranslator\';
  WideForceDirectories(Result);
end;

type
  TAccessComboBox = class(TCustomComboBox);

procedure FixXPStyles(AControl:TWInControl);
var
  i:integer;
  WC:TWinControl;
begin
  if (AControl is TWinControl) then
  begin
    WC := TWinControl(AControl);
    for i := 0 to WC.ControlCount - 1 do
    begin
      if WC.Controls[i] is TCustomComboBox then
      begin
        if Assigned(IsAppThemed) and IsAppThemed {Win32PlatformIsXP} then
          TAccessComboBox(TWinControl(AControl).Controls[i]).BevelKind := bkNone
        else
          TAccessComboBox(TWinControl(AControl).Controls[i]).BevelKind := bkFlat;
      end
      else if WC.Components[i] is TCustomPanel then
        SetOrdProp(WC.Components[i], 'ParentBackground', Ord(false));
    end;
  end;
end;

function GetPluginsFolder:WideString;
begin
  Result := WideIncludeTrailingPathDelimiter(WideExtractFilePath(Application.ExeName)) + 'plugins';
end;


procedure SaveAndFreeOptions;
begin
  if FAppOptions <> nil then
  try
    FAppOptions.SaveToFile(GetUserAppOptionsFile);
  except
    on E:Exception do
      HandleFileCreateException(FAppOptions, E, GetUserAppOptionsFile);
  end;
  FreeAndNil(FAppOptions);
end;

{ TAppUtils }

class function TAppUtils.ActionShortCutInUse(AM:TActionList;
  ShortCut:Word):boolean;
begin
  Result := AppUtils.ActionShortCutInUse(AM, ShortCut);
end;

class function TAppUtils.AutoDetectCharacterSet(Stream:TStream):TEncoding;
begin
  Result := AppUtils.AutoDetectCharacterSet(Stream);
end;

class function TAppUtils.AutoDetectCharacterSet(const Filename:WideString):TEncoding;
begin
  Result := AppUtils.AutoDetectCharacterSet(Filename);
end;

class function TAppUtils.DetectEncoding(const FileName:WideString):TEncoding;
begin
  Result := AppUtils.DetectEncoding(FileName);
end;

class function TAppUtils.FileCharSetToEncoding(
  CharSet:TTntStreamCharSet):TEncoding;
begin
  Result := AppUtils.FileCharSetToEncoding(CharSet);
end;

class function TAppUtils.FindActionShortCut(AM:TActionList;
  ShortCut:Word):TCustomAction;
begin
  Result := AppUtils.FindActionShortCut(AM, ShortCut);
end;

class procedure TAppUtils.FixXPStyles(AControl:TWinControl);
begin
  AppUtils.FixXPStyles(AControl);
end;

class function TAppUtils.GetAppStoragePath:WideString;
begin
  Result := AppUtils.GetAppStoragePath;
end;

class function TAppUtils.GetAppVersion:WideString;
begin
  Result := AppUtils.GetAppVersion;
end;

class function TAppUtils.GetCurrentYear:Integer;
begin
  Result := AppUtils.GetCurrentYear;
end;

class function TAppUtils.GetPluginsFolder:WideString;
begin
  Result := AppUtils.GetPluginsFolder;
end;

class function TAppUtils.GetUserAppDataFolder(
  const Default:WideString):WideString;
begin
  Result := AppUtils.GetUserAppDataFolder(Default);
end;

class function TAppUtils.GetUserAppOptionsFile:WideString;
begin
  Result := AppUtils.GetUserAppOptionsFile;
end;

class function TAppUtils.GetUserShortcutFile:WideString;
begin
  Result := AppUtils.GetUserShortCutFile;
end;

class function TAppUtils.GlobalApplicationServices:IApplicationServices;
begin
  Result := AppUtils.GlobalApplicationServices;
end;

class function TAppUtils.GlobalAppOptions:TAppOptions;
begin
  Result := AppUtils.GlobalAppOptions;
end;

class function TAppUtils.GlobalLanguageFile:TAppLanguage;
begin
  Result := AppUtils.GlobalLanguageFile;
end;

class procedure TAppUtils.HandleFileCreateException(Sender:TObject;
  E:Exception; const Filename:WideString);
begin
  AppUtils.HandleFileCreateException(Sender, E, Filename);
end;

class function TAppUtils.MyShortCutToText(ShortCut:TShortCut):WideString;
begin
  Result := AppUtils.MyShortCutToText(ShortCut);
end;

class function TAppUtils.RemoveActionShortCut(AM:TActionList;
  ShortCut:Word):integer;
begin
  Result := AppUtils.RemoveActionShortCut(AM, ShortCut);
end;

class procedure TAppUtils.TBMRULoadFromIni(MRU:TTBXMRUList);
begin
  AppUtils.TBMRULoadFromIni(MRU);
end;

class procedure TAppUtils.TBMRULoadFromReg(MRU:TTBXMRUList; RootKey:Cardinal;
  const Path:WideString);
begin
  AppUtils.TBMRULoadFromReg(MRU, RootKey, Path);
end;

class procedure TAppUtils.TBMRUSaveToIni(MRU:TTBXMRUList);
begin
  AppUtils.TBMRUSaveToIni(MRU);
end;

class procedure TAppUtils.TBMRUSaveToReg(MRU:TTBXMRUList; RootKey:Cardinal;
  const Path:WideString);
begin
  AppUtils.TBMRUSaveToReg(MRU, RootKey, Path);
end;

class function TAppUtils._(const ASection, AMsg:WideString):WideString;
begin
  Result := AppUtils._(ASection, AMsg);
end;

initialization

finalization
  SaveAndFreeOptions;
  FreeAndNil(FLanguageFile);

end.

