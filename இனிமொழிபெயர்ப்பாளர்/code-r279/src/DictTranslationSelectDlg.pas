{@abstract(Dictionary Translation Selector Dialog) }
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
// $Id: DictTranslationSelectDlg.pas 249 2007-08-14 16:29:55Z peter3 $
unit DictTranslationSelectDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, TntStdCtrls, Dictionary;

type
  TfrmDictTranslationSelect = class(TfrmBase)
    TntLabel1:TTntLabel;
    edOriginal:TTntEdit;
    TntLabel2:TTntLabel;
    edTranslation:TTntEdit;
    TntLabel3:TTntLabel;
    lbTranslations:TTntListBox;
    btnUse:TTntButton;
    btnCancel:TTntButton;
    btnIgnore:TTntButton;
    btnAdd:TTntButton;
    chkIgnoreNonEmpty:TTntCheckBox;
    chkDontAskAgain:TCheckBox;
    procedure btnIgnoreClick(Sender:TObject);
    procedure btnUseClick(Sender:TObject);
    procedure btnAddClick(Sender:TObject);
    procedure btnCancelClick(Sender:TObject);
    procedure lbTranslationsClick(Sender:TObject);
    procedure edTranslationChange(Sender:TObject);
    procedure lbTranslationsDblClick(Sender:TObject);
  private
    { Private declarations }
    FResult:integer;
    FModified:boolean;
    FDictionaryItem:TDictionaryItem;
  public
    { Public declarations }
    class function Edit(DictionaryItem:TDictionaryItem; var Translation:WideString; out Modified:boolean; var Prompt:boolean):Integer;
  end;

implementation
uses
  AppUtils, AppConsts;

{$R *.dfm}

{ TfrmDictTranslationSelect }

class function TfrmDictTranslationSelect.Edit(
  DictionaryItem:TDictionaryItem; var Translation:WideString; out Modified:boolean; var Prompt:boolean):Integer;
var
  frm:TfrmDictTranslationSelect;
begin
  if DictionaryItem = nil then
  begin
    Result := cDictIgnore;
    Exit;
  end;

  frm := self.Create(Application);
  try
    frm.FDictionaryItem := DictionaryItem;
    frm.edOriginal.Text := DictionaryItem.Original;
    frm.edTranslation.Text := Translation;
    frm.lbTranslations.Items := DictionaryItem.Translations;
    frm.lbTranslations.ItemIndex := frm.lbTranslations.Items.IndexOf(Translation);
    frm.chkIgnoreNonEmpty.Checked := GlobalAppOptions.DictIgnoreNonEmpty;
    frm.chkDontAskAgain.Checked := not Prompt;
    frm.edTranslationChange(nil);
    if frm.ShowModal <> mrOK then
      frm.FResult := cDictCancel
    else
    begin
      GlobalAppOptions.DictIgnoreNonEmpty := frm.chkIgnoreNonEmpty.Checked;
      Prompt := not frm.chkDontAskAgain.Checked;
    end;
    Modified := frm.FModified;
    Result := frm.FResult;
    if Result in [cDictUse, cDictAdd] then
      Translation := frm.edTranslation.Text;
  finally
    frm.Free;
  end;
end;

procedure TfrmDictTranslationSelect.btnIgnoreClick(Sender:TObject);
begin
  FResult := cDictIgnore;
end;

procedure TfrmDictTranslationSelect.btnUseClick(Sender:TObject);
begin
  FResult := cDictUse;
end;

procedure TfrmDictTranslationSelect.btnAddClick(Sender:TObject);
begin
//  FResult := cDictAdd;
  FDictionaryItem.Translations.Add(edTranslation.Text);
  lbTranslations.Items := FDictionaryItem.Translations;
  FModified := true;
end;

procedure TfrmDictTranslationSelect.btnCancelClick(Sender:TObject);
begin
  FResult := cDictCancel;
end;

procedure TfrmDictTranslationSelect.lbTranslationsClick(Sender:TObject);
begin
  with lbTranslations do
  begin
    if ItemIndex > -1 then
      edTranslation.Text := Items[ItemIndex];
  end;
end;

procedure TfrmDictTranslationSelect.edTranslationChange(Sender:TObject);
begin
  btnAdd.Enabled := (edTranslation.Text <> '') and (lbTranslations.Items.IndexOf(edTranslation.Text) < 0);
end;

procedure TfrmDictTranslationSelect.lbTranslationsDblClick(
  Sender:TObject);
begin
  if lbTranslations.ItemIndex > -1 then
    btnUse.Click;
end;

end.
