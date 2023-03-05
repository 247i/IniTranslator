{@abstract(Constants and global types for application) }
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
// $Id: AppConsts.pas 249 2007-08-14 16:29:55Z peter3 $
unit AppConsts;
{$I TRANSLATOR.INC}

interface

type
  TEncoding = (feAnsi, feUTF8, feUnicode, feUnicodeSwapped);

resourcestring
  SFmtAboutText =
    '%0:s, version %1:s: Copyright (c) 2003-%2:d by Peter Thörnqvist; all rights reserved'#10#10 +
    'Toolbars and menus courtesy of Toolbar2000.'#10#9'For more information, see http://www.jrsoftware.org/tb2k.php.'#10 +
    'Theme enabled toolbars and menus courtesy of TBX.'#10#9'For more information, see http://g32.org/tbx/index.html.'#10 +
    'Extra themes for TBX courtesy of Roy Magne Klever.'#10#9'For more information, see http://www.rmklever.com/delphitbx.'#10 +
    'Unicode enabled add-on package for Toolbar2000 and TBX courtesy of Silverpoint Development'#10#9'For more information, see http://club.telepolis.com/silverpointdev/sptbxlib.'#10 +
    'Unicode controls courtesy of Troy Wolbrink''s TNT controls.'#10#9'For more information, see http://www.tntware.com/delphicontrols/unicode/.'#10 +
    'Spell checker kindly donated by Addictive Software.'#10#9'For more info and additional dictionaries, see http://www.addictivesoftware.com'#10#10 +
    'This program is released subject to the MPL 1.1 license (http://www.mozilla.org/MPL/MPL-1.1.html for details)'#10'and come with absolutely no warranty of any kind.';

  SFmtAboutCaption = 'About %s...';
  SSavePrompt = 'The translation file has been modified, do you want to save it?';
  SFmtOriginalColumn = 'Original (%s)';
  SFmtTranslationColumn = 'Translation (%s)';
  SFmtTextNotFound = 'The text "%s" could not be found';
  SSearchFailCaption = 'Find';
  SAppTitle = 'Ini Translator';
  SModified = 'Modified';
  SReady = 'Ready';
  SOriginal = 'Original';
  STranslation = 'Translation';
  SInfoCaption = 'Information';
  SConfirmCaption = 'Confirm';
  SErrorCaption = 'Error';
  SErrDictEmpty = 'Dictionary is empty: create or load a dictionary first!';
  SDictCreated = 'Dictionary created and ready for use.';
  SClearDictPrompt = 'Clear current dictionary items first?';
  SFmtErrHelpNotFound = 'Unable to locate the help file (%s). Make sure the file exists and try again.';
  SDictInverted = 'inverted';
  SFmtFileNotFound = 'File "%s" not found: make sure the file exists and try again';
  SNotImplemented = 'This function is not yet implemented';
  SFmtFileChangedReloadPrompt = '"%s" has been changed outside the program, do you want to reload it?';
  SFmtItemsCount = '%d items';
  SSaveTranslationTemplate = 'Save Translation Template';
  SLanguageNotChangedUntilRestart = 'The language will not be changed until you restart the program';
  SDeleteItemText = 'Delete selected item?';
  SFmtKeyDetails = '[%0:s] - %1:s';
  SNoDictionary = '(no dictionary)';
  SDecodedCharsCaption = 'Decoded characters';
  SAsciiValue = 'ASCII Value(s):';
  SOpenOrigTitle = 'Open Original Language File';
  SOpenTransTitle = 'Open Translated Language File';
  SSaveTransTitle = 'Save Translated Language File As';
  SSaveOrigTitle = 'Save Original Language File As';
  SFileFilter = 'Language files|*.lng|Inno Setup files|*.isl|Ini files|*.ini;*.inf|Text files|*.txt:*.inc;*.bat;*.doc|All supported files|*.lng;' +
    '*.isl;*.ini;*.inf;*.txt;*.inc;*.bat;*.doc|All files |*.*';
  SAllFileFilter = 'All files (*.*)|*.*';

  SFmtCountOfCountTranslated = '%0:d of %1:d translated';
  SQCopyToClipboard = 'Copy to Clipboard?';
  // KbdCfgFrame
  SNotAssigned = '(not assigned)';
  SAssignedTo = 'Assigned to:';
  SNoCategory = '(none)';

  { TfrmImportExport }
  SImportCaption = 'Import';
  SImportLabelCaption = 'Available &plugins:';
  SImportButtonCaption = '&Import';
  SExportCaption = 'Export';
  SExportLabelCaption = 'Available &plugins:';
  SExportButtonCaption = '&Export';
  SNoPluginsAvaliable = 'There are no plugins to show.';
  SPluginError = 'Plugin Error';
  SSaveDictPrompt = 'Save modifications to the dictionary?';
  SArgumentsPrompt = 'Arguments:';
  SFmtErrToolExec = 'Failed to execute "%s %s": %s';
  SFmtNewToolName = '(New Tool %d)';
  SFmtErrCreateFile = 'Could not create file "%s".'#13#10'Please check that the file is writable and that you have sufficient permissions to create and modify files in the affected folder.';

  SPromptDeleteItem = 'Delete selected item?';
  SConfirmDelete = 'Confirm Delete';
  SCaptionEditItem = 'Edit Item';
  SCaptionAddItem = 'Add Item';

  SErrSectionEmpty = 'Section cannot be empty';
  SErrNameEmpty = 'Name cannot be empty';
  SErrOrigTextEmpty = 'Original text cannot be empty';
  SErrSectionNameExists = 'An item with the specified Section and Name already exists';
  SDictTranslationCompleted = 'Translating with dictionary finished';
  SSelectLanguageFile = 'Select a language file';
  SSelectHelpFile = 'Select a help file';
  SFmtSaveItemsNoName = 'Some items (%d) could not be saved as they had no Original value';
  SConfirmRemoveOrphans = 'Saving the translation now will remove any orphaned items from the file. Continue anyway?';
  SFmtOrphansCount = '%d orphan(s)';
  SImportedPromptToExport = 'The current items seems to have been imported. Do you want to export them instead?';
  SUndoText = 'Undo text';
  SNothingToUndo = 'Nothing to undo';
  SUndoAdd = 'Undo add';
  SUndoEdit = 'Undo edit';
  SUndoDelete = 'Undo delete';


