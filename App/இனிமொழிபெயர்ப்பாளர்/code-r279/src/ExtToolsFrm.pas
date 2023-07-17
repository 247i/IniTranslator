{@abstract(External Tools dialog) }
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

// $Id: ExtToolsFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit ExtToolsFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ActnList, ImgList,
  Menus,
  BaseForm, AppOptions, ShortCutEdit,
  TntMenus, TntButtons, TntStdCtrls, TntDialogs, TB2Item, TntActnList,
  TBX, TntExtCtrls, SpTBXItem;

type
  TTestToolItemClickEvent = procedure(Sender:TObject; ToolItem:TToolItem) of object;
  TfrmTools = class(TfrmBase)
    Label1:TTntLabel;
    lbContents:TTntListBox;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    btnAdd:TTntButton;
    btnDelete:TTntButton;
    btnUp:TTntButton;
    btnDown:TTntButton;
    odCommand:TTntOpenDialog;
    popArguments:TSpTBXPopupMenu;
    OriginalLine1:TSpTBXItem;
    OriginalText1:TSpTBXItem;
    OriginalPath1:TSpTBXItem;
    OriginalDirectory1:TSpTBXItem;
    OriginalName1:TSpTBXItem;
    OriginalExtension1:TSpTBXItem;
    N1:TSpTBXSeparatorItem;
    ranslationLine1:TSpTBXItem;
    ranslationText1:TSpTBXItem;
    ranslationPath1:TSpTBXItem;
    ranslationDirectory1:TSpTBXItem;
    ranslationName1:TSpTBXItem;
    ranslationExtension1:TSpTBXItem;
    N2:TSpTBXSeparatorItem;
    DictionaryPath1:TSpTBXItem;
    DictionaryDirectory1:TSpTBXItem;
    DictionaryName1:TSpTBXItem;
    DictionaryExtension1:TSpTBXItem;
    popInitialDir:TSpTBXPopupMenu;
    OriginalPath2:TSpTBXItem;
    ranslationPath2:TSpTBXItem;
    DictionaryPath2:TSpTBXItem;
    ApplicationPath1:TSpTBXItem;
    TBXSeparatorItem1:TSpTBXSeparatorItem;
    TBXItem1:TSpTBXItem;
    TBXItem2:TSpTBXItem;
    TBXSeparatorItem2:TSpTBXSeparatorItem;
    TBXItem3:TSpTBXItem;
    TBXItem4:TSpTBXItem;
    pnlEditTool:TTntPanel;
    Label2:TTntLabel;
    Label3:TTntLabel;
    Label4:TTntLabel;
    Label5:TTntLabel;
    edTitle:TTntEdit;
    edCommand:TTntEdit;
    edArguments:TTntEdit;
    edInitialDir:TTntEdit;
    btnCommand:TTntButton;
    btnArguments:TTntBitBtn;
    btnInitDir:TTntBitBtn;
    chkPrompt:TTntCheckBox;
    chkWait:TTntCheckBox;
    chkShell:TTntCheckBox;
    btnTest:TTntButton;
    TBItem1:TSpTBXItem;
    lblShortCut:TTntLabel;
    btnClear:TTntButton;
    alTools:TTntActionList;
    acAdd:TTntAction;
    acDelete:TTntAction;
    acMoveUp:TTntAction;
    acMoveDown:TTntAction;
    acCommand:TTntAction;
    acClear:TTntAction;
    acUseShellexecute:TTntAction;
    acPrompt:TTntAction;
    acWait:TTntAction;
    acTest:TTntAction;
    acArgs:TTntAction;
    acDir:TTntAction;
    ilTools:TImageList;
    popContents:TSpTBXPopupMenu;
    TBXItem5:TSpTBXItem;
    TBXItem6:TSpTBXItem;
    TBXSeparatorItem3:TSpTBXSeparatorItem;
    TBXItem7:TSpTBXItem;
    TBXItem8:TSpTBXItem;
    Bevel1:TBevel;
    procedure ArgumentsClick(Sender:TObject);
    procedure InitialDirClick(Sender:TObject);
    procedure lbContentsClick(Sender:TObject);
    procedure edTitleChange(Sender:TObject);
    procedure btnOKClick(Sender:TObject);
    procedure acAddExecute(Sender:TObject);
    procedure acDeleteExecute(Sender:TObject);
    procedure acMoveUpExecute(Sender:TObject);
    procedure acMoveDownExecute(Sender:TObject);
    procedure acCommandExecute(Sender:TObject);
    procedure acClearExecute(Sender:TObject);
    procedure acUseShellexecuteExecute(Sender:TObject);
    procedure acPromptExecute(Sender:TObject);
    procedure acWaitExecute(Sender:TObject);
    procedure acTestExecute(Sender:TObject);
    procedure acArgsExecute(Sender:TObject);
    procedure acDirExecute(Sender:TObject);
    procedure alToolsUpdate(Action:TBasicAction; var Handled:Boolean);
    function lbContentsDataFind(Control:TWinControl;
      FindString:string):Integer;
    procedure lbContentsData(Control:TWinControl; Index:Integer;
      var Data:WideString);
    procedure lbContentsDrawItem(Control:TWinControl; Index:Integer;
      Rect:TRect; State:TOwnerDrawState);
  private
    { Private declarations }
    FLastItemIndex:integer;
    FTools:TToolItems;
    FOnTestClick:TTestToolItemClickEvent;
    FMainActionList:TactionList;
    edShortCut:TShortCutEdit;
    procedure SaveCurrentTool;
    procedure LoadCurrentTool;
    function NewToolTitle:WideString;
  public
    { Public declarations }
    class function Edit(Options:TAppOptions; MainActionList:TActionList; TestClickEvent:TTestToolItemClickEvent):boolean;
    procedure LoadOptions(Options:TAppOptions);
    procedure SaveOptions(Options:TAppOptions);
    procedure ClearToolList;

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property OnTestClick:TTestToolItemClickEvent read FOnTestClick write FOnTestClick;
  end;

