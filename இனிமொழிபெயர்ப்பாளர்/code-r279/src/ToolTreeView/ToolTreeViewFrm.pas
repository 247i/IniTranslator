unit ToolTreeViewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, TntForms,
  Dialogs, ComCtrls, TntComCtrls, StdCtrls, TntStdCtrls, ExtCtrls,
  TntExtCtrls, TransIntf, Menus, TntMenus, ImgList, ActnList, TntActnList;

type
  TfrmToolTreeView = class(TTntForm)
    StatusBottom:TTntStatusBar;
    splitVertical:TTntSplitter;
    pnlLeft:TTntPanel;
    lblSections:TTntLabel;
    tvSections:TTntTreeView;
    nbViews:TNotebook;
    pnlRight:TTntPanel;
    splitHorizontal:TTntSplitter;
    pnlTopRight:TTntPanel;
    lblOriginal:TTntLabel;
    reOriginal:TTntRichEdit;
    lvView:TTntListView;
    popTreeview:TTntPopupMenu;
    N1:TTntMenuItem;
    N2:TTntMenuItem;
    ilTreeView:TImageList;
    pnlBottomRight:TTntPanel;
    lblTranslation:TTntLabel;
    reTranslation:TTntRichEdit;
    alMain:TTntActionList;
    acPrev:TTntAction;
    acNext:TTntAction;
    acPrevUntrans:TTntAction;
    acNextUntrans:TTntAction;
    acPrevSection:TTntAction;
    acNextSection:TTntAction;
    acClose:TTntAction;
    Previous1:TTntMenuItem;
    Next1:TTntMenuItem;
    Previousuntranslated1:TTntMenuItem;
    Nextuntranslated1:TTntMenuItem;
    Previoussection1:TTntMenuItem;
    Nextsection1:TTntMenuItem;
    procedure tvSectionsChanging(Sender:TObject; Node:TTreeNode;
      var AllowChange:Boolean);
    procedure lvViewDblClick(Sender:TObject);
    procedure tvSectionsCustomDrawItem(Sender:TCustomTreeView;
      Node:TTreeNode; State:TCustomDrawState; var DefaultDraw:Boolean);
    procedure tvSectionsGetImageIndex(Sender:TObject; Node:TTreeNode);
    procedure lvViewCustomDrawItem(Sender:TCustomListView;
      Item:TListItem; State:TCustomDrawState; var DefaultDraw:Boolean);
    procedure tvSectionsDblClick(Sender:TObject);
    procedure lvViewKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure tvSectionsKeyPress(Sender:TObject; var Key:Char);
    procedure lvViewKeyPress(Sender:TObject; var Key:Char);
    procedure lvViewEnter(Sender:TObject);
    procedure TntFormResize(Sender:TObject);
    procedure TntFormKeyUp(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure reTranslationKeyUp(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure tvSectionsKeyUp(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure reTranslationKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure acPrevExecute(Sender:TObject);
    procedure acNextExecute(Sender:TObject);
    procedure acPrevUntransExecute(Sender:TObject);
    procedure acNextUntransExecute(Sender:TObject);
    procedure acPrevSectionExecute(Sender:TObject);
    procedure acNextSectionExecute(Sender:TObject);
    procedure acCloseExecute(Sender:TObject);
  private
    { Private declarations }
    procedure BuildTree(const Items:ITranslationItems; const SelectedItem:ITranslationItem);
    procedure FillListView(Node:TTntTreeNode);
    procedure FindInTree(Data:Pointer);
    procedure ShowAtEndMsg;
    procedure ShowAtStartMsg;
    procedure SetPath(ANode:TTntTreeNode);
  public
    { Public declarations }
    class function Edit(const Items:ITranslationItems; var SelectedItem:ITranslationItem):WordBool;
  end;

implementation

{$R *.dfm}

procedure TfrmToolTreeView.ShowAtEndMsg;
begin
//  ShowMessage('At end of tree. Try searching in the opposite direction.');
  MessageBeep(MB_OK);
end;

procedure TfrmToolTreeView.ShowAtStartMsg;
begin
//  ShowMessage('At start of tree. Try searching in the opposite direction.');
  MessageBeep(MB_OK);
end;

function trimCRLFRight(const S:WideString):WideString;
var
  i:integer;
begin
  Result := S;
  i := Length(Result);
  while (i >= 1) and (Result[i] in [WideChar(#10), WideChar(#13)]) do
    Dec(i);
  if i >= 0 then
    SetLength(Result, i);
end;

procedure TfrmToolTreeView.BuildTree(const Items:ITranslationItems; const SelectedItem:ITranslationItem);
var
  N:TTntTreeNode;
  i:integer;
  FLastSection:WideString;
  FoldSort:Integer;
begin
  tvSections.Items.BeginUpdate;
  FOldSort := Items.Sort;
  try
    Items.Sort := stIndex;
    tvSections.Items.Clear;
    reOriginal.Clear;
    reTranslation.Clear;
    FLastSection := #2;
    N := nil;
    for i := 0 to Items.Count - 1 do
    begin
      if (i = 0) or not WideSameText(FLastSection, Items[i].Section) then
      begin
        FLastSection := Items[i].Section;
        N := tvSections.Items.Add(nil, Items[i].Section);
      end;
      tvSections.Items.AddChildObject(N, Items[i].Name, Pointer(Items[i]));
    end;
  finally
    Items.Sort := FOldSort;
    tvSections.Items.EndUpdate;
  end;
  if tvSections.Items.Count > 0 then
  begin
    if SelectedItem <> nil then
      FindInTree(Pointer(SelectedItem))
    else
      tvSections.Selected := tvSections.Items[0];
    if tvSections.Selected <> nil then
    begin
      tvSections.Selected.MakeVisible;
      tvSections.Selected.Expand(false);
    end;
  end;
end;

class function TfrmToolTreeView.Edit(const Items:ITranslationItems; var SelectedItem:ITranslationItem):WordBool;
var
  frm:TfrmToolTreeView;
  Dummy:boolean;
begin
  frm := self.Create(Application);
  try
    frm.BuildTree(Items, SelectedItem);
    frm.ShowModal;
    frm.tvSectionsChanging(frm.tvSections, frm.tvSections.Selected, Dummy); // save last edit
    if frm.tvSections.Selected <> nil then
      SelectedItem := ITranslationItem(frm.tvSections.Selected.Data)
    else
      SelectedItem := nil;
    Result := true;
  finally
    frm.Free;
  end;
end;

procedure TfrmToolTreeView.tvSectionsChanging(Sender:TObject;
  Node:TTreeNode; var AllowChange:Boolean);
var
  I:ITranslationItem;
begin
  if tvSections.Selected <> nil then // the previous selected node
  begin
    I := ITranslationItem(TTntTreeNode(tvSections.Selected).Data);
    if I <> nil then
    begin
      if reOriginal.Modified then
        I.Original := trimCRLFRight(reOriginal.Lines.Text);
      if reTranslation.Modified then
      begin
        I.Translation := trimCRLFRight(reTranslation.Lines.Text);
        I.Translated := I.Translation <> '';
        tvSectionsGetImageIndex(tvSections, tvSections.Selected);
        tvSections.Invalidate;
      end;
    end;
  end;
  if Node <> nil then // the newly selected node
  begin
    I := ITranslationItem(TTntTreeNode(Node).Data);
    if I <> nil then
    begin
      reOriginal.Enabled := true;
      reTranslation.Enabled := true;
      reOriginal.Lines.Text := I.Original;
      reTranslation.Lines.Text := I.Translation;
      nbViews.PageIndex := 0;
    end
    else
    begin
      reOriginal.Lines.Text := '';
      reTranslation.Lines.Text := '';
      reOriginal.Enabled := false;
      reTranslation.Enabled := false;
      FillListView(TTntTreeNode(Node));
      nbViews.PageIndex := 1;
    end;
    tvSectionsGetImageIndex(tvSections, Node);
    SetPath(TTntTreeNode(Node));
  end;
  reOriginal.Modified := false;
  reTranslation.Modified := false;
  reOriginal.SelectAll;
  reTranslation.SelectAll;
end;

procedure TfrmToolTreeView.FillListView(Node:TTntTreeNode);
var
  N:TTntTreeNode;
  T:ITranslationItem;
begin
  lvView.Items.BeginUpdate;
  try
    lvView.Items.Clear;
    N := Node.getFirstChild;
    while N <> nil do
    begin
      with lvView.Items.Add do
      begin
        if N.Data <> nil then
        begin
          T := ITranslationItem(N.Data);
          Caption := T.Name;
          SubItems.Add(T.Original);
          SubItems.Add(T.Translation);
        end
        else
          Caption := N.Text;
        Data := N.Data;
        ImageIndex := N.ImageIndex;
        StateIndex := N.StateIndex;
        if StateIndex = 0 then
          StateIndex := -1;
      end;
      N := N.getNextSibling;
    end;
  finally
    lvView.Items.EndUpdate;
  end;
  if lvView.Items.Count > 0 then
    lvView.Selected := lvView.Items[0];
end;

procedure TfrmToolTreeView.lvViewDblClick(Sender:TObject);
begin
  if lvView.Selected <> nil then
    FindInTree(lvView.Selected.Data);
  if reTranslation.CanFocus then
    reTranslation.SetFocus;
  reTranslation.SelectAll;
end;

procedure TfrmToolTreeView.FindInTree(Data:Pointer);
var
  N:TTntTreeNode;
begin
  N := tvSections.Items.GetFirstNode;
  while N <> nil do
  begin
    if N.Data = Data then
    begin
      N.MakeVisible;
      tvSections.Selected := N;
      Exit;
    end;
    N := N.GetNext;
  end;
end;

procedure TfrmToolTreeView.tvSectionsCustomDrawItem(Sender:TCustomTreeView; Node:TTreeNode; State:TCustomDrawState;
  var DefaultDraw:Boolean);
var
  I:ITranslationItem;
begin
  if Node = nil then
    Exit;
  I := ITranslationItem(Node.Data);
  if I <> nil then
  begin
    Sender.Canvas.Font.Style := Font.Style;
    if not I.Translated then
      Sender.Canvas.Font.Style := [fsBold];
    if I.Modified then
      Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsItalic];
  end;
end;

procedure TfrmToolTreeView.lvViewCustomDrawItem(Sender:TCustomListView;
  Item:TListItem; State:TCustomDrawState; var DefaultDraw:Boolean);
var
  I:ITranslationItem;
begin
  if Item = nil then
    Exit;
  I := ITranslationItem(Item.Data);
  if I <> nil then
  begin
    Sender.Canvas.Font.Style := Font.Style;
    if not I.Translated then
      Sender.Canvas.Font.Style := [fsBold];
    if I.Modified then
      Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsItalic];
  end;
end;

procedure TfrmToolTreeView.tvSectionsGetImageIndex(Sender:TObject;
  Node:TTreeNode);
var
  I:ITranslationItem;
begin
  if Node = nil then
    Exit;
  i := ITranslationItem(Node.Data);
  if I <> nil then
  begin
    if I.Translated then
      Node.ImageIndex := 0
    else
      Node.ImageIndex := 1;
    if I.Modified then
      Node.StateIndex := 2
    else
      Node.StateIndex := -1;
  end
  else
  begin
    if Node.Expanded then
      Node.ImageIndex := 4
    else
      Node.ImageIndex := 3;
  end;
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfrmToolTreeView.SetPath(ANode:TTntTreeNode);
var
  N:TTntTreeNode;
  S:WideString;
begin
  S := '';
  N := ANode;
  while N <> nil do
  begin
    S := N.Text + '\' + S;
    N := N.Parent;
  end;
  if Length(S) > 0 then
    SetLength(S, Length(S) - 1);
  StatusBottom.Panels[0].Text := S;
end;

procedure TfrmToolTreeView.tvSectionsDblClick(Sender:TObject);
begin
  if (tvSections.Selected = nil) or (tvSections.Selected.Data = nil) then
    Exit;
  if reTranslation.CanFocus then
    reTranslation.SetFocus;
  reTranslation.SelectAll;
end;

procedure TfrmToolTreeView.lvViewKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_RETURN then
  begin
    lvViewDblClick(Sender);
    Key := 0;
  end;
end;

procedure TfrmToolTreeView.tvSectionsKeyPress(Sender:TObject;
  var Key:Char);
begin
  if Key = #13 then
    Key := #0; // remove "bell"
end;

procedure TfrmToolTreeView.lvViewKeyPress(Sender:TObject; var Key:Char);
begin
  if Key = #13 then
    Key := #0; // remove "bell"
end;

procedure TfrmToolTreeView.lvViewEnter(Sender:TObject);
begin
  if (lvView.Items.Count > 0) and (lvView.Selected = nil) then
    lvView.Selected := lvView.Items[0];
  if lvView.Selected <> nil then
    lvView.Selected.Focused := true;
end;

procedure TfrmToolTreeView.TntFormResize(Sender:TObject);
var
  i, j:integer;
begin
  i := ClientHeight div 2;
  pnlTopRight.Height := i;
  i := lvView.ClientWidth div lvView.Columns.Count;
  for j := 0 to lvView.Columns.Count - 1 do
    lvView.Columns[j].Width := i;
end;

procedure TfrmToolTreeView.TntFormKeyUp(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TfrmToolTreeView.reTranslationKeyUp(Sender:TObject;
  var Key:Word; Shift:TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if tvSections.CanFocus then
      tvSections.SetFocus;
    Key := 0;
  end;
end;

procedure TfrmToolTreeView.tvSectionsKeyUp(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_RETURN then
  begin
    tvSectionsDblClick(Sender);
    Key := 0;
  end;
end;

procedure TfrmToolTreeView.reTranslationKeyDown(Sender:TObject;
  var Key:Word; Shift:TShiftState);
begin
  if Key = VK_RETURN then
    Key := 0;
end;

procedure TfrmToolTreeView.acPrevExecute(Sender:TObject);
begin
  if (tvSections.Selected <> nil) and (tvSections.Selected.GetPrev <> nil) then
  begin
    tvSections.Selected := tvSections.Selected.GetPrev;
    Exit;
  end;
  ShowAtStartMsg;
end;

procedure TfrmToolTreeView.acNextExecute(Sender:TObject);
begin
  if (tvSections.Selected <> nil) and (tvSections.Selected.GetNext <> nil) then
  begin
    tvSections.Selected := tvSections.Selected.GetNext;
    Exit;
  end;
  ShowAtEndMsg;
end;

procedure TfrmToolTreeView.acPrevUntransExecute(Sender:TObject);
var
  N:TTntTreeNode;
  I:ITranslationItem;
begin
  N := tvSections.Selected;
  if N <> nil then
    N := N.GetPrev;
  while N <> nil do
  begin
    if N.Data <> nil then
    begin
      I := ITranslationItem(N.Data);
      if (I <> nil) and (not I.Translated) then
      begin
        tvSections.Selected := N;
        Exit;
      end;
    end;
    N := N.GetPrev;
  end;
  ShowAtStartMsg;
end;

procedure TfrmToolTreeView.acNextUntransExecute(Sender:TObject);
var
  N:TTntTreeNode;
  I:ITranslationItem;
begin
  N := tvSections.Selected;
  if N <> nil then
    N := N.GetNext;
  while N <> nil do
  begin
    if N.Data <> nil then
    begin
      I := ITranslationItem(N.Data);
      if (I <> nil) and (not I.Translated) then
      begin
        tvSections.Selected := N;
        Exit;
      end;
    end;
    N := N.GetNext;
  end;
  ShowAtEndMsg;
end;

procedure TfrmToolTreeView.acPrevSectionExecute(Sender:TObject);
var
  N:TTntTreeNode;
begin
  N := tvSections.Selected;
  if N <> nil then
    N := N.GetPrev;
  while N <> nil do
  begin
    if N.Data = nil then
    begin
      N.MakeVisible;
      N.Expand(false);
      tvSections.Selected := N;
      Exit;
    end;
    N := N.GetPrev;
  end;
  ShowAtStartMsg;
end;

procedure TfrmToolTreeView.acNextSectionExecute(Sender:TObject);
var
  N:TTntTreeNode;
begin
  N := tvSections.Selected;
  if N <> nil then
    N := N.GetNext;
  while N <> nil do
  begin
    if N.Data = nil then
    begin
      N.MakeVisible;
      N.Expand(false);
      tvSections.Selected := N;
      Exit;
    end;
    N := N.GetNext;
  end;
  ShowAtEndMsg;
end;

procedure TfrmToolTreeView.acCloseExecute(Sender:TObject);
begin
  Close;
end;

end.