const
  SLngExt = 'lng';
  SANSI = 'ANSI';
  SUTF8 = 'UTF-8';
  SUnicode = 'Unicode';

  cTranslatedCommentImage = 56;
  cUntranslatedCommentImage = 57;
  cDefaultItemImage = 58;
  cDefaultUntranslatedImage = 59;
  cArrowUp = 48;
  cArrowDown = 49;
  cOrigMonitor = 0;
  cTransMonitor = 1;
  cDictMonitor = 2;
  cRegToolbarKey = '\Software\Peter3\Ini Translator\Toolbars';
  cRegMRUKey = '\Software\Peter3\Ini Translator\';
  cIniToolbarKey = 'Toolbars';
  cIniMRUKey = 'MRU';
  cArgsMacros:array[0..18] of PWideChar =
  (
    '$(OrigLine)',
    '$(OrigText)',
    '$(OrigPath)',
    '$(OrigDir)',
    '$(OrigName)',
    '$(OrigExt)',
    '$(TransLine)',
    '$(TransText)',
    '$(TransPath)',
    '$(TransDir)',
    '$(TransName)',
    '$(TransExt)',
    '$(DictPath)',
    '$(DictDir)',
    '$(DictName)',
    '$(DictExt)',
    '$(AppDir)',
    '$(WinDir)',
    '$(SysDir)'
    );
  cDirMacros:array[0..5] of PWideChar =
  (
    '$(OrigDir)',
    '$(TransDir)',
    '$(DictDir)',
    '$(AppDir)',
    '$(WinDir)',
    '$(SysDir)'
    );
  cTrimOriginal = 0;
  cTrimTranslation = 1;
  cTrimLeading = 0;
  cTrimTrailing = 1;
  cTrimBoth = 2;

  cDictUse = 0;
  cDictAdd = 1;
  cDictIgnore = 2;
  cDictCancel = 3;

  cUndoAdd = 0;
  cUndoEdit = 1;
  cUndoDelete = 2;

implementation

end.