implementation
uses
  TntClasses, TntWindows, AppUtils, AppConsts;

{$R *.dfm}

{ TfrmTools }

procedure TfrmTools.ClearToolList;
begin
  lbContents.Count := 0;
  FLastItemIndex := -1;
end;

destructor TfrmTools.Destroy;
begin
  ClearToolList;
  FTools.Free;
  inherited;
end;

class function TfrmTools.Edit(Options:TAppOptions; MainActionList:TActionList; TestClickEvent:TTestToolItemClickEvent):boolean;
var
  frmTools:TfrmTools;
begin
  frmTools := Self.Create(Application);
  try
    // frmTools.Font := Application.MainForm.Font;
    frmTools.OnTestClick := TestClickEvent;
    frmTools.FMainActionList := MainActionList;
    frmTools.LoadOptions(Options);
    frmTools.lbContents.ItemIndex := 0;
    frmTools.LoadCurrentTool;
    Result := frmTools.ShowModal = mrOK;
    if Result then
      frmTools.SaveOptions(Options);
  finally
    frmTools.Free;
  end;
end;

procedure TfrmTools.LoadOptions(Options:TAppOptions);
begin
  ClearToolList;
  FTools.Assign(Options.Tools);
  lbContents.Count := FTools.Count;
  lbContents.ItemIndex := 0;
end;

procedure TfrmTools.SaveOptions(Options:TAppOptions);
begin
  SaveCurrentTool;
  Options.Tools.Assign(FTools);
end;

procedure TfrmTools.ArgumentsClick(Sender:TObject);
begin
  edArguments.SelText := cArgsMacros[TMenuItem(Sender).Tag];
end;

procedure TfrmTools.InitialDirClick(Sender:TObject);
begin
  edInitialDir.SelText := cDirMacros[TMenuItem(Sender).Tag];
end;

procedure TfrmTools.lbContentsClick(Sender:TObject);
begin
  SaveCurrentTool;
  LoadCurrentTool;
  FLastItemIndex := lbContents.ItemIndex;
end;

procedure TfrmTools.LoadCurrentTool;
var
  ATool:TToolItem;
  I:integer;
begin
  I := lbContents.ItemIndex;
  if (I >= 0) and (I < FTools.Count) then
  begin
    ATool := FTools[I];
    edTitle.Text := ATool.Title;
    edCommand.Text := ATool.Command;
    edArguments.Text := ATool.Arguments;
    edInitialDir.Text := ATool.InitialDirectory;
//    chkCapture.Checked := ATool.CaptureOutput;
    acPrompt.Checked := ATool.PromptForArguments;
    acUseShellexecute.Checked := ATool.UseShellExecute;
    acWait.Checked := ATool.WaitForCompletion;
    edShortCut.ShortCut := ATool.ShortCut;
  end
  else
  begin
    edTitle.Text := '';
    edCommand.Text := '';
    edArguments.Text := '';
    edInitialDir.Text := '';
