{@abstract(Translation utilities) }
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
// $Id: MsgTranslate.pas 249 2007-08-14 16:29:55Z peter3 $

unit MsgTranslate;

{$I TRANSLATOR.INC}

interface
uses
  SysUtils, WideIniFiles, Classes, TransIntf, TntClasses;

type
  TTranslateEvent = procedure(Sender, AnObject:TObject; const APropName, ASection:WideString; var AValue:WideString) of object;
  TTemplateEvent = procedure(Sender, AnObject:TObject; const APropName:WideString; var ASection, AName, AValue:WideString) of object;
  TCheckTranslateEvent = procedure(Sender, AnObject:TObject; const APropName:WideString; var ATranslate:boolean) of object;

  TSaveTranslationEvent = procedure(Sender:TObject; ini:TWideCustomIniFile) of object;

  TAppLanguage = class(TObject, IInterface)
  private
    FLangFile:TWideMemIniFile;
    FSkipList:TTntStrings;
    FClassSkipList:TThreadList;
    FOnWrite:TTemplateEvent;
    FOnRead:TTranslateEvent;
    FOnWriteAdditional:TSaveTranslationEvent;
    FFilename:WideString;
    FOnReading:TCheckTranslateEvent;
    FOnWriting:TCheckTranslateEvent;
    procedure WriteTranslationSub(IniFile:TWideCustomIniFile; AnObject:TObject);
    { IInterface }
    function _AddRef:Integer; stdcall;
    function _Release:Integer; stdcall;
    function QueryInterface(const IID:TGUID; out Obj):HRESULT; stdcall;
  protected
    function DoReading(AnObject:TObject; const PropName:WideString):boolean;
    function DoWriting(AnObject:TObject; const PropName:WideString):boolean;
    procedure DoReadObject(AnObject:TObject; const PropName, Section:WideString; var AValue:WideString); dynamic;
    procedure DoWriteObject(AnObject:TObject; const PropName:WideString; var ASection, AName, AValue:WideString); dynamic;
  public
    function Translate(const Section, Name, Value:WideString):WideString;

    constructor Create(const Filename:WideString = '');
    destructor Destroy; override;
    function InSkipList(const S:WideString):boolean;
    function InClassSkipList(AClass:TClass):boolean;
    // TranslateObject iterates over AnObject's published properties and calls OnReading/OnRead for each
    // WideString or TTntStrings type property unless AnObject is in the class skiplist or the
    // property name is in the property skiplist. If it's OK to translate, the
    // new value (gotten from OnRead) is written to the property
    // If the property is a TCollection, it's Items properties are iterated as well (and so on) unless
    // ANObject is in the class skiplist
    // If AnObject is a TComponent, it's Components array is iterated as well even if AnObject
    // is in the class skiplist (and so on)
    procedure TranslateObject(AnObject:TObject; const Section:WideString);
    procedure LoadFromFile(const AFilename:WideString);
    procedure SaveToFile(const AFilename:WideString);
    // creates a new template language file with the name AFilename.
    // AnObject is written and then iterated (if it is a TComponent with Components)
    procedure CreateTemplate(const AFilename:WideString; AnObject:TObject);
    // add a class to skip when reading / writing
    procedure SkipClass(AClass:TClass);
    // add a published property skip (for all classes) when reading / writing
    procedure SkipProperty(const PropName:WideString);

    property Filename:WideString read FFilename;
    property SkipList:TTntStrings read FSkipList;
    property ClassSkipList:TThreadList read FClassSkipList;
    // OnReading and OnRead are used with TranslateObject:
    // Return false in ATranslate if this object/property shouldn't be read
    // if ATranslate is false and PropName = '', the entire object will be skipped
    property OnReading:TCheckTranslateEvent read FOnReading write FOnReading;
    // assign event handler to do the actual reading
    property OnRead:TTranslateEvent read FOnRead write FOnRead;
    // OnWrite and OnWriting are used with CreateTemplate:
    // return false in ATranslate if this class/property shouldn't be written
    // if ATranslate is false and if PropName = '', the entire object will be skipped
    property OnWriting:TCheckTranslateEvent read FOnWriting write FOnWriting;
    // assign event handler to do the actual writing
    property OnWrite:TTemplateEvent read FOnWrite write FOnWrite;
    // OnWriteAdditional is are used with CreateTemplate: assign event handler to write any additional
    // strings not caught by OnWrite (like consts and resourcestrings)
    property OnWriteAdditional:TSaveTranslationEvent read FOnWriteAdditional write FOnWriteAdditional;
  end;

