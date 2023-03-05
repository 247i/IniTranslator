{@abstract(Trim options dialog) }
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

// $Id: ToolTrimFrm.pas 250 2007-08-14 16:42:00Z peter3 $
unit ToolTrimFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, TransIntf;

type
  TfrmToolTrim = class(TTntForm)
    lblTrimWhat:TTntLabel;
    edTrimWhat:TTntEdit;
    lblTrimWhere:TTntLabel;
    cbTrimWhere:TTntComboBox;
    lblTrimHow:TTntLabel;
    cbTrimHow:TTntComboBox;
    chkTrimWhitespace:TTntCheckBox;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    procedure btnOKClick(Sender:TObject);
  private
    { Private declarations }
    FItems:ITranslationItems;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure DoTrim;
    procedure DoTranslate;
  public
    { Public declarations }
    class function Execute(const Items:ITranslationItems):boolean;
  end;

implementation
uses
  ToolTrimConsts, WideIniFiles;

{$R *.dfm}

{ TfrmTrim }

class function TfrmToolTrim.Execute(const Items:ITranslationItems):boolean;
var
  frmTrim:TfrmToolTrim;
  FAppHandle:Cardinal;
begin
  FAppHandle := Application.Handle;
  Application.Handle := GlobalAppServices.AppHandle;

  frmTrim := self.Create(Application);
  try
    // frmTrim.Font := Application.MainForm.Font;
    frmTrim.FItems := Items;
    frmTrim.DoTranslate;
    frmTrim.LoadSettings;
    Result := frmTrim.ShowModal = mrOK;
    frmTrim.SaveSettings;
  finally
    frmTrim.Free;
    Application.Handle := FAppHandle;
  end;
end;

procedure TfrmToolTrim.LoadSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    edTrimWhat.Text := ReadString('Settings', 'What', edTrimWhat.Text);
    cbTrimWhere.ItemIndex := ReadInteger('Settings', 'Where', cbTrimWhere.ItemIndex);
    cbTrimHow.ItemIndex := ReadInteger('Settings', 'How', cbTrimHow.ItemIndex);
    chkTrimWhitespace.Checked := ReadBool('Settings', 'WhiteSpace', chkTrimWhitespace.Checked);
  finally
    Free;
  end;
end;

procedure TfrmToolTrim.SaveSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    WriteString('Settings', 'What', edTrimWhat.Text);
    WriteInteger('Settings', 'Where', cbTrimWhere.ItemIndex);
    WriteInteger('Settings', 'How', cbTrimHow.ItemIndex);
    WriteBool('Settings', 'WhiteSpace', chkTrimWhitespace.Checked);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TfrmToolTrim.btnOKClick(Sender:TObject);
begin
  DoTrim;
end;

procedure TfrmToolTrim.DoTrim;
var
  i:integer;
  ti:ITranslationItem;
  S:WideString;

  procedure InternalTrim(var S:WideString);
  var
    iStart:integer;
  begin
    if cbTrimHow.ItemIndex in [0, 2] then
    begin
      iStart := 1;
      while (iStart <= Length(S)) and ((Pos(S[iStart], edTrimWhat.Text) > 0)
        or (chkTrimWhiteSpace.Checked and (S[iStart] < #33))) do
        Inc(iStart);
      S := Copy(S, iStart, MaxInt);
    end;
    if cbTrimHow.ItemIndex in [1, 2] then
    begin
      iStart := Length(S);
      while (iStart >= 1) and ((Pos(S[iStart], edTrimWhat.Text) > 0)
        or (chkTrimWhiteSpace.Checked and (S[iStart] < #33))) do
        Dec(iStart);
      S := Copy(S, 1, iStart);
    end;

  end;
begin
  if (edTrimWhat.Text <> '') or chkTrimWhiteSpace.Checked then
  begin
    for i := 0 to FItems.Count - 1 do
    begin
      ti := FItems[i];
      if (cbTrimWhere.ItemIndex in [0, 2]) and (ti.Original <> '') then
      begin
        S := ti.Original;
        InternalTrim(S);
        if Length(S) <> Length(ti.Original) then
          ti.Original := S;
      end;
      if (cbTrimWhere.ItemIndex in [0, 2]) and (ti.Translation <> '') then
      begin
        S := ti.Translation;
        InternalTrim(S);
        if Length(S) <> Length(ti.Translation) then
          ti.Translation := S;
      end;
    end;
  end;
end;

procedure TfrmToolTrim.DoTranslate;
begin
  Caption := Translate(SFormCaption);
  lblTrimWhat.Caption := Translate(STrimWhatLabel);
  chkTrimWhitespace.Caption := Translate(STrimWhiteSpace);
  lblTrimWhere.Caption := Translate(STrimWhereLabel);
  cbTrimWhere.Items.Text := Translate(STrimWhereOptions);
  lblTrimHow.Caption := Translate(STrimHowLabel);
  cbTrimHow.Items.Text := Translate(STrimHowOptions);
  btnOK.Caption := Translate(SOK);
  btnCancel.Caption := Translate(SCancel);
end;

end.