//    chkCapture.Checked := false;
    acPrompt.Checked := false;
    acWait.Checked := false;
    acUseShellexecute.Checked := false;
    edShortCut.ShortCut := 0;
  end;
  FLastItemIndex := I;
end;

procedure TfrmTools.SaveCurrentTool;
var
  ATool:TToolItem;
begin
  if (FLastItemIndex >= 0) and (FLastItemIndex < FTools.Count) then
  begin
    ATool := FTools[FLastItemIndex];
    ATool.Title := edTitle.Text;
    ATool.Command := edCommand.Text;
    ATool.Arguments := edArguments.Text;
    ATool.InitialDirectory := edInitialDir.Text;
//    ATool.CaptureOutput := chkCapture.Checked;
    ATool.PromptForArguments := acPrompt.Checked;
    ATool.WaitForCompletion := acWait.Checked;
    ATool.UseShellExecute := acUseShellexecute.Checked;
    ATool.ShortCut := edShortCut.ShortCut;
  end;
end;

constructor TfrmTools.Create(AOwner:TComponent);
begin
  inherited;
  FLastItemIndex := -1;
  FTools := TToolItems.Create;

  edShortCut := TShortCutEdit.Create(Self);
  edShortCut.Parent := pnlEditTool;
  edShortCut.Left := 104;
  edShortCut.Top := 120;
  edShortCut.Width := 217;
  edShortCut.Anchors := [akLeft, akTop, akRight];
  edShortCut.TabOrder := 7;
  edShortCut.BevelInner := bvNone;
  edShortCut.BevelOuter := bvRaised;
  edShortCut.BevelKind := bkFlat;
  edShortCut.BorderStyle := bsNone;
  lblShortCut.FocusControl := edShortCut;
end;

function TfrmTools.NewToolTitle:WideString;
var
  i:integer;
  S:WideString;
begin
  i := 1;
  S := _(Application.MainForm.ClassName, SFmtNewToolName);
  Result := WideFormat(S, [i]);
  while FTools.IndexOf(Result) >= 0 do
  begin
    Inc(i);
    Result := WideFormat(S, [i]);
  end;
end;

procedure TfrmTools.edTitleChange(Sender:TObject);
begin
  with lbContents do
    if (ItemIndex >= 0) and (ItemIndex < FTools.Count) then
    begin
      FTools[ItemIndex].Title := edTitle.Text;
      Invalidate;
    end;
end;

procedure TfrmTools.btnOKClick(Sender:TObject);
begin
  FLastItemIndex := lbContents.ItemIndex;
  SaveCurrentTool;
end;

procedure TfrmTools.acAddExecute(Sender:TObject);
var
  ATool:TToolItem;
begin
  SaveCurrentTool;
  ATool := FTools.Add;
  ATool.Title := NewToolTitle;
  lbContents.Count := FTools.Count;
  lbContents.ItemIndex := FTools.Count - 1;
  LoadCurrentTool;
  if edTitle.CanFocus then
    edTitle.SetFocus;
end;

procedure TfrmTools.acDeleteExecute(Sender:TObject);
var
  i:integer;
begin
  with lbContents do
  begin
    if (ItemIndex >= 0) and (ItemIndex < FTools.Count) then
    begin
      i := ItemIndex;
      FTools.Delete(i);
      lbContents.Count := FTools.Count;
      ItemIndex := i;
      if ItemIndex < 0 then
        ItemIndex := i - 1;
      LoadCurrentTool;
    end;
  end;
end;

procedure TfrmTools.acMoveUpExecute(Sender:TObject);
var
  i:integer;
begin
  SaveCurrentTool;
  with lbContents do
  begin
    i := ItemIndex;
    if i > 0 then
    begin
      FTools.Exchange(i, i - 1);
      FLastItemIndex := -1;
      ItemIndex := i - 1;
      lbContents.Invalidate;
    end;
  end;
end;

procedure TfrmTools.acMoveDownExecute(Sender:TObject);
var
  i:integer;
begin
  SaveCurrentTool;
  with lbContents do
  begin
    i := ItemIndex;
    if i < FTools.Count - 1 then
    begin
      FTools.Exchange(i, i + 1);
      FLastItemIndex := -1;
      ItemIndex := i + 1;
      lbContents.Invalidate;
    end;
  end;
