{@abstract(PO parser strings)}
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
// $Id: POParserConsts.pas 278 2007-11-05 20:34:05Z peter3 $
unit POParserConsts;

interface
uses
  TransIntf;

const
  cSectionName = 'POParser';
  cDefaultHeader =
    'Project-Id-Version: <PROJECT>\n' +
    'POT-Creation-Date: 2003-05-20 12:17\n' +
    'PO-Revision-Date: 2003-09-23 09:24+0100\n' +
    'Last-Translator: <none>\n' +
    'Language-Team: Unknown <unknown>\n' +
    'MIME-Version: 1.0\n' +
    'Content-Type: text/plain; charset=UTF-8\n' +
    'Content-Transfer-Encoding: 8bit';
  SImportTitle = 'Import from PO file';
  SExportTitle = 'Export to PO file';
  SConfigureTitle = 'Configure PO parser';
  SFileFilter = 'PO files (*.po;*.pot)|*.po;*.pot|All files|*.*';
  SFormCaption = 'PO Export Settings';
  SFileNameLabel = '&Filename:';
  SPreviewLabel = '&Preview (editable):';
  SCompileMOCaption = 'Compile to &MO:';
  SCompileMOHint = 'Command-line to invoke the MO compiler (msgfmt.exe by default).\r\nUse "%i" to insert the filename in "Filename" as the file to compile and use "%o" to change the input file extension to .mo.';
  SBrowseCaption = '...';
  SOK = 'OK';
  SCancel = 'Cancel';


var
  GlobalApplicationServices:IApplicationServices = nil;

function Translate(const Value:WideString):WideString;


implementation

function Translate(const Value:WideString):WideString;
begin
  if GlobalApplicationServices <> nil then
    Result := GlobalApplicationServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

end.
