{@abstract(Form hosting KbdCfgFrame) }
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

// $Id: KbdCfgFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit KbdCfgFrm;

{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ComCtrls, Menus,
  BaseForm,
  TntActnList, KbdCfgFrame, TntForms;

type
  TfrmConfigKbd = class(TfrmBase)
    FrmKbdCfg1:TFrmKbdCfg;
    procedure FormCreate(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function EditShortCuts(AActionList:TTntActionList):boolean;
  end;

implementation
uses
  AppUtils, MsgTranslate;

{$R *.dfm}

class function TfrmConfigKbd.EditShortCuts(AActionList:TTntActionList):boolean;
var
  frmConfigKbd:TfrmConfigKbd;
begin
  frmConfigKbd := self.Create(Application);
  try
    if AActionList <> nil then
      AActionList.State := asSuspended;
    frmConfigKbd.FrmKbdCfg1.AdjustControls;
    frmConfigKbd.FrmKbdCfg1.EditShortCuts(AActionList);
    frmConfigKbd.ActiveControl := frmConfigKbd.FrmKbdCfg1.lbCategories;
    frmConfigKbd.ShowModal;
    Result := frmConfigKbd.FrmKbdCfg1.Modified;
    if AActionList <> nil then
      AActionList.State := asNormal;
  finally
    frmConfigKbd.Free;
  end;
end;

procedure TfrmConfigKbd.FormCreate(Sender:TObject);
begin
  FrmKbdCfg1.Align := alClient;
end;

end.
