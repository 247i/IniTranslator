{@abstract(Export to PO file dialog w. preview. Also has opition to compile to mo file) }

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
// $Id: POExportFrm.pas 250 2007-08-14 16:42:00Z peter3 $

unit POExportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ActnList, TntForms, TntClasses, TntComCtrls,
  TntDialogs, TntActnList, TntStdCtrls;

type
  TfrmPOExport = class(TTntForm)
    lblFilename:TTntLabel;
    edFilename:TTntEdit;
    btnBrowse:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    rePreview:TTntRichEdit;
    lblPreview:TTntLabel;
    alPOExport:TTntActionList;
    acSaveFile:TTntAction;
    SaveDialog1:TTntSaveDialog;
    chkCompileMO:TTntCheckBox;
    edMOCmdLine:TTntEdit;
    procedure acSaveFileExecute(Sender:TObject);
    procedure alPOExportUpdate(Action:TBasicAction; var Handled:Boolean);
    procedure chkCompileMOClick(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Edit(var AFilename, ACmdLine:string;
      var CompileMO:Boolean; Preview:TTntStrings):boolean;
  end;

implementation
uses
  POParserConsts;

{$R *.dfm}

procedure TfrmPOExport.acSaveFileExecute(Sender:TObject);
begin
  SaveDialog1.Filename := edFilename.Text;
  if SaveDialog1.Execute then
    edFilename.Text := SaveDialog1.Filename;
end;

procedure TfrmPOExport.alPOExportUpdate(Action:TBasicAction;
  var Handled:Boolean);
begin
  btnOK.Enabled := (edFilename.Text <> '');
end;

class function TfrmPOExport.Edit(var AFilename, ACmdLine:string;
  var CompileMO:Boolean; Preview:TTntStrings):boolean;
var
  frmPOExport:TfrmPOExport;
{  function MakeValidComments(Strings:TStrings):WideString;
  var i:integer;
  begin
    Result := '';
    for i := 0 to Strings.Count - 1 do
      if (Strings[i] <> '') and (Strings[i][1] <> '#') then
        Result := Result + '#' + Strings[i] + SLineBreak
      else
        Result := Result + Strings[i] + SLineBreak;
  end;
  }
begin
  frmPOExport := self.Create(Application);
  with frmPOExport do
  try
    edFilename.Text := AFilename;
    edMOCmdLine.Text := ACmdLine;
    rePreview.Lines := Preview;
    rePreview.SelStart := 0;
    SendMessage(rePreview.Handle, EM_SCROLLCARET, 0, 0);
    chkCompileMO.Checked := CompileMO;
    Caption := Translate(SFormCaption);
    lblFileName.Caption := Translate(SFileNameLabel);
    lblPreview.Caption := Translate(SPreviewLabel);
    chkCompileMO.Caption := Translate(SCompileMOCaption);
    edMOCmdLine.Hint := Translate(SCompileMOHint);
    btnBrowse.Caption := Translate(SBrowseCaption);
    btnOK.Caption := Translate(SOK);
    btnCancel.Caption := Translate(SCancel);
    Result := ShowModal = mrOK;
    if Result then
    begin
      AFilename := edFilename.Text;
      Preview.Assign(rePreview.Lines);
      ACmdLine := edMOCmdLine.Text;
      CompileMO := chkCompileMO.Checked;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPOExport.chkCompileMOClick(Sender:TObject);
begin
  edMOCmdLine.Enabled := chkCompileMO.Checked;
end;

end.