end;

procedure TfrmTools.acCommandExecute(Sender:TObject);
begin
  odCommand.Filename := edCommand.Text;
  if odCommand.Execute then
    edCommand.Text := odCommand.Filename;
end;

procedure TfrmTools.acClearExecute(Sender:TObject);
begin
  edShortCut.ShortCut := 0;
end;

procedure TfrmTools.acUseShellexecuteExecute(Sender:TObject);
begin
  acUseShellexecute.Checked := not acUseShellexecute.Checked;
end;

procedure TfrmTools.acPromptExecute(Sender:TObject);
begin
  acPrompt.Checked := not acPrompt.Checked;
end;

procedure TfrmTools.acWaitExecute(Sender:TObject);
begin
  acWait.Checked := not acWait.Checked;
end;

procedure TfrmTools.acTestExecute(Sender:TObject);
begin
  with lbContents do
    if (ItemIndex >= 0) and (ItemIndex < FTools.Count) and Assigned(FOnTestClick) then
    begin
      SaveCurrentTool;
      FOnTestClick(btnTest, FTools[ItemIndex]);
    end;
end;

procedure TfrmTools.acArgsExecute(Sender:TObject);
var
  P:TPoint;
begin
  P := btnArguments.ClientOrigin;
  Inc(P.X, btnArguments.Width);
  popArguments.Popup(P.X, P.Y);
end;

procedure TfrmTools.acDirExecute(Sender:TObject);
var
  P:TPoint;
begin
  P := btnInitDir.ClientOrigin;
  Inc(P.X, btnInitDir.Width);
  popInitialDir.Popup(P.X, P.Y);
end;

procedure TfrmTools.alToolsUpdate(Action:TBasicAction;
  var Handled:Boolean);

  procedure PropagateEnabled(AWinControl:TWinControl; Enabled:boolean);
  var
    i:integer;
  begin
    if AWinControl.Tag <> -1 then // leave these alone
      AWinControl.Enabled := Enabled;
    for i := 0 to AWinControl.ControlCount - 1 do
    begin
      if AWinControl.Controls[i] is TWinControl then
        PropagateEnabled(TWinControl(AWinControl.Controls[i]), Enabled);
    end;
  end;
begin
  acDelete.Enabled := (lbContents.ItemIndex >= 0) and (lbContents.ItemIndex < FTools.Count);
  acMoveUp.Enabled := lbContents.ItemIndex > 0;
  acMoveDown.Enabled := lbContents.ItemIndex < FTools.Count - 1;
  acTest.Enabled := btnDelete.Enabled and Assigned(OnTestClick) and (edCommand.Text <> '');
  acClear.Enabled := edShortCut.ShortCut <> 0;
  PropagateEnabled(pnlEditTool, acDelete.Enabled);
  acWait.Enabled := not acUseShellexecute.Checked;
end;

function TfrmTools.lbContentsDataFind(Control:TWinControl;
  FindString:string):Integer;
begin
  Result := FTools.IndexOf(FindString);
end;

procedure TfrmTools.lbContentsData(Control:TWinControl; Index:Integer;
  var Data:WideString);
// var Action: TCustomAction;
begin
  Data := '';
  {
  Data := FTools[Index].Title;
  Action := FindActionShortCut(FMainActionList, FTools[Index].ShortCut);
  if Action <> nil then
    Data := '!>  ' + Data + '  <!'; // ' (' + Action.Caption + ')';
  }
end;

procedure TfrmTools.lbContentsDrawItem(Control:TWinControl;
  Index:Integer; Rect:TRect; State:TOwnerDrawState);
var
  tmp:WideString;
  Action:TCustomAction;
begin
  if (Index >= 0) and (Index < FTools.Count) then
    with lbContents.Canvas do
    begin
      FillRect(Rect);
      OffsetRect(Rect, 3, 0);
      tmp := FTools[Index].Title;
      Action := FindActionShortCut(FMainActionList, FTools[Index].ShortCut);
      if Action <> nil then
        tmp := '!>  ' + tmp + '  <!';
      Tnt_DrawTextW(Handle, PWideChar(tmp), -1, Rect, DT_SINGLELINE or DT_VCENTER or DT_EXPANDTABS);
    end;
end;

end.
