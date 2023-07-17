{@abstract(MsDictBuild main form) }
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

// $Id: MainFrm.pas 250 2007-08-14 16:42:00Z peter3 $

unit MainFrm;
{$I ..\TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, TntClasses, TntDialogs, TntStdCtrls,
  TntExtCtrls, TntComCtrls, TntSysUtils;

type
  TfrmMain = class(TForm)
    Label1:TTntLabel;
    reInputFiles:TTntRichEdit;
    Panel1:TTntPanel;
    Label2:TTntLabel;
    Label3:TTntLabel;
    edDictFile:TTntEdit;
    btnOutBrowse:TTntButton;
    rbAppend:TTntRadioButton;
    rbOverwrite:TTntRadioButton;
    btnConvert:TTntButton;
    btnSelect:TTntButton;
    odInFiles:TOpenDialog;
    sdOutFile:TSaveDialog;
    Label4:TTntLabel;
    Image1:TImage;
    StatusBar1:TStatusBar;
    procedure btnSelectClick(Sender:TObject);
    procedure btnOutBrowseClick(Sender:TObject);
    procedure btnConvertClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
    procedure Label4Click(Sender:TObject);
  private
    { Private declarations }
    FLastOpenDir:string;
    function ConvertFile(const Filename:string; Strings:TTntStrings):integer;
    function ConvertFileSpec(const FileSpec:string; Strings:TTntStrings):integer;
    procedure LoadSettings;
    procedure SaveSettings;
  public
    { Public declarations }
  end;

var
  frmMain:TfrmMain;

implementation
uses
  IniFiles, ShellAPI, ShFolder,
{$IFDEF COMPILER_9_UP}WideStrUtils{$ELSE}TntWideStrUtils{$ENDIF};

{$R *.dfm}

procedure TfrmMain.btnSelectClick(Sender:TObject);
var
  S:TTntStringlist;
  i:integer;
begin
  odInFiles.InitialDir := FLastOpenDir;
  odInFiles.Filename := '';
  if odInFiles.Execute then
  begin
    FLastOpenDir := ExtractFilePath(odInFiles.Filename);
    S := TTntStringlist.Create;
    try
      S.Sorted := true;
      // add to a sorted stringlist so any duplicates are removed
      for i := 0 to reInputFiles.Lines.Count - 1 do
        S.Add(reInputFiles.Lines[i]);
      for i := 0 to odInFiles.Files.Count - 1 do
        S.Add(odInFiles.Files[i]);
      while (S.Count > 0) and (S[0] = '') do
        S.Delete(0);
      reInputFiles.Lines := S;
    finally
      S.Free;
    end;
  end;
end;

procedure TfrmMain.btnOutBrowseClick(Sender:TObject);
begin
  sdOutFile.Filename := edDictFile.Text;
  if sdOutFile.Execute then
    edDictFile.Text := sdOutFile.Filename;
end;

function TfrmMain.ConvertFile(const Filename:string; Strings:TTntStrings):integer;
var
  AInFile, AContent:TTntStringlist;
  AName, AValue:WideString;
  i, j:integer;
  procedure ParseItem(const S:WideString; out Name, Value:WideString);
  var
    P, P1:PWideChar;
    tmp:WideString;
  begin
    if Length(S) < 6 then Exit;
    P := PWideChar(S);
    Value := '';
    while P^ in [WideChar(#1)..WideChar(#31)] do
      Inc(P);
    if (P^ in [WideChar(''''), WideChar('"')]) then
      tmp := WideExtractQuotedStr(P, P^)
    else
    begin
      P1 := P;
      while (P^ >= ' ') and (P^ <> WideChar(',')) do
        Inc(P);
      SetString(tmp, P1, P - P1);
    end;
    Name := tmp;
    tmp := '';

    // skip next
    if P^ = WideChar(',') then
      Inc(P);
    while P^ <> WideChar(',') do
    begin
      if P^ = #0 then
        Exit;
      Inc(P);
    end;
    if P^ = #0 then
      Exit;
    if P^ = WideChar(',') then
      Inc(P);
    if P^ = #0 then
      Exit;
    if (P^ in [WideChar(''''), WideChar('"')]) then
      tmp := WideExtractQuotedStr(P, P^)
    else
    begin
      P1 := P;
      while (P^ >= ' ') and (P^ <> WideChar(',')) do
        Inc(P);
      SetString(tmp, P1, P - P1);
    end;
    Value := tmp;
  end;
begin
  StatusBar1.Panels[0].Text := Filename;
  StatusBar1.Update;
  AInFile := TTntStringlist.Create;
  AContent := TTntStringlist.Create;
  try
    AInFile.LoadFromFile(Filename);
    Result := Ord(AInFile.Count > 0);
    for i := 0 to AInFile.Count - 1 do
    begin
      // can't use TStrings.CommaText since it is broken
      try
        ParseItem(AInFile[i], AName, AValue);
      except
        raise Exception.CreateFmt('Error parsing "%s" at line %d', [Filename, i]);
      end;
      if AName <> '' then
      begin
        j := Strings.IndexOfName(AName);
        if j >= 0 then
          Strings.Delete(j);
        Strings.Add(WideFormat('%s="%s"', [AName, AValue])); // need to add quotes since we support multiple translation items and this should be treated as one
      end;
    end;
  finally
    AContent.Free;
    AInFile.Free;
  end;
end;

function TfrmMain.ConvertFileSpec(const FileSpec:string; Strings:TTntStrings):integer;
var
  F:TSearchRec;
begin
  Result := 0;
  if FindFirst(FileSpec, faAnyFile, F) = 0 then
  try
    repeat
      if F.Attr and faDirectory = 0 then
        Inc(Result, ConvertFile(ExtractFilePath(FileSpec) + F.Name, Strings));
    until FindNext(F) <> 0;
  finally
    FindClose(F);
  end;
end;

procedure TfrmMain.btnConvertClick(Sender:TObject);
var
  i, ACount:integer;
  AOutFile:TTntStringlist;
begin
  SaveSettings;
  if edDictFile.Text = '' then
  begin
    ShowMessage('Please specify a filename to save the dictionary to.');
    edDictFile.SetFocus;
    Exit;
  end;
  ACount := 0;
  AOutFile := TTntStringlist.Create;
  try
    AOutFile.Sorted := true;
    if FileExists(edDictFile.Text) and rbAppend.Checked then
      AOutFile.LoadFromFile(edDictFile.Text);
    for i := 0 to reInputFiles.Lines.Count - 1 do
      Inc(ACount, ConvertFileSpec(reInputFiles.Lines[i], AOutFile));
    AOutFile.SaveToFile(edDictFile.Text);
  finally
    AOutFile.Free;
  end;
  ShowMessageFmt('%d files converted', [ACount]);
end;

function GetUserAppDataFolder:string;
begin
  SetLength(Result, MAX_PATH + 1);
  if not Succeeded(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, PChar(Result))) then
    Result := '';
  Result := string(PChar(Result));
  if Result = '' then
    Result := ExtractFilePath(Application.Exename)
  else
    Result := IncludeTrailingPathDelimiter(Result) + 'IniTranslator';
end;

function GetIniFileName:string;
begin
  Result := IncludeTrailingPathDelimiter(GetUserAppDataFolder) + ChangeFileExt(ExtractFilename(Application.ExeName), '.ini');
end;

procedure TfrmMain.LoadSettings;
begin
  with TIniFile.Create(GetIniFileName) do
  try
    reInputFiles.Lines.CommaText := ReadString('Settings', 'Input Files', reInputFiles.Lines.CommaText);
    edDictFile.Text := ReadString('Settings', 'DictFile', edDictFile.Text);
    rbAppend.Checked := ReadBool('Settings', 'Append', rbAppend.Checked);
    rbOverwrite.Checked := not rbAppend.Checked;
    FLastOpenDir := ReadString('Settings', 'LastDir', '.');
  finally
    Free;
  end;
end;

procedure TfrmMain.SaveSettings;
begin
  with TIniFile.Create(GetIniFileName) do
  try
    WriteString('Settings', 'Input Files', reInputFiles.Lines.CommaText);
    WriteString('Settings', 'DictFile', edDictFile.Text);
    WriteBool('Settings', 'Append', rbAppend.Checked);
    WriteString('Settings', 'LastDir', FLastOpenDir);
  finally
    Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender:TObject);
begin
  LoadSettings;
end;

procedure TfrmMain.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
  SaveSettings;
end;

procedure TfrmMain.Label4Click(Sender:TObject);
begin
  ShellExecute(Handle, nil, 'ftp://ftp.microsoft.com/developr/msdn/newup/Glossary/', nil, nil, SW_SHOWNORMAL);
end;

end.
