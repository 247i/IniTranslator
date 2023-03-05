{@abstract(Comments Viewer Form) }
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
// $Id: CommentsFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit CommentsFrm;
{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  Menus, StdActns, ActnList, Buttons,
  BaseForm, TranslateFile, TransIntf,
  TntClasses, TntComCtrls, TntButtons, TntStdCtrls, TntExtCtrls, TntMenus,
  TntStdActns, TntActnList, TB2Item, TBX, SpTBXItem;

type
  TCommentModifiedEvent = procedure(Sender:TObject; const AText:WideString) of object;
  TfrmComments = class(TfrmBase)
    pnlBack:TTntPanel;
    pnlTrans:TTntPanel;
    lblTrans:TLabel;
    reTranslation:TTntRichEdit;
    pnlOrig:TTntPanel;
    lblOrig:TTntLabel;
    reOriginal:TTntRichEdit;
    StatusBar1:TTntStatusBar;
    alComments:TTntActionList;
    popComments:TSpTBXPopupMenu;
    Undo1:TSpTBXItem;
    N1:TSpTBXItem;
    Cut1:TSpTBXItem;
    Copy1:TSpTBXItem;
    Paste1:TSpTBXItem;
    N2:TSpTBXItem;
    SelectAll1:TSpTBXItem;
    spLocked:TTntSpeedButton;
    acClose:TTntAction;
    EditUndo1:TTntEditUndo;
    EditSelectAll1:TTntEditSelectAll;
    EditPaste1:TTntEditPaste;
    EditCopy1:TTntEditCopy;
    EditCut1:TTntEditCut;
    procedure FormResize(Sender:TObject);
    procedure FormDestroy(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
    procedure reTranslationChange(Sender:TObject);
  private
    FOnCommentModified:TCommentModifiedEvent;
    function GetPinned:boolean;
    procedure SetPinned(const Value:boolean);
    procedure SetOnCommentModified(const Value:TCommentModifiedEvent);
    { Private declarations }
  public
    { Public declarations }
    procedure SetComments(const Item:ITranslationItem; CommentChars:TTntStrings);
    property Pinned:boolean read GetPinned write SetPinned;
    property OnCommentModified:TCommentModifiedEvent read FOnCommentModified write SetOnCommentModified;
  end;

var
  frmComments:TfrmComments = nil;

implementation
uses
  AppUtils;

{$R *.dfm}

procedure TfrmComments.FormResize(Sender:TObject);
var
  H:integer;
begin
  H := pnlBack.Height - pnlOrig.Height - pnlTrans.Height;
  if H < 0 then
    Exit;
  reOriginal.Height := H div 2;
end;

procedure TfrmComments.SetComments(const Item:ITranslationItem; CommentChars:TTntStrings);
// var i: integer;
begin
  if Item = nil then
  begin
    reOriginal.Clear;
    reTranslation.Clear;
  end
  else
  begin
    reOriginal.Text := Item.OrigComments;
//    for i := 0 to reOriginal.Lines.Count - 1 do
//      if Copy(reOriginal.Lines[i], 1, 1) = CommentChar then
//        reOriginal.Lines[i] := trim(Copy(reOriginal.Lines[i], 2, MaxInt));
    reTranslation.OnChange := nil;
    reTranslation.Text := Item.TransComments;
//    for i := 0 to reTranslation.Lines.Count - 1 do
//      if Copy(reTranslation.Lines[i], 1, 1) = CommentChar then
//        reTranslation.Lines[i] := trim(Copy(reTranslation.Lines[i], 2, MaxInt));
    reTranslation.Modified := false;
    reTranslation.OnChange := reTranslationChange;
  end;
end;

procedure TfrmComments.FormDestroy(Sender:TObject);
begin
  frmComments := nil;
end;

function TfrmComments.GetPinned:boolean;
begin
  Result := spLocked.Down;
end;

procedure TfrmComments.SetPinned(const Value:boolean);
begin
  spLocked.Down := Value;
end;

procedure TfrmComments.acCloseExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmComments.reTranslationChange(Sender:TObject);
begin
  if reTranslation.Modified and Assigned(FOnCommentModified) then
    FOnCommentModified(self, reTranslation.Text);
end;

procedure TfrmComments.SetOnCommentModified(
  const Value:TCommentModifiedEvent);
begin
  FOnCommentModified := Value;
  reTranslation.ReadOnly := not Assigned(FOnCommentModified);
end;

end.
