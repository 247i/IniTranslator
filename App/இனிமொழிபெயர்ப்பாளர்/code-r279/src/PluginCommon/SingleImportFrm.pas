{@abstract(Generic single file select dialog) }
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

// $Id: SingleImportFrm.pas 278 2007-11-05 20:34:05Z peter3 $

unit SingleImportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TransIntf, TntForms, TntDialogs, TntStdCtrls;

type
  TfrmSingleImport = class(TTntForm, IInterface, ILocalizable)
    lblFilename:TTntLabel;
    edFilename:TTntEdit;
    btnBrowse:TTntButton;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    OpenDialog1:TTntOpenDialog;
    procedure btnBrowseClick(Sender:TObject);
  private
    { Private declarations }
    FAppServices:IApplicationServices;
    FCount:integer;
    function Translate(const Value:WideString):WideString;
  public
    { Public declarations }
    class function Execute(var AFilename:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean; overload;
    class function Execute(const ApplicationServices:IApplicationServices; var AFilename:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean; overload;
    function GetString(out Section, Name, Value:WideString):WordBool; safecall;

  end;

implementation

{$R *.dfm}

{ TfrmImport }

class function TfrmSingleImport.Execute(var AFilename:WideString; const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean;
begin
  Result := Execute(nil, AFilename, ACaption, Filter, InitialDir, DefaultExt);
end;

procedure TfrmSingleImport.btnBrowseClick(Sender:TObject);
begin
  OpenDialog1.Filename := edFilename.Text;
  if OpenDialog1.Execute then
    edFilename.Text := OpenDialog1.Filename;
end;

class function TfrmSingleImport.Execute(const ApplicationServices:IApplicationServices; var AFilename:WideString;
  const ACaption, Filter, InitialDir, DefaultExt:WideString):boolean;
var
  frmImport:TfrmSingleImport;
begin
  frmImport := self.Create(Application);
  with frmImport do
  try
    FAppServices := ApplicationServices;
    if ACaption <> '' then
      Caption := Translate(ACaption)
    else
      Caption := Translate(Caption);
    OpenDialog1.Filter := Translate(Filter);
    OpenDialog1.InitialDir := InitialDir;
    OpenDialog1.DefaultExt := DefaultExt;
    OpenDialog1.Title := Translate(OpenDialog1.Title);
    
    lblFilename.Caption := Translate(lblFilename.Caption);
    btnOK.Caption := Translate(btnOK.Caption);
    btnCancel.Caption := Translate(btnCancel.Caption);
    edFilename.Text := AFilename;
    Result := (ShowModal = mrOk) and FileExists(edFilename.Text);
    if Result then
      AFilename := edFilename.Text;
  finally
    Free;
  end;

end;

function TfrmSingleImport.Translate(const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(self.ClassName, Value, Value)
  else
    Result := Value;
end;

function TfrmSingleImport.GetString(out Section, Name,
  Value:WideString):WordBool;
begin
  Result := true;
  case FCount of
    0:Value := self.Caption;
    1:Value := lblFilename.Caption;
    2:Value := btnBrowse.Caption;
    3:Value := btnOK.Caption;
    4:Value := btnCancel.Caption;
    5:Value := OpenDialog1.Title;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := ClassName;
  Name := Value;

end;

end.
