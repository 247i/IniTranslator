{@abstract(Edit form for ToolConsistency) }
{
  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net
    Korney San - kora att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: ToolConsistencyFrm.pas 250 2007-08-14 16:42:00Z peter3 $

unit ToolConsistencyFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, TntForms,
  Dialogs, TransIntf, TntWindows, TntClasses, TntMenus, StdCtrls, ComCtrls,
  TntStdCtrls, TntComCtrls, ActnList, Menus, TntActnList;

type
  TfrmToolConsistency = class(TTntForm)
    chkIgnoreAccelChar:TTntCheckBox;
    tvItems:TTntTreeView;
    btnClose:TTntButton;
    lblInfo:TTntLabel;
    btnUpdate:TTntButton;
    TntLabel1:TTntLabel;
    alMain:TTntActionList;
    acUpdate:TTntAction;
    acClose:TTntAction;
    acEdit:TTntAction;
    acUseThisTranslation:TTntAction;
    popItems:TTntPopupMenu;
    Usethistranslation1:TTntMenuItem;
    Edit1:TTntMenuItem;
    chkSynchronizeAccelChar:TTntCheckBox;
    acSync1:TTntMenuItem;
    acSync:TTntAction;
    N1:TTntMenuItem;
    procedure chkIgnoreAccelCharClick(Sender:TObject);
    procedure tvItemsChange(Sender:TObject; Node:TTreeNode);
    procedure tvItemsEditing(Sender:TObject; Node:TTreeNode;
      var AllowEdit:Boolean);
    procedure tvItemsEdited(Sender:TObject; Node:TTntTreeNode;
      var S:WideString);
    procedure acUseThisTranslationExecute(Sender:TObject);
    procedure acEditExecute(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
    procedure acUpdateExecute(Sender:TObject);
    procedure alMainUpdate(Action:TBasicAction; var Handled:Boolean);
    procedure acSyncExecute(Sender:TObject);
  private
    { Private declarations }
    Congratulations:WideString;
    FItems:ITranslationItems;
    FAppServices:IApplicationServices;
    FSelectedItem:ITranslationItem;
    procedure BuildList(IgnoreAccelChar:boolean);
    procedure LoadSettings;
    procedure SaveSettings;
    function AutoShortCut(Item:ITranslationItem; S:WideString):WideString;
  public
    { Public declarations }
    class function Execute(const ApplicationServices:IApplicationServices;
      const Items, Orphans:ITranslationItems;
      var SelectedItem:ITranslationItem):boolean;
  end;

implementation
uses
  ToolConsistencyConsts,
  WideIniFiles;

{$R *.dfm}

type
  TTranslationItems = class
  private
    FOriginalItems:TTntStrings;
    FIgnoreAccelChar:boolean;
    function GetItems(Index:integer):TTntStrings;
    function GetCount:integer;
    function GetName(Index:integer):WideString;
    function GetRealItem(Index, SubIndex:integer):ITranslationItem;
  public
    constructor Create(IgnoreAccelChar:boolean);
    destructor Destroy; override;
    procedure Clear;
    procedure Add(const AItem:ITranslationItem);
    property Items[Index:integer]:TTntStrings read GetItems;
    property Name[Index:integer]:WideString read GetName;
    property RealItem[Index, SubIndex:integer]:ITranslationItem read GetRealItem;
    property Count:integer read GetCount;
  end;

{ TTranslationItems }

procedure TTranslationItems.Add(const AItem:ITranslationItem);
var
  AOriginal, ATranslation:WideString;
  SL:TTntStringlist;
  i:integer;
begin
  if FIgnoreAccelChar then
  begin
    AOriginal := WideStripHotkey(AItem.Original);
    ATranslation := WideStripHotkey(AItem.Translation);
  end
  else
  begin
    AOriginal := AItem.Original;
    ATranslation := AItem.Translation;
  end;
  i := FOriginalItems.IndexOf(AOriginal);
  if i < 0 then
    i := FOriginalItems.Add(AOriginal);
  if FOriginalItems.Objects[i] = nil then
  begin
    SL := TTntStringlist.Create;
    SL.Sorted := true;
    FOriginalItems.Objects[i] := SL;
  end
  else
    SL := TTntStringlist(FOriginalItems.Objects[i]);
  SL.AddObject(ATranslation, TObject(Pointer(AItem)));
end;

procedure TTranslationItems.Clear;
var
  i:integer;
begin
  for i := 0 to FOriginalItems.Count - 1 do
    TTntStringlist(FOriginalItems.Objects[i]).Free;
  FOriginalItems.Clear;
end;

constructor TTranslationItems.Create(IgnoreAccelChar:boolean);
begin
  inherited Create;
  FOriginalItems := TTntStringlist.Create;
  TTntStringlist(FOriginalItems).Sorted := true;
  FIgnoreAccelChar := IgnoreAccelChar;
end;

destructor TTranslationItems.Destroy;
begin
  Clear;
  FreeAndNil(FOriginalItems);
  inherited;
end;

function TTranslationItems.GetCount:integer;
begin
  Result := FOriginalItems.Count;
end;

function TTranslationItems.GetItems(Index:integer):TTntStrings;
begin
  Result := TTntStrings(FOriginalItems.Objects[Index]);
end;

function TTranslationItems.GetName(Index:integer):WideString;
begin
  Result := FOriginalItems[Index];
end;

function TTranslationItems.GetRealItem(Index, SubIndex:integer):ITranslationItem;
begin
  Result := ITranslationItem(Pointer(TTntStrings(FOriginalItems.Objects[Index]).Objects[SubIndex]));
end;

{ TfrmToolConsistency }

function TfrmToolConsistency.AutoShortCut(Item:ITranslationItem; S:WideString):WideString;
var
  WHK:WideString;
  i:integer;
begin
  if (Item <> nil) then
  begin
    // Synchronize accelerator
    if chkSynchronizeAccelChar.Checked then
    begin
      WHK := WideUpperCase(WideGetHotkey(Item.Original));
      if WHK = '' then
        S := WideStripHotkey(S)
      else
      begin
        // Accelerator in original
        if WideGetHotkey(S) = '' then
        begin
          i := Pos(WHK, WideUpperCase(S));
          if i > 0 then // insert at same character as original
            S := Copy(S, 1, i - 1) + cHotkeyPrefix + Copy(S, i, MaxInt)
          else // insert at the same character position as original
          begin
            i := Pos(cHotKeyPrefix + WHK, WideUpperCase(Item.Original));
            if (i > 0) and (i <= Length(S)) then
              S := Copy(S, 1, i - 1) + cHotkeyPrefix + Copy(S, i, MaxInt)
            else // give up - insert at start
              S := cHotkeyPrefix + S;
          end;
        end;

      end;
    end;
    Item.Translation := S;
  end;
  Result := S;
end;

procedure TfrmToolConsistency.chkIgnoreAccelCharClick(Sender:TObject);
begin
  BuildList(chkIgnoreAccelChar.Checked);
end;

procedure TfrmToolConsistency.BuildList(IgnoreAccelChar:boolean);
var
  i, j:integer;
  N:TTntTreeNode;
  AItem:ITranslationItem;
  FTItems:TTranslationItems;
begin
  tvItems.Items.Clear;
  FTItems := TTranslationItems.Create(IgnoreAccelChar);
  try
    // first build a list of original items with translations as subitems
    // each original item only appears once and each subitem translation
    // only appear once (because the lists are sorted and we ignore duplicates)
    for i := 0 to FItems.Count - 1 do
      FTItems.Add(FItems[i]);
    // next, build a tree of all items that have more than 1 unique translation
    // since this indicates that the translations are not consistent for the specific original item
    for i := 0 to FTItems.Count - 1 do
      if FTItems.Items[i].Count > 1 then
      begin
        N := tvItems.Items.Add(nil, FTItems.Name[i]);
        for j := 0 to FTItems.Items[i].Count - 1 do
        begin
          AItem := FTItems.RealItem[i, j];
          tvItems.Items.AddChildObject(N, AItem.Translation, Pointer(AItem));
        end;
      end;
    if tvItems.Items.Count = 0 then
    begin
      // no items in tree -> translation is consistent
      tvItems.ShowRoot := false;
      tvItems.Items.Add(nil, Congratulations);
    end
    else
      tvItems.ShowRoot := true;
    tvItems.FullExpand;
    tvItems.Selected := tvItems.Items.GetFirstNode;
    tvItems.Selected.MakeVisible;
  finally
    FreeAndNil(FTItems);
  end;
end;

class function TfrmToolConsistency.Execute(const ApplicationServices:IApplicationServices; const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):boolean;
var
  frm:TfrmToolConsistency;
  FAppHandle:Cardinal;
begin
  FAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
  frm := self.Create(Application);
  try
    if ApplicationServices <> nil then
    begin
      frm.FAppServices := ApplicationServices;
      frm.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyFormCaption, SToolConsistencyFormCaption);
      frm.TntLabel1.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyLabel1, SToolConsistencyLabel1);
      frm.tvItems.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencytvItemsHint, SToolConsistencytvItemsHint);
      frm.btnClose.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencybtnClose, SToolConsistencybtnClose);
      frm.btnClose.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencybtnCloseHint, SToolConsistencybtnCloseHint);
      frm.btnUpdate.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencybtnUpdate, SToolConsistencybtnUpdate);
      frm.btnUpdate.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencybtnUpdateHint, SToolConsistencybtnUpdateHint);
      frm.chkIgnoreAccelChar.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencychkIgnoreAccelChar, SToolConsistencychkIgnoreAccelChar);
      frm.chkIgnoreAccelChar.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencychkIgnoreAccelCharHint, SToolConsistencychkIgnoreAccelCharHint);
      frm.chkSynchronizeAccelChar.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencySynchronize, SToolConsistencySynchronize);
      frm.chkSynchronizeAccelChar.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencySynchronizeHint, SToolConsistencySynchronizeHint);
      frm.Usethistranslation1.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyUsethistranslation1, SToolConsistencyUsethistranslation1);
      frm.Usethistranslation1.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyUsethistranslation1Hint, SToolConsistencyUsethistranslation1Hint);
      frm.Edit1.Caption := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyEdit1, SToolConsistencyEdit1);
      frm.Edit1.Hint := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyEdit1Hint, SToolConsistencyEdit1Hint);
      frm.Congratulations := ApplicationServices.Translate(SLocalizeSectionName, SToolConsistencyIsConsistent, SToolConsistencyIsConsistent);
    end
    else
      frm.Congratulations := SToolConsistencyIsConsistent;
    frm.FItems := Items;
    frm.FSelectedItem := SelectedItem;
    frm.LoadSettings;
    frm.acUpdate.Execute;
    frm.ShowModal;
    SelectedItem := frm.FSelectedItem;
    frm.SaveSettings;
    Result := true;
  finally
    frm.Free;
    Application.Handle := FAppHandle;
  end;
