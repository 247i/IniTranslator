unit ToolItemEditFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, ExtCtrls, StdCtrls, ComCtrls, TntComCtrls, TransIntf;

type
  TfrmEditItem = class(TTntForm)
    reOriginal:TTntRichEdit;
    Panel1:TPanel;
    reTranslation:TTntRichEdit;
    procedure reTranslationKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure TntFormKeyUp(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure TntFormKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
  private
    { Private declarations }
    ReturnKey:boolean;
  public
    { Public declarations }
    class function Edit(const AItem:ITranslationItem; APos:TPoint):boolean;
  end;


implementation
uses
  Math;
{$R *.DFM}

procedure TfrmEditItem.reTranslationKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_RETURN then
    Key := 0;
end;

class function TfrmEditItem.Edit(const AItem:ITranslationItem; APos:TPoint):boolean;
var
  frm:TfrmEditItem;
  R:TRect;
begin
  frm := Self.Create(Application);
  try
    frm.reOriginal.Text := AItem.Original;
    frm.reTranslation.Text := AItem.Translation;
    frm.reTranslation.SelectAll;
    SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0);
    if APos.X < 0 then
      frm.Left := ((R.Right - R.Left) - frm.Width) div 2
    else
      frm.Left := APos.X;
    if APos.Y < 0 then
      frm.Top := ((R.Bottom - R.Top) - frm.Height) div 2
    else
      frm.Top := APos.Y;
    frm.Top := Min(Max(frm.Top, R.Top), R.Bottom - frm.Height);
    frm.Left := Min(Max(frm.Left, R.Left), R.Right - frm.Width);
    Result := frm.ShowModal = mrOK;
    if Result then
    begin
      AItem.Original := frm.reOriginal.Text;
      AItem.Translation := frm.reTranslation.Text;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmEditItem.TntFormKeyUp(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if ReturnKey and (Key = VK_RETURN) then
  begin
    Key := 0;
    ModalResult := mrOK;
  end
  else if Key = VK_ESCAPE then
    ModalResult := mrCancel;
  ReturnKey := false;
end;

procedure TfrmEditItem.TntFormKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  ReturnKey := false;
  if Key = VK_RETURN then
    ReturnKey := true;
end;

end.
