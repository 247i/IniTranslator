{@abstract(file select dialog for OpenOffice GSI files) }
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
// $Id: OOGSIImportFrm.pas 278 2007-11-05 20:34:05Z peter3 $

unit OOGSIImportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntDialogs, TntStdCtrls;

type
  TfrmImport = class(TTntForm)
    Label1:TTntLabel;
    edFilename:TTntEdit;
    btnBrowse:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    OpenDialog1:TTntOpenDialog;
    Label2:TTntLabel;
    edFilename2:TTntEdit;
    btnBrowse2:TTntButton;
    OpenDialog2:TTntOpenDialog;
    chkOriginalIsDual:TTntCheckBox;
    chkSearchTranslation:TTntCheckBox;
    procedure CheckChange(Sender:TObject);
    procedure btnBrowseClick(Sender:TObject);
    procedure btnBrowse2Click(Sender:TObject);
    procedure chkOriginalIsDualClick(Sender:TObject);
  private
    { Private declarations }
    procedure LoadSettings;
    procedure SaveSettings;
  public
    { Public declarations }
    class function Execute(var AOriginalFile, ATranslationFile:WideString;
      var OrigIsDualLine, SearchTrans:boolean; const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean;
  end;

implementation
uses
  IniFiles;

{$R *.dfm}

{ TfrmImport }

class function TfrmImport.Execute(var AOriginalFile, ATranslationFile:WideString;
  var OrigIsDualLine, SearchTrans:boolean; const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean;
var
  frmImport:TfrmImport;
begin
  frmImport := self.Create(Application);
  with frmImport do
  try
    LoadSettings;
    Caption := ACaption;
    OpenDialog1.Filter := Filter;
    OpenDialog1.InitialDir := InitialDir;
    OpenDialog1.DefaultExt := DefaultExt;
    // OpenDialog1.Title := Translate(OpenDialog1.Title);
    OpenDialog2.Filter := Filter;
    OpenDialog2.InitialDir := InitialDir;
    OpenDialog2.DefaultExt := DefaultExt;
    // OpenDialog2.Title := Translate(OpenDialog2.Title);

    edFilename.Text := AOriginalFile;
    edFilename2.Text := ATranslationFile;
    chkOriginalIsDual.Checked := OrigIsDualLine;
    chkSearchTranslation.Checked := SearchTrans;
    CheckChange(nil);
    Result := (ShowModal = mrOk) and FileExists(edFilename.Text);
    if Result then
    begin
      AOriginalFile := edFilename.Text;
      ATranslationFile := edFilename2.Text;
      OrigIsDualLine := chkOriginalIsDual.Checked;
      SearchTrans := chkSearchTranslation.Checked;
    end;
    SaveSettings;
  finally
    Free;
  end;
end;

procedure TfrmImport.CheckChange(Sender:TObject);
begin
  btnOK.Enabled := FileExists(edFilename.Text);
end;

procedure TfrmImport.btnBrowseClick(Sender:TObject);
begin
  OpenDialog1.Filename := edFilename.Text;
  if OpenDialog1.Execute then
    edFilename.Text := OpenDialog1.Filename;
  CheckChange(Sender);
end;

procedure TfrmImport.btnBrowse2Click(Sender:TObject);
begin
  OpenDialog2.Filename := edFilename2.Text;
  if OpenDialog2.Execute then
    edFilename2.Text := OpenDialog2.Filename;
  CheckChange(Sender);
end;

procedure TfrmImport.LoadSettings;
var
  M:TMemoryStream; FRect:TRect;
begin
  try
    FRect := Rect(0, 0, 0, 0);
    with TIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
    try
      M := TMemoryStream.Create;
      try
        if ReadBinaryStream('Forms', ClassName, M) = SizeOf(TRect) then
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

procedure TfrmImport.SaveSettings;
var
  M:TMemoryStream; FRect:TRect;
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
        WriteBinaryStream('Forms', ClassName, M);
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

procedure TfrmImport.chkOriginalIsDualClick(Sender:TObject);
begin
  Label2.Enabled := not chkOriginalIsDual.Checked;
  edFilename2.Enabled := Label2.Enabled;
  btnBrowse2.Enabled := Label2.Enabled;
  chkSearchTranslation.Enabled := Label2.Enabled;
end;

end.
