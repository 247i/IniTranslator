{@abstract(Open and Save Dialogs that has extra "encoding" combobox) }
{
  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved.
  Parts Copyright (c) 2003 by Eyal Post; all rights reserved

  NOTE:
    The originally concept and code for these dialogs came from Eyal Post
    (author of VssConnexion and SourceConnexion, see more at http://www.epocalipse.com)
    and are used with permission.

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net: rewrote as self-contained dialog components

  Status:
   The contents of this file is subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: EncodingDlgs.pas 251 2007-08-14 17:39:28Z peter3 $
unit EncodingDlgs;
{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  TntForms, TntClasses, TntSysUtils, TntStdCtrls, TntDialogs;

type
  TfrmEncoding = class(TTntForm)
    cbEncodings:TTntComboBox;
    lblEncoding:TTntLabel;
    bvlTopLine:TBevel;
    chkHeader:TTntCheckBox;
    chkFooter:TTntCheckBox;
  private
    FParentWnd:HWND;
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;
  protected
    procedure Initialize; virtual;
  public
    constructor Create(OpenDialog:TTntOpenDialog); reintroduce;
    destructor Destroy; override;
  end;

  TEncodingOpenDialog = class(TTntOpenDialog)
  private
    FEncodingIndex, FSelectedIndex:integer;
    FEncodings:TTntStrings;
    FForm:TfrmEncoding;
    FEncodingLabel:WideString;
    FInsertFooter:boolean;
    FInsertHeader:boolean;
    procedure SetEncodingIndex(const Value:integer);
    procedure SetEncodings(const Value:TTntStrings);
  protected
    procedure DoShow; override;
    procedure DoClose; override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Execute:boolean; override;
  published
    property Encodings:TTntStrings read FEncodings write SetEncodings;
    property EncodingLabel:WideString read FEncodingLabel write FEncodingLabel;
    property EncodingIndex:integer read FEncodingIndex write SetEncodingIndex default 0;
    property InsertHeader:boolean read FInsertHeader write FInsertHeader;
    property InsertFooter:boolean read FInsertFooter write FInsertFooter;
  end;

  TEncodingSaveDialog = class(TEncodingOpenDialog)
  public
    function Execute:boolean; override;
  end;

resourcestring
  SEncoding = '&Encoding:';

implementation
uses
  Dlgs, CommDlg;

{$R *.DFM}

{ TfrmEncoding }

constructor TfrmEncoding.Create(OpenDialog:TTntOpenDialog);
begin
  FParentWnd := GetParent(OpenDialog.Handle);
  Initialize;
  chkHeader.Visible := OpenDialog is TEncodingSaveDialog;
  chkFooter.Visible := chkHeader.Visible;
end;

destructor TfrmEncoding.Destroy;
begin
  inherited;
end;

procedure TfrmEncoding.Initialize;
var
  DlgRect, DlgClientRect, OpenRect:TRect;
  hOpen, hItem:HWND;
begin
  CreateParented(FParentWnd);
  GetWindowRect(FParentWnd, DlgRect);
  Windows.GetClientRect(FParentWnd, DlgClientRect);
  Top := DlgClientRect.Bottom;
  Left := 0;
  // adjust for size bar (32 px should be enough)
  Width := DlgClientRect.Right - DlgClientRect.Left - 32;

  hItem := GetDlgItem(FParentWnd, cmb1);
  GetWindowRect(hItem, OpenRect);

  // adjust for border (4 px)
  cbEncodings.Left := OpenRect.Left - DlgRect.Left - 4;
  cbEncodings.Width := OpenRect.Right - OpenRect.Left;

  hItem := GetDlgItem(FParentWnd, stc2);
  GetWindowRect(hItem, OpenRect);
  lblEncoding.Left := OpenRect.Left - DlgRect.Left - 4;

//  bvlTopLine.Width := Width - 16;
//  bvlTopLine.Left := 8;

  hOpen := GetDlgItem(FParentWnd, IDOK);
  GetWindowRect(hOpen, OpenRect);
  Show;
  with DlgRect do
    MoveWindow(FParentWnd, Left, Top, Right - Left, Bottom - Top + Self.Height, true);
end;

procedure TfrmEncoding.WMNCDestroy(var Message:TWMNCDestroy);
begin
  inherited;
  Free;
end;

{ TEncodingOpenDialog }

constructor TEncodingOpenDialog.Create(AOwner:TComponent);
begin
  inherited;
  FEncodings := TTntStringlist.Create;
  FEncodingLabel := SEncoding;
end;

destructor TEncodingOpenDialog.Destroy;
begin
  FEncodings.Free;
  inherited;
end;

procedure TEncodingOpenDialog.DoClose;
begin
  if FForm <> nil then
  begin
    FSelectedIndex := FForm.cbEncodings.ItemIndex;
    InsertHeader := FForm.chkHeader.Checked;
    InsertFooter := FForm.chkFooter.Checked;
  end;
  FForm := nil;
  inherited;
end;

procedure TEncodingOpenDialog.DoShow;
begin
  FForm := TfrmEncoding.Create(Self);
  FForm.cbEncodings.Items.Assign(Encodings);
  FForm.cbEncodings.ItemIndex := EncodingIndex;
  FForm.lblEncoding.Caption := FEncodingLabel;
  FForm.chkHeader.Checked := InsertHeader;
  FForm.chkFooter.Checked := InsertFooter;

  if OptionsEx <> [] then
  begin
    // empirical...
//    FForm.lblEncoding.Left := FForm.lblEncoding.Left - 90;
//    FForm.cbEncodings.Left := FForm.cbEncodings.Left - 114;
//    FForm.cbEncodings.Width := FForm.cbEncodings.Width - 12;
  end;
  inherited;
end;

function TEncodingOpenDialog.Execute:boolean;
begin
  Result := inherited Execute;
  if Result then
    FEncodingIndex := FSelectedIndex
  else if CommDlgExtendedError = FNERR_INVALIDFILENAME then
    raise Exception.CreateFmt('Invalid filename specified "%s"', [Filename]);
end;

procedure TEncodingOpenDialog.SetEncodingIndex(const Value:integer);
begin
  FEncodingIndex := Value;
  if FForm <> nil then
    FForm.cbEncodings.ItemIndex := Value;
end;

procedure TEncodingOpenDialog.SetEncodings(const Value:TTntStrings);
begin
  FEncodings.Assign(Value);
  if FForm <> nil then
  begin
    FForm.cbEncodings.Items.Assign(Value);
    FForm.cbEncodings.ItemIndex := EncodingIndex;
  end;
end;

{ TEncodingSaveDialog }

function TEncodingSaveDialog.Execute:boolean;
begin
  if Win32PlatformIsUnicode then
    Result := DoExecuteW(@GetSaveFileNameW)
  else
    Result := DoExecute(@GetSaveFileNameA);
  if Result then
    FEncodingIndex := FSelectedIndex
  else if CommDlgExtendedError = FNERR_INVALIDFILENAME then
    raise Exception.CreateFmt('Invalid filename specified "%s"', [Filename]);
end;

end.