function DecodeStrings(const S:WideString):WideString;
function EncodeStrings(const S:WideString):WideString;

resourcestring
  SPropNotFoundFmt = 'Property %s not found';

implementation
uses
  TypInfo, TntSysUtils;

function DecodeStrings(const S:WideString):WideString;
var
  i, j, l:integer;
begin
  Result := '';
  SetLength(Result, Length(S));
  j := 0;
  i := 1;
  l := Length(S);
  while i <= l do
  begin
    if (i < l) and (S[i] = '\') then
    begin
      case S[i + 1] of
        '\':
          begin
            Inc(i);
            Inc(j);
            Result[j] := S[i];
          end;
        'n':
          begin
            Inc(i);
            Inc(j);
            Result[j] := #10;
          end;
        'r':
          begin
            Inc(i);
            Inc(j);
            Result[j] := #13;
          end;
        't':
          begin
            Inc(i);
            Inc(j);
            Result[j] := #9;
          end;
      else
        begin
          Inc(j);
          Result[j] := S[i];
        end;
      end // case
    end
    else
    begin
      Inc(j);
      Result[j] := S[i];
    end;
    Inc(i);
  end;
  SetLength(Result, j);
//  Result := Tnt_WideStringReplace(S, '\n', SLineBreak, [rfReplaceAll]);
end;

function EncodeStrings(const S:WideString):WideString;
const
  TAB = WideChar(#9);
  CR = WideChar(#10);
  LF = WideChar(#13);
  WBackSlash = WideChar('\');
var
  i, j:integer;
begin
  j := 0;
  Result := '';
  SetLength(Result, Length(S) * 2); // every character in S is a #9, #10 or #13...
  for i := 1 to Length(S) do
  begin
    if S[i] in [TAB, CR, LF, WBackSlash] then
    begin
      Inc(j);
      Result[j] := '\';
      Inc(j);
      case S[i] of
        TAB:Result[j] := 't';
        CR:Result[j] := 'n';
        LF:Result[j] := 'r';
        WBackSlash:Dec(j); // Result[j] := '\';
      end;
    end
    else
    begin
      Inc(j);
      Result[j] := S[i];
    end;
  end;
  SetLength(Result, j);
//  Result := Tnt_WideStringReplace(S, SLineBreak, '\n', [rfReplaceAll]);
end;

{ TAppLanguage }

function TAppLanguage._AddRef:Integer;
begin
  Result := -1; // no ref counting!
end;

function TAppLanguage._Release:Integer;
begin
  Result := -1; // no ref counting!
end;

function TAppLanguage.QueryInterface(const IID:TGUID; out Obj):HRESULT;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

constructor TAppLanguage.Create(const Filename:WideString);
begin
  inherited Create;
  FSkipList := TTntStringlist.Create;
  TTntStringlist(FSkipList).Sorted := true;
  FClassSkipList := TThreadList.Create;
  if WideFileExists(Filename) then
    LoadFromFile(Filename);
end;

procedure TAppLanguage.WriteTranslationSub(IniFile:TWideCustomIniFile; AnObject:TObject);
var
  i, j, Count:integer;
  PropList:PPropList;
  PropName:WideString;
  PropInfo:PPropInfo;
  sl:TObject;
  ASection, AName, AValue:WideString;

  function IsWriteProp(Info:PPropInfo):Boolean;
  begin
    Result := Assigned(Info) and (Info^.SetProc <> nil);
  end;
begin
  if AnObject = nil then
    Exit;
  if not InClassSkipList(AnObject.ClassType) and DoWriting(AnObject, '') then
  begin
    ASection := '';
    Count := GetPropList(AnObject, PropList);
    try
      for j := 0 to Count - 1 do
      begin
        PropInfo := PropList[j];
        PropName := UpperCase(PropInfo^.Name);
        if InSkipList(PropName) or not DoWriting(AnObject, PropName) then
          Continue;
        try
          case PropInfo^.PropType^.Kind of
            tkString, tkLString, tkWString:
              begin
                AValue := GetWideStrProp(AnObject, PropName);
                if (trim(AValue) <> '') and (IsWriteProp(PropInfo)) then
                begin
                  AName := EncodeStrings(AValue);
                  DoWriteObject(AnObject, PropName, ASection, AName, AValue);
                  if (ASection <> '') and (AName <> '') then
                    IniFile.WriteString(ASection, EncodeStrings(AName), EncodeStrings(AValue));
                end;
              end;
            tkClass:
              begin
                sl := GetObjectProp(AnObject, PropName);
                if (sl = nil) then
                  Continue;
             // Check for TStrings translation
                if sl is TStrings then
                begin
                  AValue := EncodeStrings(TStrings(sl).Text);
                  AName := AValue;
                  DoWriteObject(AnObject, PropName, ASection, AName, AValue);
                  if (ASection <> '') and (AName <> '') then
                    IniFile.WriteString(ASection, EncodeStrings(AName), EncodeStrings(AValue));
                end
                else if sl is TTntStrings then
                begin
                  AValue := EncodeStrings(TTntStrings(sl).Text);
                  AName := AValue;
                  DoWriteObject(AnObject, PropName, ASection, AName, AValue);
                  if (ASection <> '') and (AName <> '') then
                    IniFile.WriteString(ASection, EncodeStrings(AName), EncodeStrings(AValue));
                end
                else if sl is TCollection then
                  for i := 0 to TCollection(sl).Count - 1 do
                    WriteTranslationSub(IniFile, TCollection(sl).Items[i]);
              end;
          end; // case
        except
      //
        end;
      end;
    finally
      if Count > 0 then
        FreeMem(PropList);
    end;
  end;
  if AnObject is TComponent then
    for i := 0 to TComponent(AnObject).ComponentCount - 1 do
      WriteTranslationSub(IniFile, TComponent(AnObject).Components[i]);
end;

procedure TAppLanguage.CreateTemplate(const AFilename:WideString;
  AnObject:TObject);
var
  ini:TWideMemIniFile;
begin
  ini := TWideMemIniFile.Create(AFilename);
  try
    WriteTranslationSub(ini, AnObject);
    if Assigned(FOnWriteAdditional) then
      FOnWriteAdditional(self, ini);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

destructor TAppLanguage.Destroy;
begin
  FreeAndNil(FSkipList);
  FreeAndNil(FClassSkipList);
  FreeAndNil(FLangFile);
  inherited;
end;

procedure TAppLanguage.DoReadObject(AnObject:TObject; const PropName,
  Section:WideString; var AValue:WideString);
begin
  if Assigned(FOnRead) then
    FOnRead(self, AnObject, PropName, Section, AValue);
end;

function TAppLanguage.InClassSkipList(AClass:TClass):boolean;
var
  FParent:TClass;
begin
  with FClassSkipList.LockList do
  try
    // check this class and all ancestors:
    Result := false;
    FParent := AClass;
    while not Result do
    begin
      if FParent <> nil then
      begin
        Result := IndexOf(Pointer(FParent)) >= 0;
        FParent := FParent.ClassParent;
      end
      else
        Break;
    end;
  finally
    FClassSkipList.UnlockList;
  end;
end;

function TAppLanguage.InSkipList(const S:WideString):boolean;
begin
  Result := Assigned(FSkipList) and (FSkipList.IndexOf(S) > -1);
end;

procedure TAppLanguage.LoadFromFile(const AFilename:WideString);
begin
  FreeAndNil(FLangFile);
  FLangFile := TWideMemIniFile.Create(AFilename);
  FFilename := AFilename;
end;

procedure TAppLanguage.SaveToFile(const AFilename:WideString);
begin
  if FLangFile = nil then
    FLangFile := TWideMemIniFile.Create(AFilename)
  else if AFilename <> Filename then
    FLangFile.Rename(AFilename, false);
  FLangFile.UpdateFile;
end;

procedure TAppLanguage.SkipClass(AClass:TClass);
begin
  with FClassSkipList.LockList do
  try
    if IndexOf(Pointer(AClass)) < 0 then
      Add(Pointer(AClass));
  finally
    FClassSkipList.UnlockList;
  end;
end;

procedure TAppLanguage.SkipProperty(const PropName:WideString);
begin
  FSkipList.Add(PropName);
end;

procedure TAppLanguage.TranslateObject(AnObject:TObject; const Section:WideString);
var
  i, j, Count:integer;
  PropList:PPropList;
  PropName:WideString;
  PropInfo:PPropInfo;
  sl:TObject;
  ppi:PPropInfo;
  AValue, ANewValue:WideString;

  function IsWriteProp(Info:PPropInfo):Boolean;
  begin
    Result := Assigned(Info) and (Info^.SetProc <> nil);
  end;

begin
  if not InClassSkipList(AnObject.ClassType) and DoReading(AnObject, '') then
  begin
    Count := GetPropList(AnObject, PropList);
    try
      for j := 0 to Count - 1 do
      begin
        PropInfo := PropList[j];
        PropName := UpperCase(PropInfo^.Name);
        try
          if InSkiplist(PropName) or not DoReading(AnObject, PropName) then
            Continue;
          case PropInfo^.PropType^.Kind of
            tkString, tkLString, tkWString:
              begin
                AValue := GetWideStrProp(AnObject, PropName);
                if (AValue <> '') and (IsWriteProp(PropInfo)) then
                begin
                  ANewValue := EncodeStrings(AValue);
                  DoReadObject(AnObject, PropName, Section, ANewValue);
                  if not WideSameStr(ANewValue, EncodeStrings(AValue)) then
                  begin
                    ppi := GetPropInfo(AnObject, PropName);
                    if ppi = nil then
                      raise Exception.CreateFmt(SPropNotFoundFmt, [PropName]);
                    SetWideStrProp(AnObject, ppi, DecodeStrings(ANewValue));
                  end;
                end;
              end;
            tkClass:
              begin
                sl := GetObjectProp(AnObject, PropName);
                if (sl = nil) then
                  Continue;
             // Check for TStrings translation
                if sl is TStrings then
                begin
                  AValue := EncodeStrings(TStrings(sl).Text);
                  if AValue <> '' then
                  begin
                    ANewValue := AValue;
                    DoReadObject(AnObject, PropName, Section, ANewValue);
                    if not WideSameStr(ANewValue, AValue) then
                      TStrings(sl).Text := DecodeStrings(ANewValue); // NB! This will loose any data in Objects[] !
                  end
                end
                else if sl is TTntStrings then
                begin
                  AValue := EncodeStrings(TTntStrings(sl).Text);
                  if AValue <> '' then
                  begin
                    ANewValue := AValue;
                    DoReadObject(AnObject, PropName, Section, ANewValue);
                    if not WideSameStr(ANewValue, AValue) then
                      TTntStrings(sl).Text := DecodeStrings(ANewValue); // NB! This will loose any data in Objects[] !
                  end
                end
                else if sl is TCollection then
                  for i := 0 to TCollection(sl).Count - 1 do
                    TranslateObject(TCollection(sl).Items[i], Section);
              end;
          end; // case
        except
      //
        end;
      end;
    finally
      if Count > 0 then
        FreeMem(PropList);
    end;
  end;
  if AnObject is TComponent then
    for i := 0 to TComponent(AnObject).ComponentCount - 1 do
      TranslateObject(TComponent(AnObject).Components[i], Section);
end;

function TAppLanguage.Translate(const Section, Name, Value:WideString):WideString;
begin
  if FLangFile <> nil then
  begin
    Result := FLangFile.ReadString(Section, trim(EncodeStrings(Name)), EncodeStrings(Value));
    if Result <> '' then
      Result := DecodeStrings(Result)
    else
      Result := DecodeStrings(Value);
  end
  else
    Result := DecodeStrings(Value);
end;

procedure TAppLanguage.DoWriteObject(AnObject:TObject;
  const PropName:WideString; var ASection, AName, AValue:WideString);
begin
  if Assigned(FOnWrite) then
    FOnWrite(self, AnObject, PropName, ASection, AName, AValue);
end;

function TAppLanguage.DoReading(AnObject:TObject;
  const PropName:WideString):boolean;
begin
  Result := true;
  if Assigned(FOnReading) then
    FOnReading(self, AnObject, PropName, Result);
end;

function TAppLanguage.DoWriting(AnObject:TObject;
  const PropName:WideString):boolean;
begin
  Result := true;
  if Assigned(FOnWriting) then
    FOnWriting(self, AnObject, PropName, Result);
end;

end.
