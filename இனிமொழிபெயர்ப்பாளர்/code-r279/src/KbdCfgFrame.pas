{@abstract(Keyboard configuration frame) }
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

// $Id: KbdCfgFrame.pas 249 2007-08-14 16:29:55Z peter3 $
unit KbdCfgFrame;

{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, ComCtrls, ShortCutEdit,
  TntForms, TntClasses, TntControls, TntActnList, TntStdCtrls, TntComCtrls;

type
  TFrmKbdCfg = class(TTntFrame)
    lbCategories:TTntListBox;
    Label1:TTntLabel;
    Label2:TTntLabel;
    lblNewShortCut:TTntLabel;
    Label4:TTntLabel;
    lbCurrentShortCuts:TTntListBox;
    btnAdd:TTntButton;
    btnRemove:TTntButton;
    lblAssignedTo:TTntLabel;
    btnReset:TTntButton;
    btnClose:TTntButton;
    alMain:TTntActionList;
    acAdd:TTntAction;
    acRemove:TTntAction;
    lblAssignedTo2:TTntLabel;
    lblCommand:TTntLabel;
    bvTop:TBevel;
    lblShortcut:TTntLabel;
    bvMiddle:TBevel;
    lblDescription:TTntLabel;
    lblBottom:TTntLabel;
    bvBottom:TBevel;
    acReset:TTntAction;
    acClose:TTntAction;
    lvCommands:TTntListView;
    procedure acAddExecute(Sender:TObject);
    procedure acRemoveExecute(Sender:TObject);
    procedure alMainUpdate(Action:TBasicAction; var Handled:Boolean);
    procedure btnCloseClick(Sender:TObject);
    procedure lbCategoriesClick(Sender:TObject);
    procedure acResetExecute(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
    procedure lvCommandsSelectItem(Sender:TObject; Item:TListItem;
      Selected:Boolean);
    procedure lvCommandsEnter(Sender:TObject);
    procedure lvCommandsChange(Sender:TObject; Item:TListItem;
      Change:TItemChange);
    procedure lbCategoriesEnter(Sender:TObject);
    procedure edShortCutChange(Sender:TObject);
  private
    { Private declarations }
    CatList:TTntStringlist;
    edShortCut:TShortCutEdit;
    FActionList:TTntActionList;
    FOnClose:TNotifyEvent;
    FModified:boolean;
    FTempStoreFilename:WideString;
    function GetCurrentAction:TTntAction;
    function GetShortCutAssignee(ShortCut:TShortCut):TTntAction;
    procedure SetTempStoreFilename(const Value:WideString);
    procedure CheckTempName;
    procedure ClearCatList;
    function GetTempStoreFilename:WideString;
    procedure CopyToCommands(S:TTntStrings);
    function DoTranslate(const S:WideString):WideString;
  public
    { Public declarations }
    procedure EditShortCuts(AActionList:TTntActionList);
    constructor Create(AOwner:TComponent); override;

    destructor Destroy; override;
    procedure AdjustControls;
    property TempStoreFilename:WideString read GetTempStoreFilename write SetTempStoreFilename;
    property OnClose:TNotifyEvent read FOnClose write FOnClose;
    property Modified:boolean read FModified;
  end;

const
  ACTION_HIDDEN_TAG = -1;

procedure SaveActionShortCutsToFile(AL:TTntActionList; Filename:WideString);
procedure LoadActionShortCutsFromFile(AL:TTntActionList; Filename:WideString);

implementation
uses
  Menus, // for ShortCutToKey
  AppConsts, AppUtils, CommonUtils, MsgTranslate,
  TntWindows, TntMenus, TntSysUtils, TntWideStrUtils;

{$R *.dfm}

// format: Action.Name;Action.ShortCut;Action.SecondaryShortCuts[0]#27Action.SecondaryShortCuts[1]#27...

procedure SaveActionShortCutsToFile(AL:TTntActionList; Filename:WideString);
var
  i:integer;
  A:TTntAction;
  S:TTntStringlist;
begin
  if Filename = '' then
    Filename := GetAppStoragePath + 'translator.alf';
  S := TTntStringlist.Create;
  try
    for i := 0 to AL.ActionCount - 1 do
    begin
      A := TTntAction(AL[i]);
      if (A.Tag <> ACTION_HIDDEN_TAG) and ((A.ShortCut <> 0) or (A.SecondaryShortCuts.Count > 0)) then
        S.Add(WideFormat('%s;%s;%s', [A.Name, MyShortCutToText(A.ShortCut), Tnt_WideStringReplace(A.SecondaryShortCuts.Text, #13#10, #27, [rfReplaceAll])]));
    end;
    S.SaveToFile(Filename);
  finally
    S.Free;
  end;
end;

// TTntActionList.FindComponent doesn't work (FComponents = nil)...

function FindAction(AL:TTntActionList; const AName:WideString):TTntAction;
var
  i:integer;
begin
  for i := 0 to AL.ActionCount - 1 do
    if AnsiSameText(TTntAction(AL.Actions[i]).Name, AName) then
    begin
      Result := TTntAction(AL.Actions[i]);
      Exit;
    end;
  Result := nil;
end;

procedure LoadActionShortCutsFromFile(AL:TTntActionList; Filename:WideString);
var
  i, j:integer;
  A:TTntAction;
  S:TTntStringlist;
  ActionName:WideString;
begin
  if Filename = '' then
    Filename := GetAppStoragePath + 'translator.alf';
  if not WideFileExists(Filename) then
    Exit;
  S := TTntStringlist.Create;
  try
    S.LoadFromFile(Filename);
    for i := 0 to S.Count - 1 do
    begin
      j := Pos(';', S[i]);
      ActionName := Copy(S[i], 1, j - 1);

      A := FindAction(AL, ActionName);
      if A <> nil then
      begin
        S[i] := Copy(S[i], j + 1, MaxInt);
        j := Pos(';', S[i]);
        A.ShortCut := WideTextToShortCut(Copy(S[i], 1, j - 1));
        S[i] := Copy(S[i], j + 1, MaxInt);
        A.SecondaryShortCuts.Text := Tnt_WideStringReplace(S[i], #27, #13#10, [rfReplaceAll]);
      end;
    end;
  finally
    S.Free;
  end;
end;

procedure TFrmKbdCfg.acAddExecute(Sender:TObject);
var
  A:TTntAction;
  S:WideString;
begin
  if edShortCut.ShortCut = 0 then
    Exit;
  A := GetCurrentAction;
  if A <> nil then
  begin
    // assign a default shortcut first of all
    if (A.ShortCut = 0) then
    begin
      A.ShortCut := edShortCut.ShortCut;
      S := MyShortCutToText(edShortCut.ShortCut);
      if lbCurrentShortCuts.Items.IndexOf(S) < 0 then
        lbCurrentShortCuts.Items.Insert(0, S);
      FModified := true;
    end
    else // add to secondary shortcuts instead
    begin
      S := MyShortCutToText(edShortCut.ShortCut);
      if (S <> '') and (A.SecondaryShortCuts.IndexOf(S) < 0) then
      begin
        A.SecondaryShortCuts.Add(S);
        lbCurrentShortCuts.Items.Add(S);
        FModified := true;
      end;
    end;
  end;
end;

procedure TFrmKbdCfg.acRemoveExecute(Sender:TObject);
var
  A:TTntAction;
  S:TShortCut;
  Index:integer;
begin
  A := GetCurrentAction;
  if A = nil then
    Exit;
  with lbCurrentShortCuts do
  begin
    // check if the shortcut to delete is the main shortcut, delete if so
    S := WideTextToShortCut(Items[ItemIndex]);
    if A.ShortCut = S then
      A.ShortCut := 0;
    Index := A.SecondaryShortCuts.IndexOfShortCut(S);
    if Index > -1 then
      A.SecondaryShortCuts.Delete(Index);
    Items.Delete(ItemIndex);
    // make sure the action has a default shortcut (if any available)
    if Items.Count > 0 then
      A.ShortCut := WideTextToShortCut(Items[0]);
  end;
  FModified := true;
end;

function IsValidKey(AKey:Word; AShift:TShiftState):boolean;
begin
  Result := (AKey in [VK_F1..VK_F12]) or not (AKey in [0, VK_CONTROL, VK_MENU, VK_SHIFT]);
end;

procedure TFrmKbdCfg.alMainUpdate(Action:TBasicAction; var Handled:Boolean);
var
  AKey:word;
  AShift:TShiftState;
begin
  // make sure shortcuts have at least Ctrl and Alt along with Shift or is a function key (F1..F12)
  ShortCutToKey(edShortCut.ShortCut, AKey, AShift);
  acAdd.Enabled := IsValidKey(AKey, AShift) and (lvCommands.Selected <> nil);
  acRemove.Enabled := lbCurrentShortCuts.ItemIndex > -1;
  acReset.Enabled := FModified;
  edShortCut.Enabled := (lvCommands.Selected <> nil);
end;

procedure TFrmKbdCfg.btnCloseClick(Sender:TObject);
begin
  if Assigned(FOnClose) then
    FOnClose(self);
end;

constructor TFrmKbdCfg.Create(AOwner:TComponent);
begin
  inherited;
  CatList := TTntStringlist.Create;
  CatList.Sorted := true;
  edShortCut := TShortCutEdit.Create(self);
  edShortCut.Parent := Self;
  edShortCut.Left := 192;
  edShortCut.Top := 208;
  edShortCut.Width := 177;
  edShortCut.BevelInner := bvNone;
  edShortCut.BevelKind := bkFlat;
  edShortCut.BevelOuter := bvRaised;
  edShortCut.BorderStyle := bsNone;
  edShortCut.TabOrder := 4;
  edShortCut.OnChange := edShortCutChange;
  lblNewShortCut.FocusControl := edShortCut;
end;

destructor TFrmKbdCfg.Destroy;
begin
  ClearCatList;
  CatList.Free;
  inherited;
end;

procedure TFrmKbdCfg.EditShortCuts(AActionList:TTntActionList);
var
  i, j:integer;
  S:WideString;
  A:TTntAction;
  ActList:TTntStringlist;
begin
  FActionList := AActionList;
  if FActionList = nil then
    Exit;
  edShortCut.ShortCut := 0;
  SaveActionShortCutsToFile(FActionList, TempStoreFilename);
  ClearCatList;
  lbCategories.Items.Clear;
  lbCurrentShortCuts.Items.Clear;
  lvCommands.Items.Clear;
  lvCommands.SmallImages := AActionList.Images;

  for i := 0 to FActionList.ActionCount - 1 do
  begin
    A := TTntAction(FActionList.Actions[i]);
    if A.Tag = ACTION_HIDDEN_TAG then
      Continue;
    S := StrDefault(A.Category, SNoCategory);
    S := DoTranslate(S);
    j := CatList.Add(S);
    if CatList.Objects[j] = nil then
    begin
      ActList := TTntStringlist.Create;
      ActList.Sorted := true;
      CatList.Objects[j] := ActList;
    end
    else
      ActList := TTntStringlist(CatList.Objects[j]);
    S := DoTranslate(A.Caption);
    ActList.AddObject(S, A);
  end;
  lbCategories.Items := CatList;
  FModified := false;
end;

function TFrmKbdCfg.GetCurrentAction:TTntAction;
begin
  Result := nil;
  with lvCommands do
  begin
    if Selected = nil then
      Exit;
    Result := TTntAction(Selected.Data);
  end;
end;

function TFrmKbdCfg.GetShortCutAssignee(ShortCut:TShortCut):TTntAction;
var
  i:integer;
  S:WideString;
  A:TTntAction;
begin
  Result := nil;
  if (ShortCut = 0) or (FActionList = nil) then
    Exit;
  S := MyShortCutToText(ShortCut);
  for i := 0 to FActionList.ActionCount - 1 do
  begin
    A := TTntAction(FActionList.Actions[i]);
    if (A.ShortCut = ShortCut) or
      (A.SecondaryShortCuts.IndexOf(S) > -1) then
    begin
      Result := A;
      Exit;
    end;
  end;
end;

procedure TFrmKbdCfg.CopyToCommands(S:TTntStrings);
var
  i:integer;
begin
  lvCommands.Items.Clear;
  for i := 0 to S.Count - 1 do
    with lvCommands.Items.Add do
    begin
      Caption := S[i];
      ImageIndex := TTntAction(S.Objects[i]).ImageIndex;
      Data := TTntAction(S.Objects[i]);
    end;
end;

procedure TFrmKbdCfg.lbCategoriesClick(Sender:TObject);
var
  i:integer;
begin
  i := lbCategories.ItemIndex;
  if i < 0 then
    lbCategories.ItemIndex := 0;
  if i < 0 then
    Exit;
  CopyToCommands(TTntStringlist(lbCategories.Items.Objects[i]));
end;

procedure TFrmKbdCfg.acResetExecute(Sender:TObject);
begin
  LoadActionShortCutsFromFile(FActionList, TempStoreFilename);
  EditShortCuts(FActionList);
end;

procedure TFrmKbdCfg.acCloseExecute(Sender:TObject);
begin
  DeleteFile(TempStoreFilename);
  if Assigned(FOnClose) then
    FOnClose(self);
end;

procedure TFrmKbdCfg.SetTempStoreFilename(const Value:WideString);
begin
  FTempStoreFilename := Value;
  CheckTempName;
end;

procedure TFrmKbdCfg.CheckTempName;
var
  bufFile:array[0..MAX_PATH] of AnsiChar;
  nSize:Cardinal;
begin
  if FTempStoreFilename = '' then
  begin
    nSize := sizeof(bufFile);
    GetTempPath(nSize, bufFile);
    if GetTempFileName(bufFile, 'CKB', 0, bufFile) <> 0 then
      FTempStoreFilename := bufFile;
  end;
end;

function TFrmKbdCfg.GetTempStoreFilename:WideString;
begin
  CheckTempName;
  Result := FTempStoreFilename;
end;

procedure TFrmKbdCfg.lvCommandsSelectItem(Sender:TObject; Item:TListItem;
  Selected:Boolean);
var
  A:TTntAction;
  S:WideString;
  i:integer;
begin
  if not Selected then
    Exit;
  lbCurrentShortCuts.Items.Clear;
  A := GetCurrentAction;
  if A <> nil then
  begin
    S := MyShortCutToText(A.ShortCut);
    if (S <> '') then
    begin
      if lbCurrentShortCuts.Items.IndexOf(S) < 0 then
        lbCurrentShortCuts.Items.Add(S);
      i := A.SecondaryShortCuts.IndexOf(S);
      while i >= 0 do
      begin
        A.SecondaryShortCuts.Delete(i);
        i := A.SecondaryShortCuts.IndexOf(S);
      end;
      lbCurrentShortCuts.Items.AnsiStrings.AddStrings(A.SecondaryShortCuts);
    end;
    S := DoTranslate(A.Hint);
    lblDescription.Caption := WideGetLongHint(S);
  end;
end;

procedure TFrmKbdCfg.lvCommandsEnter(Sender:TObject);
begin
  if (lvCommands.Selected = nil) and (lvCommands.Items.Count > 0) then
  begin
    lvCommands.Items[0].Selected := true;
    lvCommands.Items[0].Focused := true;
  end;
end;

function TFrmKbdCfg.DoTranslate(const S:WideString):WideString;
begin
  Result := _(Application.MainForm.ClassName, S);
end;

procedure TFrmKbdCfg.ClearCatList;
var
  i:integer;
begin
  for i := 0 to CatList.Count - 1 do
    TObject(CatList.Objects[i]).Free;
  CatList.Clear;
end;

procedure TFrmKbdCfg.lvCommandsChange(Sender:TObject; Item:TListItem;
  Change:TItemChange);
begin
  edShortCut.ShortCut := 0;
end;

procedure TFrmKbdCfg.AdjustControls;
begin
  bvTop.Left := lblCommand.Left + lblCommand.Width + 7;
  bvTop.Width := ClientWidth - bvTop.Left - 8;
  bvMiddle.Left := lblShortCut.Left + lblShortCut.Width + 7;
  bvMiddle.Width := ClientWidth - bvMiddle.Left - 8;
  bvBottom.Left := lblBottom.Left + lblBottom.Width + 7;
  bvBottom.Width := ClientWidth - bvBottom.Left - 8;
end;

type
  TAccessListBox = class(TListBox);

procedure TFrmKbdCfg.lbCategoriesEnter(Sender:TObject);
begin
  if (lbCategories.ItemIndex < 0) then
  begin
    lbCategories.ItemIndex := 0;
    TAccessListBox(lbCategories).Click;
  end;
end;

procedure TFrmKbdCfg.edShortCutChange(Sender:TObject);
var
  A:TTntAction;
begin
  if edShortCut.ShortCut = 0 then
  begin
    lblAssignedTo.Caption := '';
    lblAssignedTo2.Caption := '';
  end
  else
  begin
    A := GetShortCutAssignee(edShortCut.ShortCut);
    lblAssignedTo.Caption := DoTranslate(SAssignedTo);
    if A <> nil then
      lblAssignedTo2.Caption := DoTranslate(A.Caption)
    else
      lblAssignedTo2.Caption := DoTranslate(SNotAssigned);
  end;
end;

end.
