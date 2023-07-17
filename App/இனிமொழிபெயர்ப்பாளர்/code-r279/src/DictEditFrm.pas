{@abstract(Dictionary Edit Dialog) }
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
// $Id: DictEditFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit DictEditFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, TntWindows, TntStdCtrls, ExtCtrls, TntExtCtrls, Dictionary,
  ActnList, TntActnList, Menus, TntMenus;

type
  TfrmDictEdit = class(TfrmBase)
    cbOriginal:TTntComboBox;
    TntLabel1:TTntLabel;
    btnAddOriginal:TTntButton;
    btnRemoveOriginal:TTntButton;
    lbTranslations:TTntListBox;
    TntLabel2:TTntLabel;
    edTranslation:TTntEdit;
    btnAddTranslation:TTntButton;
    btnRemoveTranslation:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    TntBevel1:TTntBevel;
    alDictEdit:TTntActionList;
    acAddOriginal:TTntAction;
    acRemoveOriginal:TTntAction;
    acAddTranslation:TTntAction;
    acRemoveTranslation:TTntAction;
    TntLabel3:TTntLabel;
    cbFilter:TTntComboBox;
    acMakeDefault:TTntAction;
    popTranslations:TTntPopupMenu;
    MakeDefault1:TTntMenuItem;
    procedure cbOriginalChange(Sender:TObject);
    procedure alDictEditUpdate(Action:TBasicAction; var Handled:Boolean);
    procedure acAddOriginalExecute(Sender:TObject);
    procedure acRemoveOriginalExecute(Sender:TObject);
    procedure acAddTranslationExecute(Sender:TObject);
    procedure acRemoveTranslationExecute(Sender:TObject);
    procedure lbTranslationsClick(Sender:TObject);
    procedure cbFilterChange(Sender:TObject);
    procedure lbTranslationsDblClick(Sender:TObject);
    procedure lbTranslationsDrawItem(Control:TWinControl; Index:Integer;
      Rect:TRect; State:TOwnerDrawState);
    procedure acMakeDefaultExecute(Sender:TObject);
  private
    { Private declarations }
    FItems:TDictionaryItems;
    procedure SetItems(const Value:TDictionaryItems);
    function GetItems:TDictionaryItems;
    function CurrentItem:TDictionaryItem;
    procedure UpdateUI;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property Items:TDictionaryItems read GetItems write SetItems;
    class function Edit(Items:TDictionaryItems):boolean;
  end;

implementation
uses
  AppUtils;

{$R *.dfm}

{ TfrmDictEdit }

constructor TfrmDictEdit.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FItems := TDictionaryItems.Create;
end;

destructor TfrmDictEdit.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

class function TfrmDictEdit.Edit(Items:TDictionaryItems):boolean;
var
  frm:TfrmDictEdit;
begin
  frm := self.Create(Application);
  try
    frm.cbFilter.ItemIndex := GlobalAppOptions.DictEditFilter;
    frm.Items := Items;
//    frm.Items.IgnorePunctuation := Items.IgnorePunctuation;
    Result := frm.ShowModal = mrOK;
    if Result then
    begin
      Items.Assign(frm.Items);
      GlobalAppOptions.DictEditFilter := frm.cbFilter.ItemIndex;
    end;
  finally
    frm.Free;
  end;
end;

function TfrmDictEdit.GetItems:TDictionaryItems;
begin
  Result := FItems;
end;

procedure TfrmDictEdit.SetItems(const Value:TDictionaryItems);
begin
  FItems.Assign(Value);
  cbOriginal.Items.Clear;
  lbTranslations.Count := 0;
  cbFilterChange(nil);
end;

procedure TfrmDictEdit.cbOriginalChange(Sender:TObject);
var
  D:TDictionaryItem;
begin

  lbTranslations.Count := 0;
  D := CurrentItem;
  if D <> nil then
  begin
    lbTranslations.Count := D.Translations.Count;
    lbTranslations.ItemIndex := D.DefaultIndex;
  end;
  UpdateUI;
end;

procedure TfrmDictEdit.alDictEditUpdate(Action:TBasicAction;
  var Handled:Boolean);
var
  i:integer;
  D:TDictionaryItem;
begin
  D := CurrentItem;
  acAddOriginal.Enabled := (cbOriginal.Text <> '') and (D = nil);
  acRemoveOriginal.Enabled := D <> nil;
  if D <> nil then
  begin
    i := D.Translations.IndexOf(edTranslation.Text);
    acAddTranslation.Enabled := (edTranslation.Text <> '') and (i < 0);
    acRemoveTranslation.Enabled := i > -1;
    acMakeDefault.Enabled := (D.Translations.Count > 1) and (D.DefaultIndex <> lbTranslations.ItemIndex);
  end
  else
  begin
    acAddTranslation.Enabled := false;
    acRemoveTranslation.Enabled := false;
    acMakeDefault.Enabled := false;
  end;
end;

procedure TfrmDictEdit.acAddOriginalExecute(Sender:TObject);
var
  D:TDictionaryItem;