end;

procedure TfrmToolConsistency.LoadSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
  try
    chkIgnoreAccelChar.Checked := ReadBool('Settings', 'IgnoreAccelChar', chkIgnoreAccelChar.Checked);
    chkSynchronizeAccelChar.Checked := ReadBool('Settings', 'SyncAccelChar', chkSynchronizeAccelChar.Checked);
  finally
    Free;
  end;
end;

procedure TfrmToolConsistency.SaveSettings;
begin
  with TWideMemIniFile.Create(ChangeFileExt(GetModuleName(HInstance), '.ini')) do
  try
    WriteBool('Settings', 'IgnoreAccelChar', chkIgnoreAccelChar.Checked);
    WriteBool('Settings', 'SyncAccelChar', chkSynchronizeAccelChar.Checked);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TfrmToolConsistency.tvItemsChange(Sender:TObject;
  Node:TTreeNode);
begin
  if Assigned(Node) and Assigned(Node.Data) then
  begin
    FSelectedItem := ITranslationItem(Node.Data);
    lblInfo.Caption := WideFormat('(%s.%s)', [FSelectedItem.Section, FSelectedItem.Name]);
  end
  else
    lblInfo.Caption := '';

  alMain.UpdateAction(nil);
end;

procedure TfrmToolConsistency.tvItemsEditing(Sender:TObject;
  Node:TTreeNode; var AllowEdit:Boolean);
