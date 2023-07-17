{@abstract(WideString version of IniFiles.pas) }
{
  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: WideIniFiles.pas 256 2007-10-17 20:57:18Z peter3 $

unit WideIniFiles;
{$I TRANSLATOR.INC}

interface
uses
  Windows, SysUtils, Classes, TntClasses;

type
  EWideIniFileException = class(Exception);

  TWideCustomIniFile = class(TObject)
  private
    FFileName:WideString;
  public
    constructor Create(const FileName:WideString);
    function SectionExists(const Section:WideString):Boolean;
    function ReadString(const Section, Ident, Default:WideString):WideString; virtual; abstract;
    procedure WriteString(const Section, Ident, Value:WideString); virtual; abstract;
    function ReadInteger(const Section, Ident:WideString; Default:Longint):Longint; virtual;
    procedure WriteInteger(const Section, Ident:WideString; Value:Longint); virtual;
    function ReadBool(const Section, Ident:WideString; Default:Boolean):Boolean; virtual;
    procedure WriteBool(const Section, Ident:WideString; Value:Boolean); virtual;
    function ReadBinaryStream(const Section, Name:WideString; Value:TStream):Integer; virtual;
    function ReadDate(const Section, Name:WideString; Default:TDateTime):TDateTime; virtual;
    function ReadDateTime(const Section, Name:WideString; Default:TDateTime):TDateTime; virtual;
    function ReadFloat(const Section, Name:WideString; Default:Double):Double; virtual;
    function ReadTime(const Section, Name:WideString; Default:TDateTime):TDateTime; virtual;
    procedure WriteBinaryStream(const Section, Name:WideString; Value:TStream); virtual;
    procedure WriteDate(const Section, Name:WideString; Value:TDateTime); virtual;
    procedure WriteDateTime(const Section, Name:WideString; Value:TDateTime); virtual;
    procedure WriteFloat(const Section, Name:WideString; Value:Double); virtual;
    procedure WriteTime(const Section, Name:WideString; Value:TDateTime); virtual;
    procedure ReadSection(const Section:WideString; Strings:TTntStrings); virtual; abstract;
    procedure ReadSections(Strings:TTntStrings); virtual; abstract;
    procedure ReadSectionValues(const Section:WideString; Strings:TTntStrings); virtual; abstract;
    procedure EraseSection(const Section:WideString); virtual; abstract;
    procedure DeleteKey(const Section, Ident:WideString); virtual; abstract;
    procedure UpdateFile; virtual; abstract;
    function ValueExists(const Section, Ident:WideString):Boolean;
    property FileName:WideString read FFileName;
  end;

  { TWideStringHash - used internally by TMemIniFile to optimize searches. }

  PPHashItem = ^PHashItem;
  PHashItem = ^THashItem;
  THashItem = record
    Next:PHashItem;
    Key:WideString;
    Value:Integer;
  end;

  TWideStringHash = class
  private
    Buckets:array of PHashItem;
  protected
    function Find(const Key:WideString):PPHashItem;
    function HashOf(const Key:WideString):Cardinal; virtual;
  public
    constructor Create(Size:Cardinal = 256);
    destructor Destroy; override;
    procedure Add(const Key:WideString; Value:Integer);
    procedure Clear;
    procedure Remove(const Key:WideString);
    function Modify(const Key:WideString; Value:Integer):Boolean;
    function ValueOf(const Key:WideString):Integer;
  end;

  { TWideHashedStringList - A TTntStringList that uses TWideStringHash to improve the
    speed of Find }
  TWideHashedStringList = class(TTntStringList)
  private
    FValueHash:TWideStringHash;
    FNameHash:TWideStringHash;
    FValueHashValid:Boolean;
    FNameHashValid:Boolean;
    procedure UpdateValueHash;
    procedure UpdateNameHash;
  protected
    procedure Changed; override;
  public
    destructor Destroy; override;
    function IndexOf(const S:WideString):Integer; override;
    function IndexOfName(const Name:WideString):Integer; override;
  end;

  { TWideMemIniFile - loads an entire INI file into memory and allows all
    operations to be performed on the memory image.  The image can then
    be written out to the disk file by calling UpdateFile }

  TWideMemIniFile = class(TWideCustomIniFile)
  private
    FSections:TTntStringList;
    function AddSection(const Section:WideString):TTntStrings;
    function GetCaseSensitive:Boolean;
    procedure LoadValues;
    procedure SetCaseSensitive(Value:Boolean);
  public
    constructor Create(const FileName:WideString);
    destructor Destroy; override;
    procedure Clear;
    procedure DeleteKey(const Section, Ident:WideString); override;
    procedure EraseSection(const Section:WideString); override;
    procedure GetStrings(List:TTntStrings);
    procedure ReadSection(const Section:WideString; Strings:TTntStrings); override;
    procedure ReadSections(Strings:TTntStrings); override;
    procedure ReadSectionValues(const Section:WideString; Strings:TTntStrings); override;
    function ReadString(const Section, Ident, Default:WideString):WideString; override;
    procedure Rename(const FileName:WideString; Reload:Boolean);
    procedure SetStrings(List:TTntStrings);
    procedure UpdateFile; override;
    procedure WriteString(const Section, Ident, Value:WideString); override;
    property CaseSensitive:Boolean read GetCaseSensitive write SetCaseSensitive;
  end;

  TWideIniFile = class(TWideMemIniFile)
  public
    destructor Destroy; override;
    function ReadString(const Section, Ident, Default:WideString):WideString; override;
    procedure WriteString(const Section, Ident, Value:WideString); override;
    procedure ReadSection(const Section:WideString; Strings:TTntStrings); override;
    procedure ReadSections(Strings:TTntStrings); override;
    procedure ReadSectionValues(const Section:WideString; Strings:TTntStrings); override;
    procedure EraseSection(const Section:WideString); override;
    procedure DeleteKey(const Section, Ident:WideString); override;
    procedure UpdateFile; override;
  end;

implementation
uses
  TntSysUtils, {$IFDEF COMPILER_9_UP}WideStrUtils{$ELSE}TntWideStrUtils{$ENDIF}, RTLConsts;

function PChar2(const S:WideString):PChar;
begin
  Result := PChar(string(S));
end;

{ TWideCustomIniFile }

constructor TWideCustomIniFile.Create(const FileName:WideString);
begin
  FFileName := FileName;
end;

function TWideCustomIniFile.SectionExists(const Section:WideString):Boolean;
var
  S:TTntStrings;
begin
  S := TTntStringlist.Create;
  try
    ReadSection(Section, S);
    Result := S.Count > 0;
  finally
    S.Free;
  end;
end;

function TWideCustomIniFile.ReadInteger(const Section, Ident:WideString;
  Default:Longint):Longint;
var
  IntStr:WideString;
begin
  IntStr := ReadString(Section, Ident, '');
  if (Length(IntStr) > 2) and (IntStr[1] = '0') and
    ((IntStr[2] = 'X') or (IntStr[2] = 'x')) then
    IntStr := '$' + Copy(IntStr, 3, Maxint);
  Result := StrToIntDef(IntStr, Default);
end;

procedure TWideCustomIniFile.WriteInteger(const Section, Ident:WideString; Value:Longint);
begin
  WriteString(Section, Ident, IntToStr(Value));
end;

function TWideCustomIniFile.ReadBool(const Section, Ident:WideString;
  Default:Boolean):Boolean;
begin
  Result := ReadInteger(Section, Ident, Ord(Default)) <> 0;
end;

function TWideCustomIniFile.ReadDate(const Section, Name:WideString; Default:TDateTime):TDateTime;
var
  DateStr:WideString;
begin
  DateStr := ReadString(Section, Name, '');
  Result := Default;
  if DateStr <> '' then
  try
    Result := StrToDate(DateStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
  else
    raise;
  end;
end;

function TWideCustomIniFile.ReadDateTime(const Section, Name:WideString; Default:TDateTime):TDateTime;
var
  DateStr:WideString;
begin
  DateStr := ReadString(Section, Name, '');
  Result := Default;
  if DateStr <> '' then
  try
    Result := StrToDateTime(DateStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
  else
    raise;
  end;
end;

function TWideCustomIniFile.ReadFloat(const Section, Name:WideString; Default:Double):Double;
var
  FloatStr:WideString;
begin
  FloatStr := ReadString(Section, Name, '');
  Result := Default;
  if FloatStr <> '' then
  try
    Result := StrToFloat(FloatStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
  else
    raise;
  end;
end;

function TWideCustomIniFile.ReadTime(const Section, Name:WideString; Default:TDateTime):TDateTime;
var
  TimeStr:WideString;
begin
  TimeStr := ReadString(Section, Name, '');
  Result := Default;
  if TimeStr <> '' then
  try
    Result := StrToTime(TimeStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
  else
    raise;
  end;
end;

procedure TWideCustomIniFile.WriteDate(const Section, Name:WideString; Value:TDateTime);
begin
  WriteString(Section, Name, DateToStr(Value));
end;

procedure TWideCustomIniFile.WriteDateTime(const Section, Name:WideString; Value:TDateTime);
begin
  WriteString(Section, Name, DateTimeToStr(Value));
end;

procedure TWideCustomIniFile.WriteFloat(const Section, Name:WideString; Value:Double);
begin
  WriteString(Section, Name, FloatToStr(Value));
end;

procedure TWideCustomIniFile.WriteTime(const Section, Name:WideString; Value:TDateTime);
begin
  WriteString(Section, Name, TimeToStr(Value));
end;

procedure TWideCustomIniFile.WriteBool(const Section, Ident:WideString; Value:Boolean);
const
  Values:array[Boolean] of WideString = ('0', '1');
begin
  WriteString(Section, Ident, Values[Value]);
end;

function TWideCustomIniFile.ValueExists(const Section, Ident:WideString):Boolean;
var
  S:TTntStrings;
begin
  S := TTntStringlist.Create;
  try
    ReadSection(Section, S);
    Result := S.IndexOf(Ident) > -1;
  finally
    S.Free;
  end;
end;

function TWideCustomIniFile.ReadBinaryStream(const Section,
  Name:WideString; Value:TStream):Integer;
begin
  raise EWideIniFileException.Create('ReadBinaryStream not implemented!');
end;

procedure TWideCustomIniFile.WriteBinaryStream(const Section,
  Name:WideString; Value:TStream);
begin
  raise EWideIniFileException.Create('WriteBinaryStream not implemented!');
end;

{ TWideStringHash }

procedure TWideStringHash.Add(const Key:WideString; Value:Integer);
var
  Hash:Integer;
  Bucket:PHashItem;
begin
  Hash := HashOf(Key) mod Cardinal(Length(Buckets));
  New(Bucket);
  Bucket^.Key := Key;
  Bucket^.Value := Value;
  Bucket^.Next := Buckets[Hash];
  Buckets[Hash] := Bucket;
end;

procedure TWideStringHash.Clear;
var
  I:Integer;
  P, N:PHashItem;
begin
  for I := 0 to Length(Buckets) - 1 do
  begin
    P := Buckets[I];
    while P <> nil do
    begin
      N := P^.Next;
      Dispose(P);
      P := N;
    end;
    Buckets[I] := nil;
  end;
end;

constructor TWideStringHash.Create(Size:Cardinal);
begin
  inherited Create;
  SetLength(Buckets, Size);
end;

destructor TWideStringHash.Destroy;
begin
  Clear;
  inherited Destroy;
end;

function TWideStringHash.Find(const Key:WideString):PPHashItem;
var
  Hash:Integer;
begin
  Hash := HashOf(Key) mod Cardinal(Length(Buckets));
  Result := @Buckets[Hash];
  while Result^ <> nil do
  begin
    if Result^.Key = Key then
      Exit
    else
      Result := @Result^.Next;
  end;
end;

function TWideStringHash.HashOf(const Key:WideString):Cardinal;
var
  I:Integer;
begin
  Result := 0;
  for I := 1 to Length(Key) do
    Result := ((Result shl 2) or (Result shr (SizeOf(Result) * 8 - 2))) xor
      Ord(Key[I]);
end;

function TWideStringHash.Modify(const Key:WideString; Value:Integer):Boolean;
var
  P:PHashItem;
begin
  P := Find(Key)^;
  if P <> nil then
  begin
    Result := True;
    P^.Value := Value;
  end
  else
    Result := False;
end;

procedure TWideStringHash.Remove(const Key:WideString);
var
  P:PHashItem;
  Prev:PPHashItem;
begin
  Prev := Find(Key);
  P := Prev^;
  if P <> nil then
  begin
    Prev^ := P^.Next;
    Dispose(P);
  end;
end;

function TWideStringHash.ValueOf(const Key:WideString):Integer;
var
  P:PHashItem;
begin
  P := Find(Key)^;
  if P <> nil then
    Result := P^.Value
  else
    Result := -1;
end;

{ TWideHashedStringList }

procedure TWideHashedStringList.Changed;
begin
  inherited Changed;
  FValueHashValid := False;
  FNameHashValid := False;
end;

destructor TWideHashedStringList.Destroy;
begin
  FValueHash.Free;
  FNameHash.Free;
  inherited Destroy;
end;

function TWideHashedStringList.IndexOf(const S:WideString):Integer;
begin
  UpdateValueHash;
  if not CaseSensitive then
    Result := FValueHash.ValueOf(AnsiUpperCase(S))
  else
    Result := FValueHash.ValueOf(S);
end;

function TWideHashedStringList.IndexOfName(const Name:WideString):Integer;
begin
  UpdateNameHash;
  if not CaseSensitive then
    Result := FNameHash.ValueOf(AnsiUpperCase(Name))
  else
    Result := FNameHash.ValueOf(Name);
end;

procedure TWideHashedStringList.UpdateNameHash;
var
  I:Integer;
  P:Integer;
  Key:WideString;
begin
  if FNameHashValid then
    Exit;

  if FNameHash = nil then
    FNameHash := TWideStringHash.Create
  else
    FNameHash.Clear;
  for I := 0 to Count - 1 do
  begin
    Key := Get(I);
    P := AnsiPos(NameValueSeparator, Key);
    if P <> 0 then
    begin
      if not CaseSensitive then
        Key := AnsiUpperCase(Copy(Key, 1, P - 1))
      else
        Key := Copy(Key, 1, P - 1);
      FNameHash.Add(Key, I);
    end;
  end;
  FNameHashValid := True;
end;

procedure TWideHashedStringList.UpdateValueHash;
var
  I:Integer;
begin
  if FValueHashValid then
    Exit;

  if FValueHash = nil then
    FValueHash := TWideStringHash.Create
  else
    FValueHash.Clear;
  for I := 0 to Count - 1 do
    if not CaseSensitive then
      FValueHash.Add(AnsiUpperCase(Self[I]), I)
    else
      FValueHash.Add(Self[I], I);
  FValueHashValid := True;
end;

{ TWideMemIniFile }

constructor TWideMemIniFile.Create(const FileName:WideString);
begin
  inherited Create(FileName);
  FSections := TWideHashedStringList.Create;
  LoadValues;
end;

destructor TWideMemIniFile.Destroy;
begin
  if FSections <> nil then
    Clear;
  FSections.Free;
  inherited Destroy;
end;

function TWideMemIniFile.AddSection(const Section:WideString):TTntStrings;
begin
  Result := TWideHashedStringList.Create;
  try
    TWideHashedStringList(Result).CaseSensitive := CaseSensitive;
    FSections.AddObject(Section, Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure TWideMemIniFile.Clear;
var
  I:Integer;
begin
  for I := 0 to FSections.Count - 1 do
    TObject(FSections.Objects[I]).Free;
  FSections.Clear;
end;

procedure TWideMemIniFile.DeleteKey(const Section, Ident:WideString);
var
  I, J:Integer;
  Strings:TTntStrings;
begin
  I := FSections.IndexOf(Section);
  if I >= 0 then
  begin
    Strings := TTntStrings(FSections.Objects[I]);
    J := Strings.IndexOfName(Ident);
    if J >= 0 then
      Strings.Delete(J);
  end;
end;

procedure TWideMemIniFile.EraseSection(const Section:WideString);
var
  I:Integer;
begin
  I := FSections.IndexOf(Section);
  if I >= 0 then
  begin
    TTntStrings(FSections.Objects[I]).Free;
    FSections.Delete(I);
  end;
end;

function TWideMemIniFile.GetCaseSensitive:Boolean;
begin
  Result := FSections.CaseSensitive;
end;

procedure TWideMemIniFile.GetStrings(List:TTntStrings);
var
  I, J:Integer;
  Strings:TTntStrings;
begin
  List.BeginUpdate;
  try
    for I := 0 to FSections.Count - 1 do
    begin
      List.Add('[' + FSections[I] + ']');
      Strings := TTntStrings(FSections.Objects[I]);
      for J := 0 to Strings.Count - 1 do
        List.Add(Strings[J]);
      List.Add('');
    end;
  finally
    List.EndUpdate;
  end;
end;

procedure TWideMemIniFile.LoadValues;
var
  List:TTntStringList;
begin
  if (FileName <> '') and FileExists(FileName) then
  begin
    List := TTntStringList.Create;
    try
      List.LoadFromFile(FileName);
      SetStrings(List);
    finally
      List.Free;
    end;
  end
  else
    Clear;
end;

procedure TWideMemIniFile.ReadSection(const Section:WideString;
  Strings:TTntStrings);
var
  I, J:Integer;
  SectionStrings:TTntStrings;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    I := FSections.IndexOf(Section);
    if I >= 0 then
    begin
      SectionStrings := TTntStrings(FSections.Objects[I]);
      for J := 0 to SectionStrings.Count - 1 do
        Strings.Add(SectionStrings.Names[J]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TWideMemIniFile.ReadSections(Strings:TTntStrings);
begin
  Strings.Assign(FSections);
end;

procedure TWideMemIniFile.ReadSectionValues(const Section:WideString;
  Strings:TTntStrings);
var
  I:Integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    I := FSections.IndexOf(Section);
    if I >= 0 then
      Strings.Assign(TTntStrings(FSections.Objects[I]));
  finally
    Strings.EndUpdate;
  end;
end;

function TWideMemIniFile.ReadString(const Section, Ident,
  Default:WideString):WideString;
var
  I:Integer;
  Strings:TTntStrings;
begin
  I := FSections.IndexOf(Section);
  if I >= 0 then
  begin
    Strings := TTntStrings(FSections.Objects[I]);
    I := Strings.IndexOfName(Ident);
    if I >= 0 then
    begin
      Result := Copy(Strings[I], Length(Ident) + 2, Maxint);
      Exit;
    end;
  end;
  Result := Default;
end;

procedure TWideMemIniFile.Rename(const FileName:WideString; Reload:Boolean);
begin
  FFileName := FileName;
  if Reload then
    LoadValues;
end;

procedure TWideMemIniFile.SetCaseSensitive(Value:Boolean);
var
  I:Integer;
begin
  if Value <> FSections.CaseSensitive then
  begin
    FSections.CaseSensitive := Value;
    for I := 0 to FSections.Count - 1 do
      with TWideHashedStringList(FSections.Objects[I]) do
      begin
        CaseSensitive := Value;
        Changed;
      end;
    TWideHashedStringList(FSections).Changed;
  end;
end;

procedure TWideMemIniFile.SetStrings(List:TTntStrings);
var
  I, J:Integer;
  S:WideString;
  Strings:TTntStrings;
begin
  Clear;
  Strings := nil;
  for I := 0 to List.Count - 1 do
  begin
    S := Trim(List[I]);
    if (S <> '') and (S[1] <> ';') then
      if (S[1] = '[') and (S[Length(S)] = ']') then
      begin
        Delete(S, 1, 1);
        SetLength(S, Length(S) - 1);
        Strings := AddSection(Trim(S));
      end
      else if Strings <> nil then
      begin
        J := Pos('=', S);
        if J > 0 then // remove spaces before and after '='
          Strings.Add(Trim(Copy(S, 1, J - 1)) + '=' + Trim(Copy(S, J + 1, MaxInt)))
        else
          Strings.Add(S);
      end;
  end;
end;

procedure TWideMemIniFile.UpdateFile;
var
  List:TTntStringList;
begin
  List := TTntStringList.Create;
  try
    GetStrings(List);
    List.SaveToFile(FFileName);
  finally
    List.Free;
  end;
end;

procedure TWideMemIniFile.WriteString(const Section, Ident, Value:WideString);
var
  I:Integer;
  S:WideString;
  Strings:TTntStrings;
begin
  I := FSections.IndexOf(Section);
  if I >= 0 then
    Strings := TTntStrings(FSections.Objects[I])
  else
    Strings := AddSection(Section);
  S := Ident + '=' + Value;
  I := Strings.IndexOfName(Ident);
  if I >= 0 then
    Strings[I] := S
  else
    Strings.Add(S);
end;

{ TWideIniFile }

procedure TWideIniFile.DeleteKey(const Section, Ident:WideString);
begin
  if Win32PlatformIsUnicode then
    WritePrivateProfileStringW(PWideChar(Section), PWideChar(Ident), nil, PWideChar(FFileName))
  else
    WritePrivateProfileStringA(PChar2(Section), PChar2(Ident), nil, PChar2(FFileName));
end;

destructor TWideIniFile.Destroy;
begin
  UpdateFile;
  inherited Destroy;
end;

procedure TWideIniFile.EraseSection(const Section:WideString);
begin
  if Win32PlatformIsUnicode then
  begin
    if not WritePrivateProfileStringW(PWideChar(Section), nil, nil, PWideChar(FFileName)) then
      EWideIniFileException.CreateFmt(SIniFileWriteError, [FFileName]);
  end
  else if not WritePrivateProfileStringA(PChar2(Section), nil, nil, PChar2(FFileName)) then
    raise EWideIniFileException.CreateFmt(SIniFileWriteError, [FFileName]);

end;

procedure TWideIniFile.ReadSection(const Section:WideString;
  Strings:TTntStrings);
const
  BufSize = 16384;
var
  WBuffer, P:PWideChar;
  ABuffer, P2:PChar;
begin
  WBuffer := nil;
  ABuffer := nil;
  if Win32PlatformIsUnicode then
    GetMem(WBuffer, BufSize * 2)
  else
    GetMem(ABuffer, BufSize);
  try
    Strings.BeginUpdate;
    try
      Strings.Clear;
      if Win32PlatformIsUnicode then
      begin
        if GetPrivateProfileStringW(PWideChar(Section), nil, nil, WBuffer, BufSize,
          PWideChar(FFileName)) <> 0 then
        begin
          P := WBuffer;
          while P^ <> #0 do
          begin
            Strings.Add(P);
            Inc(P, WStrLen(P) + 1);
          end;
        end;
      end
      else
      begin
        if GetPrivateProfileStringA(PChar2(Section), nil, nil, ABuffer, BufSize,
          PChar2(FFileName)) <> 0 then
        begin
          P2 := ABuffer;
          while P2^ <> #0 do
          begin
            Strings.Add(P2);
            Inc(P2, StrLen(P2) + 1);
          end;
        end;
      end;
    finally
      Strings.EndUpdate;
    end;
  finally
    if Win32PlatformIsUnicode then
      FreeMem(WBuffer, BufSize * 2)
    else
      FreeMem(ABuffer, BufSize);
  end;
end;

procedure TWideIniFile.ReadSections(Strings:TTntStrings);
const
  BufSize = 16384;
var
  WBuffer, P:PWideChar;
  ABuffer, P2:PChar;
begin
  WBuffer := nil;
  ABuffer := nil;
  if Win32PlatformIsUnicode then
    GetMem(WBuffer, BufSize * 2)
  else
    GetMem(ABuffer, BufSize);
  try
    Strings.BeginUpdate;
    try
      Strings.Clear;
      if Win32PlatformIsUnicode then
      begin
        if GetPrivateProfileStringW(nil, nil, nil, WBuffer, BufSize,
          PWideChar(FFileName)) <> 0 then
        begin
          P := WBuffer;
          while P^ <> #0 do
          begin
            Strings.Add(P);
            Inc(P, WStrLen(P) + 1);
          end;
        end
      end
      else
      begin
        if GetPrivateProfileStringA(nil, nil, nil, ABuffer, BufSize,
          PChar2(FFileName)) <> 0 then
        begin
          P2 := ABuffer;
          while P2^ <> #0 do
          begin
            Strings.Add(P2);
            Inc(P2, StrLen(P2) + 1);
          end;
        end

      end;
    finally
      Strings.EndUpdate;
    end;
  finally
    if Win32PlatformIsUnicode then
      FreeMem(WBuffer, BufSize * 2)
    else
      FreeMem(ABuffer, BufSize);
  end;
end;

procedure TWideIniFile.ReadSectionValues(const Section:WideString;
  Strings:TTntStrings);
var
  KeyList:TTntStringList;
  I:Integer;
begin
  KeyList := TTntStringList.Create;
  try
    ReadSection(Section, KeyList);
    Strings.BeginUpdate;
    try
      Strings.Clear;
      for I := 0 to KeyList.Count - 1 do
        Strings.Add(KeyList[I] + WideChar('=') + ReadString(Section, KeyList[I], ''))
    finally
      Strings.EndUpdate;
    end;
  finally
    KeyList.Free;
  end;
end;

function TWideIniFile.ReadString(const Section, Ident,
  Default:WideString):WideString;
var
  WBuffer:array[0..2047] of WideChar;
  ABuffer:array[0..2047] of Char;
begin
  if Win32PlatformIsUnicode then
    SetString(Result, WBuffer, GetPrivateProfileStringW(PWideChar(Section),
      PWideChar(Ident), PWideChar(Default), WBuffer, SizeOf(WBuffer), PWideChar(FFileName)))
  else
    SetString(Result, ABuffer, GetPrivateProfileStringA(PChar2(Section),
      PChar2(Ident), PChar2(Default), ABuffer, SizeOf(ABuffer), PChar2(FFileName)));
end;

procedure TWideIniFile.UpdateFile;
begin
  if Win32PlatformIsUnicode then
    WritePrivateProfileStringW(nil, nil, nil, PWideChar(FFileName))
  else
    WritePrivateProfileStringA(nil, nil, nil, PChar2(FFileName))
end;

procedure TWideIniFile.WriteString(const Section, Ident,
  Value:WideString);
begin
  if Win32PlatformIsUnicode then
  begin
    if not WritePrivateProfileStringW(PWideChar(Section), PWideChar(Ident),
      PWideChar(Value), PWideChar(FFileName)) then
      raise EWideIniFileException.CreateFmt(SIniFileWriteError, [FileName]);
  end
  else if not WritePrivateProfileStringA(PChar2(Section), PChar2(Ident),
    PChar2(Value), PChar2(FFileName)) then
    raise EWideIniFileException.CreateFmt(SIniFileWriteError, [FileName]);
end;

end.
