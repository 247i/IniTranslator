{@abstract(OpenOffice GSI language file parser) }
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
// $Id: OOGSIParserImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit OOGSIParserImpl;

interface
uses
  SysUtils, Classes, Types, TntClasses, TransIntf;
{
 limitations:
  * only exports single line GSI files
  * assumes original and translation items are equivalent in count and ordering
}

type
  TGSIParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldHandle:LongWord;
    FAppServices:IApplicationServices;
    FCount:integer;
    FOrigFile, FTransFile:WideString;
    FOrigIsDual, FSearchTrans:boolean;
    FExportRect:TRect;
    procedure BuildPreview(const Items:ITranslationItems; Strings:TTntStrings);
    function DoImport(const Items, Orphans:ITranslationItems;
      const OrigFile, TransFile:string; OrigIsDual, SearchTrans:boolean):boolean;
    procedure LoadSettings;
    procedure SaveSettings;
    function Translate(const Value:WideString):WideString;
  public
    constructor Create;
    destructor Destroy; override;
    function Configure(Capability:Integer):HRESULT; safecall;
    function DisplayName(Capability:Integer):WideString; safecall;
    function ExportItems(const Items, Orphans:ITranslationItems):HRESULT; safecall;
    function ImportItems(const Items, Orphans:ITranslationItems):HRESULT; safecall;

    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Capabilities:Integer; safecall;
    function GetString(out Section, Name, Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Windows, Forms, IniFiles, TntSysUtils,
  CommonUtils, PreviewExportFrm, OOGSIImportFrm;

const
  cGSIFilter = 'OpenOffice files (*.gsi;*.sdf)|*.gsi;*.sdf|All files (*.*)|*.*';
  cGSIExportTitle = 'Export to OpenOffice language file';
  cGSIImportTitle = 'Import from OpenOffice language file';
  SImportError = 'There was an error importing, please check the files and try again';
  SError = 'OpenOffice Parser Error';
  SFmtErrorMsg = '%s';
  cGSIPlaceHolder = #27;
  cSectionName = 'OpenOffice';

function YesNo(const Text, Caption:string):boolean;
begin
  Result := Application.MessageBox(PChar(Text), PChar(Caption), MB_YESNO or MB_ICONQUESTION) = IDYES;
end;

function MyWideDequotedStr(const S:WideString; Quote:WideChar):WideString;
//var LText:PWideChar;
begin
  Result := S;
  if (S = '') or (Quote = #0) then
    Result := S;
  if (Length(S) > 1) and (S[1] = Quote) and (TntWideLastChar(S) = Quote) then
    Result := Copy(S, 2, Length(S) - 2)
end;

procedure ShowError(const Text:string);
begin
  Application.MessageBox(PChar(Format(SFmtErrorMsg, [Text])), PChar(SError), MB_OK or MB_ICONERROR);
end;

{ TGSIParser }

function TGSIParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TGSIParser.Configure(Capability:Integer):HRESULT;
begin
  Result := S_OK;
end;

constructor TGSIParser.Create;
begin
  inherited Create;
  FOldHandle := Application.Handle;
end;

procedure TGSIParser.BuildPreview(const Items:ITranslationItems;
  Strings:TTntStrings);
var
  i:integer;
  FOldSort:TTranslateSortType;
begin
  try
    FOldSort := Items.Sort;
    Strings.Clear;
    try
      Items.Sort := stIndex;
      for i := 0 to Items.Count - 1 do
        Strings.Add(StringReplace(Items[i].PrivateStorage, cGSIPlaceHolder, Items[i].Translation, []));
    finally
      Items.Sort := FOldSort;
    end;
  except
    Application.HandleException(Self);
  end;
end;

destructor TGSIParser.Destroy;
begin
  Application.Handle := FOldHandle;
  inherited;
end;

function TGSIParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:Result := Translate(cGSIImportTitle);
    CAP_EXPORT:Result := Translate(cGSIExportTitle);
//    CAP_CONFIGURE : Result := 'Configure';
  else
    Result := '';
  end;
end;

procedure StrTokenize(const S:WideString; Delimiter:WideChar; List:TTNTStringlist; MinLength:integer = 1);
var
  i, j:integer;
  tmp:WideString;
begin
  j := 1;
  for i := 1 to Length(S) do
  begin
    if (S[i] = Delimiter) then
    begin
      tmp := Copy(S, j, i - j);
      if Length(tmp) >= MinLength then
        List.Add(tmp);
      j := i + 1;
    end;
  end;
  if j <= Length(S) then
  begin
    tmp := Copy(S, j, MaxInt);
    if Length(tmp) >= MinLength then
      List.Add(tmp);
  end;
end;

function TGSIParser.DoImport(const Items, Orphans:ITranslationItems;
  const OrigFile, TransFile:string; OrigIsDual, SearchTrans:boolean):boolean;
var
  FOrig, FTrans, FTokens:TTntStringList;
  i, j:integer;
  FOldSort:TTranslateSortType;
  ATemplate, AName, ATranslation:WideString;

  function GetGSIString(const S:WideString; var ExtractedTemplate, AName:WideString):WideString;
  var
    i:integer;
  begin
    FTokens.Clear;
    StrTokenize(S, WideChar(#9), FTokens, 0);
    if FTokens.Count > 10 then
    begin
      Result := FTokens[10];
      FTokens[10] := cGSIPlaceHolder;
      AName := FTokens[5];
      if AName = '' then
        AName := FTokens[4]
      else
        AName := FTokens[4] + WideChar('.') + AName;
      ExtractedTemplate := '';
      for i := 0 to FTokens.Count - 1 do
        ExtractedTemplate := ExtractedTemplate + FTokens[i] + #9;
      ExtractedTemplate := Trim(ExtractedTemplate);
    end
    else
    begin
      ExtractedTemplate := S;
      Result := '';
    end;
  end;

  procedure ParseRow(const Orig, Trans:WideString);
  var
    S, AName:WideString;
  begin
    with Items.Add do
    begin
      Index := Items.Count;
      Section := cSectionName;
      S := '';
      Original := GetGSIString(Orig, S, AName);
      Name := AName;
      S := Trans;
      if S <> '' then
      begin
        Translation := GetGSIString(Trans, S, AName);
        Translated := (Translation <> '') or (Translation = Original);
        PrivateStorage := S;
      end;
    end;
  end;
begin
  // rules:
  // * if original is a dual line file, split it into orig and trans, ignore translation
  // * if original is not dual line file and translation is not given, double up original
  // * if original is not a dual line file and translation is given, use orig as orig and trans as trans
  Result := false;
  try
    Items.Clear;
    Orphans.Clear;
    FOldSort := Items.Sort;
    Items.Sort := stNone;
    FOrig := TTntStringlist.Create;
    FTrans := TTntStringlist.Create;
    FTokens := TTntStringlist.Create;
    try
      // GSI files are always encoded as UTF-8 but without BOM
      FOrig.AnsiStrings.LoadFromFileEx(OrigFile, CP_UTF8);
      if OrigIsDual then // ignore translation
      begin
        i := 0;
        while i < FOrig.Count - 1 do // move every other item to trans, delete from orig
        begin
          Inc(i);
          FTrans.Add(FOrig[i]);
          FOrig.Delete(i);
        end;
      end
      else if not FileExists(TransFile) then
        FTrans.AddStrings(FOrig) // just make a copy in translation list
      else
        FTrans.AnsiStrings.LoadFromFileEx(TransFile, CP_UTF8);
      if not SearchTrans or OrigIsDual then
      begin
        for i := 0 to FOrig.Count - 1 do
          if FTrans.Count > i then
            ParseRow(FOrig[i], FTrans[i])
          else
            ParseRow(FOrig[i], FOrig[i]);
      end
      else
      begin
        for i := 0 to FOrig.Count - 1 do
          ParseRow(FOrig[i], '');
        for i := 0 to FTrans.Count - 1 do
        begin
          ATranslation := GetGSIString(FTrans[i], ATemplate, AName);
          j := Items.IndexOf(cSectionName, AName);
          if j >= 0 then
          begin
            Items[j].Translation := ATranslation;
            Items[j].PrivateStorage := ATemplate;
            Items[j].Translated := (Items[j].Translation <> '') or (Items[j].Translation = Items[j].Original);
          end;
        end;
      end;
    finally
      FOrig.Free;
      FTrans.Free;
      FTokens.Free;
    end;
    Items.Sort := FOldSort;
    Result := true;
  except
    Application.HandleException(self);
  end;
end;

function TGSIParser.ExportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
begin
  try
    Result := S_FALSE;
    LoadSettings;
    S := TTntStringlist.Create;
    try
      BuildPreview(Items, S);
      if TfrmExport.Execute(FAppServices, FOrigFile, Translate(cGSIExportTitle), Translate(cGSIFilter), '.', 'gsi', S) then
      begin
      // GSI files are always encodeds as UTF-8 but without BOM
        S.AnsiStrings.SaveToFileEx(FOrigFile, CP_UTF8);
        SaveSettings;
        Result := S_OK;
      end;
    finally
      S.Free
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TGSIParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
begin
  try
    Result := S_FALSE;
    LoadSettings;
    if TfrmImport.Execute(FOrigFile, FTransFile, FOrigIsDual, FSearchTrans, Translate(cGSIImportTitle), Translate(cGSIFilter), '.', 'gsi') then
    begin
      if DoImport(Items, Orphans, FOrigFile, FTransFile, FOrigIsDual, FSearchTrans) then
      begin
        Items.Modified := false;
        Orphans.Modified := false;
        SaveSettings;
        Result := S_OK;
      end
      else
        WideMessageBox(0, PWideChar(Translate(SImportError)), PWideChar(Translate(SError)), MB_OK or MB_ICONERROR);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TGSIParser.Init(const ApplicationServices:IApplicationServices);
begin
  FAppServices := ApplicationServices;
  Application.Handle := ApplicationServices.AppHandle;
end;

procedure TGSIParser.LoadSettings;
var
  M:TMemoryStream;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
      FOrigIsDual := ReadBool('Settings', 'OrigIsDual', FOrigIsDual);
      FSearchTrans := ReadBool('Settings', 'SearchTrans', FSearchTrans);
      M := TMemoryStream.Create;
      try
        if ReadBinaryStream('Forms', 'Export', M) = SizeOf(TRect) then
        begin
          M.Seek(0, soFromBeginning);
          Move(M.Memory^, Pointer(@FExportRect)^, sizeof(TRect));
        end;
      finally
        M.Free;
      end;
    finally
      Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TGSIParser.SaveSettings;
var
  M:TMemoryStream;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
      WriteBool('Settings', 'OrigIsDual', FOrigIsDual);
      WriteBool('Settings', 'SearchTrans', FSearchTrans);
      M := TMemoryStream.Create;
      try
        M.Write(FExportRect, sizeof(TRect));
        M.Seek(0, soFromBeginning);
        WriteBinaryStream('Forms', 'Export', M);
      finally
        M.Free;
      end;
    finally
      Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TGSIParser.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := cGSIFilter;
    1:Value := cGSIExportTitle;
    2:Value := cGSIImportTitle;
    3:Value := SImportError;
    4:Value := SError;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;
end;

function TGSIParser.Translate(const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(ClassName, Value, Value)
  else
    Result := Value;
end;

end.
