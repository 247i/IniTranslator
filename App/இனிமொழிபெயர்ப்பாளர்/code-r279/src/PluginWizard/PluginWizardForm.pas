{@abstract(Options dialog for PluginWizard) }
{
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

// $Id: PluginWizardForm.pas 250 2007-08-14 16:42:00Z peter3 $

unit PluginWizardForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PluginOptions;

type
  TfrmTranslatorPluginWizard = class(TForm)
    btnOK:TButton;
    btnCancel:TButton;
    GroupBox1:TGroupBox;
    Label1:TLabel;
    edClassName:TEdit;
    rbFileParser:TRadioButton;
    rbToolPlugin:TRadioButton;
    Label2:TLabel;
    edTitle:TEdit;
    Label3:TLabel;
    edTransIntfPath:TEdit;
    btnBrowse:TButton;
    odTransIntf:TOpenDialog;
    procedure btnBrowseClick(Sender:TObject);
    procedure btnOKClick(Sender:TObject);
  private
    { Private declarations }
    function Validate:boolean;
  public
    { Public declarations }
    class function Execute(Options:TPluginOptions):boolean;
  end;

implementation

{$R *.dfm}

{ TfrmTranslatorPluginWizard }

class function TfrmTranslatorPluginWizard.Execute(Options:TPluginOptions):boolean;
var
  frm:TfrmTranslatorPluginWizard;
begin
  frm := self.Create(Application);
  try
    frm.edClassName.Text := Options.PluginClassName;
    frm.edTitle.Text := Options.Title;
    frm.edTransIntfPath.Text := Options.TransIntfPath;
    frm.rbFileParser.Checked := Options.IsFileParser;
    frm.rbToolPlugin.Checked := not Options.IsFileParser;
    Result := frm.ShowModal = mrOk;
    if Result then
    begin
      Options.PluginClassName := frm.edClassName.Text;
      Options.Title := frm.edTitle.Text;
      Options.TransIntfPath := frm.edTransIntfPath.Text;
      Options.IsFileParser := frm.rbFileParser.Checked;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmTranslatorPluginWizard.btnBrowseClick(Sender:TObject);
begin
  odTransIntf.FileName := edTransIntfPath.Text;
  if odTransIntf.Execute then
    edTransIntfPath.Text := odTransIntf.FileName;
end;

procedure TfrmTranslatorPluginWizard.btnOKClick(Sender:TObject);
begin
  if not Validate then
    ModalResult := mrNone;
end;

function TfrmTranslatorPluginWizard.Validate:boolean;
begin
  Result := false;
  if edClassName.Text = '' then
  begin
    MessageDlg('Specify a class name', mtWarning, [mbOK], 0);
    Exit;
  end;

  if edTitle.Text = '' then
  begin
    MessageDlg('Specify a title', mtWarning, [mbOK], 0);
    Exit;
  end;

  if not FileExists(edTransIntfPath.Text) then
  begin
    MessageDlg('Specify path to TransIntf.pas', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := true;
end;

end.
