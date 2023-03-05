{@abstract(Project file for Xilisoft parser) }
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

// $Id: XilisoftParser.dpr 176 2006-12-09 14:22:59Z peter3 $
library XilisoftParser;

uses
  SysUtils,
  Classes,
  TransIntf in '..\TransIntf.pas',
  DualImportFrm in '..\PluginCommon\DualImportFrm.pas' {frmDualImport},
  XilisoftParserImpl in 'XilisoftParserImpl.pas',
  XilisoftParserCfgForm in 'XilisoftParserCfgForm.pas' {XilisoftCfgForm},
  CommonUtils in '..\CommonUtils.pas',
  XiliSoftParserConsts in 'XiliSoftParserConsts.pas';

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TXilisoftParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;

begin
end.