begin
  AllowEdit := Assigned(Node) and Assigned(Node.Data);
end;

procedure TfrmToolConsistency.tvItemsEdited(Sender:TObject;
  Node:TTntTreeNode; var S:WideString);
begin
  S := AutoShortCut(ITranslationItem(Node.Data), S);
end;

procedure TfrmToolConsistency.acUseThisTranslationExecute(Sender:TObject);
var
  N:TTntTreeNode;
  Item1, Item2:ITranslationItem;
begin
  if Assigned(tvItems.Selected) and Assigned(tvItems.Selected.Data) then
  begin
    N := tvItems.Selected;
    Item1 := ITranslationItem(tvItems.Selected.Data);

    N := N.getPrevSibling;
    while N <> nil do
    begin
      // Caption := 'N.getPrevSibling';
      Item2 := ITranslationItem(N.Data);
      Item2.Translation := AutoShortCut(Item2, Item1.Translation);
      Item2.Translated := Item2.Translation <> '';
      N.Text := Item2.Translation;
      N := N.getPrevSibling;
    end;

    N := tvItems.Selected;
    Item1 := ITranslationItem(tvItems.Selected.Data);
    N := N.getNextSibling;
    while N <> nil do
    begin
      // Caption := 'N.getNextSibling';
      Item2 := ITranslationItem(N.Data);
      Item2.Translation := AutoShortCut(Item2, Item1.Translation);
      Item2.Translated := Item2.Translation <> '';
      N.Text := Item2.Translation;
      N := N.getNextSibling;
    end;
  end;
end;

procedure TfrmToolConsistency.acEditExecute(Sender:TObject);
begin
  if Assigned(tvItems.Selected) and Assigned(tvItems.Selected.Data) then
    tvItems.Selected.EditText;
end;

procedure TfrmToolConsistency.acCloseExecute(Sender:TObject);
begin
  if tvItems.IsEditing then
    tvItems.Selected.EndEdit(true)
  else
    Close;
end;

procedure TfrmToolConsistency.acUpdateExecute(Sender:TObject);
begin
  BuildList(chkIgnoreAccelChar.Checked);
end;

procedure TfrmToolConsistency.alMainUpdate(Action:TBasicAction;
  var Handled:Boolean);
begin
  acUseThisTranslation.Enabled := Assigned(tvItems.Selected) and Assigned(tvItems.Selected.Data);
  acEdit.Enabled := acUseThisTranslation.Enabled;
end;

procedure TfrmToolConsistency.acSyncExecute(Sender:TObject);
begin
  if Assigned(tvItems.Selected) and Assigned(tvItems.Selected.Data) then
    FAppServices.SelectedItem := ITranslationItem(tvItems.Selected.Data);
end;

end.
