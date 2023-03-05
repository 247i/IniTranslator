{@abstract(Single file select dialog for MS Dict Parser) }
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

// $Id: MSDictParserImportFrm.pas 211 2006-12-20 14:27:27Z peter3 $

unit MSDictParserImportFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TransIntf, TntClasses, TntForms, TntDialogs, TntStdCtrls,
  TntComCtrls;

type

  TfrmImport = class(TTntForm, IInterface, ILocalizable)
    Label1: TTntLabel;
    edFilename: TTntEdit;
    btnBrowse: TTntButton;
    btnOK: TTntButton;
    btnCancel: TTntButton;
    OpenDialog1: TTntOpenDialog;
    edSkipLines: TTntEdit;
    Label2: TTntLabel;
    udSkipLines: TTntUpDown;
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
    FCount:integer;
    FAppServices:IApplicationServices;
    function Translate(const Value:WideString):WideString;
  public
    { Public declarations }
    class function Execute(var AFilename: WideString; var SkipLines: integer; const ACaption, Filter, InitialDir, DefaultExt: WideString): boolean;overload;
    class function Execute(const ApplicationServices:IApplicationServices; var AFilename: WideString; var SkipLines: integer; const ACaption, Filter, InitialDir, DefaultExt: WideString): boolean;overload;
    function GetString(out Section: WideString; out Name: WideString; out Value: WideString): WordBool; safecall;
  end;

implementation

{$R *.dfm}

{ TfrmImport }

class function TfrmImport.Execute(var AFilename: WideString; var SkipLines: integer;
  const ACaption, Filter, InitialDir, DefaultExt: WideString): boolean;
begin
  Result := Execute(nil, AFilename, SkipLines, ACaption, Filter, InitialDir, DefaultExt);
end;

procedure TfrmImport.btnBrowseClick(Sender: TObject);
begin
  OpenDialog1.Filename := edFilename.Text;
  if OpenDialog1.Execute then
    edFilename.Text := OpenDialog1.Filename;
end;

class function TfrmImport.Execute(
  const ApplicationServices: IApplicationServices; var AFilename: WideString;
  var SkipLines: integer; const ACaption, Filter, InitialDir,
  DefaultExt: WideString): boolean;
var
  frmImport: TfrmImport;
begin
  frmImport := self.Create(Application);
  with frmImport do
  try
    FAppServices := ApplicationServices;
    Label1.Caption := Translate(Label1.Caption);
    Label2.Caption := Translate(Label2.Caption);
    btnBrowse.Caption := Translate(btnBrowse.Caption);
    btnOK.Caption := Translate(btnOK.Caption);
    btnCancel.Caption := Translate(btnCancel.Caption);
    Caption := Translate(ACaption);
    OpenDialog1.Title := Translate(OpenDialog1.Title);
    OpenDialog1.Filter := Translate(Filter);
    OpenDialog1.InitialDir := InitialDir;
    OpenDialog1.DefaultExt := DefaultExt;
    edFilename.Text := AFilename;
    udSkipLines.Position := SkipLines;
    Result := (ShowModal = mrOk) and FileExists(edFilename.Text);
    if Result then
    begin
      AFilename := edFilename.Text;
      SkipLines := udSkipLines.Position;
    end;
  finally
    Free;
  end;
end;

function TfrmImport.Translate(const Value: WideString): WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate('TMSDictParser', Value, Value)
  else
    Result := Value;
end;


function TfrmImport.GetString(out Section, Name,
  Value: WideString): WordBool;
begin
  Result := true;
  case FCount of
    0: Value := self.Caption;
    1: Value := Label1.Caption;
    2: Value := Label2.Caption;
    3: Value := btnBrowse.Caption;
    4: Value := btnOK.Caption;
    5: Value := btnCancel.Caption;
    6: Value := OpenDialog1.Title;
  else
    Result := false;
    FCount := 0;
  end;
  if Result then
    Inc(FCount);
  Section := 'TMsDictParser';
  Name := Value;
end;

end.

