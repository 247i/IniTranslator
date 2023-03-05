{@abstract(Search and Replace Form) }
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
// $Id: FindReplaceFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit FindReplaceFrm;
{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, StdActns, Menus, ActnList,
  BaseForm,
  TntStdCtrls, TntClasses, TntButtons, TntActnList;

type
  TfrmFindReplace = class(TfrmBase)
    Label1:TTntLabel;
    chkMatchLine:TTntCheckBox;
    chkMatchCase:TTntCheckBox;
    cbFindWhat:TTntComboBox;
    btnFindNext:TTntButton;
    btnClose:TTntButton;
    lblReplaceWith:TTntLabel;
    cbReplaceWith:TTntComboBox;
    chkSearchUp:TTntCheckBox;
    lblFindIn:TTntLabel;
    cbFindWhere:TTntComboBox;
    btnReplace:TTntBitBtn;
    btnReplaceAll:TTntButton;
    acClipboard:TTntActionList;
    acCut:TTntAction;
    acCopy:TTntAction;
    acPaste:TTntAction;
    acSelectAll:TTntAction;
    acUndo:TTntAction;
    acClose:TTntAction;
    chkFuzzy:TTntCheckBox;
    procedure cbFindWhatChange(Sender:TObject);
    procedure btnCloseClick(Sender:TObject);
    procedure btnFindNextClick(Sender:TObject);
    procedure btnReplaceClick(Sender:TObject);
    procedure btnReplaceAllClick(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure acCutExecute(Sender:TObject);
    procedure acPasteExecute(Sender:TObject);
    procedure acCopyExecute(Sender:TObject);
    procedure acSelectAllExecute(Sender:TObject);
    procedure acUndoExecute(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
    procedure FormDestroy(Sender:TObject);
  private
    { Private declarations }
    FExpanded:boolean;
    FBitmap:TBitmap;
    FOnReplaceAll:TNotifyEvent;
    FOnReplace:TNotifyEvent;
    FOnFindNext:TNotifyEvent;
    FMaxHistoryCount:integer;
    procedure SetExpanded(const Value:boolean);
    procedure SetMaxHistoryCount(const Value:integer);
    procedure AddComboText(ACombo:TCustomComboBox);

  public
    { Public declarations }
    property MaxHistoryCount:integer read FMaxHistoryCount write SetMaxHistoryCount default 25;
    property Expanded:boolean read FExpanded write SetExpanded;
    property OnFindNext:TNotifyEvent read FOnFindNext write FOnFindNext;
    property OnReplace:TNotifyEvent read FOnReplace write FOnReplace;
    property OnReplaceAll:TNotifyEvent read FOnReplaceAll write FOnReplaceAll;
  end;

  TFindIn = (fiiOriginal, fiiTranslation, fiiBoth);
  TFindReplace = class(TComponent)
  private
    FForm:TfrmFindReplace;
    FOnReplace:TNotifyEvent;
    FOnShow:TNotifyEvent;
    FOnReplaceAll:TNotifyEvent;
    FOnClose:TNotifyEvent;
    FOnFindNext:TNotifyEvent;
    FFindInIndex:TFindIn;
    procedure SetFindHistory(const Value:TTntStrings);
    procedure SetFindIn(const Value:TTntStrings);
    procedure SetFindText(const Value:WideString);
    procedure SetMatchCase(const Value:boolean);
    procedure SetMatchLine(const Value:boolean);
    procedure SetReplaceHistory(const Value:TTntStrings);
    procedure SetReplaceText(const Value:WideString);
    procedure SetSearchUp(const Value:boolean);
    function GetFindHistory:TTntStrings;
    function GetFindIn:TTntStrings;
    function GetReplaceHistory:TTntStrings;
    function GetFindText:WideString;
    function GetMatchCase:boolean;
    function GetMatchLine:boolean;
    function GetReplaceText:WideString;
    function GetSearchUp:boolean;
    function GetPosition:TPoint;
    procedure SetPosition(const Value:TPoint);
    function GetTitle:WideString;
    procedure SetTitle(const Value:WideString);
    function GetExpanded:boolean;
    procedure SetExpanded(const Value:boolean);
    function GetShowing:boolean;
    function GetFindInIndex:TFindIn;
    procedure SetFindInIndex(const Value:TFindIn);
    function GetMaxHistoryCount:Cardinal;
    procedure SetMaxHistoryCount(const Value:Cardinal);
    function GetFuzzySearch:boolean;
    procedure SetFuzzySearch(const Value:boolean);
    procedure DoClose(Sender:TObject);
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    property Showing:boolean read GetShowing;
    property FindHistory:TTntStrings read GetFindHistory write SetFindHistory;
    property ReplaceHistory:TTntStrings read GetReplaceHistory write SetReplaceHistory;
    property FindText:WideString read GetFindText write SetFindText;
    property ReplaceText:WideString read GetReplaceText write SetReplaceText;
  published
    property Title:WideString read GetTitle write SetTitle;
    property MaxHistoryCount:Cardinal read GetMaxHistoryCount write SetMaxHistoryCount;
    property Expanded:boolean read GetExpanded write SetExpanded;
    property Position:TPoint read GetPosition write SetPosition;
    property FindIn:TTntStrings read GetFindIn write SetFindIn;
    property FuzzySearch:boolean read GetFuzzySearch write SetFuzzySearch;
    property FindInIndex:TFindIn read GetFindInIndex write SetFindInIndex;
    property MatchLine:boolean read GetMatchLine write SetMatchLine;
    property MatchCase:boolean read GetMatchCase write SetMatchCase;
    property SearchUp:boolean read GetSearchUp write SetSearchUp;
    property OnFindNext:TNotifyEvent read FOnFindNext write FOnFindNext;
    property OnReplace:TNotifyEvent read FOnReplace write FOnReplace;
    property OnReplaceAll:TNotifyEvent read FOnReplaceAll write FOnReplaceAll;
    property OnShow:TNotifyEvent read FOnShow write FOnShow;
    property OnClose:TNotifyEvent read FOnClose write FOnClose;
  end;

implementation
uses
  AppUtils, MsgTranslate, TntClipbrd;

{$R *.dfm}

{ TfrmFindReplace }

procedure TfrmFindReplace.cbFindWhatChange(Sender:TObject);
begin
  btnFindNext.Enabled := Length(cbFindWhat.Text) > 0;
  btnReplace.Enabled := btnFindNext.Enabled or not Expanded;
  btnReplaceAll.Enabled := btnFindNext.Enabled;
end;

procedure TfrmFindReplace.btnCloseClick(Sender:TObject);
begin
  Close;
end;

procedure TfrmFindReplace.btnFindNextClick(Sender:TObject);
begin
  AddComboText(cbFindWhat);
  if Assigned(FOnFindNext) then
    FOnFindNext(self);
end;

procedure TfrmFindReplace.btnReplaceClick(Sender:TObject);
begin
  if not Expanded then
  begin
    Expanded := true;
    cbFindWhatChange(Sender); // updated buttons
    Exit;
  end;
  AddComboText(cbReplaceWith);
  if Assigned(FOnReplace) then
    FOnReplace(self);
end;

procedure TfrmFindReplace.btnReplaceAllClick(Sender:TObject);
begin
  AddComboText(cbReplaceWith);
  if Assigned(FOnReplaceAll) then
    FOnReplaceAll(self);
end;

procedure TfrmFindReplace.SetExpanded(const Value:boolean);
begin
  if FExpanded <> Value then
  begin
    if Value then
    begin
      lblReplaceWith.Visible := true;
      cbReplaceWith.Visible := true;
      btnReplace.Glyph := nil;
      btnReplace.Margin := -1;
      btnReplaceAll.Visible := true;
      btnClose.Top := btnReplaceAll.Top + btnReplaceAll.Height + 4;
      lblFindIn.Top := chkMatchLine.Top;
      cbFindWhere.Top := lblFindIn.Top - 2;
    end
    else
    begin
      lblReplaceWith.Visible := false;
      cbReplaceWith.Visible := false;
      btnReplaceAll.Visible := false;
      btnReplace.Glyph := FBitmap;
      btnReplace.Margin := 2;
      btnClose.Top := btnReplace.Top + btnReplace.Height + 4;
      lblFindIn.Top := lblReplaceWith.Top;
      cbFindWhere.Top := cbReplaceWith.Top;
    end;
    FExpanded := Value;
  end;
end;

procedure TfrmFindReplace.FormActivate(Sender:TObject);
begin
  if cbFindWhat.CanFocus then
    cbFindWhat.SetFocus;
end;

procedure TfrmFindReplace.FormCreate(Sender:TObject);
begin
  MaxHistoryCount := 25;
  FBitmap := TBitmap.Create;
  FBitmap.Assign(btnReplace.Glyph);
end;

procedure TfrmFindReplace.SetMaxHistoryCount(const Value:integer);
begin
  if FMaxHistoryCount <> Value then
  begin
    FMaxHistoryCount := Value;
    while cbFindWhat.Items.Count > MaxHistoryCount do
      cbFindWhat.Items.Delete(cbFindWhat.Items.Count - 1);
    while cbReplaceWith.Items.Count > MaxHistoryCount do
      cbReplaceWith.Items.Delete(cbReplaceWith.Items.Count - 1);
  end;
end;

// normal comboboxes have their own popupmenu but doesn't react to the standard shortcut keys,
// so we handle those with these actions instead:

procedure TfrmFindReplace.acCutExecute(Sender:TObject);
begin
  if (ActiveControl is TTntComboBox) and (TTntComboBox(ActiveControl).Style = csDropDown) then
    SendMessage(TTntComboBox(ActiveControl).Handle, WM_CUT, 0, 0);
end;

procedure TfrmFindReplace.acCopyExecute(Sender:TObject);
begin
  if (ActiveControl is TTntComboBox) and (TTntComboBox(ActiveControl).Style = csDropDown) then
    SendMessage(TTntComboBox(ActiveControl).Handle, WM_COPY, 0, 0);
end;

procedure TfrmFindReplace.acPasteExecute(Sender:TObject);
begin
  if (ActiveControl is TTntComboBox) and (TTntComboBox(ActiveControl).Style = csDropDown) then
    SendMessage(TTntComboBox(ActiveControl).Handle, WM_PASTE, 0, 0);
end;

type
  THackTntComboBox = class(TTntComboBox); // get access to EditHandle (protected)

procedure TfrmFindReplace.acSelectAllExecute(Sender:TObject);
begin
  if (ActiveControl is TTntComboBox) and (TTntComboBox(ActiveControl).Style = csDropDown) then
    SendMessage(THackTntComboBox(ActiveControl).EditHandle, EM_SETSEL, 0, -1);
end;

procedure TfrmFindReplace.acUndoExecute(Sender:TObject);
begin
  if (ActiveControl is TTntComboBox) and (TTntComboBox(ActiveControl).Style = csDropDown) then
    SendMessage(THackTntComboBox(ActiveControl).EditHandle, EM_UNDO, 0, -1);
end;

procedure TfrmFindReplace.acCloseExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmFindReplace.FormDestroy(Sender:TObject);
begin
  FBitmap.Free;
end;

type
  THackCombo = class(TCustomComboBox);

procedure TfrmFindReplace.AddComboText(ACombo:TCustomComboBox);
begin
  if (THackCombo(ACombo).Text <> '') and (ACombo.Items.IndexOf(THackCombo(ACombo).Text) < 0) then
    ACombo.Items.Insert(0, THackCombo(ACombo).Text);
  while ACombo.Items.Count > MaxHistoryCount do
    ACombo.Items.Delete(ACombo.Items.Count - 1);
end;

{ TFindReplace }

constructor TFindReplace.Create(AOwner:TComponent);
begin
  inherited;
  FForm := TfrmFindReplace.Create(self);
  FForm.Expanded := true;
  FForm.Expanded := false;
  FindInIndex := fiiOriginal;
end;

destructor TFindReplace.Destroy;
begin
  if Showing then
  begin
    FFindInIndex := TFindIn(FForm.cbFindWhere.ItemIndex);
    FForm.Hide;
  end;
  FForm := nil;
  inherited;
end;

procedure TFindReplace.DoClose(Sender:TObject);
begin
  FFindInIndex := TFindIn(FForm.cbFindWhere.ItemIndex);
  if Assigned(FOnClose) then
    FOnClose(Sender);
end;

procedure TFindReplace.Execute;
begin
  if Showing then
    Exit;
  FForm.OnShow := OnShow;
  FForm.OnHide := DoClose;
  FForm.OnFindNext := OnFindNext;
  FForm.OnReplace := OnReplace;
  FForm.OnReplaceAll := OnReplaceAll;
  FForm.cbFindWhatChange(nil);
  FForm.Show;
  FindInIndex := FFindInIndex;
end;

function TFindReplace.GetExpanded:boolean;
begin
  Result := FForm.Expanded;
end;

function TFindReplace.GetFindHistory:TTntStrings;
begin
  Result := FForm.cbFindWhat.Items;
end;

function TFindReplace.GetFindIn:TTntStrings;
begin
  Result := FForm.cbFindWhere.Items;
end;

function TFindReplace.GetFindInIndex:TFindIn;
begin
  if Showing then
    Result := TFindIn(FForm.cbFindWhere.ItemIndex)
  else
    Result := FFindInIndex;
end;

function TFindReplace.GetFindText:WideString;
begin
  Result := FForm.cbFindWhat.Text;
end;

function TFindReplace.GetFuzzySearch:boolean;
begin
  Result := FForm.chkFuzzy.Checked;
end;

function TFindReplace.GetMatchCase:boolean;
begin
  Result := FForm.chkMatchCase.Checked;
end;

function TFindReplace.GetMatchLine:boolean;
begin
  Result := FForm.chkMatchLine.Checked;
end;

function TFindReplace.GetMaxHistoryCount:Cardinal;
begin
  Result := FForm.MaxHistoryCount;
end;

function TFindReplace.GetPosition:TPoint;
begin
  Result := Point(FForm.Left, FForm.Top);
end;

function TFindReplace.GetReplaceHistory:TTntStrings;
begin
  Result := FForm.cbReplaceWith.Items;
end;

function TFindReplace.GetReplaceText:WideString;
begin
  Result := FForm.cbReplaceWith.Text;
end;

function TFindReplace.GetSearchUp:boolean;
begin
  Result := FForm.chkSearchUp.Checked;
end;

function TFindReplace.GetShowing:boolean;
begin
  Result := (FForm <> nil) and FForm.Visible;
end;

function TFindReplace.GetTitle:WideString;
begin
  Result := FForm.Caption;
end;

procedure TFindReplace.SetExpanded(const Value:boolean);
begin
  FForm.Expanded := Value;
end;

procedure TFindReplace.SetFindHistory(const Value:TTntStrings);
var
  i:integer;
begin
  i := FForm.cbFindWhat.ItemIndex;
  FForm.cbFindWhat.Items := Value;
  FForm.cbFindWhat.ItemIndex := i;
end;

procedure TFindReplace.SetFindIn(const Value:TTntStrings);
var
  i:integer;
begin
  i := FForm.cbFindWhere.ItemIndex;
  FForm.cbFindWhere.Items := Value;
  FForm.cbFindWhere.ItemIndex := i;
end;

procedure TFindReplace.SetFindInIndex(const Value:TFindIn);
begin
  if Showing then
    FForm.cbFindWhere.ItemIndex := Ord(Value)
  else
    FFindInIndex := Value;
end;

procedure TFindReplace.SetFindText(const Value:WideString);
begin
  FForm.cbFindWhat.Text := Value;
end;

procedure TFindReplace.SetFuzzySearch(const Value:boolean);
begin
  FForm.chkFuzzy.Checked := Value;
end;

procedure TFindReplace.SetMatchCase(const Value:boolean);
begin
  FForm.chkMatchCase.Checked := Value;
end;

procedure TFindReplace.SetMatchLine(const Value:boolean);
begin
  FForm.chkMatchLine.Checked := Value;
end;

procedure TFindReplace.SetMaxHistoryCount(const Value:Cardinal);
begin
  FForm.MaxHistoryCount := Value;
end;

procedure TFindReplace.SetPosition(const Value:TPoint);
begin
  if (Value.X < 0) or (Value.Y < 0) then
  begin
    FForm.Left := (Screen.Width - FForm.Width) div 2;
    FForm.Top := (Screen.Height - FForm.Height) div 2;
  end
  else
  begin
    FForm.Left := Value.X;
    FForm.Top := Value.Y;
  end;
end;

procedure TFindReplace.SetReplaceHistory(const Value:TTntStrings);
var
  i:integer;
begin
  i := FForm.cbReplaceWith.ItemIndex;
  FForm.cbReplaceWith.Items := Value;
  FForm.cbReplaceWith.ItemIndex := i;
end;

procedure TFindReplace.SetReplaceText(const Value:WideString);
begin
  FForm.cbReplaceWith.Text := Value;
end;

procedure TFindReplace.SetSearchUp(const Value:boolean);
begin
  FForm.chkSearchUp.Checked := Value;
end;

procedure TFindReplace.SetTitle(const Value:WideString);
begin
  FForm.Caption := Value;
end;

end.
