unit MainFrm;
{$I ..\TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntClasses, TntSysUtils, TntStdCtrls, TntDialogs;

type
  TfrmMain = class(TForm)
    TntLabel1:TTntLabel;
    edInput:TTntEdit;
    btnInput:TTntButton;
    TntLabel2:TTntLabel;
    edOutput:TTntEdit;
    btnOutput:TTntButton;
    TntLabel3:TTntLabel;
    cbOriginal:TTntComboBox;
    TntLabel4:TTntLabel;
    cbTranslation:TTntComboBox;
    btnCreate:TTntButton;
    dlgInput:TTntOpenDialog;
    dlgOutput:TTntSaveDialog;
    chkOverwrite:TTntCheckBox;
    TntLabel5:TTntLabel;
    procedure edInputChange(Sender:TObject);
    procedure btnCreateClick(Sender:TObject);
    procedure btnInputClick(Sender:TObject);
    procedure btnOutputClick(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
    procedure TntLabel5Click(Sender:TObject);
    procedure edOutputChange(Sender:TObject);
  private
    { Private declarations }
    procedure LoadSettings;
    procedure SaveSettings;
    procedure LoadLanguages(const Filename:WideString; Original, Translation:TTntStrings);
    function Validate:boolean;
    procedure ConvertFile(const Input, Output:WideString; OrigIndex,
      TransIndex:integer; OverwriteOutput:boolean);
  public
    { Public declarations }
  end;

var
  frmMain:TfrmMain;

implementation
uses
{$IFDEF COMPILER_9_UP}WideStrUtils{$ELSE}TntWideStrUtils{$ENDIF}, IniFiles, TntWindows;

{$R *.dfm}

procedure TfrmMain.edInputChange(Sender:TObject);
var
  i, j:integer;

  function Max(Value1, Value2:integer):integer;
  begin
    Result := Value1;
    if Value2 > Value1 then
      Result := Value2;
  end;
begin
  if FileExists(edInput.Text) then
  begin
    if edOutput.Text = '' then
      edOutput.Text := ChangeFileExt(edINput.Text, '.dct');
    i := cbOriginal.ItemIndex;
    j := cbTranslation.ItemIndex;
    LoadLanguages(edInput.Text, cbOriginal.Items, cbTranslation.Items);
    cbOriginal.ItemIndex := Max(i, 0);
    cbTranslation.ItemIndex := Max(j, 0);
  end;
  edInput.Hint := edInput.Text;
end;

procedure TfrmMain.btnOutputClick(Sender:TObject);
begin
  dlgOutput.Filename := edOutput.Text;
  if dlgOutput.Execute then
    edOutput.Text := dlgOutput.Filename;
end;

procedure TfrmMain.btnInputClick(Sender:TObject);
begin
  dlgInput.Filename := edInput.Text;
  if dlgInput.Execute then
  begin
    edInput.Text := dlgInput.Filename;
    edInputChange(Sender);
  end;
end;

procedure SplitString(const S:WideString; Strings:TTntStrings; Delimiter:WideChar);
var
  i, j:integer;
  tmp:WideString;
begin
  j := 1;
  Strings.Clear;
  for i := 0 to Length(S) do
  begin
    if S[i] = Delimiter then
    begin
      tmp := Copy(S, j, i - j);
      Strings.Add(tmp);
      j := i + 1;
    end;
  end;
end;

procedure TfrmMain.LoadLanguages(const Filename:WideString; Original,
  Translation:TTntStrings);
const
  cMarker:PWideChar = 'English - United States'; // this is the start of the first item
var
  S, T:TTntStringlist;
  i:integer;
begin
  Original.BeginUpdate;
  S := TTntStringlist.Create;
  T := TTntStringlist.Create;
  try
    S.LoadFromFile(Filename);
    for i := 0 to S.Count - 1 do
      if Pos(cMarker, S[i]) = 1 then
      begin
        T.Text := Tnt_WideStringReplace(S[i], #9, #13#10, [rfReplaceAll]);
//        SplitString(S[i], T, #9);
        Original.Assign(T);
        Translation.Assign(T);
        Exit;
      end;
  finally
    Original.EndUpdate;
    S.Free;
    T.Free;
  end;
end;

function TfrmMain.Validate:boolean;
var
  S:WideString;
begin
  Result := true;
  S := '';
  if not FileExists(edInput.Text) then
  begin
    Result := false;
    S := 'The specified input file was not found!';
    edInput.SetFocus;
  end
  else if cbOriginal.ItemIndex < 0 then
  begin
    Result := false;
    S := 'Please select an original language!';
    cbOriginal.SetFocus;
  end
  else if cbTranslation.ItemIndex < 0 then
  begin
    Result := false;
    S := 'Please select a translation language!';
    cbTranslation.SetFocus;
  end
  else if cbTranslation.ItemIndex = cbOriginal.ItemIndex then
  begin
    Result := false;
    S := 'Please specify different languages for original and translation!';
    cbOriginal.SetFocus;
  end
  else if edOutput.Text = '' then
  begin
    Result := false;
    S := 'Please specify an output filename!';
    edOutput.SetFocus;
  end;

  if not Result then
    WideMessageDlg(S, mtError, [mbOK], 0);
end;

procedure TfrmMain.ConvertFile(const Input, Output:WideString; OrigIndex, TransIndex:integer; OverwriteOutput:boolean);
const
  cMarker:PWideChar = 'English - United States'; // this is the start of the first item
var
  I, T, O:TTntStringlist;
  j:integer;
  MarkerFound:boolean;
begin
  if (OrigIndex < 0) or (TransIndex < 0) then
    raise Exception.CreateFmt('OrigIndex (%d) or TransIndex (%d) is invalid', [OrigIndex, TransIndex]);
  I := TTntStringlist.Create;
  T := TTntStringlist.Create;
  O := TTntStringlist.Create;
  MarkerFound := false;
  try
    T.Delimiter := #9;
    I.LoadFromFile(Input);
    if not OverwriteOutput and FileExists(Output) then
      O.LoadFromFile(Output);
    for j := 0 to I.Count - 1 do
    begin
      if MarkerFound then
      begin
        T.Text := Tnt_WideStringReplace(I[j], #9, #13#10, [rfReplaceAll]);

        // SplitString(I[j], T, #9);
        if (OrigIndex < T.Count) and (TransIndex < T.Count) then
          O.Add(WideFormat('%s="%s"', [WideDequotedStr(T[OrigIndex], '"'), WideDequotedStr(T[TransIndex], '"')]));
      end;
      if Pos(cMarker, I[j]) = 1 then
        MarkerFound := true;
    end;
    O.SaveToFile(Output);
  finally
    I.Free;
    T.Free;
    O.Free;
  end;
end;

procedure TfrmMain.btnCreateClick(Sender:TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if Validate then
    begin
      ConvertFile(ExpandUNCFilename(edInput.Text), ExpandUNCFilename(edOutput.Text), cbOriginal.ItemIndex, cbTranslation.ItemIndex, chkOverwrite.Checked);
      WideShowMessage('Conversion done!');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.LoadSettings;
begin
  with TIniFile.Create(ChangeFileExt(Application.Exename, '.ini')) do
  try
    edInput.Text := ReadString('Settings', 'Input', '');
    edOutput.Text := ReadString('Settings', 'Output', '');
    cbOriginal.ItemIndex := ReadInteger('Settings', 'OriginalIndex', 0);
    cbTranslation.ItemIndex := ReadInteger('Settings', 'TranslationIndex', 0);
    chkOverwrite.Checked := ReadBool('Settings', 'Overwrite', true);
  finally
    Free;
  end;
end;

procedure TfrmMain.SaveSettings;
begin
  with TIniFile.Create(ChangeFileExt(Application.Exename, '.ini')) do
  try
    WriteString('Settings', 'Input', edInput.Text);
    WriteString('Settings', 'Output', edOutput.Text);
    WriteInteger('Settings', 'OriginalIndex', cbOriginal.ItemIndex);
    WriteInteger('Settings', 'TranslationIndex', cbTranslation.ItemIndex);
    WriteBool('Settings', 'Overwrite', chkOverwrite.Checked);
  finally
    Free;
  end;

end;

procedure TfrmMain.FormShow(Sender:TObject);
begin
  OnShow := nil;
  LoadSettings;
end;

procedure TfrmMain.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
  SaveSettings;
end;

procedure TfrmMain.TntLabel5Click(Sender:TObject);
begin
  Tnt_ShellExecuteW(Handle, 'open', 'http://www.microsoft.com/globaldev/tools/MILSGlossary.mspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.edOutputChange(Sender:TObject);
begin
  edOutput.Hint := edOutput.Text;
end;

end.