begin
  if (cbOriginal.Text <> '') and (CurrentItem <> nil) then
  begin
    cbOriginal.ItemIndex := cbOriginal.Items.Add(cbOriginal.Text);
    FItems.Add(cbOriginal.Text);
    D := CurrentItem;
    if D <> nil then
    begin
      lbTranslations.Count := D.Translations.Count;
      lbTranslations.ItemIndex := D.DefaultIndex;
    end
    else
      lbTranslations.Count := 0;
    edTranslation.SetFocus;
    edTranslation.SelectAll;
  end;
  cbFilterChange(Sender);
end;

procedure TfrmDictEdit.acRemoveOriginalExecute(Sender:TObject);
var
  i:integer;
begin
  i := FItems.IndexOf(cbOriginal.Text);
  if i >= 0 then
    FItems.Delete(i);

  i := cbOriginal.Items.IndexOf(cbOriginal.Text);
  if i >= 0 then
  begin
    cbOriginal.Items.Delete(i);
    cbOriginal.ItemIndex := i;
  end;
  if cbOriginal.ItemIndex < 0 then
    cbOriginal.ItemIndex := 0;
  cbOriginalChange(Sender);
  cbOriginal.SetFocus;
end;

procedure TfrmDictEdit.acAddTranslationExecute(Sender:TObject);
var
  i:integer;
begin
  if edTranslation.Text = '' then
    Exit;
  i := FItems.IndexOf(cbOriginal.Text);
  if (i >= 0) and (FItems[i].Translations.IndexOf(edTranslation.Text) < 0) then
  begin
    FItems[i].Translations.Add(edTranslation.Text);
    cbOriginalChange(Sender);
    edTranslation.SetFocus;
    edTranslation.SelectAll;
  end;
end;

procedure TfrmDictEdit.acRemoveTranslationExecute(Sender:TObject);
var
  D:TDictionaryItem;
begin
  D := CurrentItem;
  if (D <> nil) then
  begin
    if lbTranslations.ItemIndex >= 0 then
    begin
      D.Translations.Delete(lbTranslations.ItemIndex);
      cbOriginalChange(Sender);
    end;
  end;
end;

procedure TfrmDictEdit.lbTranslationsClick(Sender:TObject);
begin
  with lbTranslations do
    if ItemIndex >= 0 then
      edTranslation.Text := CurrentItem.Translations[ItemIndex];
  UpdateUI;
end;

procedure TfrmDictEdit.UpdateUI;
begin
  alDictEdit.UpdateAction(nil);
end;

procedure TfrmDictEdit.cbFilterChange(Sender:TObject);
var
  i:integer;
begin
  cbOriginal.Text := '';
  cbOriginal.Items.Clear;
  for i := 0 to FItems.Count - 1 do
    case cbFilter.ItemIndex of
      0: // all items
        cbOriginal.Items.Add(FItems[i].Original);
      1: // items with translations
        if FItems[i].Translations.Count > 0 then
          cbOriginal.Items.Add(FItems[i].Original);
      2:
        if FItems[i].Translations.Count = 0 then
          cbOriginal.Items.Add(FItems[i].Original);
      3:
        if FItems[i].Translations.Count > 1 then
          cbOriginal.Items.Add(FItems[i].Original);
      4:
        if FItems[i].Translations.Count = 1 then
          cbOriginal.Items.Add(FItems[i].Original);
    end;
  if cbOriginal.Items.Count > 0 then
    cbOriginal.ItemIndex := 0;
  cbOriginalChange(Sender);
end;

procedure TfrmDictEdit.lbTranslationsDblClick(Sender:TObject);
begin
  acMakeDefault.Execute;
end;

function TfrmDictEdit.CurrentItem:TDictionaryItem;
var
  i:integer;
begin
  i := Items.IndexOf(cbOriginal.Text);
  if i >= 0 then
    Result := Items[i]
  else
    Result := nil;
end;

procedure TfrmDictEdit.lbTranslationsDrawItem(Control:TWinControl;
  Index:Integer; Rect:TRect; State:TOwnerDrawState);
var
  D:TDictionaryItem;
  C:TCanvas;
begin
  C := lbTranslations.Canvas;
  C.Font := lbTranslations.Font;
  if ([odSelected, odFocused] * State <> []) then
    C.Font.Color := clHighlightText;

  D := CurrentItem;
  if (D <> nil) and (Index >= 0) and (Index < D.Translations.Count) then
  begin
    if (Index = D.DefaultIndex) and (D.Translations.Count > 1) then
      C.Font.Style := C.Font.Style + [fsBold];
    C.FillRect(Rect);
    SetBkMode(C.Handle, Windows.TRANSPARENT);
    Tnt_DrawTextW(C.Handle, PWideChar(D.Translations[Index]), -1, Rect, DT_SINGLELINE or DT_VCENTER or DT_LEFT or DT_NOPREFIX);
  end;
end;

procedure TfrmDictEdit.acMakeDefaultExecute(Sender:TObject);
var
  D:TDictionaryItem;
begin
  // set the selected item as the default translation
  D := CurrentItem;
  if D <> nil then
  begin
    D.DefaultIndex := lbTranslations.ItemIndex;
    lbTranslations.Invalidate;
  end;
end;

end.
