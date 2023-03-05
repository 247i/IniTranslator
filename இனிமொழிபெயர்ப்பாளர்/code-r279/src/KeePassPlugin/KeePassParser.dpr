{@abstract(app file for KeePass) }
{
  Copyright © 2006 by Peter Thornqvist; all rights reserved

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
// $Id: KeePassParser.dpr 212 2006-12-20 14:30:34Z peter3 $
library KeePassParser;

uses
  SysUtils,
  Classes,
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport},
  TransIntf in '..\TransIntf.pas',
  KeePassParserImpl in 'KeePassParserImpl.pas',
  CommonUtils in '..\CommonUtils.pas',
  SingleImportFrm in '..\PluginCommon\SingleImportFrm.pas' {frmSingleImport: TTntForm},
  KeePassParserLang in 'KeePassParserLang.pas',
  WideIniFiles in '..\WideIniFiles.pas';

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TKeePassParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.

