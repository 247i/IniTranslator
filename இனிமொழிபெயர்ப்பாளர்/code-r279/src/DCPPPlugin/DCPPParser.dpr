{@abstract(Parser for DC++ language files) }
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

// $Id: DCPPParser.dpr 231 2006-12-25 20:42:32Z peter3 $
library DCPPParser;

uses
  SysUtils,
  Classes,
  DCPPParserImpl in 'DCPPParserImpl.pas',
  TransIntf in '..\TransIntf.pas',
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport: TTntForm},
  DCPPParserConsts in 'DCPPParserConsts.pas',
  CommonUtils in '..\CommonUtils.pas',
  WideIniFiles in '..\WideIniFiles.pas',
  DualImportFrm in '..\PluginCommon\DualImportFrm.pas' {frmDualImport: TTntForm};

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TDCPPParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.
