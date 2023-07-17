{@abstract(App to split and export languages from OpenOffice sdf and gsi files) }
{
keepass.sourceforge.net
  Copyright © 2006 by Peter Thornqvist; all rights reserved

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
// $Id: MainFrm.pas 269 2007-10-21 15:49:52Z peter3 $

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntDialogs, TntStdCtrls;

type
  TfrmMain = class(TTntForm)
    Label1:TTntLabel;
    edSDFFile:TTntEdit;
    btnSDFFile:TTntButton;
    Label2:TTntLabel;
    edSaveFolder:TTntEdit;
    btnSaveFolder:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    odSDFFile:TTntOpenDialog;
    chkExtractLanguage:TTntCheckBox;
    cbLanguages:TTntComboBox;
    chkSortItems:TTntCheckBox;
    procedure btnOKClick(Sender:TObject);
    procedure btnCancelClick(Sender:TObject);
    procedure btnSDFFileClick(Sender:TObject);
    procedure btnSaveFolderClick(Sender:TObject);
    procedure chkExtractLanguageClick(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
    procedure FormShow(Sender:TObject);
  private
    { Private declarations }
    procedure LoadSettings;
    procedure SaveSettings;
    procedure SplitFile(const Filename, OutputFolder:string; SortItems:boolean);
    procedure ExtractFile(const Filename, OutputFolder, Language:string; SortItems:boolean);
    function Validate:boolean;
  public
    { Public declarations }
  end;

var
  frmMain:TfrmMain;

implementation

uses
{$WARN UNIT_PLATFORM OFF}FileCtrl, {$WARN UNIT_PLATFORM ON}IniFiles, CommonUtils;


{$R *.dfm}

procedure StrTokenize(const S:string; Delimiter:Char; List:TStrings; MinLength:integer = 1);
var
  i, j:integer;
  tmp:string;
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

function TfrmMain.Validate:boolean;
var
  S:WideString;
begin
  S := '';
  if not FileExists(edSDFFile.Text) then
  begin
    S := 'File does not exist';
    edSDFFile.SetFocus;
  end;
  ForceDirectories(edSaveFolder.Text);
  if not DirectoryExists(edSaveFolder.Text) then
  begin
    S := 'Output folder does not exist';
    edSaveFolder.SetFocus;
  end;
  if chkExtractLanguage.Checked and (cbLanguages.Text = '') then
  begin
    S := 'No language specified';
    cbLanguages.SetFocus;
  end;
  Result := S = '';
  if not Result then
    WideMessageBox(Handle, PWideChar(S), 'Error', MB_OK or MB_ICONERROR);
end;

procedure TfrmMain.btnOKClick(Sender:TObject);
begin
  if not Validate then Exit;

  if chkExtractLanguage.Checked then
    ExtractFile(edSDFFile.Text, edSaveFolder.Text, cbLanguages.Text, chkSortItems.Checked)
  else
    SplitFile(edSDFFile.Text, edSaveFolder.Text, chkSortItems.Checked);
  WideMessageBox(Handle, 'Done', PWideChar(Caption), MB_OK or MB_ICONINFORMATION);
end;

function GetLanguage(S:string):string;
var
  T:TStringlist;
begin
  T := TStringlist.Create;
  try
    StrTokenize(S, #9, T, 0);
    if T.Count > 9 then
      Result := T[9]
    else
      Result := '';
  finally
    T.Free;
  end;
end;

procedure TfrmMain.SplitFile(const Filename, OutputFolder:string; SortItems:boolean);
var
  i, aStart, aIndex, aCount:integer;
  S:TStringlist;
  aFileNameTemplate, aBaseFolder, aCurrentFilename:string;
  FFiles:array of TextFile;
  FLanguages:TStringlist;

  function GetLanguages(S:TStrings; i:integer):integer;
  var
    j:integer;
    lang:string;
  begin
    for j := i to S.Count - 1 do
    begin
      lang := GetLanguage(S[j]);
      if FLanguages.IndexOf(lang) > -1 then
      begin
        Result := FLanguages.Count;
        Exit;
      end
      else
        FLanguages.Add(lang);
    end;
    Result := 0;
  end;
begin
  aBaseFolder := IncludeTrailingPathDelimiter(OutputFolder);
  ForceDirectories(aBaseFolder);
  aFileNameTemplate := ExtractFileName(Filename);
  S := TStringlist.Create;
  FLanguages := TStringlist.Create;
  try
    FLanguages.Sorted := true;
    S.LoadFromFile(Filename);
    aStart := 0;
  // skip empty and comment lines
    while aStart < S.Count do
      if (S[aStart] = '') or (S[aStart][1] = '#') then
        Inc(aStart)
      else
        Break;
    aCount := GetLanguages(S, aStart);
    if aCount > 0 then
    begin
      SetLength(FFiles, aCount);
      for i := 0 to aCount - 1 do
      begin
        // create a folder for each file, named like the language
        ForceDirectories(aBaseFolder + FLanguages[i]);
        aCurrentFilename := IncludeTrailingPathDelimiter(aBaseFolder + FLanguages[i]) + aFileNameTemplate;
        // assign the filename to the file
        // this assures that the index of a file in FFiles directly syncs up with the items in FLanguages,
        // i.e they have the same index - THIS IS VERY IMPORTANT!
        AssignFile(FFiles[i], aCurrentFilename);
        Rewrite(FFiles[i]);
      end;
      // walk the source file, extract lines and put into correct file based on the language
      for i := aStart to S.Count - 1 do
      begin
        aIndex := FLanguages.IndexOf(GetLanguage(S[i]));
        if aIndex >= 0 then
          Writeln(FFiles[aIndex], S[i]);
      end;

      if SortItems then
      begin
        // save the file names for later
        FLanguages.Clear;
        for i := 0 to aCount - 1 do
          FLanguages.Add(TTextRec(FFiles[i]).Name);
      end;
      // close the files
      for i := 0 to aCount - 1 do
      begin
        Flush(FFiles[i]);
        CloseFile(FFiles[i]);
      end;
      SetLength(FFiles, 0);
      if SortItems then
      // sort the files
        for i := 0 to aCount - 1 do
        begin
          S.LoadFromFile(FLanguages[i]);
          S.Sort;
          S.SaveToFile(FLanguages[i]);
        end;
    end;
  finally
    S.Free;
    FLanguages.Free;
  end;
end;

procedure TfrmMain.ExtractFile(const Filename, OutputFolder, Language:string; SortItems:boolean);
var
  i, aStart:integer;
  S:TStringlist;
  aFileNameTemplate, aBaseFolder, aCurrentFilename:string;
  FFile:TextFile;
begin
  aBaseFolder := IncludeTrailingPathDelimiter(OutputFolder);
  aFileNameTemplate := ExtractFileName(Filename);
  S := TStringlist.Create;
  try
    S.LoadFromFile(Filename);
    aStart := 0;
  // skip empty and comment lines
    while aStart < S.Count do
      if (S[aStart] = '') or (S[aStart][1] = '#') then
        Inc(aStart)
      else
        Break;
    ForceDirectories(aBaseFolder + Language);
    aCurrentFilename := IncludeTrailingPathDelimiter(aBaseFolder + Language) + aFileNameTemplate;
    AssignFile(FFile, aCurrentFilename);
    Rewrite(FFile);
    try
      for i := aStart to S.Count - 1 do
        if AnsiSameText(Language, GetLanguage(S[i])) then
          Writeln(FFile, S[i]);
    finally
      CloseFile(FFile);
    end;
    if SortItems then
    begin
      S.LoadFromFile(aCurrentFilename);
      S.Sort;
      S.SaveToFile(aCurrentFilename);
    end;
  finally
    S.Free;
  end;
end;

procedure TfrmMain.btnCancelClick(Sender:TObject);
begin
  Close;
end;

procedure TfrmMain.btnSDFFileClick(Sender:TObject);
begin
  odSDFFile.FileName := edSDFFile.Text;
  if odSDFFile.Execute then
  begin
    edSDFFile.Text := odSDFFile.FileName;
    if not DirectoryExists(edSaveFolder.Text) then
      edSaveFolder.Text := ExtractFilePath(odSDFFile.FileName);
  end;
end;

procedure TfrmMain.btnSaveFolderClick(Sender:TObject);
var
  S:string;
begin
  S := edSaveFolder.Text;
  if S = '' then
    S := ExtractFilePath(edSDFFile.Text);
  if SelectDirectory('Select output folder', '', S) then
    edSaveFolder.Text := S;
end;

procedure TfrmMain.chkExtractLanguageClick(Sender:TObject);
begin
  if chkExtractLanguage.Checked then
    btnOK.Caption := 'Extract'
  else
    btnOK.Caption := 'Split';
  cbLanguages.Enabled := chkExtractLanguage.Checked;
end;

procedure TfrmMain.LoadSettings;
begin
  with TIniFile.Create(ChangeFileExt(Application.Exename, '.ini')) do
  try
    edSDFFile.Text := ReadString('Settings', 'Filename', '');
    edSaveFolder.Text := ReadString('Settings', 'SaveFolder', '');
    chkExtractLanguage.Checked := ReadBool('Settings', 'ExtractLanguage', false);
    chkSortItems.Checked := ReadBool('Settings', 'SortItems', true);
    cbLanguages.Text := ReadString('Settings', 'Language', 'af');
  finally
    Free;
  end;
end;

procedure TfrmMain.SaveSettings;
begin
  with TIniFile.Create(ChangeFileExt(Application.Exename, '.ini')) do
  try
    WriteString('Settings', 'Filename', edSDFFile.Text);
    WriteString('Settings', 'SaveFolder', edSaveFolder.Text);
    WriteBool('Settings', 'ExtractLanguage', chkExtractLanguage.Checked);
    WriteBool('Settings', 'SortItems', chkSortItems.Checked);
    WriteString('Settings', 'Language', cbLanguages.Text);
  finally
    Free;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
  SaveSettings;
end;

procedure TfrmMain.FormShow(Sender:TObject);
begin
  LoadSettings;
  OnShow := nil;
end;

end.
