{@abstract(Base form for all forms and dialogs in the application)) }
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

// $Id: BaseForm.pas 249 2007-08-14 16:29:55Z peter3 $

unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms;

type
  TfrmBase = class(TTntForm)
  private
    { Private declarations }
  protected
    procedure LoadFormPos; virtual;
    procedure SaveFormPos; virtual;

  public
    { Public declarations }
    procedure AfterConstruction; override;
    function CloseQuery:Boolean; override;
  end;

var
  frmBase:TfrmBase;

implementation
uses
  AppUtils, AppOptions;

{$R *.dfm}

{ TfrmBase }

procedure TfrmBase.AfterConstruction;
begin
  inherited;
  if Application <> nil then
  begin
    ShowHint := Application.ShowHint;
    if (Application.MainForm <> nil) and (Application.MainForm <> Self) then
      Self.Font := Application.MainForm.Font;
  end;
  GlobalLanguageFile.TranslateObject(Self, ClassName);
  LoadFormPos;
  FixXPStyles(self);
end;

function TfrmBase.CloseQuery:Boolean;
begin
  SaveFormPos;
  Result := inherited CloseQuery;
end;

procedure TfrmBase.LoadFormPos;
var
  W:TAppWindowInfo;
begin
  if (Self = Application.MainForm) and IsIconic(Application.Handle) or IsZoomed(Handle) then
    ShowWindow(Handle, SW_RESTORE);
  W := GlobalAppOptions.WindowInfos[Self];
  if (W.WindowState = wsMinimized) and (Self = Application.MainForm) then
    ShowWindow(Application.Handle, SW_MINIMIZE);
  WindowState := W.WindowState;
  if WindowState = wsNormal then
  begin
      // set default (screen center)
    SetBounds((Screen.Width - Width) div 2, (Screen.Height - Height) div 2, Width, Height);
    if BorderStyle in [bsSizeable, bsSizeToolWin] then
      BoundsRect := W.BoundsRect
    else
    begin
      Top := W.BoundsRect.Top;
      Left := W.BoundsRect.Left;
    end;
  end;
end;

procedure TfrmBase.SaveFormPos;
var
  W:TAppWindowInfo;
begin
  W.Name := self.Name;
  W.WindowState := WindowState;
  W.BoundsRect := BoundsRect;
  GlobalAppOptions.WindowInfos[self] := W;
  inherited;
end;

end.
