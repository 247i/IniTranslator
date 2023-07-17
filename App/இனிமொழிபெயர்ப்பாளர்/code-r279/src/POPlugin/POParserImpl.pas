{@abstract(PO parser)}
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
// $Id: POParserImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit POParserImpl;

interface
uses
  Windows, Forms, TntClasses, TntSysUtils, TransIntf;

type
  TPOFileParser = class(TInterfacedObject, IUnknown, IFileParser, ILocalizable)
  private
    FIndex:integer;
    FFilename, FCmdLine:string;
    FCompileMO:Boolean;
    procedure LoadSettings;
    procedure SaveSettings;
    function GetFilename(const AFilename:string; ForOpen:boolean):string;
    procedure LoadFromPOFile(const Items, Orphans:ITranslationItems;
      const Filename:string);
    procedure MakePOFile(const Items:ITranslationItems; Header, Result:TTntStrings);
  public
    function Capabilities:Integer; safecall;
    function Configure(Capability:integer):HResult; safecall;
    function DisplayName(Capability:integer):WideString; safecall;
    function ExportItems(const Items, Orphans:ITranslationItems):HResult; safecall;
    function ImportItems(const Items, Orphans:ITranslationItems):HResult; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;

  end;

implementation
uses
  CommonUtils, SysUtils, Classes, Controls, Dialogs, IniFiles, POExportFrm, POParserConsts;

var
  FHeader:TTntStringList;

function YesNo(const Text, Caption:string):boolean;
begin
  Result := Application.MessageBox(PChar(Text), PChar(Caption), MB_YESNO or MB_ICONQUESTION) = IDYES;
end;

function LineBreakPO(const Str:WideString):WideString;
var
  S:TTnTStringList;
  i:integer;
begin
  Result := StringReplace(Str, '\n', '\n' + SLineBreak, [rfReplaceAll]);
  S := TTntStringlist.Create;
  try
    S.Text := Result;
    Result := '';
    for i := 0 to S.Count - 1 do
      S[i] := '"' + S[i] + '"';
    Result := trim(S.Text);
  finally
    S.Free;
  end;
  if Result = '' then
    Result := '""';
end;

{ TPOFileParser }

function TPOFileParser.Capabilities:Integer;
begin
  Result := CAP_IMPORT or CAP_EXPORT or CAP_ITEM_DELETE or CAP_ITEM_INSERT or CAP_ITEM_EDIT;
end;

function TPOFileParser.Configure(Capability:integer):HResult;
begin
  Result := S_OK;
end;

function TPOFileParser.DisplayName(Capability:integer):WideString;
begin
  case Capability of
    CAP_IMPORT:Result := Translate(SImportTitle);
    CAP_EXPORT:Result := Translate(SExportTitle);
    CAP_CONFIGURE:Result := Translate(SConfigureTitle);
  else
    Result := '';
  end;
end;

