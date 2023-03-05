{@abstract(Orphaned Items) }
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

// $Id: OrphansFrm.pas 249 2007-08-14 16:29:55Z peter3 $

unit OrphansFrm;

{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Menus,
  ComCtrls, StdCtrls, ExtCtrls,
  ActnList,
  BaseForm, TranslateFile, TransIntf, WideIniFiles,
  TntClasses, TntComCtrls, TntStdCtrls, TntActnList, TntMenus, TntExtCtrls, TntDialogs,
  TB2Item, TBX, SpTBXItem, TB2Dock, TB2Toolbar;

type
  TfrmOrphans = class(TfrmBase)
    lvOrphaned:TTntListView;
    StatusBar1:TTntStatusBar;
    Panel1:TTntPanel;
    Panel2:TTntPanel;
    lblSection:TTntLabel;
    alOrphans:TTntActionList;
    acCopy:TTntAction;
    acSave:TTntAction;
    acMerge:TTntAction;
    acClear:TTntAction;
    acClose:TTntAction;
    acRemove:TTntAction;
    acPaste:TTntAction;
    acFindItem:TTntAction;
    acFindNext:TTntAction;
    TopDock:TSpTBXDock;
    tbMenu:TSpTBXToolbar;
    Actions1:TSpTBXSubmenuItem;
    SpTBXItem10:TSpTBXItem;
    SpTBXItem12:TSpTBXItem;
    SpTBXItem13:TSpTBXItem;
    SpTBXItem14:TSpTBXItem;
    SpTBXItem15:TSpTBXItem;
    SpTBXItem16:TSpTBXItem;
    SpTBXItem17:TSpTBXItem;
    SpTBXItem18:TSpTBXItem;
    SpTBXItem19:TSpTBXItem;
    SpTBXSeparatorItem3:TSpTBXSeparatorItem;
    SpTBXSeparatorItem4:TSpTBXSeparatorItem;
    SpTBXSeparatorItem5:TSpTBXSeparatorItem;
    popList:TSpTBXPopupMenu;
    SpTBXItem3:TSpTBXItem;
    SpTBXItem5:TSpTBXItem;
    SpTBXItem6:TSpTBXItem;
    SpTBXItem7:TSpTBXItem;
    SpTBXItem8:TSpTBXItem;
    SpTBXSeparatorItem1:TSpTBXSeparatorItem;
    SpTBXSeparatorItem2:TSpTBXSeparatorItem;
    acAdd:TTntAction;
    SpTBXItem1:TSpTBXItem;
    SpTBXItem2:TSpTBXItem;
    procedure lvOrphanedResize(Sender:TObject);
    procedure acCopyExecute(Sender:TObject);
    procedure alOrphansUpdate(Action:TBasicAction; var Handled:Boolean);
    procedure lvOrphanedChange(Sender:TObject; Item:TListItem;
      Change:TItemChange);
    procedure FormShow(Sender:TObject);
    procedure acMergeExecute(Sender:TObject);
    procedure lvOrphanedData(Sender:TObject; Item:TListItem);
    procedure acSaveExecute(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
    procedure acClearExecute(Sender:TObject);
    procedure acRemoveExecute(Sender:TObject);
    procedure acPasteExecute(Sender:TObject);
    procedure acFindItemExecute(Sender:TObject);
    procedure acFindNextExecute(Sender:TObject);
    procedure acAddExecute(Sender:TObject);
  private
    { Private declarations }
    FAppServices:IApplicationServices;
    FOnMerge:TNotifyEvent;
    procedure SaveToFile(const FileName:WideString);
    procedure ShowError(Count:integer);
    function SelectedItem:ITranslationItem;
    function SelectedIndex:integer;
  public
    { Public declarations }
    class function Edit(const ApplicationServices:IApplicationServices; CanMerge:boolean; OnMerge:TNotifyEvent):boolean;
  end;

implementation
uses
  AppUtils, CommonUtils, AppConsts, TntClipbrd, Dialogs;

{$R *.dfm}

class function TfrmOrphans.Edit(const ApplicationServices:IApplicationServices; CanMerge:boolean; OnMerge:TNotifyEvent):boolean;
var
  frmOrphans:TfrmOrphans;
begin
  frmOrphans := self.Create(Application);
  try
    frmOrphans.FAppServices := ApplicationServices;
    frmOrphans.FOnMerge := OnMerge;
    frmOrphans.lvOrphaned.Items.Count := ApplicationServices.Orphans.Count;
    frmOrphans.acSave.Enabled := ApplicationServices.Orphans.Count > 0;
    frmOrphans.acMerge.Enabled := Assigned(OnMerge) and CanMerge and (ApplicationServices.Orphans.Count > 0);
    frmOrphans.acAdd.Enabled := frmOrphans.acMerge.Enabled;
    Result := frmOrphans.ShowModal = mrOK;
  finally
    frmOrphans.Free;
  end;
end;

procedure TfrmOrphans.lvOrphanedResize(Sender:TObject);
begin
  lvOrphaned.Columns[0].Width := lvOrphaned.ClientWidth div 2;
  lvOrphaned.Columns[1].Width := lvOrphaned.ClientWidth - lvOrphaned.Columns[0].Width;
end;

procedure TfrmOrphans.acCopyExecute(Sender:TObject);
var
  S:WideString;
begin
  with lvOrphaned.Selected do
  begin
    if (Index >= 0) and (Index < FAppServices.Orphans.Count) then
    begin
      S := FAppServices.Orphans.Items[Index].Translation;
      if S = '' then
        S := FAppServices.Orphans.Items[Index].Original;
      if S <> '' then
        TntClipboard.AsWideText := S;
    end;
  end;
end;

procedure TfrmOrphans.alOrphansUpdate(Action:TBasicAction;
  var Handled:Boolean);
var
  AItem:ITranslationItem;
begin
  acCopy.Enabled := (lvOrphaned.Selected <> nil)
    and ((lvOrphaned.Selected.Caption <> '') or (lvOrphaned.Selected.SubItems[0] <> ''));
  AItem := SelectedItem;
  acClear.Enabled := FAppServices.Orphans.Count > 0;
  acRemove.Enabled := Assigned(AItem);
  acPaste.Enabled := Assigned(AItem) and (AItem.Translation <> '');
  acFindItem.Enabled := Assigned(AItem) and (AItem.Original <> '');
  acFindNext.Enabled := acFindItem.Enabled;
end;

procedure TfrmOrphans.lvOrphanedChange(Sender:TObject; Item:TListItem;
  Change:TItemChange);
begin
  if (SelectedItem <> nil) then
    lblSection.Caption := '[' + SelectedItem.Section + '] ' + SelectedItem.Name
  else
    lblSection.Caption := '[]';
end;

procedure TfrmOrphans.FormShow(Sender:TObject);
begin
  if (lvOrphaned.Selected = nil) and (lvOrphaned.Items.Count > 0) then
    lvOrphaned.Selected := lvOrphaned.Items[0];
  if lvOrphaned.Selected <> nil then
    lvOrphaned.Selected.Focused := true;
end;

procedure TfrmOrphans.SaveToFile(const FileName:WideString);
var
  i, iError:integer;
begin
  with TWideMemIniFile.Create(Filename) do
  try
    iError := 0;
    for i := 0 to FAppServices.Orphans.Count - 1 do
      with FAppServices.Orphans.Items[i] do
        if Original <> '' then
          WriteString(Section, Original, Translation)
        else
          Inc(iError);
    UpdateFile;
    if iError > 0 then
      ShowError(iError);
  finally
    Free;
  end;
end;

procedure TfrmOrphans.acMergeExecute(Sender:TObject);
begin
  if Assigned(FOnMerge) then
  begin
    FOnMerge(self);
    lvOrphaned.Items.Count := FAppServices.Orphans.Count;
    lvOrphaned.Invalidate;
  end;
  acMerge.Enabled := (FAppServices.Orphans.Count > 0);
  acSave.Enabled := acMerge.Enabled;
  lvOrphanedChange(nil, nil, ctState);
end;

procedure TfrmOrphans.lvOrphanedData(Sender:TObject; Item:TListItem);
begin
  if (Item <> nil) and (Item.Index >= 0) and (Item.Index < FAppServices.Orphans.Count) then
  begin
    TTntListItem(Item).Caption := FAppServices.Orphans.Items[Item.Index].Original;
    TTntListItem(Item).SubItems.Add(FAppServices.Orphans.Items[Item.Index].Translation);
  end;
end;

procedure TfrmOrphans.acSaveExecute(Sender:TObject);
begin
  with TTntSaveDialog.Create(nil) do
  try
    Options := Options + [ofOverwritePrompt];
    Filter := SAllFileFilter;
    InitialDir := '.';
    if Execute then
      SaveToFile(Filename);
  finally
    Free;
  end;
end;

procedure TfrmOrphans.ShowError(Count:integer);
begin
  ErrMsg(WideFormat(SFmtSaveItemsNoName, [Count]), SErrorCaption);
end;

procedure TfrmOrphans.acCloseExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmOrphans.acClearExecute(Sender:TObject);
begin
  lvOrphaned.Items.Count := 0;
  FAppServices.Orphans.Clear;
  lvOrphaned.Invalidate;
end;

procedure TfrmOrphans.acRemoveExecute(Sender:TObject);
var
  i:integer;
begin
  i := FAppServices.Orphans.IndexOf(SelectedItem);
  if i >= 0 then
    FAppServices.Orphans.Delete(i);
  lvOrphaned.Items.Count := FAppServices.Orphans.Count;
  lvOrphaned.ItemIndex := i;
  lvOrphaned.Invalidate;
end;

procedure TfrmOrphans.acPasteExecute(Sender:TObject);
begin
  if (SelectedItem <> nil) and (FAppServices.SelectedItem <> nil) then
    FAppServices.SelectedItem.Translation := SelectedItem.Translation;
end;

procedure TfrmOrphans.acAddExecute(Sender:TObject);
var
  i:integer;
begin
  if (SelectedItem <> nil) then
  begin
    FAppServices.BeginUpdate;
    lvOrphaned.Items.BeginUpdate;
    try
      i := SelectedIndex;
      FAppServices.Items.Add(SelectedItem);
      FAppServices.Orphans.Delete(i);
      lvOrphaned.Items.Count := FAppServices.Orphans.Count;
      lvOrphaned.Invalidate;
    finally
      FAppServices.EndUpdate;
      lvOrphaned.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmOrphans.acFindItemExecute(Sender:TObject);
var
  i:integer;
  AItem:ITranslationItem;
begin
  if SelectedItem <> nil then
  begin
    AItem := SelectedItem;
    for i := 0 to FAppServices.Items.Count - 1 do
      if WideSameText(FAppServices.Items[i].Original, AItem.Original) then
      begin
        FAppServices.SelectedItem := FAppServices.Items[i];
        Exit;
      end;

    InfoMsg(WideFormat(_(Application.MainForm.ClassName, SFmtTextNotFound), [AItem.Original]),
      _(Application.MainForm.ClassName, SSearchFailCaption));
  end;
end;

procedure TfrmOrphans.acFindNextExecute(Sender:TObject);
var
  i, j:integer;
  AItem:ITranslationItem;
begin
  if SelectedItem <> nil then
  begin
    if FAppServices.SelectedItem <> nil then
    begin
      AItem := SelectedItem;
      j := FAppServices.Items.IndexOf(FAppServices.SelectedItem);
      if j < 0 then
        Exit;
      for i := j + 1 to FAppServices.Items.Count - 1 do
        if WideSameText(FAppServices.Items[i].Original, AItem.Original) then
        begin
          FAppServices.SelectedItem := FAppServices.Items[i];
          Exit;
        end;
      InfoMsg(WideFormat(_(Application.MainForm.ClassName, SFmtTextNotFound), [AItem.Original]),
        _(Application.MainForm.ClassName, SSearchFailCaption));
    end
    else
      acFindItem.Execute;
  end;
end;

function TfrmOrphans.SelectedItem:ITranslationItem;
begin
  if lvOrphaned.Selected <> nil then
    Result := FAppServices.Orphans[lvOrphaned.Selected.Index]
  else
    Result := nil;
end;

function TfrmOrphans.SelectedIndex:integer;
begin
  if lvOrphaned.Selected <> nil then
    Result := lvOrphaned.Selected.Index
  else
    Result := -1;
end;




end.
