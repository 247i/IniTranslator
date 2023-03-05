{@abstract(Mozilla properties file parser) }
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
// $Id: MozillaPropsImpl.pas 250 2007-08-14 16:42:00Z peter3 $
unit MozillaPropsImpl;

interface
uses
  SysUtils, Classes, Types, TntClasses, TransIntf;
type
  TMozillaPropsParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FCount:integer;
    FAppServices:IApplicationServices;
    FOrigFile, FTransFile:WideString;
    FExportRect:TRect;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
    function Translate(const Value:WideString):WideString;
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
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Forms, IniFiles, PreviewExportFrm, DualImportFrm;

const
  cPropsFilter = 'Mozilla properties files|*.properties|All files (*.*)|*.*';
  cPropsImportTitle = 'Import from Mozilla Properties file';
  cPropsExportTitle = 'Export to Mozilla Properties file';
  cSectionName = 'Mozilla Properties';

{ TMozillaPropsParser }

procedure TMozillaPropsParser.BuildPreview(Items:ITranslationItems;
  Strings:TTntStrings);
var
  i:integer;
begin
  for i := 0 to Items.Count - 1 do
    with Items[i] do
    begin
      if TransComments <> '' then
        Strings.Add(TransComments);
      Strings.Add(Format('%s=%s', [Name, Translation]));
    end;
end;

function TMozillaPropsParser.Capabilities:Integer;
begin
  Result := CAP_EXPORT or CAP_IMPORT;
end;

function TMozillaPropsParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TMozillaPropsParser.Create;
begin
  inherited;
  FOldAppHandle := Application.Handle;
end;

destructor TMozillaPropsParser.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TMozillaPropsParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_EXPORT:
      Result := Translate(cPropsExportTitle);
    CAP_IMPORT:
      Result := Translate(cPropsImportTitle);
  else
    Result := '';
  end;
end;

function TMozillaPropsParser.ExportItems(const Items,
  Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  FOldSort:TTranslateSortType;
begin
  Result := S_FALSE;
  try
    LoadSettings;
    FOldSort := Items.Sort;
    S := TTntStringlist.Create;
    try
      Items.Sort := stIndex;
      BuildPreview(Items, S);
      if TfrmExport.Execute(FAppServices, FTransFile, Translate(cPropsExportTitle), Translate(cPropsFilter), '.', 'properties', S) then
      begin
        S.AnsiStrings.SaveToFile(FTransFile);
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

function TMozillaPropsParser.GetString(out Section, Name,
  Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := cPropsFilter;
    1:Value := cPropsImportTitle;
    2:Value := cPropsExportTitle;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;
end;

function TMozillaPropsParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  i, j:integer;
  TI:ITranslationItem;
  tmp, cmt:WideString;
begin
  Result := S_FALSE;
  try
    LoadSettings;
    if TfrmDualImport.Execute(FAppServices, FOrigFile, FTransFile, Translate(cPropsImportTitle), Translate(cPropsFilter), '.', 'properties') then
    begin
      TI := nil;
      S := TTntStringlist.Create;
      try
        Items.Clear;
        Items.Sort := stIndex;
        Orphans.Clear;
        S.LoadFromFile(FOrigFile);
        for i := 0 to S.Count - 1 do
        begin
          if TI = nil then
            TI := Items.Add;
          if Pos('#', S[i]) = 1 then
            TI.OrigComments := TI.OrigComments + #13#10 + S[i]
          else if Pos('=', S[i]) > 0 then
          begin
            TI.Section := cSectionName;
            TI.Name := trim(Copy(S[i], 1, Pos('=', S[i]) - 1));
            TI.Original := Copy(S[i], Pos('=', S[i]) + 1, MaxInt);
            if i < S.Count - 1 then
              TI := Items.Add;
          end;
        end;
        cmt := '';
        Items.Sort := stSection;
        S.LoadFromFile(FOrigFile);
        for i := 0 to S.Count - 1 do
        begin
          if Pos('#', S[i]) = 1 then
            cmt := cmt + #13#10 + S[i]
          else if Pos('=', S[i]) > 0 then
          begin
            tmp := trim(Copy(S[i], 1, Pos('=', S[i]) - 1));
            j := Items.IndexOf(cSectionName, tmp);
            if j > -1 then
            begin
              TI := Items[j];
              TI.Translation := Copy(S[i], Pos('=', S[i]) + 1, MaxInt);
              TI.Translated := TI.Translation <> '';
              TI.TransComments := cmt;
              cmt := '';
            end;
          end;
        end;
      finally
        S.Free;
      end;
      Items.Modified := false;
      Orphans.Modified := false;
      SaveSettings;
      Result := S_OK;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TMozillaPropsParser.Init(const ApplicationServices:IApplicationServices);
begin
  FAppServices := ApplicationServices;
  Application.Handle := ApplicationServices.AppHandle;
end;

procedure TMozillaPropsParser.LoadSettings;
var
  M:TMemoryStream;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
    FTransFile := ReadString('Settings', 'TransFile', FTransFile);
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
end;

procedure TMozillaPropsParser.SaveSettings;
var
  M:TMemoryStream;
begin
  with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    WriteString('Settings', 'OrigFile', FOrigFile);
    WriteString('Settings', 'TransFile', FTransFile);
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
end;

function TMozillaPropsParser.Translate(
  const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(ClassName, Value, Value)
  else
    Result := Value;
end;

end.