function WinExec32AndWait(const Cmd:string; const CmdShow:Integer):Cardinal;
var
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  Result := Cardinal($FFFFFFFF);
  FillChar(StartupInfo, SizeOf(TStartupInfo), #0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := CmdShow;
  if CreateProcess(nil, PChar(Cmd), nil, nil, False, NORMAL_PRIORITY_CLASS,
    nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
    if WaitForSingleObject(ProcessInfo.hProcess, INFINITE) = WAIT_OBJECT_0 then
    begin
      if not GetExitCodeProcess(ProcessInfo.hProcess, Result) then
        Result := Cardinal($FFFFFFFF);
    end;
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ProcessInfo.hProcess);
  end;
end;

function trimQuotes(const S:WideString; Quote:WideChar):string;
begin
  if (Length(S) > 0) and (S[1] = Quote) and (S[Length(S)] = Quote) then
    Result := Copy(S, 2, Length(S) - 2)
  else
    Result := S;
end;

procedure TPOFileParser.LoadFromPOFile(const Items, Orphans:ITranslationItems; const Filename:string);
var
  S, FComments:TTntStringlist;
  AnItem:ITranslationItem;
  i:integer;
  ShortFilename:string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      FHeader.Clear;
      Items.Clear;
      Orphans.Clear;
      ShortFilename := ChangeFileExt(ExtractFilename(Filename), '');
  // format of po file:
  // # - comment
  // msgid "%s" - the "original" string, can be multi-line
  // "%s"
  // "%s"
  // msgstr "%s" - the "translation" string, can be multi-line
  // "%s"
  // "%s"
  // the "first" item (with msgid ""), contains a specially formatted msgstr
  // Example:
  //
  //  msgid ""
  //  msgstr ""
  //  "Project-Id-Version: %name%\n"
  //  "POT-Creation-Date: YYYY-MM-DD HH:NN\n"
  //  "PO-Revision-Date: YYYY-MM-DD HH:NN+GMT\n"
  //  "Last-Translator: %translator name% <%email%>\n"
  //  "Language-Team: %language% <%language%>\n"
  //  "MIME-Version: 1.0\n"
  //  "Content-Type: text/plain; charset=%charset%\n"
  //  "Content-Transfer-Encoding: 8bit\n"
      S := TTntStringlist.Create;
      FComments := TTntStringlist.Create;
      try
        S.LoadFromFile(Filename);
    // currently hard-coded to use UTF-8
        S.Text := UTF8Decode(S.Text);
        AnItem := Items.Add; // add one default item
        i := 0;
        while i < S.Count do
        begin
          if Pos('#', S[i]) = 1 then
            FComments.Add(S[i])
          else if Pos('msgid', WideLowerCase(S[i])) = 1 then
          begin
            AnItem.Original := trimQuotes(trim(Copy(S[i], 6, MaxInt)), '"');
            while true do
            begin
              Inc(i);
              if i >= S.Count then
                Break;
              if Pos('"', trim(S[i])) = 1 then
                AnItem.Original := AnItem.Original + trimQuotes(trim(S[i]), '"')
              else
              begin
                Dec(i);
                Break;
              end;
            end;
          end
          else if Pos('msgstr', AnsiLowerCase(S[i])) = 1 then
          begin
            AnItem.Translation := trimQuotes(trim(Copy(S[i], 7, MaxInt)), '"');
            while true do
            begin
              Inc(i);
              if i >= S.Count then
                Break;
              if Pos('"', trim(S[i])) = 1 then
                AnItem.Translation := AnItem.Translation + trimQuotes(trim(S[i]), '"')
              else
              begin
                Dec(i);
                Break;
              end;
            end;
            AnItem.OrigComments := FComments.Text;
            FComments.Clear;
            AnItem.Translated := AnItem.Translation <> '';
            AnItem.Section := ShortFilename;
            AnItem.Name := AnItem.Original;
            AnItem := Items.Add;
          end;
          Inc(i);
        end;
        if Items.Count > 0 then
          Items.Delete(Items.Count - 1); // always adds one too many
        if Items.Count > 0 then
        begin
          if Items[0].Original = '' then // this is the header
          begin
            FHeader.Add(Items[0].OrigComments);
            FHeader.Add('msgid ""');
            FHeader.Add(Format('msgstr %s', [LineBreakPO(Items[0].Translation)]));
            Items.Delete(0);
          end;
        end;
      finally
        FComments.Free;
        S.Free;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TPOFileParser.MakePOFile(const Items:ITranslationItems; Header, Result:TTntStrings);
var
  i:integer;
  FOldSort:TTranslateSortType;
begin
  try
    Screen.Cursor := crHourGlass;
    FOldSort := Items.Sort;
    try
      Result.Clear;
      if Header.Count = 0 then
      begin
        Header.Add('msgid ""');
        Header.Add('msgstr ""');
        Header.Add(LineBreakPO(cDefaultHeader));
      end;
    // add header
      Result.AddStrings(FHeader);
      Result.Add('');
      Items.Sort := stIndex;
      for i := 0 to Items.Count - 1 do
      begin
        Result.Add(trim(Items[i].OrigComments));
        Result.Add(Format('msgid %s', [LineBreakPO(Items[i].Original)]));
        Result.Add(Format('msgstr %s', [LineBreakPO(Items[i].Translation)]));
        Result.Add('');
      end;
    finally
      Items.Sort := FOldSort;
      Screen.Cursor := crDefault;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TPOFileParser.ExportItems(const Items, Orphans:ITranslationItems):HResult;
var
  S:TTntStringList;
  CmdLine:string;
begin
  WaitCursor;
  Result := S_FALSE;
  try
    LoadSettings;
    S := TTntStringList.Create;
    try
      MakePOFile(Items, FHeader, S);
      if TfrmPOExport.Edit(FFilename, FCmdLine, FCompileMO, S) then
      begin
        S.Text := UTF8Encode(S.Text);
        S.AnsiStrings.SaveToFile(FFilename);
        Result := S_OK;
        if FCompileMO then
        begin
          CmdLine := StringReplace(FCmdLine, '%i', FFilename, []);
          CmdLine := StringReplace(CmdLine, '%o', ChangeFileExt(FFilename, '.mo'), []);
          if WinExec32AndWait(CmdLine, SW_SHOWNORMAL) > 31 then
            RaiseLastOSError;
        end;
      end;
      SaveSettings;
    finally
      S.Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TPOFileParser.GetFilename(const AFilename:string; ForOpen:boolean):string;
begin
  try
    if ForOpen then
    begin
      with TOpenDialog.Create(Application) do
      try
        Filename := AFilename;
        Options := Options + [ofFileMustExist];
        Filter := Translate(SFileFilter);
        if Execute then
          Result := Filename
        else
          Result := '';
      finally
        Free;
      end;
    end
    else
      with TSaveDialog.Create(Application) do
      try
        Filename := AFilename;
        Options := Options + [ofOverwritePrompt];
        Filter := Translate(SFileFilter);
        if Execute then
          Result := Filename
        else
          Result := '';
      finally
        Free;
      end;
  except
    Application.HandleException(Self);
  end;
end;

function TPOFileParser.ImportItems(const Items, Orphans:ITranslationItems):HResult;
begin
  WaitCursor;
  Result := S_FALSE;
  try
    LoadSettings;
    FFilename := GetFilename(FFilename, true);
    if (FFilename <> '') then
    begin
      LoadFromPOFile(Items, Orphans, FFilename);
      Items.Modified := false;
      Orphans.Modified := false;
      SaveSettings;
      Result := S_OK;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TPOFileParser.Init(const ApplicationServices:IApplicationServices);
begin
  GLobalApplicationServices := ApplicationServices;
end;

procedure TPOFileParser.LoadSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
//    FHeader := ReadString('PO', 'Text', FHeader);
//    FHeaderComment := ReadString('PO', 'Comment', FHeaderComment);
      FFilename := ReadString('PO', 'Filename', FFilename);
      FCmdLine := ReadString('MO', 'CmdLine', 'msgfmt "%i" -o "%o"');
      FCompileMO := ReadBool('MO', 'CompileMO', FCompileMO);
    finally
      Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TPOFileParser.SaveSettings;
begin
  try
    with TIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
    try
//    WriteString('PO', 'Text', FHeader);
//    WriteString('PO', 'Comment', FHeaderComment);
      WriteString('PO', 'Filename', FFilename);
      WriteString('MO', 'CmdLine', FCmdLine);
      WriteBool('MO', 'CompileMO', FCompileMO);
    finally
      Free;
    end;
  except
    Application.HandleException(Self);
  end;
end;

function TPOFileParser.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := SImportTitle;
    1:Value := SExportTitle;
    2:Value := SConfigureTitle;
    3:Value := SFileFilter;
    4:Value := SFormCaption;
    5:Value := SFileNameLabel;
    6:Value := SPreviewLabel;
    7:Value := SCompileMOCaption;
    8:Value := SBrowseCaption;
    9:Value := SOK;
    10:Value := SCancel;
    11:Value := SCompileMOHint;
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
    Findex := 0;
end;

initialization
  FHeader := TTntStringList.Create;

finalization
  FreeAndNil(FHeader);
end.
