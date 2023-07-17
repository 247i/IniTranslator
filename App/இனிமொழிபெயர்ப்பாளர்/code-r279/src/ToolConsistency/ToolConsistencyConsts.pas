{@abstract(Resourcestrings for ToolConsistency) }
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
// $Id: ToolConsistencyConsts.pas 190 2006-12-14 00:17:49Z peter3 $
unit ToolConsistencyConsts;

interface
const
  SLocalizeSectionName = 'TToolConsistency';
  SToolConsistencyAbout = 'This plugin checks and displays inconsistent translations';
  SToolConsistencyPluginDisplayName = 'Check translation consistency...';
  SToolConsistencyFormCaption = 'Consistency Checker';
  SToolConsistencyLabel1 = '&Inconsistent items:';
  SToolConsistencytvItemsHint = 'Press F2 to edit an item';
  SToolConsistencybtnClose = '&Close';
  SToolConsistencybtnCloseHint = 'Close this form';
  SToolConsistencybtnUpdate = '&Update';
  SToolConsistencybtnUpdateHint = 'Update the list';
  SToolConsistencychkIgnoreAccelChar = 'Ignore accelerator &key';
  SToolConsistencySynchronize = 'Synchronize accelerator with &original';
  SToolConsistencySynchronizeHint = 'Automatically insert missing accelerator key when editing.';
  SToolConsistencychkIgnoreAccelCharHint = 'Include/exclude accelerator key when displaying original items';
  SToolConsistencyUsethistranslation1 = 'Use &this translation';
  SToolConsistencyUsethistranslation1Hint = 'Use this translation for all items';
  SToolConsistencyEdit1 = 'Edit';
  SToolConsistencyEdit1Hint = 'Edit current item';
  SToolConsistencyIsConsistent = 'Congratulations! - No inconsistent items found!';
implementation

end.
