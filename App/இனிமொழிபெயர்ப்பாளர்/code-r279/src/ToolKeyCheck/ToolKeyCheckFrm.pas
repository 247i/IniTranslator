{@abstract(ToolKeyCheck edit form) }
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

// $Id: ToolKeyCheckFrm.pas 250 2007-08-14 16:42:00Z peter3 $

unit ToolKeyCheckFrm;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, ComCtrls, TransIntf, TntComCtrls, ImgList, ActnList,
  TntActnList, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Menus,
  TntMenus;

type
  TListViewInfo = class
    Column:TListColumn;
    Descending:boolean;
  end;

  TfrmToolKeyCheck = class(TTntForm)
    TntStatusBar1:TTntStatusBar;
    lvItems:TTntListView;
    ilSortArrows:TImageList;
    TntPanel1:TTntPanel;
    chkIgnoreEmpty:TTntCheckBox;
    TntButton1:TTntButton;
    alMain:TTntActionList;
    acUpdate:TTntAction;
    acEdit:TTntAction;
    acClose:TTntAction;
    popListView:TTntPopupMenu;
    Edit1:TTntMenuItem;
    acSync:TTntAction;
    Showinmainlist1:TTntMenuItem;
    N1:TTntMenuItem;
    Update1:TTntMenuItem;
    Close1:TTntMenuItem;
    procedure lvItemsResize(Sender:TObject);
    procedure lvItemsEnter(Sender:TObject);
    procedure lvItemsColumnClick(Sender:TObject; Column:TListColumn);
    procedure TntFormCreate(Sender:TObject);
    procedure TntFormDestroy(Sender:TObject);
    procedure lvItemsSelectItem(Sender:TObject; Item:TListItem;
      Selected:Boolean);
    procedure lvItemsInsert(Sender:TObject; Item:TListItem);
    procedure acCloseExecute(Sender:TObject);
    procedure acUpdateExecute(Sender:TObject);
    procedure chkIgnoreEmptyClick(Sender:TObject);
    procedure acEditExecute(Sender:TObject);
    procedure acSyncExecute(Sender:TObject);
  private
    { Private declarations }
    FListViewInfo:TListViewInfo;
    FItems:ITranslationItems;
    procedure LoadItems;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure DoTranslate;
  public
    { Public declarations }
    class function Edit(const Items:ITranslationItems):boolean;
  end;

implementation
uses
  TntWindows, TntSysUtils, CommonUtils, WideIniFiles,
  ToolKeyCheckEditFrm, ToolKeyCheckConsts;

{$R *.DFM}
const
  cUpArrow = 4;
  cDnArrow = 5;

function ConvertCRLF(const S:WideString):WideString;
begin
  Result := Tnt_WideStringReplace(S, CRLF, '\r\n', [rfReplaceAll]);
end;

function GetAccelerator(const S:WideString):WideString;
begin
  Result := WideGetHotkey(S);
end;

function GetAccessKey(const S:WideString):WideString;
var
  i:integer;
  aShortCut:TShortCut;
  tmp:WideString;
