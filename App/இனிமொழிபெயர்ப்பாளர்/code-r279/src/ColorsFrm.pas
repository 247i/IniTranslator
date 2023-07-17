{@abstract(Color Selection Form) }
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
// $Id: ColorsFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit ColorsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, TntStdCtrls, AppOptions, ExtCtrls;

type
  TfrmColors = class(TfrmBase)
    btnCancel:TTntButton;
    btnOK:TTntButton;
    cbUntranslated:TColorBox;
    TntLabel1:TTntLabel;
    TntLabel2:TTntLabel;
    cbEvenRows:TColorBox;
    TntLabel3:TTntLabel;
    cbOddRows:TColorBox;
    TntLabel4:TTntLabel;
    cbUntranslatedFont:TColorBox;
    TntLabel5:TTntLabel;
    cbEvenRowFont:TColorBox;
    TntLabel6:TTntLabel;
    cbOddRowFont:TColorBox;
  private
    { Private declarations }
    procedure LoadOptions(Options:TAppOptions);
    procedure SaveOptions(Options:TAppOptions);
  public
    { Public declarations }
    class function Edit(Options:TAppOptions):boolean;
  end;

implementation

{$R *.dfm}

{ TfrmColors }

class function TfrmColors.Edit(Options:TAppOptions):boolean;
var
  frm:TfrmColors;
begin
  frm := self.Create(Application);
  try
    frm.LoadOptions(Options);
    Result := frm.ShowModal = mrOK;
    if Result then
      frm.SaveOptions(Options);
  finally
    frm.Free;
  end;
end;

procedure TfrmColors.LoadOptions(Options:TAppOptions);
begin
  cbUntranslated.Selected := Options.ColorUntranslated;
  cbUntranslatedFont.Selected := Options.ColorFontUntranslated;
  cbEvenRows.Selected := Options.ColorEvenRow;
  cbEvenRowFont.Selected := Options.ColorFontEvenRow;
  cbOddRows.Selected := Options.ColorOddRow;
  cbOddRowFont.Selected := Options.ColorFontOddRow;
end;

procedure TfrmColors.SaveOptions(Options:TAppOptions);
begin
  Options.ColorUntranslated := cbUntranslated.Selected;
  Options.ColorFontUntranslated := cbUntranslatedFont.Selected;
  Options.ColorEvenRow := cbEvenRows.Selected;
  Options.ColorFontEvenRow := cbEvenRowFont.Selected;
  Options.ColorOddRow := cbOddRows.Selected;
  Options.ColorFontOddRow := cbOddRowFont.Selected;
end;

end.
