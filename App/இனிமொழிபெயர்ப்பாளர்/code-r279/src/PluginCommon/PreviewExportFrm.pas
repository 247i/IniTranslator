{@abstract(Generic export dialog w. content preview) }
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
// $Id: PreviewExportFrm.pas 256 2007-10-17 20:57:18Z peter3 $
unit PreviewExportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TntForms, TntClasses, TntComCtrls, TransIntf,
  TntDialogs, TntStdCtrls;

type
  TfrmExport = class(TTntForm, IInterface, ILocalizable)
    lblFilename:TTntLabel;
    edFilename:TTntEdit;
    btnBrowse:TTntButton;
    rePreview:TTntRichEdit;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    lblPreview:TTntLabel;
    SaveDialog1:TTntSaveDialog;
    FindDialog1: TFindDialog;
    procedure btnBrowseClick(Sender:TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FHasPrompted:boolean;
    FApplicationServices:IApplicationServices;
    FCount:integer;
    function CheckFilename:boolean;
    function IsValidFilename:boolean;
    function OverwriteOK:boolean;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure FindFirst();
    procedure FindNext();
    function Translate(const Value:WideString):WideString;
  public
    { Public declarations }
    class function Execute(var FileName:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString;
      Preview:TTntStrings; WordWrap:boolean = false):boolean; overload;
    class function Execute(const ApplicationServices:IApplicationServices; var FileName:WideString;
      const ACaption, Filter, InitialDir, DefaultExt:WideString; Preview:TTntStrings; WordWrap:boolean = false):boolean; overload;
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  ShellAPI, IniFiles, CommonUtils, TntSysUtils;

const
  SFmtErrInvalidFilename = 'Invalid filename "%s". Select another filename and try again.';
  SError = 'Error';
  SFmtOverwriteOK = 'File "%s" already exists. Do you want to overwrite it?';
  SConfirm = 'Confirm';
  SFmtTextNotFound = 'No more instances of "%s" found';
  SInformation = 'Information';

{$R *.dfm}

{ TfrmExport }

class function TfrmExport.Execute(var FileName:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString; Preview:TTntStrings; WordWrap:boolean = false):boolean;
begin
  Result := Execute(nil, Filename, ACaption, Filter, InitialDir, DefaultExt, Preview, WordWrap);
end;

class function TfrmExport.Execute(const ApplicationServices:IApplicationServices; var FileName:WideString;
  const ACaption, Filter, InitialDir, DefaultExt:WideString;
  Preview:TTntStrings; WordWrap:boolean = false):boolean;
var
  frmExport:TfrmExport;
begin
  Result := false;
  frmExport := self.Create(Application);
  with frmExport do
  try
    LoadSettings;
    FApplicationServices := ApplicationServices;
    if ACaption <> '' then
      Caption := Translate(ACaption)
    else
      Caption := Translate(Caption);
    lblFilename.Caption := Translate(lblFilename.Caption);
    lblPreview.Caption := Translate(lblPreview.Caption);
    btnOK.Caption := Translate(btnOK.Caption);
    btnCancel.Caption := Translate(btnCancel.Caption);
    SaveDialog1.Filter := Translate(Filter);
    SaveDialog1.InitialDir := InitialDir;
    SaveDialog1.DefaultExt := DefaultExt;
    edFilename.Text := Filename;
    rePreview.WordWrap := WordWrap;
    rePreview.Lines := Preview;
    rePreview.SelStart := 0;
    SendMessage(rePreview.Handle, EM_SCROLLCARET, 0, 0);
    if (ShowModal = mrOK) and CheckFilename and OverwriteOK then
    begin
      Result := true;
      Preview.Assign(rePreview.Lines);
      Filename := edFilename.Text;
    end;
    SaveSettings;
  finally
    Free;
  end;
end;

procedure TfrmExport.btnBrowseClick(Sender:TObject);
begin
  SaveDialog1.FileName := edFilename.Text;
  SaveDialog1.Title := Translate(SaveDialog1.Title);
  if SaveDialog1.Execute then
  begin
    FHasPrompted := true;
    edFilename.Text := SaveDialog1.FileName;
  end;
end;

function TfrmExport.OverwriteOK:boolean;
begin
  Result := FHasPrompted or not FileExists(edFilename.Text) or
    (WideMessageBox(Handle, PWideChar(Translate(WideFormat(SFmtOverwriteOK, [edFilename.Text]))), PWideChar(Translate(SConfirm)), MB_YESNO or MB_SETFOREGROUND or MB_TASKMODAL or MB_ICONQUESTION) = IDYES);
end;

procedure TfrmExport.LoadSettings;
var
  M:TMemoryStream;
  FRect:TRect;
begin
  try
    FRect := Rect(0, 0, 0, 0);
    with TIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
    try
      M := TMemoryStream.Create;
      try
        if ReadBinaryStream('Forms', self.ClassName, M) = SizeOf(TRect) then
        begin
          M.Seek(0, soFromBeginning);
          Move(M.Memory^, Pointer(@FRect)^, sizeof(TRect));
        end;
      finally
        M.Free;
      end;
    finally
      Free;
    end;
    if not IsRectEmpty(FRect) then
    begin
      if (BorderStyle in [bsSizeable, bsSizeToolWin]) and (Screen.PixelsPerInch = PixelsPerInch) then
        BoundsRect := FRect
      else
      begin
        Left := FRect.Left;
        Top := FRect.Top;
      end;
    end
    else
    begin
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TfrmExport.SaveSettings;
var
  M:TMemoryStream;
  FRect:TRect;
begin
  if WindowState = wsNormal then
  try
    FRect := BoundsRect;
    with TIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
    try
      M := TMemoryStream.Create;
      try
        M.Write(FRect, sizeof(TRect));
        M.Seek(0, soFromBeginning);
        WriteBinaryStream('Forms', self.ClassName, M);
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

function TfrmExport.IsValidFilename:boolean;
var
  AHandle:THandle;
  APrevError, ALastError:DWORD;
begin
  if edFilename.Text <> '' then
  begin
    // try to create a new file: either it will fail because the file exists
    // or because the name is invalid
    // if it doesn't fail, it is ok to create the file
    APrevError := GetLastError;
    if Win32PlatformIsUnicode then
      AHandle := CreateFileW(PWideChar(edFilename.Text), 0, 0, nil, CREATE_NEW, 0, 0)
    else
      AHandle := CreateFileA(PChar(string(edFilename.Text)), 0, 0, nil, CREATE_NEW, 0, 0);
    try
      ALastError := GetLastError;
      Result := (ALastError = ERROR_FILE_EXISTS) or (AHandle <> INVALID_HANDLE_VALUE);
      SetLastError(APrevError);
    finally
      if AHandle <> INVALID_HANDLE_VALUE then
      begin
        CloseHandle(AHandle);
        if Win32PlatformIsUnicode then
          DeleteFileW(PWideChar(edFilename.Text))
        else
          DeleteFile(PChar(string(edFilename.Text)));
      end;
    end;
  end
  else
    Result := false;
end;

function TfrmExport.CheckFilename:boolean;
begin
  Result := IsValidFilename;
  if not Result then
    WideMessageBox(Handle, PWideChar(Translate(Format(SFmtErrInvalidFilename, [edFilename.Text]))), PWideChar(Translate(SError)), MB_OK or MB_TASKMODAl or MB_ICONERROR);
end;

function TfrmExport.Translate(const Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(ClassName, Value, Value)
  else
    Result := Value;
end;

function TfrmExport.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := SFmtErrInvalidFilename;
    1:Value := SError;
    2:Value := SFmtOverwriteOK;
    3:Value := SConfirm;
    4:Value := Self.Caption;
    5:Value := lblFilename.Caption;
    6:Value := lblPreview.Caption;
    7:Value := btnBrowse.Caption;
    8:Value := btnOK.Caption;
    9:Value := btnCancel.Caption;
    10:Value := SaveDialog1.Title;
    11:Value := SFmtTextNotFound;
    12:Value := SInformation;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;
end;

procedure TfrmExport.FindFirst;
begin
  if rePreview.SelText <> '' then
    FindDialog1.FindText := rePreview.SelText;
  FindDialog1.Execute;
end;

procedure TfrmExport.FindNext;
var
  i:integer;
  hWnd:THandle;
begin
  if FindDialog1.FindText = '' then
    FindFirst
  else
  begin
    i := rePreview.FindText(FindDialog1.FindText, rePreview.SelStart + 1,Length(rePreview.Text),[]);
    if i >= 0 then
    begin
      rePreview.HideSelection := false;
      rePreview.SelStart := i;
      rePreview.SelLength := Length(FindDialog1.FindText);
      rePreview.Perform(EM_SCROLLCARET,0,0);
    end
    else
    begin
      hWnd := Windows.GetFocus;
      WideMessageBox(Handle, PWideChar(Translate(Format(SFmtTextNotFound, [FindDialog1.FindText]))),
        PWideChar(Translate(SInformation)), MB_OK or MB_TASKMODAL or MB_ICONINFORMATION);
      if FindDialog1.Handle = 0 then // dialog not visible
        hWnd := rePreview.Handle;
      Windows.SetFocus(hWnd); // restore previous focus
    end;
  end;
end;

procedure TfrmExport.FindDialog1Find(Sender: TObject);
begin
  FindNext;
end;

procedure TfrmExport.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Ord('F')) then
    FindFirst
  else if Key = VK_F3 then
    FindNext
  else
   inherited;
end;

end.
