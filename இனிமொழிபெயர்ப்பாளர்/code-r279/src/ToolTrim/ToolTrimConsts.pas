{@abstract(Resourcestrings for ToolTrim) }
{
  Copyright © 2006 by Peter Thörnqvist; all rights reserved

  Developer(s):
    peter3 - peter3 att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}
// $Id: ToolTrimConsts.pas 250 2007-08-14 16:42:00Z peter3 $
unit ToolTrimConsts;

interface
uses
  TransIntf;

const
  SSectionName = 'ToolTrim';
  SToolTrimAbout = 'This plugin trims leading and trailing whitespaces and other characters';
  SToolTrimPluginDisplayName = 'Trim...';
  SFormCaption = 'Trim Options';
  STrimWhatLabel = 'Trim wh&at:';
  STrimWhereLabel = 'Trim wh&ere:';
  STrimHowLabel = 'Trim h&ow:';
  STrimWhiteSpace = 'Trim additional &whitespace also';
  STrimWhereOptions = 'Original\r\nTranslation\r\nBoth';
  STrimHowOptions = 'Leading\r\nTrailing\r\nBoth';
  SOK = 'OK';
  SCancel = 'Cancel';

var
  GlobalAppServices:IApplicationServices = nil;

function Translate(const Value:WideString):WideString;

implementation

function Translate(const Value:WideString):WideString;
begin
  if GlobalAppServices <> nil then
    Result := GlobalAppServices.Translate(SSectionName, Value, Value)
  else
    Result := Value;
end;

end.
