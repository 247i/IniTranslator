{@abstract(Tool plugin to view inconsistent translations) }
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

// $Id: ToolConsistency.dpr 176 2006-12-09 14:22:59Z peter3 $
library ToolConsistency;

uses
  SysUtils,
  Classes,
  ToolConsistencyImpl in 'ToolConsistencyImpl.pas',
  TransIntf in '..\TransIntf.pas',
  ToolConsistencyFrm in 'ToolConsistencyFrm.pas' {frmToolConsistency},
  WideIniFiles in '..\WideIniFiles.pas',
  ToolConsistencyConsts in 'ToolConsistencyConsts.pas';

{$R *.res}
function InstallPlugin(out ToolItems: IToolItems): HResult; stdcall;
begin
  ToolItems := TToolConsistencyPlugins.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransToolItemsFuncName;

begin
end.

