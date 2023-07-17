{@abstract(Add/Edit item dialog) }
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

// $Id: EditItemFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit EditItemFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, TntStdCtrls, TntClasses, TransIntf,
  ComCtrls, TntComCtrls;

type
  TfrmEditItem = class(TfrmBase)
    btnOK:TTntButton;
    btnCancel:TTntButton;
    Label1:TTntLabel;
    cbSections:TTntComboBox;
    Label2:TTntLabel;
    edOriginal:TTntRichEdit;
    Label3:TTntLabel;
    edTranslation:TTntRichEdit;
    Label6:TTntLabel;
    edName:TTntEdit;
    pcComments:TTntPageControl;
    tabOriginal:TTntTabSheet;
    tabTranslation:TTntTabSheet;
    edOrigComments:TTntRichEdit;
    edTransComment:TTntRichEdit;
    procedure TntFormCreate(Sender:TObject);
    procedure DoKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure TntFormShow(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Edit(const ACaption:WideString;
      Sections:TTntStringlist; const AItem:ITranslationItem; IsNewItem:boolean):boolean;
  end;

var
  frmEditItem:TfrmEditItem;

implementation
uses
  AppUtils;

{$R *.dfm}

{ TfrmEditItem }

class function TfrmEditItem.Edit(const ACaption:WideString; Sections:TTntStringlist;
  const AItem:ITranslationItem; IsNewItem:boolean):boolean;
var
  frm:TfrmEditItem;
begin
  frm := self.Create(Application);
  try
    GlobalLanguageFile.TranslateObject(frm, frm.ClassName);
    frm.Caption := ACaption;
    if Sections <> nil then
      frm.cbSections.Items := Sections;
    frm.cbSections.Text := AItem.Section;
    if frm.cbSections.Text = '' then
      frm.cbSections.ItemIndex := 0;
    frm.cbSections.Enabled := IsNewItem;
    frm.edName.Text := AItem.Name;
    frm.edName.ReadOnly := not IsNewItem;
    frm.edOriginal.Text := AItem.Original;
    frm.edTranslation.Text := AItem.Translation;
    frm.edOrigComments.Text := AItem.OrigComments;
    frm.edTransComment.Text := AItem.TransComments;
    if IsNewItem then
      frm.ActiveControl := frm.cbSections
    else
      frm.ActiveControl := frm.edTranslation;
    Result := frm.ShowModal = mrOK;
    if Result then
    begin
      AItem.Section := frm.cbSections.Text;
      AItem.Name := frm.edName.Text;
      AItem.Original := frm.edOriginal.Text;
      AItem.Translation := frm.edTranslation.Text;
      AItem.OrigComments := frm.edOrigComments.Text;
      AItem.TransComments := frm.edTransComment.Text;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmEditItem.TntFormCreate(Sender:TObject);
begin
  inherited;
  pcComments.ActivePageIndex := 0;
end;

procedure TfrmEditItem.DoKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_RETURN then
    Key := 0;
end;

procedure TfrmEditItem.TntFormShow(Sender:TObject);
begin
  if (ActiveControl = edTranslation) and edTranslation.CanFocus then
  begin
    edTranslation.SelectAll;
    edTranslation.SetFocus;
  end;
end;

end.
