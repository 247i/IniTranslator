unit PolyGlotParserImpl;
{
  Copyright © 2004 by Chris Thornton, Thornsoft Development, Inc.; all rights reserved

  Purpose:
   This parser allows native import/export for Polyglot files.  Polyglot is
   a Delphi "ini translator" by Balmsoft - www.balmsoft.com.
   The primary job of this parser is to strip/add single quotes.
   ex:
     Polyglot:   64638_arm_R_ARM_ERROR_ACCOUNT_EXPIRED='Key Expired'
     IniTrans:   64638_arm_R_ARM_ERROR_ACCOUNT_EXPIRED=Key Expired
     Polyglot:   ShowQuickBar1.Hint='Open New Preview/Edit Window'#13#10'(Multiple instances allowed)'#13#10'While there is already one of these docked into ClipMate Explorer, '#13#10'you can open as many as you''d like.'
     IniTrans:   ShowQuickBar1.Hint=Open New Preview/Edit Window#13#10(Multiple instances allowed)#13#10While there is already one of these docked into ClipMate Explorer, #13#10you can open as many as youd like.

  Developer(s):
   Chris Thornton - chris at thornsoft dot com

  Based On:  Oleg Parser

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}

interface
uses
  Classes, Types, TntClasses, TransIntf;

type
  TPolyGlotParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FIndex:integer;
    FApplicationServices:IApplicationServices;
    FTransFile, FOrigFile:WideString;
    FSection:WideString;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
    function GetString(out Section: WideString; out Name: WideString;
      out Value: WideString): WordBool; safecall;
    function Translate(const Value: WideString): WideString;
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

  end;

implementation
uses
  SysUtils, Forms, IniFiles, PreviewExportFrm, DualImportFrm;

const
  cPolyGlotFilter = 'PolyGlot Translator  Files (*.lng)|*.lng|All files (*.*)|*.*';
  cPolyGlotImportTitle = 'Import from PolyGlot Translator file';
  cPolyGlotExportTitle = 'Export to PolyGlot Translator file';
  cSectionName = 'PolyGlot';

{ TPolyGlotParser }

