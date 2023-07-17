{@abstract("Tool" Plugin displaying the content in a treeview) }
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

// $Id: ToolTreeView.dpr 56 2006-07-23 17:55:31Z peter3 $
library ToolTreeView;

uses
  SysUtils,
  Classes,
  TransIntf in '..\TransIntf.pas',
  ToolTreeViewImpl in 'ToolTreeViewImpl.pas',
  ToolTreeViewFrm in 'ToolTreeViewFrm.pas' {frmToolTreeView: TTntForm};

{$R *.res}
function InstallPlugin(out ToolItems: IToolItems): HResult; stdcall;
begin
  ToolItems := TToolTreeViewPlugins.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransToolItemsFuncName;

begin
end.
