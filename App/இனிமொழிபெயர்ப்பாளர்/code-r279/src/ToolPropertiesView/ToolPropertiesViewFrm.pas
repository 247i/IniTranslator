unit ToolPropertiesViewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, TransIntf, ComCtrls, TntComCtrls, ActnList,
  TntActnList, Menus, TntMenus;

type
  TfrmToolPropertiesView = class(TTntForm)
    TntStatusBar1:TTntStatusBar;
    lvItems:TTntListView;
    alMain:TTntActionList;
    acSync:TTntAction;
    acClose:TTntAction;
    popListView:TTntPopupMenu;
    Selectinmainlist1:TTntMenuItem;
    Close1:TTntMenuItem;
    N1:TTntMenuItem;
    procedure lvItemsData(Sender:TObject; Item:TListItem);
    procedure acCloseExecute(Sender:TObject);
    procedure acSyncExecute(Sender:TObject);
  private
    { Private declarations }
    FAppServices:IApplicationServices;
    procedure LoadItems(const ApplicationServices:IApplicationServices);
    procedure RefreshView;
  public
    { Public declarations }
    class function Execute(const ApplicationServices:IApplicationServices;
      var SelectedItem:ITranslationItem):Boolean;
  end;

implementation

{$R *.DFM}

{ TfrmToolPropertiesView }

class function TfrmToolPropertiesView.Execute(const ApplicationServices:IApplicationServices;
  var SelectedItem:ITranslationItem):Boolean;
var
  frm:TfrmToolPropertiesView;
  FAppHandle:Cardinal;
begin
  FAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
  frm := self.Create(Application);
  try
    frm.LoadItems(ApplicationServices);
    frm.ShowModal;
    Result := false; // no changes
  finally
    frm.Free;
    Application.Handle := FAppHandle;
  end;
end;

procedure TfrmToolPropertiesView.LoadItems(const ApplicationServices:IApplicationServices);
begin
  FAppServices := ApplicationServices;
  RefreshView;
end;

procedure TfrmToolPropertiesView.RefreshView;
var
  i:integer;
begin
  if FAppServices <> nil then
    lvItems.Items.Count := FAppServices.Items.Count
  else
    lvItems.Items.Count := 0;
  if lvItems.Items.Count > 0 then
    for i := 0 to lvItems.Columns.Count - 1 do
      lvItems.Columns[i].Width := ColumnHeaderWidth;
  TntStatusBar1.Panels[0].Text := WideFormat(' %d item(s) in list', [lvItems.Items.Count]);
end;

procedure TfrmToolPropertiesView.lvItemsData(Sender:TObject;
  Item:TListItem);
var
  AItem:ITranslationItem;
begin
  if (FAppServices <> nil) and (Item.Index >= 0) and (Item.Index < FAppServices.Items.Count) then
    with TTntListItem(Item) do
    begin
      AItem := FAppServices.Items[Index];
      Caption := IntToStr(AItem.Index);
      SubItems.Add(AItem.Section);
      SubItems.Add(AItem.Name);
      SubItems.Add(AItem.Original);
      SubItems.Add(AItem.Translation);
      SubItems.Add(AItem.OrigComments);
      SubItems.Add(AItem.TransComments);
      SubItems.Add(AItem.PreData);
      SubItems.Add(AItem.PostData);
      SubItems.Add(AItem.OrigQuote);
      SubItems.Add(AItem.TransQuote);
      SubItems.Add(AItem.PrivateStorage);
      SubItems.Add(AItem.ClearOriginal);
      SubItems.Add(AItem.ClearTranslation);
    end;
end;

procedure TfrmToolPropertiesView.acCloseExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmToolPropertiesView.acSyncExecute(Sender:TObject);
begin
  if (FAppServices <> nil) and (lvItems.Selected <> nil)
    and (lvItems.Selected.Index >= 0) and (lvItems.Selected.Index < FAppServices.Items.Count) then
    FAppServices.SelectedItem := FAppServices.Items[lvItems.Selected.Index];
end;

end.