function TPolyGlotParser.Translate(const Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

procedure TPolyGlotParser.BuildPreview(Items:ITranslationItems; Strings:TTntStrings);
var
  i:integer;
begin
  FSection := '';
  for i := 0 to Items.Count - 1 do
  begin
      //Next line is Useful for debugging
      //Strings.Add(Format('Section:[%s], Name[%s], Original[%s], Trans[%s]',[Items[i].Section, Items[i].Name, Items[i].Original, Items[i].Translation]));
    if (FSection <> Items[i].Section) then // output [Section] on line by itself, on section break.
    begin
      if (FSection <> '') then
        Strings.Add(''); // Throw in a blank line between sections.
      Strings.Add(Format('[%s]', [Items[i].Section]));
      FSection := Items[i].Section;
    end;
    if Items[i].Translation <> '' then
      Strings.Add(Items[i].Name + '=' + chr(39) + StringReplace(Items[i].Translation, '#13#10', chr(39) + '#13#10' + chr(39), [rfReplaceAll]) + chr(39));
  end;
end;

function TPolyGlotParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT;
end;

function TPolyGlotParser.Configure(Capability:Integer):HRESULT;
begin
  Result := E_NOTIMPL;
end;

constructor TPolyGlotParser.Create;
begin
  inherited;
  FOldAppHandle := Application.Handle;
end;

destructor TPolyGlotParser.Destroy;
begin
  if FOldAppHandle <> 0 then
    Application.Handle := FOldAppHandle;
  inherited;
end;

function TPolyGlotParser.DisplayName(Capability:Integer):WideString;
begin
  case Capability of
    CAP_IMPORT:
      Result := Translate(cPolyGlotImportTitle);
    CAP_EXPORT:
      Result := Translate(cPolyGlotExportTitle);
  else
    Result := '';
  end;
end;

function TPolyGlotParser.ExportItems(const Items,
  Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  FOldSort:TTranslateSortType;
begin
  Result := S_FALSE;
  FOldSort := Items.Sort;
  FSection := ''; // init
  try
    LoadSettings;
    Items.Sort := stIndex;
    S := TTntStringlist.Create;
    try
      BuildPreview(Items, S);
      if TfrmExport.Execute(FApplicationServices, FTransFile, Translate(cPolyGlotExportTitle), Translate(cPolyGlotFilter), '.', 'lng', S) then
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

function TPolyGlotParser.GetString(out Section, Name,
  Value: WideString): WordBool;
begin
  Result := true;
  case FIndex of
    0: Value := cPolyGlotFilter;
    1: Value := cPolyGlotImportTitle;
    2: Value := cPolyGlotExportTitle;
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

function TPolyGlotParser.ImportItems(const Items, Orphans:ITranslationItems):HRESULT;
var
  S:TTntStringlist;
  i, j, k:integer;
  TI:ITranslationItem;
begin
  Result := S_FALSE;
  try
    Items.Clear;
    Orphans.Clear;
    TI := nil;
    LoadSettings;
    if TfrmDualImport.Execute(FApplicationServices, FOrigFile, FTransFile, Translate(cPolyGlotImportTitle), Translate(cPolyGlotFilter), '.', 'lng', True) then
    begin
      Items.Sort := stNone;
      S := TTntStringlist.Create;
      try
        S.LoadFromFile(FOrigFile);
        for i := 0 to S.Count - 1 do
        begin
          if Pos('[', S[i]) = 1 then
            FSection := Copy(S[i], 2, Pos(']', S[i]) - 2) //New Section
          else
          begin
            j := Pos('=', S[i]);
            if j > 0 then
            begin
              TI := Items.Add;
              TI.Section := FSection;

              TI.Name := Copy(S[i], 1, j - 1);
              TI.Original := StringReplace(Copy(S[i], j + 1, MaxInt), #39, '', [rfReplaceAll]);
              TI.Translation := '';
            end;
          end;
        end;
        {Now load the translation. Need to sync with the original}
        if FileExists(FTransFile) then {For new projects, there won't be one.}
        begin
          S.LoadFromFile(FTransFile);
          for i := 0 to S.Count - 1 do
          begin
            if Pos('[', S[i]) = 1 then
              FSection := Copy(S[i], 2, Pos(']', S[i]) - 2) //New Section
            else
            begin
              j := Pos('=', S[i]);
              if j > 0 then
              begin
                k := Items.IndexOf(FSection, Copy(S[i], 1, j - 1)); {Find corresponding entry in Original file}
                if (k > -1) then
                  TI := Items.Items[k]
                else
                begin {Not found - somehow....}
                  TI := Items.Add;
                  TI.Section := FSection;
                  TI.Name := Copy(S[i], 1, j - 1);
                  TI.Original := '';
                end;
                TI.Translation := StringReplace(Copy(S[i], j + 1, MaxInt), #39, '', [rfReplaceAll]);
              end;
            end;
          end;
        end;
        Items.Modified := false;
        Orphans.Modified := false;
      finally
        Items.Sort := stIndex;
        S.Free;
      end;
      SaveSettings;
      Result := S_OK;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TPolyGlotParser.Init(const ApplicationServices:IApplicationServices);
begin
  Application.Handle := ApplicationServices.AppHandle;
  FApplicationServices := ApplicationServices;
end;

procedure TPolyGlotParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      FOrigFile := ReadString('Settings', 'OrigFile', FOrigFile);
      FTransFile := ReadString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

procedure TPolyGlotParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
      WriteString('Settings', 'OrigFile', FOrigFile);
      WriteString('Settings', 'TransFile', FTransFile);
    finally
      Free;
    end;
  except
    Application.HandleException(self);
  end;
end;

end.