begin
  Result := '';
    // sanity check
  if Pos(WideString('Ctrl'), S) +
    Pos(WideString('Shift'), S) + Pos(WideString('Alt'), S) +
    Pos(WideString('\t'), S) + Pos(WideString(#9), S) <= 0 then
    Exit;

  // trim off as much as possible
  tmp := S;
  i := Pos(WideChar(' '), tmp);
  while i > 0 do
  begin
    tmp := Copy(tmp, i + 1, MaxInt);
    i := Pos(WideChar(' '), tmp);
  end;
  i := Pos(WideString('\t'), tmp);
  while i > 0 do
  begin
    tmp := Copy(tmp, i + 2, MaxInt);
    i := Pos(WideString('\t'), tmp);
  end;

  i := Pos(WideChar(#9), tmp);
  while i > 0 do
  begin
    tmp := Copy(tmp, i + 1, MaxInt);
    i := Pos(WideChar(#9), tmp);
  end;

  // brute force (slow!)
  for i := 1 to Length(tmp) - 1 do // need at least 2 characters
  begin
    aShortCut := WideTextToShortCut(Copy(tmp, i, MaxInt));
    if aShortCut <> 0 then
    begin
      Result := WideShortCutToText(aShortCut);
      Exit;
    end;
  end;
  Result := '';
end;

{ TfrmToolKeyCheck }

class function TfrmToolKeyCheck.Edit(const Items:ITranslationItems):boolean;
var
  frm:TfrmToolKeyCheck;
begin
  frm := self.Create(Application);
  try
    frm.DoTranslate;
    frm.FItems := Items;
    frm.LoadSettings;
    frm.acUpdate.Execute;
    frm.ShowModal;
    frm.SaveSettings;
    Result := true;
  finally
    frm.Free;
  end;
end;

procedure TfrmToolKeyCheck.LoadItems;
var
  i:integer;
  li:TTntListItem;
  aAccess, aAccel:WideString;
begin
  WaitCursor;
  if FItems = nil then
    Exit;
  lvItems.Items.BeginUpdate;
  try
    lvItems.Items.Clear;
    for i := 0 to FItems.Count - 1 do
    begin
      aAccel := GetAccelerator(FItems[i].Translation);
      aAccess := GetAccessKey(FItems[i].Translation);
      if not chkIgnoreEmpty.Checked or (aAccel <> '') or (aAccess <> '') then
      begin
        li := lvItems.Items.Add;
        li.Caption := FItems[i].Original;
        li.SubItems.Add(FItems[i].Translation);
        li.SubItems.Add(aAccel);
        li.SubItems.Add(aAccess);
        li.Data := Pointer(FItems[i]);
      end;
    end;
    FListViewInfo.Column := nil;
    lvItemsColumnClick(lvItems, lvItems.Columns[2]);
  finally
    lvItems.Items.EndUpdate;
  end;
end;

procedure TfrmToolKeyCheck.lvItemsResize(Sender:TObject);
var
  i, W:integer;
begin
  W := lvItems.ClientWidth div lvItems.Columns.Count;
  for i := 0 to lvItems.Columns.Count - 1 do
    lvItems.Columns[i].Width := W;
end;

procedure TfrmToolKeyCheck.lvItemsEnter(Sender:TObject);
begin
  if (lvItems.Items.Count > 0) and (lvItems.Selected = nil) then
  begin
    lvItems.Selected := lvItems.Items[0];
    lvItems.Selected.Focused := true;
  end;
end;

function ListViewSort(lParam1, lParam2, lParamSort:Integer):Integer; stdcall;
var
  Item1:TTntListItem absolute lParam1;
  Item2:TTntListItem absolute lParam2;
  Info:TListVIewInfo absolute lParamSort;
  S1, S2:WIdeString;
begin
  if Info.Column.Index = 0 then
  begin
    S1 := Item1.Caption;
    S2 := Item2.Caption;
  end
  else
  begin
    S1 := Item1.SubItems[Info.Column.Index - 1];
    S2 := Item2.SubItems[Info.Column.Index - 1];
  end;
  Result := WideCompareText(S1, S2);
  if Result = 0 then
    Result := WideCompareStr(S1, S2);
  if Info.Descending then
    Result := -Result;
end;

procedure TfrmToolKeyCheck.lvItemsColumnClick(Sender:TObject;
  Column:TListColumn);
var
  i:integer;
begin
  if FListViewInfo.Column = Column then
    FListViewInfo.Descending := not FListViewInfo.Descending
  else
    FListViewInfo.Descending := false;
  FListViewInfo.Column := Column;
  lvItems.CustomSort(ListViewSort, integer(FListViewInfo));
  for i := 0 to lvItems.Columns.Count - 1 do
    lvItems.Columns[i].ImageIndex := -1;
  if FListViewInfo.Descending then
    Column.ImageIndex := cUpArrow
  else
    Column.ImageIndex := cDnArrow;
end;

procedure TfrmToolKeyCheck.TntFormCreate(Sender:TObject);
begin
  FListViewInfo := TListViewInfo.Create;
end;

procedure TfrmToolKeyCheck.TntFormDestroy(Sender:TObject);
begin
  FListViewInfo.Free;
end;

procedure TfrmToolKeyCheck.lvItemsSelectItem(Sender:TObject;
  Item:TListItem; Selected:Boolean);
var
  AItem:ITranslationItem;
begin
  if Assigned(Item) and Assigned(Item.Data) then
  begin
    AItem := ITranslationItem(Item.Data);
    TntStatusBar1.Panels[0].Text := WideFormat('"%s", "%s", "%s", "%s"',
      [AItem.Section, AItem.Name, AItem.Original, AItem.Translation]);
  end
  else
    TntStatusBar1.Panels[0].Text := '';
end;

procedure TfrmToolKeyCheck.lvItemsInsert(Sender:TObject; Item:TListItem);
begin
  Item.ImageIndex := -1;
  Item.StateIndex := -1;
end;

procedure TfrmToolKeyCheck.acCloseExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmToolKeyCheck.acUpdateExecute(Sender:TObject);
begin
  LoadItems;
end;

procedure TfrmToolKeyCheck.chkIgnoreEmptyClick(Sender:TObject);
begin
  acUpdate.Execute;
end;

procedure TfrmToolKeyCheck.LoadSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    chkIgnoreEmpty.Checked := ReadBool('Settings', 'IgnoreEmpty', chkIgnoreEmpty.Checked);
  finally
    Free;
  end;
end;

procedure TfrmToolKeyCheck.SaveSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(hInstance), '.ini')) do
  try
    WriteBool('Settings', 'IgnoreEmpty', chkIgnoreEmpty.Checked);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TfrmToolKeyCheck.acEditExecute(Sender:TObject);
var
  AItem:ITranslationItem;
  S:WideString;
begin
  if Assigned(lvItems.Selected) and Assigned(lvItems.Selected.Data) then
  begin
    AItem := ITranslationItem(lvItems.Selected.Data);
    S := AItem.Translation;
    if TfrmToolKeyCheckEdit.Edit(AItem.Original, S) and
      not WideSameText(AItem.Translation, S) then
    begin
      AItem.Translation := ConvertCRLF(trim(S));
      lvItems.Selected.SubItems[0] := ConvertCRLF(trim(S));
      lvItems.Selected.SubItems[1] := GetAccelerator(S);
      lvItems.Selected.SubItems[2] := GetAccessKey(S);
    end;
  end;
end;

procedure TfrmToolKeyCheck.acSyncExecute(Sender:TObject);
var
  AItem:ITranslationItem;
begin
  if lvItems.Selected <> nil then
    AItem := ITranslationItem(lvItems.Selected.Data);
  if AItem <> nil then
    GlobalAppServices.SelectedItem := AItem;
end;

procedure TfrmToolKeyCheck.DoTranslate;
begin
  Caption := Translate(SMainFormCaption);
  lvItems.Columns[0].Caption := Translate(SOriginal);
  lvItems.Columns[1].Caption := Translate(STranslation);
  lvItems.Columns[2].Caption := Translate(SAccelKey);
  lvItems.Columns[3].Caption := Translate(SAccessKey);
  chkIgnoreEmpty.Caption := Translate(SIgnoreEmpty);
  acUpdate.Caption := Translate(SUpdate);
  acEdit.Caption := Translate(SEdit);
  acClose.Caption := Translate(SClose);
  acSync.Caption := Translate(SSync);
end;

end.
