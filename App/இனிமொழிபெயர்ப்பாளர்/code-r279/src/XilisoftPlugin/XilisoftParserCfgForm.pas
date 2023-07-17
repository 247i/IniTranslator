{
  Copyright © 2006 by Alexander Kornienko; all rights reserved

  Developer(s):
    Korney San - kora att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: XilisoftParserCfgForm.pas 250 2007-08-14 16:42:00Z peter3 $
unit XilisoftParserCfgForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, TransIntf;

type
  TXilisoftCfgForm = class(TTntForm)
    TCB1:TTntCheckBox;
    TntButton1:TTntButton;
    procedure TntButton1Click(Sender:TObject);
  private
    { Private declarations }
    FApplicationServices:IApplicationServices;
  public
    { Public declarations }
    property ApplicationServices:IApplicationServices read FApplicationServices write FApplicationServices;
    class function Edit(const ApplicationServices:IApplicationServices; var Checked:boolean):boolean;
  end;

implementation

uses
  IniFiles, XiliSoftParserConsts;

{$R *.dfm}

procedure TXilisoftCfgForm.TntButton1Click(Sender:TObject);
begin
  if TCB1.Checked then
    ModalResult := mrYes
  else
    ModalResult := mrNo;
end;

class function TXilisoftCfgForm.Edit(
  const ApplicationServices:IApplicationServices; var Checked:boolean):boolean;
var
  frm:TXilisoftCfgForm;
begin
  frm := self.Create(Application);
  try
    if ApplicationServices <> nil then
    begin
      frm.Caption := ApplicationServices.Translate(SLocalizeSectionName, SFormCaption, SFormCaption);
      frm.TCB1.Caption := ApplicationServices.Translate(SLocalizeSectionName, SCheckBoxCaption, SCheckBoxCaption);
      frm.TntButton1.Caption := ApplicationServices.Translate(SLocalizeSectionName, SButtonCaption, SButtonCaption);
    end;
    frm.TCB1.Checked := Checked;
    Result := frm.ShowModal = mrOK;
    if Result then
      Checked := frm.TCB1.Checked
  finally
    frm.Free;
  end;
end;

end.
