{@abstract(Generic file select dialog. Two files) }
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
// $Id: DualImportFrm.pas 278 2007-11-05 20:34:05Z peter3 $
unit DualImportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TransIntf, TntForms, TntDialogs, TntStdCtrls;

type
  TfrmDualImport = class(TTntForm, IInterface, ILocalizable)
    lblOriginal:TTntLabel;
    edFilename:TTntEdit;
    btnBrowse:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    OpenDialog1:TTntOpenDialog;
    lblTranslation:TTntLabel;
    edFilename2:TTntEdit;
    btnBrowse2:TTntButton;
    OpenDialog2:TTntOpenDialog;
    procedure CheckChange(Sender:TObject);
    procedure btnBrowseClick(Sender:TObject);
    procedure btnBrowse2Click(Sender:TObject);
  private
    { Private declarations }
    FCount:integer;
    FSecondIsOptional:boolean;
    FApplicationServices:IApplicationServices;
    procedure LoadSettings;
    procedure SaveSettings;
    function Translate(const Value:WideString):WideString;

  public
    { Public declarations }
    // SecondIsOptional parameter suggested by Chris Thornton
    class function Execute(var AOriginalFile, ATranslationFile:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString; const SecondIsOptional:Boolean = false):boolean; overload;
    class function Execute(const ApplicationServices:IApplicationServices; var AOriginalFile, ATranslationFile:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString; const SecondIsOptional:Boolean = false):boolean; overload;
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  IniFiles;

resourcestring
  SOptional = '&Translation file (optional):';

{$R *.dfm}

{ TfrmImport }

class function TfrmDualImport.Execute(var AOriginalFile, ATranslationFile:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString; const SecondIsOptional:Boolean = false):boolean;
begin
  Result := Execute(nil, AOriginalFile, ATranslationFile, ACaption, Filter, InitialDir, DefaultExt, SecondIsOptional);
end;

procedure TfrmDualImport.CheckChange(Sender:TObject);
begin
  btnOK.Enabled := (edFilename.Text <> '') and (FSecondIsOptional or ((edFilename2.Text <> '') and FileExists(edFilename.Text) and FileExists(edFilename2.Text)));
end;

procedure TfrmDualImport.btnBrowseClick(Sender:TObject);
begin
  OpenDialog1.Filename := edFilename.Text;
  if OpenDialog1.Execute then
    edFilename.Text := OpenDialog1.Filename;
  CheckChange(Sender);
end;

procedure TfrmDualImport.btnBrowse2Click(Sender:TObject);
begin
  OpenDialog2.Filename := edFilename2.Text;
  if OpenDialog2.Execute then
    edFilename2.Text := OpenDialog2.Filename;
  CheckChange(Sender);
end;

procedure TfrmDualImport.LoadSettings;
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

procedure TfrmDualImport.SaveSettings;
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

class function TfrmDualImport.Execute(
  const ApplicationServices:IApplicationServices; var AOriginalFile,
  ATranslationFile:WideString; const ACaption, Filter, InitialDir,
  DefaultExt:WideString; const SecondIsOptional:Boolean):boolean;
var
  frmImport:TfrmDualImport;
begin
  frmImport := self.Create(Application);
  with frmImport do
  try
    LoadSettings;
    FSecondIsOptional := SecondIsOptional;
    FApplicationServices := ApplicationServices;
    if ACaption <> '' then
      Caption := Translate(ACaption)
    else
      Caption := Translate(Caption);
    OpenDialog1.Filter := Translate(Filter);
    OpenDialog1.InitialDir := InitialDir;
    OpenDialog1.DefaultExt := Translate(DefaultExt);
    OpenDialog1.Title := Translate(OpenDialog1.Title);
    
    OpenDialog2.Filter := Translate(Filter);
    OpenDialog2.InitialDir := InitialDir;
    OpenDialog2.DefaultExt := Translate(DefaultExt);
    OpenDialog2.Title := Translate(OpenDialog2.Title);
    
    edFilename.Text := AOriginalFile;
    if SecondIsOptional then
      lblTranslation.Caption := Translate(SOptional)
    else
      lblTranslation.Caption := Translate(lblTranslation.Caption);
    lblOriginal.Caption := Translate(lblOriginal.Caption);
    edFilename2.Text := ATranslationFile;
    btnOK.Caption := Translate(btnOK.Caption);
    btnCancel.Caption := Translate(btnCancel.Caption);

    CheckChange(nil);
    Result := (ShowModal = mrOk) and FileExists(edFilename.Text) and (SecondIsOptional or FileExists(edFilename2.Text));
    if Result then
    begin
      AOriginalFile := edFilename.Text;
      ATranslationFile := edFilename2.Text;
    end;
    SaveSettings;
  finally
    Free;
  end;

end;

function TfrmDualImport.Translate(const Value:WideString):WideString;
begin
  if FApplicationServices <> nil then
    Result := FApplicationServices.Translate(self.ClassName, Value, Value)
  else
    Result := Value;
end;

function TfrmDualImport.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := SOptional;
    1:Value := self.Caption;
    2:Value := lblOriginal.Caption;
    3:Value := lblTranslation.Caption;
    4:Value := btnBrowse.Caption;
    5:Value := btnBrowse2.Caption;
    6:Value := btnOK.Caption;
    7:Value := btnCancel.Caption;
    8:Value := OpenDialog1.Title;
    9:Value := OpenDialog2.Title;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;
end;

end.
