{@abstract(Main form for INI Translator) }

{
  Copyright © 2003 by Peter Thornqvist; all rights reserved

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
// $Id: MainFrm.pas 269 2007-10-21 15:49:52Z peter3 $
unit MainFrm;
{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, ActnList, StdActns, ImgList,
  // app specific
  BaseForm, FileMonitor, MsgTranslate, AppOptions,
  AppConsts, TranslateFile, TransIntf, Dictionary,
  FindReplaceFrm, EncodingDlgs, ToolItems, WideIniFiles, UndoList,

{$IFDEF USEADDICTSPELLCHECKER}
  // addict spell checker (www.addictive-software.com)
  ad3Spell, ad3SpellBase, ad3Configuration, ad3ConfigurationDialogCtrl, ad3SpellLanguages, ad3ParserBase, ad3Ignore,
{$ENDIF USEADDICTSPELLCHECKER}
  // TNT controls (http://home.ccci.org/wolbrink/tnt/delphi_unicode_controls.htm)
  TntStdCtrls, TntComCtrls, TNTClasses, TNTSysUtils,
  TntActnList, TntExtCtrls, TntDialogs, TntStdActns,
  // Toolbar2000 (http://www.jrsoftware.org)
  TB2Item, TB2Dock, TB2Toolbar, TB2ToolWindow, TB2MRU,
  // TBX (http://g32.org)
  TBX, TBXExtItems, TB2ExtItems, TBXSwitcher,
  TBXDefaultTheme, TBXOfficeXPTheme, TBXAluminumTheme, TBXStripesTheme, TBXStatusBars,
  // additional TBX themes (http://www.rmklever.com)
{$IFDEF USEOLDTBX}
  TBXOffice11XPTheme, TBXOffice11AdaptiveTheme, TBXTristanTheme, TBXTristan2Theme,
  TBXAthenTheme, TBXMonaiXPTheme, TBXMonaiTheme,
  TBXNewOfficeTheme, TBXNewOfficeAdaptiveTheme, TBXDreamTheme,
  TBXEosTheme, TBXOffice2007Theme,
  TBXNexos2Theme, TBXNexos3Theme, TBXNexos4Theme, TBXNexos5Theme, TBXNexosXTheme,
  TBXOfficeCTheme, TBXOfficeKTheme, TBXReliferTheme, TBXRomaTheme,
  TBXSentimoXTheme, TBXUxThemes, TBXXitoTheme,
  TBXToolPals, TBXLists,
  TBXDefaultXPTheme, TBXWhidbeyTheme, TBXZezioTheme,
  //
  // TBXOfficeXPGradientTheme,
  // TBXOffice2003Theme,
  //  TBXDock2003,
  // TBXBlueGradientXPTheme,
  //
{$ENDIF USEOLDTBX}
  // SpTBXLib (http://club.telepolis.com/silverpointdev/sptbxlib)
  TBXDkPanels, SpTBXItem, SpTBXEditors, SpTBXControls;

const
  WM_DELAYLOADED = WM_USER + 1001;

type
  TfrmMain = class(TfrmBase)
    sbBottom: TTBXStatusBar;
    alMain:TTntActionList;
    acOpenOrig:TTntAction;
    acOpenTrans:TTntAction;
    acSaveTrans:TTntAction;
    acSaveTransAs:TTntAction;
    acExit:TTntAction;
    acPrev:TTntAction;
    acNext:TTntAction;
    acCopyFromOriginal:TTntAction;
    acAbout:TTntAction;
    acToggleFocus:TTntAction;
    acFocusTranslation:TTntAction;
    acFind:TTntAction;
    acFindNext:TTntAction;
    acReplace:TTntAction;
    acNextUntranslated:TTntAction;
    acPrevUntranslated:TTntAction;
    acFocusListView:TTntAction;
    acFocusOriginal:TTntAction;
    acShowQuotes:TTntAction;
    acRestoreSort:TTntAction;
    acDictSave:TTntAction;
    acDictLoad:TTntAction;
    SaveDictDlg:TTntSaveDialog;
    OpenDictDlg:TTntOpenDialog;
    acDictCreate:TTntAction;
    acDictTranslate:TTntAction;
    il16:TImageList;
    acDictInvert:TTntAction;
    acHelp:TTntAction;
    acNewTrans:TTntAction;
    acCreateTranslationFile:TTntAction;
    acCopyAllFromOrig:TTntAction;
    acViewDetails:TTntAction;
    acCut:TTntAction;
    acCopy:TTntAction;
    acPaste:TTntAction;
    acSelectAll:TTntEditSelectAll;
    acUndo:TTntAction;
    TopDock:TSpTBXDock;
    tbMenu:TSpTBXToolbar;
    mnuFile:TSpTBXSubmenuItem;
    OpenOriginal1:TSpTBXItem;
    ClearTranslation1:TSpTBXItem;
    OpenTranslation1:TSpTBXItem;
    SaveTranslation1:TSpTBXItem;
    SaveTranslationAs1:TSpTBXItem;
    N1:TSpTBXSeparatorItem;
    SelectLanguage1:TSpTBXItem;
    N11:TSpTBXSeparatorItem;
    Exit1:TSpTBXItem;
    Edit1:TSpTBXSubmenuItem;
    acCopyFromOriginal1:TSpTBXItem;
    Find1:TSpTBXItem;
    FindNext1:TSpTBXItem;
    Replace1:TSpTBXItem;
    N8:TSpTBXSeparatorItem;
    ToggleFocus1:TSpTBXItem;
    N9:TSpTBXSeparatorItem;
    Navigation1:TSpTBXSubmenuItem;
    Previous1:TSpTBXItem;
    Next1:TSpTBXItem;
    About2:TSpTBXSeparatorItem;
    Previousuntranslated1:TSpTBXItem;
    Nextuntranslated1:TSpTBXItem;
    N4:TSpTBXSeparatorItem;
    ShowQuotes1:TSpTBXItem;
    Unsort1:TSpTBXItem;
    N10:TSpTBXSeparatorItem;
    ShowDetails1:TSpTBXItem;
    Dictionary1:TSpTBXSubmenuItem;
    LoadDictionary1:TSpTBXItem;
    SaveDictionary1:TSpTBXItem;
    N5:TSpTBXSeparatorItem;
    CreateDictionary1:TSpTBXItem;
    N6:TSpTBXSeparatorItem;
    Translatewithdictionary1:TSpTBXItem;
    acDictInvert1:TSpTBXItem;
    Help1:TSpTBXSubmenuItem;
    Help2:TSpTBXItem;
    N7:TSpTBXSeparatorItem;
    About1:TSpTBXItem;
    TBSeparatorItem3:TSpTBXSeparatorItem;
    TBDock1:TSpTBXDock;
    TBDock2:TSpTBXDock;
    TBDock3:TSpTBXDock;
    TBItem5:TSpTBXItem;
    TBItem6:TSpTBXItem;
    TBItem7:TSpTBXItem;
    TBSeparatorItem6:TSpTBXSeparatorItem;
    acCopyFromName:TTntAction;
    TBItem13:TSpTBXItem;
    acPreferences:TTntAction;
    acViewComments:TTntAction;
    TBItem14:TSpTBXItem;
    TBSeparatorItem8:TSpTBXSeparatorItem;
    acAsciiValues:TTntAction;
    TBItem16:TSpTBXItem;
    popEdit:TSpTBXPopupMenu;
    Undo1:TSpTBXItem;
    N13:TSpTBXSeparatorItem;
    Cut1:TSpTBXItem;
    Copy1:TSpTBXItem;
    Paste1:TSpTBXItem;
    N14:TSpTBXSeparatorItem;
    SelectAll1:TSpTBXItem;
    TBSeparatorItem9:TSpTBXSeparatorItem;
    TBItem17:TSpTBXItem;
    popList:TSpTBXPopupMenu;
    TBItem20:TSpTBXItem;
    TBItem21:TSpTBXItem;
    TBItem24:TSpTBXItem;
    TBItem25:TSpTBXItem;
    TBSeparatorItem14:TSpTBXSeparatorItem;
    tbTools:TSpTBXToolbar;
    TBItem1:TSpTBXItem;
    TBSeparatorItem2:TSpTBXSeparatorItem;
    TBItem2:TSpTBXItem;
    TBItem3:TSpTBXItem;
    TBItem4:TSpTBXItem;
    TBSeparatorItem1:TSpTBXSeparatorItem;
    TBItem12:TSpTBXItem;
    TBItem10:TSpTBXItem;
    TBItem8:TSpTBXItem;
    TBSeparatorItem7:TSpTBXSeparatorItem;
    TBItem9:TSpTBXItem;
    TBItem11:TSpTBXItem;
    TBSeparatorItem12:TSpTBXSeparatorItem;
    TBItem18:TSpTBXItem;
    TBItem19:TSpTBXItem;
    TBSeparatorItem4:TSpTBXSeparatorItem;
    TBItem27:TSpTBXItem;
    TBSeparatorItem5:TSpTBXSeparatorItem;
    TBItem29:TSpTBXItem;
    MRUFiles:TTBXMRUList;
    TBMRUListItem1:TTBXMRUListItem;
    miRecentlyUsed:TSpTBXSubmenuItem;
    acClearMRU:TTntAction;
    acClearInvalidMRU:TTntAction;
    TBSeparatorItem15:TSpTBXSeparatorItem;
    TBItem31:TSpTBXItem;
    TBItem32:TSpTBXItem;
    TBSeparatorItem16:TSpTBXSeparatorItem;
    acFindUnmatchedShortCut:TTntAction;
    acHome:TTntAction;
    acEnd:TTntAction;
    acPageUp:TTntAction;
    acPageDown:TTntAction;
    TBSubmenuItem2:TSpTBXSubmenuItem;
    TBItem36:TSpTBXItem;
    ilBookmarks:TImageList;
    acGotoBookmark1:TTntAction;
    acGotoBookmark2:TTntAction;
    acGotoBookmark4:TTntAction;
    acGotoBookmark5:TTntAction;
    acGotoBookmark6:TTntAction;
    acGotoBookmark7:TTntAction;
    acGotoBookmark8:TTntAction;
    acGotoBookmark9:TTntAction;
    acGotoBookmark0:TTntAction;
    acToggleBookmark1:TTntAction;
    acToggleBookmark2:TTntAction;
    acToggleBookmark3:TTntAction;
    acToggleBookmark4:TTntAction;
    acToggleBookmark5:TTntAction;
    acToggleBookmark6:TTntAction;
    acToggleBookmark7:TTntAction;
    acToggleBookmark8:TTntAction;
    acToggleBookmark9:TTntAction;
    acToggleBookmark0:TTntAction;
    acGotoBookmark3:TTntAction;
    TBSubmenuItem3:TSpTBXSubmenuItem;
    TBSubmenuItem4:TSpTBXSubmenuItem;
    TBItem22:TSpTBXItem;
    TBItem23:TSpTBXItem;
    TBItem26:TSpTBXItem;
    TBItem28:TSpTBXItem;
    TBItem30:TSpTBXItem;
    TBItem37:TSpTBXItem;
    TBItem38:TSpTBXItem;
    TBItem39:TSpTBXItem;
    TBItem40:TSpTBXItem;
    TBItem41:TSpTBXItem;
    TBItem42:TSpTBXItem;
    TBItem43:TSpTBXItem;
    TBItem44:TSpTBXItem;
    TBItem45:TSpTBXItem;
    TBItem46:TSpTBXItem;
    TBItem47:TSpTBXItem;
    TBItem48:TSpTBXItem;
    TBItem49:TSpTBXItem;
    TBItem50:TSpTBXItem;
    TBItem51:TSpTBXItem;
    alBookmarks:TTntActionList;
    TBSeparatorItem10:TSpTBXSeparatorItem;
    acClearAllTranslations:TTntAction;
    acReplaceEverywhere:TTntAction;
    TBSeparatorItem11:TSpTBXSeparatorItem;
    TBItem52:TSpTBXItem;
    TBItem53:TSpTBXItem;
    TBItem54:TSpTBXItem;
    acNextSuspicious:TTntAction;
    TBItem55:TSpTBXItem;
    TBItem56:TSpTBXItem;
    acViewOrphans:TTntAction;
    ThemeSwitcher:TTBXSwitcher;
    TBXSeparatorItem1:TSpTBXSeparatorItem;
    acSaveOrigAs:TTntAction;
    TBXItem1:TSpTBXItem;
    acConfigureKeyboard:TTntAction;
    TBXSeparatorItem2:TSpTBXSeparatorItem;
    TBXItem2:TSpTBXItem;
    TBXSeparatorItem3:TSpTBXSeparatorItem;
    TBXVisibilityToggleItem1:TSpTBXItem;
    acImport:TTntAction;
    acExport:TTntAction;
    TBXSeparatorItem4:TSpTBXSeparatorItem;
    TBXItem3:TSpTBXItem;
    TBXItem4:TSpTBXItem;
    acToggleTranslated:TTntAction;
    TBXSeparatorItem5:TSpTBXSeparatorItem;
    TBXItem5:TSpTBXItem;
    pnlBack:TTntPanel;
    splitHorz:TSplitter;
    pnlBottom:TTntPanel;
    pnlTrans:TTntPanel;
    lblTrans:TTntLabel;
    reTranslation:TTntRichEdit;
    pnlOrig:TTntPanel;
    lblOrig:TTntLabel;
    reOriginal:TTntRichEdit;
    lvTranslateStrings:TTntListView;
    pnlKeyBack:TTntPanel;
    pnlKeyDetails:TTntPanel;
    lblViewDetails: TTntLabel;
    acTestExceptionHandler:TTntAction;
    acDictAdd:TTntAction;
    TBXItem6:TSpTBXItem;
    TBXItem7:TSpTBXItem;
    acFullScreen:TTntAction;
    TBXItem8:TSpTBXItem;
    TBXSeparatorItem6:TSpTBXSeparatorItem;
    smiDictionary:TSpTBXSubmenuItem;
    acSpellCheck:TTntAction;
    tbxSpellCheck:TSpTBXItem;
    acToolsCustomize:TTntAction;
    TBXItem10:TSpTBXItem;
    mnuTools:TSpTBXSubmenuItem;
    acNoRichEditTntAction:TTntAction;
    acDeleteItem:TTntAction;
    acEditItem:TTntAction;
    acAddItem:TTntAction;
    TBXSeparatorItem7:TSpTBXSeparatorItem;
    TBXItem9:TSpTBXItem;
    TBXItem11:TSpTBXItem;
    TBXItem12:TSpTBXItem;
    acSaveOriginal:TTntAction;
    TBXItem13:TSpTBXItem;
    acConfigSuspicious:TTntAction;
    TBXItem15:TSpTBXItem;
    acDictEdit:TTntAction;
    TBXItem16:TSpTBXItem;
    TBXSeparatorItem8:TSpTBXSeparatorItem;
    mnuPlugins:TSpTBXSubmenuItem;
    pbTranslated:TTntProgressBar;
    mnuThemes:TSpTBXSubmenuItem;
    mnuThemesGroup:TSpTBXThemeGroupItem;
    acMakeConsistent:TTntAction;
    SpTBXItem1:TSpTBXItem;
    SpTBXSeparatorItem1:TSpTBXSeparatorItem;
    SpTBXItem2:TSpTBXItem;
    SpTBXItem3:TSpTBXItem;
    SpTBXSeparatorItem2:TSpTBXSeparatorItem;
    procedure FormCreate(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:boolean);
    procedure lvTranslateStringsChange(Sender:TObject; Item:TListItem;
      Change:TItemChange);
    procedure reTranslationExit(Sender:TObject);
    procedure lvTranslateStringsData(Sender:TObject; Item:TListItem);
    procedure acExitExecute(Sender:TObject);
    procedure acOpenOrigExecute(Sender:TObject);
    procedure acOpenTransExecute(Sender:TObject);
    procedure acSaveTransExecute(Sender:TObject);
    procedure acSaveTransAsExecute(Sender:TObject);
    procedure acPrevExecute(Sender:TObject);
    procedure acNextExecute(Sender:TObject);
    procedure acCopyFromOriginalExecute(Sender:TObject);
    procedure reTranslationEnter(Sender:TObject);
    procedure acAboutExecute(Sender:TObject);
    procedure lvTranslateStringsEnter(Sender:TObject);
    procedure acToggleFocusExecute(Sender:TObject);
    procedure acFocusTranslationExecute(Sender:TObject);
    procedure acFindExecute(Sender:TObject);
    procedure acFindNextExecute(Sender:TObject);
    procedure acReplaceExecute(Sender:TObject);
    procedure lvTranslateStringsAdvancedCustomDrawItem(
      Sender:TCustomListView; Item:TListItem; State:TCustomDrawState;
      Stage:TCustomDrawStage; var DefaultDraw:boolean);
    procedure acNextUntranslatedExecute(Sender:TObject);
    procedure acPrevUntranslatedExecute(Sender:TObject);
    procedure acFocusListViewExecute(Sender:TObject);
    procedure acFocusOriginalExecute(Sender:TObject);
    procedure acShowQuotesExecute(Sender:TObject);
    procedure alMainUpdate(Action:TBasicAction; var Handled:boolean);
    procedure lvTranslateStringsColumnClick(Sender:TObject;
      Column:TListColumn);
    procedure acRestoreSortExecute(Sender:TObject);
    procedure pnlBottomResize(Sender:TObject);
    procedure acDictSaveExecute(Sender:TObject);
    procedure acDictLoadExecute(Sender:TObject);
    procedure acDictCreateExecute(Sender:TObject);
    procedure acDictTranslateExecute(Sender:TObject);
    procedure acDictInvertExecute(Sender:TObject);
    procedure acDictAddExecute(Sender:TObject);
    procedure acHelpExecute(Sender:TObject);
    procedure lvTranslateStringsDataFind(Sender:TObject; Find:TItemFind;
      const FindString:WideString; const FindPosition:TPoint;
      FindData:Pointer; StartIndex:integer; Direction:TSearchDirection;
      Wrap:boolean; var Index:integer);
    procedure acNewTransExecute(Sender:TObject);
    procedure acCreateTranslationFileExecute(Sender:TObject);
    procedure acCopyAllFromOrigExecute(Sender:TObject);
    procedure acViewDetailsExecute(Sender:TObject);
    procedure acPasteUpdate(Sender:TObject);
    procedure reTranslationKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure acCopyFromNameExecute(Sender:TObject);
    procedure acPreferencesExecute(Sender:TObject);
    procedure acViewCommentsExecute(Sender:TObject);
    procedure acAsciiValuesExecute(Sender:TObject);
    procedure lvTranslateStringsInfoTip(Sender:TObject; Item:TListItem;
      var InfoTip:string);
    procedure MRUFilesClick(Sender:TObject; const FileName:string);
    procedure acClearMRUExecute(Sender:TObject);
    procedure acClearInvalidMRUExecute(Sender:TObject);
    procedure mnuFileSelect(Sender:TTBCustomItem; Viewer:TTBItemViewer;
      Selecting:boolean);
    procedure acFindUnmatchedShortCutExecute(Sender:TObject);
    procedure acHomeExecute(Sender:TObject);
    procedure acEndExecute(Sender:TObject);
    procedure acPageUpExecute(Sender:TObject);
    procedure acPageDownExecute(Sender:TObject);
    procedure GotoBookmarkExecute(Sender:TObject);
    procedure ToggleBookmarkExecute(Sender:TObject);
    procedure acClearAllTranslationsExecute(Sender:TObject);
    procedure acReplaceEverywhereExecute(Sender:TObject);
    procedure acNextSuspiciousExecute(Sender:TObject);
    procedure acViewOrphansExecute(Sender:TObject);
    procedure acCutExecute(Sender:TObject);
    procedure acCopyExecute(Sender:TObject);
    procedure acPasteExecute(Sender:TObject);
    procedure acSelectAllExecute(Sender:TObject);
    procedure acUndoExecute(Sender:TObject);
    procedure acSaveOrigAsExecute(Sender:TObject);
    procedure acConfigureKeyboardExecute(Sender:TObject);
    procedure acImportExecute(Sender:TObject);
    procedure acExportExecute(Sender:TObject);
    procedure acToggleTranslatedExecute(Sender:TObject);
    procedure acTestExceptionHandlerExecute(Sender:TObject);
    procedure acFullScreenExecute(Sender:TObject);
    procedure popEditPopup(Sender:TObject);
    procedure acToolsCustomizeExecute(Sender:TObject);
    procedure acAddItemExecute(Sender:TObject);
    procedure acEditItemExecute(Sender:TObject);
    procedure acDeleteItemExecute(Sender:TObject);
    procedure acSaveOriginalExecute(Sender:TObject);
    procedure lvTranslateStringsDblClick(Sender:TObject);
    procedure acConfigSuspiciousExecute(Sender:TObject);
    procedure acDictEditExecute(Sender:TObject);
    procedure mnuPluginsPopup(Sender:TTBCustomItem; FromLink:Boolean);
    procedure acMakeConsistentExecute(Sender:TObject);
    procedure mnuToolsPopup(Sender:TTBCustomItem; FromLink:Boolean);
  private
    { Private declarations }
    OpenOrigDlg, OpenTransDlg:TEncodingOpenDialog;
    SaveTransDlg, SaveOrigDlg:TEncodingSaveDialog;
    FFindReplace:TFindReplace;
    FTranslateFile:TTranslateFiles;
    FLastFindText, FLastFolder:WideString;
    FCommandProcessor, FModified, FIsImport:boolean;
    FUndoList:TUndoList;

    FDictionary:TDictionaryItems;
    FFileMonitors:array of TFileMonitorThread;
    FBookmarks:array[0..9] of integer;
    FImportIndex, FCapabilitesSupported:integer;
    FExternalToolItems:TExternalToolItems;
{$IFDEF USEADDICTSPELLCHECKER}
    adSpellChecker:TAddictSpell3;
{$ENDIF USEADDICTSPELLCHECKER}
    FNotify:TInterfaceList;

    function NotifyChanging(Msg, WParam, LParam:integer):WordBool;
    procedure NotifyChanged(Msg, WParam, LParam:integer);
{$IFDEF USEADDICTSPELLCHECKER}

    procedure SpellCheckComplete(Sender:TObject);
    procedure CreateSpellChecker;
    procedure SpellCheckGetString(Sender:TObject;
      LanguageString:TSpellLanguageString; var Text:string);
    procedure SpellCheckWordCheck(Sender:TObject; const
      Word:string; var CheckType:TWordCheckType; var Replacement:string);
    procedure SpellCheckExecute(Sender:TObject);
{$ENDIF USEADDICTSPELLCHECKER}

    // returns true if it's OK to continue
    function CheckModified:boolean;
    function DoExport:boolean;
    function CheckDictModified:boolean;
    function CheckOrphans:boolean;
    procedure LoadSettings(FirstLoad:boolean);
    procedure SetUpLangFile;
    procedure LoadTranslate;
    procedure SaveSettings;
    procedure CreateEverything;
    procedure FreeEverything;
    function CloseApp:boolean;
    function LoadOriginal(const FileName:WideString; Encoding:TEncoding):TEncoding;
    function LoadTranslation(const FileName:WideString; Encoding:TEncoding):TEncoding;
    function SaveTranslation(const FileName:WideString; Encoding:TEncoding; const InsertHeader:boolean = false; const InsertFooter:boolean = false):boolean;
    function SaveTranslationAs(const FileName:WideString; Encoding:TEncoding):boolean;
    function SaveOriginal(const FileName:WideString; Encoding:TEncoding; const InsertHeader:boolean = false; const InsertFooter:boolean = false):boolean;
    function SaveOrigAs(const FileName:WideString; Encoding:TEncoding):boolean;
    procedure SetModified(const Value:boolean);
    function GetModified:boolean;
    function SearchFromCurrent(const FindText:WideString; CaseSense, WholeWord,
      Down, Fuzzy:boolean; FindIn:TFindIn):TTntListItem;
    procedure UpdateStatus;
    function AddQuotes(const S:WideString):WideString;
    function RemoveQuotes(const S:WideString; AForce:boolean = false):WideString;
    procedure CreateDict(ClearList:boolean);
    procedure LoadDictionary(const FileName:WideString);
    procedure SaveDictionary(const FileName:WideString);
    procedure HandleCommandLine;
    // performs a command
    // returns false if the application should be terminated
    function ProcessCommand(const ACommand:WideString):boolean;
    // lods a file with commands and calls ProcessCommand for each row
    procedure ProcessCommands(const CommandFile:WideString);
    procedure DoMonitoredFileChange(Sender:TObject; const FileName:WideString; var AContinue, AReset:boolean);
    procedure DoThreadTerminate(Sender:TObject);
    procedure StartMonitor(var AMonitor:TFileMonitorThread;
      const AFileName:WideString);
    procedure StopMonitor(var AMonitor:TFileMonitorThread);
    procedure UseDictionary;
    procedure DoWriteObject(Sender, AnObject:TObject; const APropName:WideString;
      var ASection, AName, AValue:WideString);
    procedure DoSaveExtra(Sender:TObject; ini:TWideCustomIniFile);
    procedure DoAllowWriting(Sender, AnObject:TObject; const APropName:WideString; var ATranslate:boolean);
    procedure DoReadObject(Sender, AnObject:TObject; const PropName, Section:WideString; var Value:WideString);
    procedure ScrollToTop;
    procedure SaveEditChanges;
    function GetFilename(const Filename:WideString):WideString;
    procedure MoveCommentWindow;
    procedure WMDropFiles(var Message:TWmDropFiles); message WM_DROPFILES;
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMDelayLoaded(var Message:TMessage); message WM_DELAYLOADED;
    procedure MoveListViewSelection(Index:integer);
    // bookmark support
    // either toggles bookmark on/off or moves bookmark from current index to new index
    procedure ToggleBookmark(Bookmark, Index:integer);
    // moves focus to Bookmark
    procedure GotoBookmark(Bookmark:integer);
    // clears all bookmarks
    procedure ClearBookmarks;
    // returns the bookmark for item at Index
    function GetBookmark(Index:integer):integer;
    procedure DoFindNext(Sender:TObject);
    procedure DoFindReplace(Sender:TObject);
    procedure DoFindReplaceAll(Sender:TObject);
    procedure CreateDialogs;
    procedure AddMRUFiles(const OriginalFileName, TranslationFilename:WideString);
    procedure OpenMRUFiles(const FileName:WideString);
    function MRUFilesExists(const FileName:WideString):boolean;
    procedure DoCommentModified(Sender:TObject; const AText:WideString);
    procedure UpdateColumn(Index:integer; const AFileName:WideString);
    procedure DoTranslateSuggestionClick(Sender:TObject);
    procedure BuildToolMenu(Parent:TTBCustomItem);
    procedure BuildExternalToolMenu(Parent:TTBCustomItem);

    procedure DoToolMenuClick(Sender:TObject);
    procedure DoTestToolClick(Sender:TObject; Tool:TToolItem);
    function MacroReplace(const AMacros:WideString):WideString;
    procedure ExecuteTool(ATool:TToolItem);
    function QueryArgs(const Title, CmdLine:WideString; var Args:WideString):boolean;
    procedure DoMacroReplace(Sender:TObject; var Args:WideString);

    procedure GetSections(Strings:TTntStringlist);
    procedure CheckBookMarkImages;
    procedure AddItem(const Section, Original, Translation, OrigComments, TransComments:WideString); overload;
    procedure AddItem(AItem:ITranslationItem); overload;
    procedure InsertItem(AItem:ITranslationItem);
    procedure DeleteItem(Index:integer); overload;
    procedure DeleteItem(const Item:ITranslationItem); overload;
    procedure DoExternalToolClick(Sender:TObject);
    function GetSelectedItem:ITranslationItem;
    procedure SetSelectedItem(const Value:ITranslationItem);
    function GetSelectedListItem:TTntListItem;
    procedure SetSelectedListItem(const Value:TTntListItem);
    procedure MakeTranslationsConsistent;
    function SelectOriginal(ShowDialog, ShowTransDialog:boolean):boolean;
    function SelectTranslation(ShowDialog, CalledByOrig:boolean):boolean;
    procedure DoMergeOrphans(Sender:TObject);
    procedure DoUndoEvent(Sender:TObject; AItem:TUndoItem);
    procedure AddUndo(const Item:ITranslationItem; Description:WideString; UndoType:integer);
  public
    function GetItems:ITranslationItems;
    function GetOrphans:ITranslationItems;
    function GetAppHandle:Cardinal;
    function GetMainFormHandle:Cardinal;
    function GetDictionaryItems:IDictionaryItems;
    function GetHeader:WideString;
    procedure SetHeader(const Value:WideString);
    function GetFooter:WideString;
    procedure SetFooter(const Value:WideString);
    function GetAppOption(const Section, Name, Default:WideString):WideString; safecall;
    procedure SetAppOption(const Section, Name, Value:WideString); safecall;
    procedure RegisterNotify(const ANotify:INotify); safecall;
    procedure UnRegisterNotify(const ANotify:INotify); safecall;
    function BeginUpdate:Integer; safecall;
    function EndUpdate:Integer; safecall;
    function Translate(const Section, Name, Value:WideString):WideString;
{
    property Items:ITranslationItems read GetItems;
    property Orphans:ITranslationItems read GetOrphans;
    property Dictionary:IDictionaryItems read GetDictionaryItems;
    property AppHandle:Cardinal read GetAppHandle;
    property TranslationService:ITranslationService read GetTranslationService;
    property Header:WideString read GetHeader write SetHeader;
    property Footer:WideString read GetFooter write SetFooter;
}
    {IApplication end}

    { Public declarations }
    property Modified:boolean read GetModified write SetModified;
    property SelectedItem:ITranslationItem read GetSelectedItem write SetSelectedItem;
    property SelectedListItem:TTntListItem read GetSelectedListItem write SetSelectedListItem;
  end;

var
  frmMain:TfrmMain;

implementation
uses
  ShellAPI, TntWindows, TntClipbrd, TntWideStrUtils,
{$IFDEF USEADDICTSPELLCHECKER}
  ad3ParseEngine,
{$ENDIF USEADDICTSPELLCHECKER}
  AppUtils, CommonUtils, OptionsFrm, CommentsFrm, OrphansFrm, ApplicationServices,
  KbdCfgFrame, KbdCfgFrm, ImportExportFrm, ExtToolsFrm, PromptArgsFrm,
  EditItemFrm, SuspiciousConfigFrm, DictTranslationSelectDlg,
  DictEditFrm, ColorsFrm;

{$R *.dfm}
var
  FApplicationServices:IApplicationServices = nil;

function InternalApplicationServicesFunc:IApplicationServices;
begin
  Result := FApplicationServices;
end;

type
  TTranslationUndoItem = class(TUndoData)
  private
    FItem:ITranslationItem;
  public
    constructor Create(const Items:ITranslationItems; const Item:ITranslationItem);
    property Item:ITranslationItem read FItem;
  end;

{ TTranslationUndoItem }

constructor TTranslationUndoItem.Create(const Items:ITranslationItems;
  const Item:ITranslationItem);
begin
  inherited Create;
  FItem := Items.CreateItem;
  FItem.Index := Item.Index;
  FItem.Translated := Item.Translated;
  FItem.TransComments := Item.TransComments;
  FItem.OrigComments := Item.OrigComments;
  FItem.Original := Item.Original;
  FItem.Translation := Item.Translation;
  FItem.Section := Item.Section;
  FItem.Name := Item.Name;
  FItem.PrivateStorage := Item.PrivateStorage;
  FItem.PreData := Item.PreData;
  FItem.PostData := Item.PostData;
  FItem.Modified := Item.Modified;
end;

{ TfrmMain }
// frmMain support routines

procedure TfrmMain.LoadSettings(FirstLoad:boolean);
var
  m:boolean;
begin
  WaitCursor;
  // only options that can be changed from the options dialog needs to be reset, so these are only set once
  if FirstLoad then
  begin
    FUndoList := TUndoList.Create;
    FUndoList.OnUndo := DoUndoEvent;
    CreateDialogs;
    if WideFileExists(GlobalAppOptions.OriginalFile) then
      LoadOriginal(GlobalAppOptions.OriginalFile, TEncoding(GlobalAppOptions.OrigEncoding)); // ??
    if WideFileExists(GlobalAppOptions.TranslationFile) then
      LoadTranslation(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding)); // ??
    if WideFileExists(GlobalAppOptions.DictionaryFile) then
      LoadDictionary(GlobalAppOptions.DictionaryFile);

    Caption := GlobalAppOptions.AppTitle;
    Application.Title := Caption;
    pnlBottom.Height := GlobalAppOptions.SplitterPosition;
    TBIniLoadPositions(Self, GetUserAppOptionsFile, cIniToolbarKey);
    // Find replace dialog
    FFindReplace.FindHistory.CommaText := trim(GlobalAppOptions.FindHistory);
    FFindReplace.ReplaceHistory.CommaText := trim(GlobalAppOptions.ReplaceHistory);
    FFindReplace.FindText := GlobalAppOptions.FindText;
    FFindReplace.ReplaceText := GlobalAppOptions.ReplaceText;
    FFindReplace.MatchLine := GlobalAppOptions.MatchLine;
    FFindReplace.MatchCase := GlobalAppOptions.MatchCase;
    FFindReplace.SearchUp := GlobalAppOptions.SearchUp;
    FFindReplace.FuzzySearch := GlobalAppOptions.FuzzySearch;

    FFindReplace.OnFindNext := DoFindNext;
    FFindReplace.OnReplace := DoFindReplace;
    FFindReplace.OnReplaceAll := DoFindReplaceAll;

    // don't load mru until translation is loaded or the filenames might get "decoded"
    TBMRULoadFromIni(MRUFiles);
    // load shortcuts
    LoadActionShortCutsFromFile(alMain, GetUserShortcutFile);

    // must call ThemeSwitcher manually: cbThemes.OnChange is not triggered when assigning directly to Text property
    ThemeSwitcher.Theme := GlobalAppOptions.Theme;
    PostMessage(Handle, WM_DELAYLOADED, Handle, 0);
    acRestoreSortExecute(nil);
    LoadTranslate;
  end;

  UpdateColumn(0, GlobalAppOptions.OriginalFile);
  UpdateColumn(1, GlobalAppOptions.TranslationFile);

  lvTranslateStrings.Font.Name := GlobalAppOptions.FontName;
  lvTranslateStrings.Font.Size := GlobalAppOptions.FontSize;

  reOriginal.Font := lvTranslateStrings.Font;
  reOriginal.Color := GlobalAppOptions.ColorUntranslated;
  reOriginal.DefAttributes.Assign(reOriginal.Font);
  reOriginal.DefAttributes.Color := GlobalAppOptions.ColorFontUntranslated;
  m := reTranslation.Modified;
  try
    reTranslation.Font := lvTranslateStrings.Font;
    reTranslation.DefAttributes.Assign(reTranslation.Font);
  finally
    reTranslation.Modified := m;
  end;
  lblViewDetails.Font.Name := GlobalAppOptions.FontName;
  
  Application.ShowHint := GlobalAppOptions.ShowToolTips;
  Application.HintShortCuts := GlobalAppOptions.ShowToolTipShortCuts;
  ShowHint := Application.ShowHint;
  FDictionary.IgnorePunctuation := GlobalAppOptions.DictIgnoreSpeedKeys;
  if GlobalAppOptions.ShowQuotes <> acShowQuotes.Checked then
    acShowQuotes.Execute;
  if acDictInvert.Checked <> GlobalAppOptions.InvertDictionary then
    acDictInvert.Execute;
  if acViewDetails.Checked <> GlobalAppOptions.ShowDetails then
    acViewDetails.Execute;
  lvTranslateStrings.Invalidate;
{$IFNDEF USEADDICTSPELLCHECKER}
  acSpellCheck.Enabled := false;
  acSpellCheck.Visible := false;
  acSpellCheck.Tag := ACTION_HIDDEN_TAG;
{$ELSE}
  acSpellCheck.Enabled := true;
  acSpellCheck.Visible := true;
  acSpellCheck.Tag := 0;
  acSpellCheck.OnExecute := SpellCheckExecute;
{$ENDIF}
  FTranslateFile.StartSection := GlobalAppOptions.SectionStart[1];
  FTranslateFile.EndSection := GlobalAppOptions.SectionEnd[1];
  FTranslateFile.SeparatorChars := GlobalAppOptions.SeparatorChars;
end;

procedure TfrmMain.SaveSettings;
var
  W:TAppWindowInfo;
begin
  if FCommandProcessor then
    Exit;
  WaitCursor;
  W.BoundsRect := BoundsRect;
  if IsIconic(Application.Handle) then
    W.WindowState := wsMinimized
  else
    W.WindowState := WindowState;
  GlobalAppOptions.WindowInfos[Self] := W;

  GlobalAppOptions.ShowQuotes := acShowQuotes.Checked;
  GlobalAppOptions.AppTitle := SAppTitle;
  GlobalAppOptions.SplitterPosition := pnlBottom.Height;
  GlobalAppOptions.InvertDictionary := acDictInvert.Checked;
  GlobalAppOptions.ShowDetails := acViewDetails.Checked;
  GlobalAppOptions.ShowToolTips := Application.ShowHint;
  //  GlobalAppOptions.ShowToolTipShortCuts := Application.HintShortCuts;
  GlobalAppOptions.FontName := reOriginal.Font.Name;
  GlobalAppOptions.FontSize := reOriginal.Font.Size;

  if (frmComments <> nil) then
    GlobalAppOptions.PinCommentWindow := frmComments.Pinned;
  // find / replace dialog
  FFindReplace.FindHistory.Text := trim(FFindReplace.FindHistory.Text);
  FFindReplace.ReplaceHistory.Text := trim(FFindReplace.ReplaceHistory.Text);
  GlobalAppOptions.FindHistory := FFindReplace.FindHistory.CommaText;
  GlobalAppOptions.ReplaceHistory := FFindReplace.ReplaceHistory.CommaText;
  GlobalAppOptions.FindText := FFindReplace.FindText;
  GlobalAppOptions.ReplaceText := FFindReplace.ReplaceText;
  GlobalAppOptions.MatchLine := FFindReplace.MatchLine;
  GlobalAppOptions.MatchCase := FFindReplace.MatchCase;
  GlobalAppOptions.SearchUp := FFindReplace.SearchUp;
  GlobalAppOptions.FuzzySearch := FFindReplace.FuzzySearch;
  GlobalAppOptions.FindInIndex := Ord(FFindReplace.FindInIndex);
  GlobalAppOptions.Theme := ThemeSwitcher.Theme;

  TBIniSavePositions(Self, GetUserAppOptionsFile, cIniToolbarKey);
  TBMRUSaveToIni(MRUFiles);
  try
    SaveActionShortCutsToFile(alMain, GetUserShortcutFile);
  except
    on E:Exception do
      HandleFileCreateException(Self, E, GetUserShortcutFile);
  end;
end;

function TfrmMain.ProcessCommand(const ACommand:WideString):boolean;
var
  tmp, tmp2:WideString;
  i:integer;
begin
  Result := true;
  i := Pos(WideChar(' '), ACommand);

  if i > 0 then
  begin
    tmp := trim(Copy(ACommand, 1, i - 1));
    tmp2 := ExpandUNCFileName(RemoveQuotes(trim(Copy(ACommand, i + 1, MaxInt)), true));
  end
  else
  begin
    tmp := trim(ACommand);
    tmp2 := '';
  end;
  if WideSameText('OPENORIG', tmp) and WideFileExists(tmp2) then
    LoadOriginal(tmp2, feAnsi)
  else if WideSameText('OPENORIGUC', tmp) and WideFileExists(tmp2) then
    LoadOriginal(tmp2, feUnicode)
  else if WideSameText('OPENORIGUTF8', tmp) and WideFileExists(tmp2) then
    LoadOriginal(tmp2, feUTF8)
  else if WideSameText('OPENTRANS', tmp) and WideFileExists(tmp2) then
    LoadTranslation(tmp2, feAnsi)
  else if WideSameText('OPENTRANSUC', tmp) and WideFileExists(tmp2) then
    LoadTranslation(tmp2, feUnicode)
  else if WideSameText('OPENTRANSUTF8', tmp) and WideFileExists(tmp2) then
    LoadTranslation(tmp2, feUTF8)
  else if WideSameText('OPENDICT', tmp) and WideFileExists(tmp2) then
    LoadDictionary(tmp2)
  else if WideSameText('SAVETRANS', tmp) then
  begin
    if (tmp2 = '') then
      ErrMsg('SAVETRANS called with empty Filename', _(ClassName, SErrorCaption))
    else
    begin
      ForceDirectories(ExtractFilePath(tmp2));
      SaveTranslation(tmp2, feAnsi);
    end;
  end
  else if WideSameText('SAVETRANSUC', tmp) then
  begin
    if (tmp2 = '') then
      ErrMsg('SAVETRANSUC called with empty Filename', _(ClassName, SErrorCaption))
    else
    begin
      ForceDirectories(ExtractFilePath(tmp2));
      SaveTranslation(tmp2, feUnicode);
    end;
  end
  else if WideSameText('SAVETRANSUTF8', tmp) then
  begin
    if (tmp2 = '') then
      ErrMsg('SAVETRANSUTF8 called with empty Filename', _(ClassName, SErrorCaption))
    else
    begin
      ForceDirectories(ExtractFilePath(tmp2));
      SaveTranslation(tmp2, feUTF8);
    end;
  end
  else if WideSameText('SAVEDICT', tmp) then
  begin
    if (tmp2 = '') then
      ErrMsg('SAVEDICT called with empty Filename', _(ClassName, SErrorCaption))
    else
    begin
      ForceDirectories(ExtractFilePath(tmp2));
      SaveDictionary(tmp2);
    end;
  end
  else if WideSameText('CREATEDICT', tmp) then
    CreateDict(false)
  else if WideSameText('CLEARDICT', tmp) then
    FDictionary.Clear
  else if WideSameText('USEDICT', tmp) then
    UseDictionary
  else if WideSameText('INVERTDICT', tmp) then
    acDictInvert.Execute
  else if WideSameText('QUIT', tmp) then
    Result := false;
end;

procedure TfrmMain.ProcessCommands(const CommandFile:WideString);
var
  S:TTntStringlist;
  i:integer;
begin
  if not WideFileExists(CommandFile) then
    ErrMsg(WideFormat(_(ClassName, SFmtFileNotFound), [CommandFile]), _(ClassName, SErrorCaption))
  else
  begin
    WaitCursor;
    FCommandProcessor := true;
    ShowWindow(Application.Handle, SW_HIDE);
    SendMessage(Handle, WM_SETREDRAW, 0, 0);
    try
      S := TTntStringlist.Create;
      try
        S.LoadFromFile(CommandFile);
        for i := 0 to S.Count - 1 do
          if not ProcessCommand(S[i]) then
          begin
            CloseApp;
            Application.Terminate;
            Halt(0); // Close is not fast enough
            Exit; // this will skip the ShowWindow below
          end;
      finally
        S.Free;
      end;
    finally
      FCommandProcessor := false;
    end;
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    ShowWindow(Application.Handle, SW_SHOW);
    ShowWindow(Handle, SW_SHOW);
    SendMessage(Handle, WM_SETREDRAW, 1, 0);
  end;
end;

procedure TfrmMain.HandleCommandLine;
var
  S:AnsiString;
begin
  UpdateColumn(0, '');
  UpdateColumn(1, '');
  if GetCmdSwitchValue('b', ['-', '/'], S, true) then // /b<commandfile>
    ProcessCommands(ExpandUNCFileName(S))
  else if (ParamCount >= 1) then // <orig> <trans> <dict>
  begin
    if (ParamCount >= 1) then
    begin
      S := ExpandUNCFileName(ParamStr(1));
      if WideFileExists(S) then
        LoadOriginal(S, DetectEncoding(S));
      if (ParamCount >= 2) then
      begin
        S := ExpandUNCFileName(ParamStr(2));
        if WideFileExists(S) then
          LoadTranslation(S, DetectEncoding(S));
      end
      else if WideFileExists(GlobalAppOptions.TranslationFile) then
        LoadTranslation(GlobalAppOptions.TranslationFile, DetectEncoding(GlobalAppOptions.TranslationFile));
    end;
    if (ParamCount >= 3) then
    begin
      S := ExpandUNCFileName(ParamStr(3));
      if WideFileExists(S) then
        LoadDictionary(S);
    end;
  end;
  UpdateStatus;
  Modified := false;
end;

function TfrmMain.LoadOriginal(const FileName:WideString; Encoding:TEncoding):TEncoding;
begin
  WaitCursor;
  Result := Encoding;

  if not NotifyChanging(NOTIFY_ITEM_FILE_OPEN, Ord(false), Integer(PWideChar(Filename))) then
    Exit;
  if not CheckModified then
    Exit;
  FUndoList.Clear;
  if WideFileExists(Filename) and not FCommandProcessor then
  begin
    FCapabilitesSupported := 0;
    FIsImport := false;
//    AddMRUFiles(FileName, GlobalAppOptions.TranslationFile);
  end;

  StopMonitor(FFileMonitors[cOrigMonitor]);

  ScrollToTop;
  reOriginal.Clear;
  reTranslation.Clear;
  lvTranslateStrings.Items.Count := 0;

  GlobalAppOptions.OriginalFile := Filename;
  GlobalAppOptions.OrigEncoding := Ord(Encoding);
  FLastFolder := WideExtractFilePath(Filename);

  Result := FTranslateFile.LoadOriginal(FileName, Encoding);
  NotifyChanged(NOTIFY_ITEM_FILE_OPEN, Ord(false), Integer(PWideChar(Filename)));
  GlobalAppOptions.OrigEncoding := Ord(Result);
  StartMonitor(FFileMonitors[cOrigMonitor], Filename);

  if not FCommandProcessor then
  begin
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    lvTranslateStrings.Invalidate;
  end;
  UpdateStatus;
  acRestoreSortExecute(nil);
end;

function TfrmMain.LoadTranslation(const FileName:WideString; Encoding:TEncoding):TEncoding;
begin
  WaitCursor;
  Result := Encoding;
  if not NotifyChanging(NOTIFY_ITEM_FILE_OPEN, Ord(true), Integer(PWideChar(Filename))) then
    Exit;
  if not CheckModified then
    Exit;
  FUndoList.Clear;
  StopMonitor(FFileMonitors[cTransMonitor]);
  reOriginal.Clear;
  reTranslation.Clear;
  ScrollToTop;
  lvTranslateStrings.Items.Count := 0;

  GlobalAppOptions.TranslationFile := Filename;
  GlobalAppOptions.TransEncoding := Ord(Encoding);
  FLastFolder := WideExtractFilePath(Filename);

  AddMRUFiles(GlobalAppOptions.OriginalFile, FileName);

  Result := FTranslateFile.LoadTranslation(FileName, Encoding);
  FIsImport := false;
  NotifyChanged(NOTIFY_ITEM_FILE_OPEN, Ord(true), Integer(PWideChar(Filename)));
  GlobalAppOptions.TransEncoding := Ord(Result);
  StartMonitor(FFileMonitors[cTransMonitor], FileName);
  lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
  lvTranslateStrings.Invalidate;

  if Visible then
  begin
    if lvTranslateStrings.CanFocus then
      lvTranslateStrings.SetFocus;
    lvTranslateStringsEnter(nil);
    if reTranslation.CanFocus then
    begin
      reTranslation.SetFocus;
      reTranslation.SelectAll;
    end;
  end;
  Modified := false;
  UpdateStatus;
  acRestoreSortExecute(nil);
end;

function TfrmMain.SaveTranslation(const FileName:WideString; Encoding:TEncoding;
  const InsertHeader:boolean = false; const InsertFooter:boolean = false):boolean;
var
  i:integer;
begin
  Result := false;
  if not CheckOrphans then
    Exit;

  if FileName = '' then
  begin
    Result := SaveTranslationAs(FileName, Encoding);
    Exit;
  end;
  if DoExport then
    Exit;

  WaitCursor;
  i := lvTranslateStrings.ItemIndex;

  if not NotifyChanging(NOTIFY_ITEM_FILE_SAVE, Ord(true), Integer(PWideChar(Filename))) then
  begin
    Result := false;
    Exit;
  end;

  // stop the monitor thread
  StopMonitor(FFileMonitors[cTransMonitor]);
  // avoid false alarms when original = translation
  StopMonitor(FFileMonitors[cOrigMonitor]);
  SaveEditChanges;
  //  DeleteFile(Filename); // clear old content
  try
    if InsertHeader then
      FTranslateFile.Header := GlobalAppOptions.Header.Text
    else
      FTranslateFile.Header := '';
    if InsertFooter then
      FTranslateFile.Footer := GlobalAppOptions.Footer.Text
    else
      FTranslateFile.Footer := '';
    FTranslateFile.SaveTranslation(FileName, Encoding);
    NotifyChanged(NOTIFY_ITEM_FILE_SAVE, Ord(true), Integer(PWideChar(Filename)));
  except
    on E:Exception do
      HandleFileCreateException(Self, E, FileName);
  end;
  GlobalAppOptions.TranslationFile := Filename;
  GlobalAppOptions.TransEncoding := Ord(Encoding);
  FLastFolder := WideExtractFilePath(Filename);

  UpdateColumn(1, FileName);
  Result := true;
  Modified := false;
  // resume the monitor thread
  StartMonitor(FFileMonitors[cTransMonitor], FileName);
  StartMonitor(FFileMonitors[cOrigMonitor], GlobalAppOptions.OriginalFile);
  lvTranslateStrings.Invalidate;
  lvTranslateStrings.ItemIndex := i;
end;

function TfrmMain.SaveTranslationAs(const FileName:WideString; Encoding:TEncoding):boolean;
begin
  Result := false;
  if DoExport then
    Exit;
  SaveTransDlg.FileName := GetFilename(Filename);
  SaveTransDlg.FilterIndex := GlobalAppOptions.FilterIndex;
  SaveTransDlg.EncodingIndex := Ord(Encoding);
  if SaveTransDlg.Execute then
  begin
    GlobalAppOptions.FilterIndex := SaveTransDlg.FilterIndex;
    SaveTranslation(SaveTransDlg.FileName,
      TEncoding(SaveTransDlg.EncodingIndex),
      SaveTransDlg.InsertHeader, SaveTransDlg.InsertFooter);
    Result := true;
  end;
  // clear for next time
  SaveTransDlg.InsertHeader := false;
  SaveTransDlg.InsertFooter := false;
end;

function TfrmMain.SaveOriginal(const FileName:WideString; Encoding:TEncoding;
  const InsertHeader:boolean = false; const InsertFooter:boolean = false):boolean;
var
  i:integer;
begin
  Result := false;
  if FileName = '' then
  begin
    Result := SaveOrigAs(FileName, Encoding);
    Exit;
  end;
  if DoExport then
    Exit;
  i := lvTranslateStrings.ItemIndex;

  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_FILE_SAVE, Ord(false), Integer(PWideChar(Filename))) then
    Exit;

  // stop the monitor thread
  StopMonitor(FFileMonitors[cTransMonitor]);
  // avoid false alarms when original = translation
  StopMonitor(FFileMonitors[cOrigMonitor]);
  SaveEditChanges;
  //  DeleteFile(Filename); // clear old content
  try
    if InsertHeader then
      FTranslateFile.Header := GlobalAppOptions.Header.Text
    else
      FTranslateFile.Header := '';
    if InsertFooter then
      FTranslateFile.Footer := GlobalAppOptions.Footer.Text
    else
      FTranslateFile.Footer := '';
    FTranslateFile.SaveOriginal(FileName, Encoding);
    NotifyChanged(NOTIFY_ITEM_FILE_SAVE, Ord(false), Integer(PWideChar(Filename)));
  except
    on E:Exception do
      HandleFileCreateException(Self, E, FileName);
  end;

  GlobalAppOptions.OriginalFile := Filename;
  GlobalAppOptions.OrigEncoding := Ord(Encoding);
  FLastFolder := WideExtractFilePath(Filename);

  UpdateColumn(0, FileName);
  Result := true;
  Modified := false;
  // resume the monitor thread
  StartMonitor(FFileMonitors[cTransMonitor], GlobalAppOptions.TranslationFile);
  StartMonitor(FFileMonitors[cOrigMonitor], GlobalAppOptions.OriginalFile);
  lvTranslateStrings.Invalidate;
  lvTranslateStrings.ItemIndex := i;
end;

function TfrmMain.SaveOrigAs(const FileName:WideString; Encoding:TEncoding):boolean;
begin
  Result := false;
  if DoExport then
    Exit;
  SaveOrigDlg.FileName := GetFilename(Filename);
  SaveOrigDlg.EncodingIndex := Ord(Encoding);
  SaveOrigDlg.FilterIndex := GlobalAppOptions.FilterIndex;
  if SaveOrigDlg.Execute then
  begin
    GlobalAppOptions.FilterIndex := SaveOrigDlg.FilterIndex;
    SaveOriginal(SaveOrigDlg.Filename, TEncoding(SaveOrigDlg.EncodingIndex),
      SaveOrigDlg.InsertHeader, SaveOrigDlg.InsertFooter);
    Result := true;
  end;
  SaveOrigDlg.InsertHeader := false;
  SaveOrigDlg.InsertFooter := false;
end;

procedure TfrmMain.CreateDict(ClearList:boolean);
var
  i:integer;

  procedure DictAdd(const AOriginal, ATranslation:WideString);
  var
    D:TDictionaryItem;
  begin
    if (trim(AOriginal) <> '') then
    begin
      D := FDictionary.Add(trim(AOriginal));
      if (trim(ATranslation) <> '') then
        D.Translations.Add(trim(ATranslation));
    end;
  end;
begin
  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_DICT_NEW, 0, 0) then
    Exit;
  if ClearList then
    FDictionary.Clear;
  for i := 0 to FTranslateFile.Items.Count - 1 do
    with FTranslateFile.Items[i] do
      DictAdd(trim(Original), trim(Translation));
  NotifyChanged(NOTIFY_ITEM_DICT_NEW, 0, 0);
  OpenDictDlg.Filename := '';
  SaveDictDlg.FileName := '';
  UpdateStatus;
end;

procedure TfrmMain.LoadDictionary(const FileName:WideString);
begin
  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_DICT_OPEN, Integer(PWideChar(Filename)), 0) then
    Exit;
  if not CheckDictModified then
    Exit;
  SaveDictDlg.FileName := FileName;
  OpenDictDlg.FileName := FileName;
  if acDictInvert.Checked then
    acDictInvert.Execute; // toggle invert
  FDictionary.LoadFromFile(FileName);
  NotifyChanged(NOTIFY_ITEM_DICT_OPEN, Integer(PWideChar(Filename)), 0);
  GlobalAppOptions.DictionaryFile := Filename;
  if not acDictInvert.Checked and GlobalAppOptions.InvertDictionary then
    acDictInvert.Execute; // toggle invert
  StartMonitor(FFileMonitors[cDictMonitor], FileName);
  UpdateStatus;
end;

procedure TfrmMain.SaveDictionary(const FileName:WideString);
begin
  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_DICT_SAVE, Integer(PWideChar(Filename)), 0) then
    Exit;
  // stop the monitor thread
  StopMonitor(FFileMonitors[cDictMonitor]);
  try
    FDictionary.SaveToFile(SaveDictDlg.FileName);
    NotifyChanged(NOTIFY_ITEM_DICT_SAVE, Integer(PWideChar(Filename)), 0);
    GlobalAppOptions.DictionaryFile := Filename;
  except
    on E:Exception do
      HandleFileCreateException(Self, E, SaveDictDlg.Filename);
  end;
  UpdateStatus;
  // resume the monitor thread
  StartMonitor(FFileMonitors[cDictMonitor], FileName);
end;

procedure TfrmMain.UseDictionary;
var
  i, j, FResult:integer;
  S:WideString;
  FModified, FPrompt:boolean;
begin
  FPrompt := true;
  FResult := cDictIgnore;
  for i := 0 to FTranslateFile.Items.Count - 1 do
//    if FTranslateFile.Items[i].Translation = '' then
  begin
    if FTranslateFile.Items[i].Translated and GlobalAppOptions.DictIgnoreNonEmpty then
      Continue;
    j := FDictionary.IndexOf(FTranslateFile.Items[i].Original);
    if (j >= 0) then // dictionary item found
    begin
      if FPrompt then
      begin
        lvTranslateStrings.Items[i].MakeVisible(false);
        lvTranslateStrings.Items[i].Selected := true;
        lvTranslateStrings.Items[i].Focused := true;
      end;
      S := FDictionary[j].DefaultTranslation;
      if S = '' then
        S := FTranslateFile.Items[i].Translation;
      FModified := false;
      if FCommandProcessor then
      begin
        FResult := cDictUse;
        if FDictionary[j].Translations.Count > 0 then
          S := FDictionary[j].DefaultTranslation
        else
          Continue;
      end
      else if FPrompt then
        FResult := TfrmDictTranslationSelect.Edit(FDictionary[j], S, FModified, FPrompt)
      else if FDictionary[j].Translations.Count > 0 then
        S := FDictionary[j].DefaultTranslation
      else
        Continue;
      FDictionary.Modified := FDictionary.Modified or FModified;
      case FResult of
        cDictIgnore:
          if not FPrompt then
            Exit // same as Cancel
          else
            Continue;
        cDictAdd:
          begin
            if (S <> '') and FPrompt then
              FDictionary[j].Translations.Add(S);
            AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
            FTranslateFile.Items[i].Translation := S;
          end;
        cDictUse:
          begin
            AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
            FTranslateFile.Items[i].Translation := S;
          end;
        cDictCancel:
          Exit;
      end;
      FTranslateFile.Items[i].Translated := S <> '';
    end;
  end;
  if not FCommandProcessor then
    InfoMsg(SDictTranslationCompleted, SInfoCaption);
end;

procedure TfrmMain.SetModified(const Value:boolean);

  procedure ClearModified;
  var
    i:integer;
  begin
    for i := 0 to FTranslateFile.Items.Count - 1 do
      FTranslateFile.Items[i].Modified := false;
    lvTranslateStrings.Update;
  end;
begin
  FModified := Value;
  reTranslation.Modified := Value;
  if not Value then
    ClearModified;
end;

function TfrmMain.GetModified:boolean;
begin
  FModified := not FCommandProcessor and (reTranslation.Modified or FModified or FTranslateFile.Items.Modified);
  Result := FModified;
end;

function TfrmMain.SearchFromCurrent(const FindText:WideString;
  CaseSense, WholeWord, Down, Fuzzy:boolean; FindIn:TFindIn):TTntListItem;
var
  i, SelIndex:integer;
begin
  Result := nil;
  if FTranslateFile.Items.Count < 1 then
    Exit;
  WaitCursor;
  if SelectedListItem = nil then
  begin
    if Down then
      i := 0
    else
      i := FTranslateFile.Items.Count - 1;
  end
  else
  begin
    SelIndex := SelectedListItem.Index;
    if Down then
      i := SelIndex + 1
    else
      i := SelIndex - 1;
  end;
  Result := nil;
  while (i >= 0) and (i < FTranslateFile.Items.Count) do
  begin
    if FindIn in [fiiOriginal, fiiBoth] then
    begin
      if MatchesString(FindText, FTranslateFile.Items[i].Original, WholeWord, CaseSense, Fuzzy) then
      begin
        Result := lvTranslateStrings.Items[i];
        Exit;
      end;
    end;
    if FindIn in [fiiTranslation, fiiBoth] then
    begin
      if MatchesString(FindText, FTranslateFile.Items[i].Translation, WholeWord, CaseSense, Fuzzy) then
      begin
        Result := lvTranslateStrings.Items[i];
        Exit;
      end;
    end;
    if Down then
      Inc(i)
    else
      Dec(i);
  end;
end;

function TfrmMain.AddQuotes(const S:WideString):WideString;
begin
  if acShowQuotes.Checked then
    Result := '"' + S + '"'
  else
    Result := S;
end;

function TfrmMain.RemoveQuotes(const S:WideString; AForce:boolean = false):WideString;
begin
  Result := S;
  if not acShowQuotes.Checked and not AForce then
    Exit;
  if (Length(Result) > 0) then
  begin
    if Result[Length(Result)] in [WideChar(#39), WideChar('"')] then
      SetLength(Result, Length(Result) - 1);
    if (Length(Result) > 0) and (Result[1] in [WideChar(#39), WideChar('"')]) then
      Result := Copy(Result, 2, MaxInt);
  end;
end;

procedure TfrmMain.ScrollToTop;
begin
  SendMessage(lvTranslateStrings.Handle, WM_VSCROLL, SB_TOP, 0);
end;

procedure TfrmMain.UpdateStatus;
var
  i:integer;

  // NB! Pass in Font.Size for StartSize and MinSize. AWidth is max width in pixels. Returns positive Font.Height

  function WideGetTextExtentPoint32(DC:HDC; Str:PWideChar; Count:Integer;
    var Size:TSize):BOOL;
  begin
    if Win32PlatformIsUnicode then
      Result := GetTextExtentPoint32W(DC, Str, Count, Size)
    else
      Result := GetTextExtentPoint32A(DC, PAnsiChar(AnsiString(Str)), Count, Size);
  end;

  function CalcMaxFontSize(ACanvas:TCanvas; const S:WideString; AWidth:integer; StartSize, MinSize:integer):integer;
  var
    aSize:TSize;
  begin
    ACanvas.Font.Size := StartSize;
    Result := StartSize;
    while WideGetTextExtentPoint32(ACanvas.Handle, PWideChar(S), Length(S), aSize) do
    begin
      if aSize.cx <= AWidth then
      begin
        Result := trunc((aSize.cy * 72) / ACanvas.Font.PixelsPerInch);
        Exit;
      end;
      ACanvas.Font.Size := ACanvas.Font.Size - 1;
      if ACanvas.Font.Size <= MinSize then
      begin
        Result := trunc((aSize.cy * 72) / ACanvas.Font.PixelsPerInch);
        Exit;
      end;
    end;
  end;

  function SafeDiv(Nominator, Denominator:integer):Extended;
  begin
    if (Nominator = 0) or (Denominator = 0) then
      Result := 0
    else
      Result := Nominator / Denominator;
  end;
begin
  if Modified then
    sbBottom.Panels[0].Caption := '  ' + _(ClassName, SModified)
  else
    sbBottom.Panels[0].Caption := '  ' + _(ClassName, SReady);

  if SelectedItem <> nil then
  begin
    sbBottom.Panels[1].Caption := '  ' + SelectedItem.Section;
    sbBottom.Panels[2].Caption := '  ' + SelectedItem.Name;
    with SelectedItem do
      lblViewDetails.Caption := WideFormat(_(ClassName, SFmtKeyDetails), [Section, Name]);
  end
  else
  begin
    sbBottom.Panels[1].Caption := '';
    sbBottom.Panels[2].Caption := '';
    lblViewDetails.Caption := Application.Title;
  end;
  // very simple, but should work *most* of the time...
  lblViewDetails.Font.Height := -CalcMaxFontSize(lblViewDetails.Canvas, lblViewDetails.Caption, lblViewDetails.Width,
    14, 7);
  sbBottom.Panels[3].Caption := '  ' + WideFormat(_(ClassName, SFmtItemsCount), [FTranslateFile.Items.Count]);
  if SaveDictDlg.FileName <> '' then
    sbBottom.Panels[4].Caption := '  ' + ExtractFileName(SaveDictDlg.FileName)
  else
    sbBottom.Panels[4].Caption := '  ' + _(ClassName, SNoDictionary);
  if acDictInvert.Checked then
    sbBottom.Panels[4].Caption := sbBottom.Panels[4].Caption + WideFormat(' (%s)', [_(ClassName,
        SDictInverted)]);
  sbBottom.Panels[5].Caption := WideFormat(_(ClassName, '  %d | %d | %d | %f%%'),
    [FTranslateFile.Items.Count, FTranslateFile.Items.TranslatedCount, FTranslateFile.Items.Count - FTranslateFile.Items.TranslatedCount, SafeDiv(FTranslateFile.Items.TranslatedCount, FTranslateFile.Items.Count) * 100]);
  pbTranslated.Max := FTranslateFile.Items.Count;
  pbTranslated.Position := FTranslateFile.Items.TranslatedCount;
  pbTranslated.Hint := '  ' + WideFormat(_(ClassName, SFmtCountOfCountTranslated), [FTranslateFile.Items.TranslatedCount,
    FTranslateFile.Items.Count]);
  // sbBottom.Panels[6].Caption := ''; this is the progress bar
  sbBottom.Panels[7].Caption := WideFormat(_(ClassName, SFmtOrphansCount), [FTranslateFile.Orphans.Count]);
  for i := 0 to sbBottom.Panels.Count - 1 do
    sbBottom.Panels[i].Hint := sbBottom.Panels[i].Caption;

  UpdateColumn(0, GlobalAppOptions.OriginalFile);
  UpdateColumn(1, GlobalAppOptions.TranslationFile);

end;

procedure TfrmMain.DoThreadTerminate(Sender:TObject);
var
  i:integer;
begin
  for i := 0 to Length(FFileMonitors) - 1 do
    if FFileMonitors[i] = Sender then
      FFileMonitors[i] := nil;
end;

procedure TfrmMain.DoMonitoredFileChange(Sender:TObject; const FileName:WideString; var AContinue, AReset:boolean);
begin
  if GetActiveWindow <> Handle then
  begin
    AReset := false;
    Exit; // only show confirm message if we have focus
  end;
  AContinue := false;
  if YesNo(WideFormat(_(ClassName, SFmtFileChangedReloadPrompt), [FileName]), _(ClassName, SConfirmCaption)) then
  begin
    if Sender = FFileMonitors[cOrigMonitor] then
    begin
      // in case Original and Translation is the same file...
      StopMonitor(FFileMonitors[cTransMonitor]);
//      if WideFileExists(GlobalAppOptions.TranslationFile) then
//        SaveTranslation(GlobalAppOptions.TranslationFile, DetectEncoding(GlobalAppOptions.TranslationFile));
      LoadOriginal(FileName, TEncoding(GlobalAppOptions.OrigEncoding));
      LoadTranslation(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding));
    end
    else if Sender = FFileMonitors[cTransMonitor] then
      LoadTranslation(FileName, TEncoding(GlobalAppOptions.TransEncoding))
    else if Sender = FFileMonitors[cDictMonitor] then
      LoadDictionary(FileName)
    else
      AContinue := true;
  end
  else
    AContinue := true;
end;

procedure TfrmMain.StartMonitor(var AMonitor:TFileMonitorThread; const AFileName:WideString);
begin
  if GlobalAppOptions.MonitorFiles and WideFileExists(AFileName) then
  begin
    StopMonitor(AMonitor);
    AMonitor := TFileMonitorThread.Create(AFileName, 1000);
    AMonitor.FreeOnTerminate := true;
    AMonitor.OnTerminate := DoThreadTerminate;
    AMonitor.OnChange := DoMonitoredFileChange;
    AMonitor.Resume;
  end;
end;

procedure TfrmMain.StopMonitor(var AMonitor:TFileMonitorThread);
begin
  if AMonitor <> nil then
  begin
    AMonitor.OnTerminate := nil;
    AMonitor.OnChange := nil;
    AMonitor.Terminate;
    AMonitor := nil;
  end;
end;

procedure TfrmMain.SaveEditChanges;
begin
  reTranslationExit(nil);
end;

procedure TfrmMain.LoadTranslate;
begin
  WaitCursor;
  if GlobalLanguageFile <> nil then
  begin
    GlobalLanguageFile.LoadFromFile(GlobalAppOptions.LanguageFile);
    GlobalLanguageFile.TranslateObject(Self, ClassName);
  end;
end;

function TfrmMain.GetFilename(const Filename:WideString):WideString;
begin
  if GlobalAppOptions.GlobalPath and (FLastFolder <> '') then
  begin
    if Filename = '' then
      Result := WideIncludeTrailingPathDelimiter(FLastFolder) + '*.*'
    else
      Result := WideIncludeTrailingPathDelimiter(FLastFolder) + WideExtractFileName(Filename);
  end
  else
    Result := Filename;
  Result := WideExcludeTrailingPathDelimiter(Result);
end;

procedure TfrmMain.MoveCommentWindow;
begin
  if (frmComments = nil) or not frmComments.Visible or not frmComments.Pinned then
    Exit;
  frmComments.Top := Top;
  if Left + Width + frmComments.Width <= Screen.Width then
    frmComments.Left := Left + Width // place to right
  else if Left - frmComments.Width >= 0 then
    frmComments.Left := Left - frmComments.Width // place to left
  else
  begin
    frmComments.Left := Screen.Width - frmComments.Width; // place in top right corner
    frmComments.Top := GetSystemMetrics(SM_CYCAPTION) - 1;
  end;
end;

procedure TfrmMain.MoveListViewSelection(Index:integer);
begin
  SaveEditChanges;
  if Index < 0 then
    Index := 0;
  if Index > lvTranslateStrings.Items.Count - 1 then
    Index := lvTranslateStrings.Items.Count - 1;
  if (Index >= 0) and (Index < lvTranslateStrings.Items.Count) then
  begin
    SelectedListItem := lvTranslateStrings.Items[Index];
    SelectedListItem.MakeVisible(false);
  end;
  if reTranslation.CanFocus then
    reTranslation.SetFocus;
  reTranslation.SelectAll;
end;

procedure TfrmMain.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
  inherited;
  MoveCommentWindow;
end;

procedure TfrmMain.DoWriteObject(Sender, AnObject:TObject;
  const APropName:WideString; var ASection, AName, AValue:WideString);

  function GetOwnerComponent(AComponent:TComponent):string;
  var
    C:TComponent;
  begin
    C := AComponent;
    Result := Self.ClassName;
    while (C <> nil) and (C <> Application) do
    begin
      Result := C.ClassName;
      C := C.Owner;
    end;
  end;

begin
  if AnObject is TCustomForm then
    ASection := TCustomForm(AnObject).ClassName
  else if AnObject is TComponent then
    ASection := GetOwnerComponent(TComponent(AnObject))
  else
    ASection := Self.ClassName;
  AName := AValue;
end;

procedure TfrmMain.DoSaveExtra(Sender:TObject; ini:TWideCustomIniFile);
var
  i:integer;
  S:WideString;
{$IFDEF USEADDICTSPELLCHECKER}
  l:TSpellLanguageString;
{$ENDIF}
begin
{$IFDEF USEADDICTSPELLCHECKER}
  // add all spellchecker strings
  for l := Low(TSpellLanguageString) to High(TSpellLanguageString) do
  begin
    S := EncodeStrings(ad3SpellLanguages.GetString(l, ltEnglish));
    ini.WriteString('SpellChecker', S, S);
  end;
{$ENDIF}

  // write out all resourcestrings
  ini.WriteString(ClassName, EncodeStrings(SFmtAboutText), EncodeStrings(SFmtAboutText));
  ini.WriteString(ClassName, EncodeStrings(SFmtAboutCaption), EncodeStrings(SFmtAboutCaption));
  ini.WriteString(ClassName, EncodeStrings(SSavePrompt), EncodeStrings(SSavePrompt));
  ini.WriteString(ClassName, EncodeStrings(SFmtOriginalColumn), EncodeStrings(SFmtOriginalColumn));
  ini.WriteString(ClassName, EncodeStrings(SFmtTranslationColumn), EncodeStrings(SFmtTranslationColumn));
  ini.WriteString(ClassName, EncodeStrings(SFmtTextNotFound), EncodeStrings(SFmtTextNotFound));
  ini.WriteString(ClassName, EncodeStrings(SSearchFailCaption), EncodeStrings(SSearchFailCaption));
  ini.WriteString(ClassName, EncodeStrings(SAppTitle), EncodeStrings(SAppTitle));
  ini.WriteString(ClassName, EncodeStrings(SModified), EncodeStrings(SModified));
  ini.WriteString(ClassName, EncodeStrings(SReady), EncodeStrings(SReady));
  ini.WriteString(ClassName, EncodeStrings(SOriginal), EncodeStrings(SOriginal));
  ini.WriteString(ClassName, EncodeStrings(STranslation), EncodeStrings(STranslation));
  ini.WriteString(ClassName, EncodeStrings(SInfoCaption), EncodeStrings(SInfoCaption));
  ini.WriteString(ClassName, EncodeStrings(SConfirmCaption), EncodeStrings(SConfirmCaption));
  ini.WriteString(ClassName, EncodeStrings(SErrorCaption), EncodeStrings(SErrorCaption));
  ini.WriteString(ClassName, EncodeStrings(SErrDictEmpty), EncodeStrings(SErrDictEmpty));
  ini.WriteString(ClassName, EncodeStrings(SDictCreated), EncodeStrings(SDictCreated));
  ini.WriteString(ClassName, EncodeStrings(SClearDictPrompt), EncodeStrings(SClearDictPrompt));
  ini.WriteString(ClassName, EncodeStrings(SFmtErrHelpNotFound), EncodeStrings(SFmtErrHelpNotFound));
  ini.WriteString(ClassName, EncodeStrings(SDictInverted), EncodeStrings(SDictInverted));
  ini.WriteString(ClassName, EncodeStrings(SFmtFileNotFound), EncodeStrings(SFmtFileNotFound));
  ini.WriteString(ClassName, EncodeStrings(SNotImplemented), EncodeStrings(SNotImplemented));
  ini.WriteString(ClassName, EncodeStrings(SFmtFileChangedReloadPrompt), EncodeStrings(SFmtFileChangedReloadPrompt));
  ini.WriteString(ClassName, EncodeStrings(SFmtItemsCount), EncodeStrings(SFmtItemsCount));
  ini.WriteString(ClassName, EncodeStrings(SSaveTranslationTemplate), EncodeStrings(SSaveTranslationTemplate));
  ini.WriteString(ClassName, EncodeStrings(SLanguageNotChangedUntilRestart),
    EncodeStrings(SLanguageNotChangedUntilRestart));
  ini.WriteString(ClassName, EncodeStrings(SDeleteItemText), EncodeStrings(SDeleteItemText));
  ini.WriteString(ClassName, EncodeStrings(SFmtKeyDetails), EncodeStrings(SFmtKeyDetails));
  ini.WriteString(ClassName, EncodeStrings(SNoDictionary), EncodeStrings(SNoDictionary));
  ini.WriteString(ClassName, EncodeStrings(SDecodedCharsCaption), EncodeStrings(SDecodedCharsCaption));
  ini.WriteString(ClassName, EncodeStrings(SAsciiValue), EncodeStrings(SAsciiValue));
  ini.WriteString(ClassName, EncodeStrings(SOpenOrigTitle), EncodeStrings(SOpenOrigTitle));
  ini.WriteString(ClassName, EncodeStrings(SOpenTransTitle), EncodeStrings(SOpenTransTitle));
  ini.WriteString(ClassName, EncodeStrings(SSaveTransTitle), EncodeStrings(SSaveTransTitle));
  ini.WriteString(ClassName, EncodeStrings(SLngExt), EncodeStrings(SLngExt));
  ini.WriteString(ClassName, EncodeStrings(SANSI), EncodeStrings(SANSI));
  ini.WriteString(ClassName, EncodeStrings(SUTF8), EncodeStrings(SUTF8));
  ini.WriteString(ClassName, EncodeStrings(SUnicode), EncodeStrings(SUnicode));
  ini.WriteString(ClassName, EncodeStrings(SFileFilter), EncodeStrings(SFileFilter));
  ini.WriteString(ClassName, EncodeStrings(SAllFileFilter), EncodeStrings(SAllFileFilter));
  ini.WriteString(ClassName, EncodeStrings(SFmtCountOfCountTranslated), EncodeStrings(SFmtCountOfCountTranslated));
  ini.WriteString(ClassName, EncodeStrings(SQCopyToClipboard), EncodeStrings(SQCopyToClipboard));
  ini.WriteString(ClassName, EncodeStrings(SNotAssigned), EncodeStrings(SNotAssigned));
  ini.WriteString(ClassName, EncodeStrings(SAssignedTo), EncodeStrings(SAssignedTo));
  ini.WriteString(ClassName, EncodeStrings(SNoCategory), EncodeStrings(SNoCategory));
  ini.WriteString(ClassName, EncodeStrings(SImportCaption), EncodeStrings(SImportCaption));
  ini.WriteString(ClassName, EncodeStrings(SImportLabelCaption), EncodeStrings(SImportLabelCaption));
  ini.WriteString(ClassName, EncodeStrings(SImportButtonCaption), EncodeStrings(SImportButtonCaption));
  ini.WriteString(ClassName, EncodeStrings(SExportCaption), EncodeStrings(SExportCaption));
  ini.WriteString(ClassName, EncodeStrings(SExportLabelCaption), EncodeStrings(SExportLabelCaption));
  ini.WriteString(ClassName, EncodeStrings(SExportButtonCaption), EncodeStrings(SExportButtonCaption));
  ini.WriteString(ClassName, EncodeStrings(SNoPluginsAvaliable), EncodeStrings(SNoPluginsAvaliable));
  ini.WriteString(ClassName, EncodeStrings(SPluginError), EncodeStrings(SPluginError));
  ini.WriteString(ClassName, EncodeStrings(SSaveDictPrompt), EncodeStrings(SSaveDictPrompt));
  ini.WriteString(ClassName, EncodeStrings(SArgumentsPrompt), EncodeStrings(SArgumentsPrompt));
  ini.WriteString(ClassName, EncodeStrings(SFmtErrToolExec), EncodeStrings(SFmtErrToolExec));
  ini.WriteString(ClassName, EncodeStrings(SFmtNewToolName), EncodeStrings(SFmtNewToolName));
  ini.WriteString(ClassName, EncodeStrings(SFmtErrCreateFile), EncodeStrings(SFmtErrCreateFile));
  ini.WriteString(ClassName, EncodeStrings(SPromptDeleteItem), EncodeStrings(SPromptDeleteItem));
  ini.WriteString(ClassName, EncodeStrings(SConfirmDelete), EncodeStrings(SConfirmDelete));
  ini.WriteString(ClassName, EncodeStrings(SCaptionEditItem), EncodeStrings(SCaptionEditItem));
  ini.WriteString(ClassName, EncodeStrings(SCaptionAddItem), EncodeStrings(SCaptionAddItem));
  ini.WriteString(ClassName, EncodeStrings(SErrSectionEmpty), EncodeStrings(SErrSectionEmpty));
  ini.WriteString(ClassName, EncodeStrings(SErrNameEmpty), EncodeStrings(SErrNameEmpty));
  ini.WriteString(ClassName, EncodeStrings(SErrOrigTextEmpty), EncodeStrings(SErrOrigTextEmpty));
  ini.WriteString(ClassName, EncodeStrings(SErrSectionNameExists), EncodeStrings(SErrSectionNameExists));
  ini.WriteString(ClassName, EncodeStrings(SDictTranslationCompleted), EncodeStrings(SDictTranslationCompleted));
  ini.WriteString(ClassName, EncodeStrings(SSelectLanguageFile), EncodeStrings(SSelectLanguageFile));
  ini.WriteString(ClassName, EncodeStrings(SSelectHelpFile), EncodeStrings(SSelectHelpFile));
  ini.WriteString(ClassName, EncodeStrings(SFmtSaveItemsNoName), EncodeStrings(SFmtSaveItemsNoName));
  ini.WriteString(ClassName, EncodeStrings(SConfirmRemoveOrphans), EncodeStrings(SConfirmRemoveOrphans));
  ini.WriteString(ClassName, EncodeStrings(SFmtOrphansCount), EncodeStrings(SFmtOrphansCount));
  ini.WriteString(ClassName, EncodeStrings(SImportedPromptToExport), EncodeStrings(SImportedPromptToExport));
  ini.WriteString(ClassName, EncodeStrings(SUndoText), EncodeStrings(SUndoText));
  ini.WriteString(ClassName, EncodeStrings(SNothingToUndo), EncodeStrings(SNothingToUndo));
  ini.WriteString(ClassName, EncodeStrings(SUndoAdd), EncodeStrings(SUndoAdd));
  ini.WriteString(ClassName, EncodeStrings(SUndoEdit), EncodeStrings(SUndoEdit));
  ini.WriteString(ClassName, EncodeStrings(SUndoDelete), EncodeStrings(SUndoDelete));

  for i := 0 to alMain.ActionCount - 1 do
  begin
    S := EncodeStrings(alMain.Actions[i].Category);
    ini.WriteString(ClassName, S, S);
    S := EncodeStrings(TAction(alMain.Actions[i]).Hint);
    ini.WriteString(ClassName, S, S);
  end;

  // write out all file plugins
  TfrmImportExport.GetStrings(GetPluginsFolder, ini);

  // write out all tool plugins
  FExternalToolItems.GetStrings(ini);
  // write out author info (do not localize)
  ini.WriteString('Translator', 'Author', 'Ini Translator');
  ini.WriteString('Translator', 'Language', 'Default');
  ini.WriteString('Translator', 'EMail', '(none)');
  ini.WriteString('Translator', 'Version', GetAppVersion);
end;

procedure TfrmMain.DoReadObject(Sender, AnObject:TObject; const PropName, Section:WideString; var Value:WideString);
begin
  Value := GlobalLanguageFile.Translate(Section, Value, Value);
end;

procedure TfrmMain.DoAllowWriting(Sender, AnObject:TObject; const APropName:WideString; var ATranslate:boolean);
begin
  ATranslate := (AnObject <> lblViewDetails)
    and (AnObject <> lvTranslateStrings.Columns[0]) and (AnObject <> lvTranslateStrings.Columns[1])
    and not ((AnObject is TTntComboBox) and (TTntComboBox(AnObject).Style = csDropDown));
  if ATranslate and (AnObject is TSpTBXItem) then
    ATranslate := not (TSpTBXItem(AnObject).Parent is TSpTBXThemeGroupItem);
end;

procedure TfrmMain.DoFindNext(Sender:TObject);
var
  li:TTntListItem;
begin
  if (FLastFindText <> FFindReplace.FindText) then
    SelectedListItem := nil;
  SaveEditChanges;
  FLastFindText := FFindReplace.FindText;
  li := SearchFromCurrent(FLastFindText, FFindReplace.MatchCase, FFindReplace.MatchLine,
    not FFindReplace.SearchUp, FFindReplace.FuzzySearch, TFindIn(FFindReplace.FindInIndex));
  if li <> nil then
  begin
    SelectedListItem := li;
    SelectedListItem.MakeVisible(false)
  end
  else
    InfoMsg(WideFormat(_(ClassName, SFmtTextNotFound), [FFindReplace.FindText]),
      _(ClassName, SSearchFailCaption));
end;

procedure TfrmMain.DoFindReplace(Sender:TObject);
var
  i:integer;
  F:TReplaceFlags;
  b:boolean;
begin
  if SelectedListItem = nil then
  begin
    acFindNext.Execute;
    Exit;
  end;
  i := SelectedListItem.Index;

  b := false;
  if (FFindReplace.FindInIndex in [fiiOriginal, fiiBoth]) then
    b := MatchesString(FFindReplace.FindText, FTranslateFile.Items[i].Original, FFindReplace.MatchLine,
      FFindReplace.MatchCase, FFindReplace.FuzzySearch);
  if not b and (FFindReplace.FindInIndex in [fiiTranslation, fiiBoth]) then
    b := MatchesString(FFindReplace.FindText, FTranslateFile.Items[i].Translation, FFindReplace.MatchLine,
      FFindReplace.MatchCase, FFindReplace.FuzzySearch);
  if b then
  begin
    if FFindReplace.MatchLine then
    begin
      AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
      FTranslateFile.Items[i].Translation := FFindReplace.ReplaceText;
    end
    else
    begin
      F := [rfReplaceAll];
      if not FFindReplace.MatchCase then
        Include(F, rfIgnoreCase);
      AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
      FTranslateFile.Items[i].Translation := Tnt_WideStringReplace(FTranslateFile.Items[i].Translation,
        FFindReplace.FindText, FFindReplace.ReplaceText, F);
    end;
    FTranslateFile.Items[i].Translated := FTranslateFile.Items[i].Translation <> '';
    reTranslation.Text := FTranslateFile.Items[i].Translation;
    Modified := true;
  end;
  DoFindNext(Sender);
end;

procedure TfrmMain.DoFindReplaceAll(Sender:TObject);
var
  i:integer;
  b:boolean;
  F:TReplaceFlags;
  li:TTntListItem;
begin
  li := SelectedListItem;
  if li = nil then
    li := SearchFromCurrent(FFindReplace.FindText, FFindReplace.MatchCase, FFindReplace.MatchLine, not
      FFindReplace.SearchUp, FFindReplace.FuzzySearch, FFindReplace.FindInIndex);
  if li = nil then
  begin
    InfoMsg(WideFormat(_(ClassName, SFmtTextNotFound), [FFindReplace.FindText]),
      _(ClassName, SSearchFailCaption));
    Exit;
  end;
  SaveEditChanges;
  i := SelectedListItem.Index;
  F := [rfReplaceAll];
  if not FFindReplace.MatchCase then
    Include(F, rfIgnoreCase);
  while i < FTranslateFile.Items.Count do
  begin
    b := false;
    if (FFindReplace.FindInIndex in [fiiOriginal, fiiBoth]) then
      b := MatchesString(FFindReplace.FindText, FTranslateFile.Items[i].Original, FFindReplace.MatchLine,
        FFindReplace.MatchCase, FFindReplace.FuzzySearch);
    if not b and (FFindReplace.FindInIndex in [fiiTranslation, fiiBoth]) then
      b := MatchesString(FFindReplace.FindText, FTranslateFile.Items[i].Translation, FFindReplace.MatchLine,
        FFindReplace.MatchCase, FFindReplace.FuzzySearch);
    if b then
    begin
      if FFindReplace.MatchLine then
      begin
        AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
        FTranslateFile.Items[i].Translation := FFindReplace.ReplaceText;
      end
      else
      begin
        F := [rfReplaceAll];
        if not FFindReplace.MatchCase then
          Include(F, rfIgnoreCase);
        AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
        FTranslateFile.Items[i].Translation := Tnt_WideStringReplace(FTranslateFile.Items[i].Translation,
          FFindReplace.FindText, FFindReplace.ReplaceText, F);
      end;
      FTranslateFile.Items[i].Translated := FTranslateFile.Items[i].Translation <> '';
      if i = SelectedListItem.Index then
        reTranslation.Text := FTranslateFile.Items[i].Translation;
      Modified := true;
    end;
    Inc(i);
  end;
  if li <> nil then
  begin
    SelectedListItem := li;
    SelectedListItem.MakeVisible(false);
  end;
  lvTranslateStrings.Invalidate;
end;

// bookmark support

procedure TfrmMain.ClearBookmarks;
var
  i:integer;
begin
  for i := Low(FBookmarks) to High(FBookmarks) do
    FBookmarks[i] := -1;
  CheckBookMarkImages;
  lvTranslateStrings.Invalidate;
end;

function TfrmMain.GetBookmark(Index:integer):integer;
begin
  // get highest bookmark icon first
  for Result := High(FBookmarks) downto Low(FBookmarks) do
    if FBookmarks[Result] = Index then
      Exit;
  if FTranslateFile.Items[Index].Modified then
    Result := High(FBookmarks) + 1
  else
    Result := -1;
end;

procedure TfrmMain.GotoBookmark(Bookmark:integer);
begin
  if (FBookmarks[Bookmark] >= 0) and (FBookmarks[Bookmark] < lvTranslateStrings.Items.Count) then
    MoveListViewSelection(FBookmarks[Bookmark])
  else
    FBookmarks[Bookmark] := -1; // out of bounds
  CheckBookMarkImages;
end;

procedure TfrmMain.CheckBookMarkImages;
var
  i:integer;
begin
  lvTranslateStrings.StateImages := ilBookmarks;
  Exit;

  for i := Low(FBookmarks) to High(FBookmarks) do
    if FBookmarks[i] <> -1 then
    begin
      lvTranslateStrings.StateImages := ilBookmarks;
      Exit;
    end;
  lvTranslateStrings.StateImages := nil;
end;

procedure TfrmMain.ToggleBookmark(Bookmark, Index:integer);
begin
  if FBookmarks[Bookmark] = Index then
    FBookmarks[Bookmark] := -1 // toggle off
  else
    FBookmarks[Bookmark] := Index; // toggle on
  CheckBookMarkImages;
  lvTranslateStrings.Invalidate;
end;

procedure TfrmMain.WMDelayLoaded(var Message:TMessage);
begin
  if frmComments <> nil then
    frmComments.Pinned := GlobalAppOptions.PinCommentWindow;
  if lvTranslateStrings.VisibleRowCount < lvTranslateStrings.Items.Count then
    lvTranslateStrings.Columns[0].Width := lvTranslateStrings.Columns[0].Width - GetSystemMetrics(SM_CXVSCROLL);
end;

procedure TfrmMain.WMDropFiles(var Message:TWmDropFiles);
var
  ACount:integer;
  P:TPoint;
  buf:array[0..MAX_PATH] of AnsiChar;
begin
  // find out where we are
  ACount := DragQueryFile(Message.Drop, $FFFFFFFF, nil, 0);
  try
    case ACount of
      0:Exit;
      1:
        begin
          DragQueryFile(Message.Drop, 0, buf, sizeof(buf));
          if WideFileExists(buf) then
          begin
            // find out where it was dropped so we can load the right file
            if not DragQueryPoint(Message.Drop, P) or PtInRect(Rect(0, 0, Width div 2, Height), P) then
            begin
              GlobalAppOptions.OriginalFile := buf;
              LoadOriginal(GlobalAppOptions.OriginalFile, DetectEncoding(GlobalAppOptions.OriginalFile));
              acNewTrans.Execute;
            end
            else
            begin
              GlobalAppOptions.TranslationFile := buf;
              LoadTranslation(GlobalAppOptions.TranslationFile, DetectEncoding(GlobalAppOptions.TranslationFile));
            end;
          end;
        end;
      2:
        begin
          DragQueryFile(Message.Drop, 0, buf, sizeof(buf));
          if WideFileExists(buf) then
            LoadOriginal(buf, DetectEncoding(buf));
          DragQueryFile(Message.Drop, 1, buf, sizeof(buf));
          if WideFileExists(buf) then
            LoadTranslation(buf, DetectEncoding(buf));
        end;
    else // more than 2
      begin
        DragQueryFile(Message.Drop, 0, buf, sizeof(buf));
        if WideFileExists(buf) then
          LoadOriginal(buf, DetectEncoding(buf));
        DragQueryFile(Message.Drop, 1, buf, sizeof(buf));
        if WideFileExists(buf) then
          LoadTranslation(buf, DetectEncoding(buf));
        DragQueryFile(Message.Drop, 2, buf, sizeof(buf));
        if WideFileExists(buf) then
          LoadDictionary(buf);
      end;
    end;
  finally
    DragFinish(Message.Drop);
  end;
  UpdateStatus;
end;

procedure TfrmMain.CreateDialogs;
begin
  { DONE : Localize these strings! }
  OpenOrigDlg := TEncodingOpenDialog.Create(Self);
  with OpenOrigDlg do
  begin
    DefaultExt := _(ClassName, SLngExt);
    Filter := _(ClassName, SFileFilter);

    InitialDir := '.';
    Title := _(ClassName, SOpenOrigTitle);
    Encodings.Add(_(ClassName, SANSI));
    Encodings.Add(_(ClassName, SUTF8));
    Encodings.Add(_(ClassName, SUnicode));
  end;

  OpenTransDlg := TEncodingOpenDialog.Create(Self);
  with OpenTransDlg do
  begin
    DefaultExt := _(ClassName, SLngExt);
    Filter := _(ClassName, SFileFilter);
    InitialDir := '.';
    Title := _(ClassName, SOpenTransTitle);
    Encodings.Add(_(ClassName, SANSI));
    Encodings.Add(_(ClassName, SUTF8));
    Encodings.Add(_(ClassName, SUnicode));
  end;
  SaveTransDlg := TEncodingSaveDialog.Create(Self);
  with SaveTransDlg do
  begin
    DefaultExt := _(ClassName, SLngExt);
    Filter := _(ClassName, SFileFilter);
    InitialDir := '.';
    Options := [ofOverwritePrompt, ofEnableSizing];
    Title := _(ClassName, SSaveTransTitle);
    Encodings.Add(_(ClassName, SANSI));
    Encodings.Add(_(ClassName, SUTF8));
    Encodings.Add(_(ClassName, SUnicode));
  end;
  SaveOrigDlg := TEncodingSaveDialog.Create(Self);
  with SaveOrigDlg do
  begin
    DefaultExt := _(ClassName, SLngExt);
    Filter := _(ClassName, SFileFilter);
    InitialDir := '.';
    Options := [ofOverwritePrompt, ofEnableSizing];
    Title := _(ClassName, SSaveOrigTitle);
    Encodings.Add(_(ClassName, SANSI));
    Encodings.Add(_(ClassName, SUTF8));
    Encodings.Add(_(ClassName, SUnicode));
  end;
end;

function TfrmMain.DoExport:boolean;
begin
  Result := false;
  if FIsImport and YesNo(_(ClassName, SImportedPromptToExport), _(ClassName, SConfirmCaption)) then
  begin
    acExport.Execute;
    Result := true;
  end;
end;

function TfrmMain.CheckModified:boolean;
begin
  Result := true;
  if Modified then
  begin
    case YesNoCancel(_(ClassName, SSavePrompt), _(ClassName, SConfirmCaption)) of
      IDYES:
        Result := SaveTranslation(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding));
      IDNO:
        Result := true; // do nothing
      IDCANCEL:
        Result := false;
    end;
  end
  else
    Modified := false;
end;

function TfrmMain.CheckDictModified:boolean;
begin
  Result := true;
  if not FCommandProcessor and FDictionary.Modified then
  begin
    case YesNoCancel(_(ClassName, SSaveDictPrompt), _(ClassName, SConfirmCaption)) of
      IDYES:
        Result := acDictSave.Execute;
      IDNO:
        Result := true; // do nothing
      IDCANCEL:
        Result := false;
    end;
  end
  else
    Modified := false;
end;

function TfrmMain.CheckOrphans:boolean;
begin
  if not FCommandProcessor and (FTranslateFile.Orphans.Count > 0) then
    Result := YesNo(_(ClassName, SConfirmRemoveOrphans),
      _(ClassName, SConfirmDelete))
  else
    Result := true;
end;

procedure TfrmMain.AddMRUFiles(const OriginalFileName, TranslationFilename:WideString);
begin
  if (OriginalFilename <> '') and (TranslationFilename <> '') then
    MRUFiles.Add(WideFormat('%s [%s]', [OriginalFilename, TranslationFilename]));
end;

procedure TfrmMain.OpenMRUFiles(const FileName:WideString);
var
  Orig, Trans:WideString;
begin
  Orig := trim(Copy(FileName, 1, Pos('[', FileName) - 1));
  if Orig <> '' then
    Trans := strBetween(FileName, '[', ']')
  else
  begin
    Trans := '';
    Orig := FileName;
  end;
  if (Orig <> '') and WideFileExists(Orig) then
    LoadOriginal(Orig, DetectEncoding(Orig))
  else
  begin
    acOpenOrig.Execute;
    Exit;
  end;
  if (Trans <> '') and WideFileExists(Trans) then
    LoadTranslation(Trans, DetectEncoding(Trans))
  else
    acOpenTrans.Execute;
end;

function TfrmMain.MRUFilesExists(const FileName:WideString):boolean;
var
  Orig, Trans:WideString;
begin
  Orig := trim(Copy(FileName, 1, Pos('[', FileName) - 1));
  if Orig <> '' then
    Trans := strBetween(FileName, '[', ']')
  else
  begin
    Trans := '';
    Orig := FileName;
  end;
  Result := (Orig <> '') and (Trans <> '') and WideFileExists(Orig) and WideFileExists(Trans);
end;

// frmMain event handlers

procedure TfrmMain.alMainUpdate(Action:TBasicAction;
  var Handled:boolean);
var
  Index, ACount:integer;
begin
  if GetActiveWindow <> Handle then
  begin
    alMain.State := asSuspended;
    Exit;
  end
  else
    alMain.State := asNormal;
  if SelectedListItem <> nil then
    Index := SelectedListItem.Index
  else
    Index := -1;
  ACount := FTranslateFile.Items.Count;
  acUndo.Enabled := FUndoList.CanUndo or reTranslation.CanUndo; //  reTranslation.Focused and Modified;
  if acUndo.Enabled and (FUndoList.Current <> nil) then
    acUndo.Caption := _(ClassName, FUndoList.Current.Description)
  else if reTranslation.CanUndo then
    acUndo.Caption := _(ClassName, SUndoText)
  else
    acUndo.Caption := _(ClassName, SNothingToUndo);

  acDictSave.Enabled := FDictionary.Count > 0;
  acDictEdit.Enabled := acDictSave.Enabled;
  acDictTranslate.Enabled := (FDictionary.Count > 0) and (ACount > 0);
  acDictAdd.Enabled := (Index > -1) and (FTranslateFile.Items[Index].Original <> '') and (FTranslateFile.Items[Index].Translation <> '');

  acFind.Enabled := ACount > 0;
  acFindNext.Enabled := ACount > 0;
  acReplace.Enabled := ACount > 0;
  //  acSaveTrans.Enabled := Modified;
  acPrev.Enabled := (Index > -1) and (Index > 0);
  acNext.Enabled := (Index > -1) and (Index < lvTranslateStrings.Items.Count - 1);
  acAsciiValues.Enabled := (reOriginal.SelLength > 0) or (reTranslation.SelLength > 0);
  acClearAllTranslations.Enabled := ACount > 0;
  acReplaceEverywhere.Enabled := (Index > -1);
  acNextSuspicious.Enabled := ACount > 0;
  acViewOrphans.Enabled := FTranslateFile.Orphans.Count > 0;
  acViewComments.Checked := (frmComments <> nil) and frmComments.Visible;
  acCopy.Enabled := (ActiveControl is TCustomEdit) and (TCustomEdit(ActiveControl).SelLength > 0);
  acCut.Enabled := acCopy.Enabled and
    (GetWindowLong(TCustomEdit(ActiveControl).Handle, GWL_STYLE) and ES_READONLY <> ES_READONLY);
  acPaste.Enabled := (TntClipboard.HasFormat(CF_TEXT) or TntClipboard.HasFormat(CF_UNICODETEXT)) and
    (GetWindowLong(TCustomEdit(ActiveControl).Handle, GWL_STYLE) and ES_READONLY <> ES_READONLY);
  acToggleTranslated.Enabled := Index > -1;
  acToggleTranslated.Checked := acToggleTranslated.Enabled and FTranslateFile.Items[Index].Translated;

  acDeleteItem.Enabled := (Index <> -1) and ((FCapabilitesSupported = 0) or (FCapabilitesSupported and CAP_ITEM_DELETE = CAP_ITEM_DELETE));
  acAddItem.Enabled := (Index <> -1) and ((FCapabilitesSupported = 0) or (FCapabilitesSupported and CAP_ITEM_INSERT = CAP_ITEM_INSERT));
  acEditItem.Enabled := (Index <> -1) and ((FCapabilitesSupported = 0) or (FCapabilitesSupported and CAP_ITEM_EDIT = CAP_ITEM_EDIT));
  // Handled := true;
end;

procedure TfrmMain.lvTranslateStringsColumnClick(Sender:TObject;
  Column:TListColumn);
begin
  WaitCursor;
  //  lvTranslateStrings.Items.Count := 0;
  try
    lvTranslateStrings.Columns[0].ImageIndex := -1;
    lvTranslateStrings.Columns[1].ImageIndex := -1;
    case Column.Index of
      0:
        begin
          if FTranslateFile.Items.Sort <> stOriginal then
          begin
            FTranslateFile.Items.Sort := stOriginal;
            lvTranslateStrings.Columns[0].ImageIndex := cArrowDown;
          end
          else
          begin
            FTranslateFile.Items.Sort := stInvertOriginal;
            lvTranslateStrings.Columns[0].ImageIndex := cArrowUp;
          end;
        end;
      1:
        begin
          if FTranslateFile.Items.Sort <> stTranslation then
          begin
            FTranslateFile.Items.Sort := stTranslation;
            lvTranslateStrings.Columns[1].ImageIndex := cArrowDown;
          end
          else
          begin
            FTranslateFile.Items.Sort := stInvertTranslation;
            lvTranslateStrings.Columns[1].ImageIndex := cArrowUp;
          end;
        end;
      2:
        begin
          if FTranslateFile.Items.Sort <> stIndex then
          begin
            FTranslateFile.Items.Sort := stIndex;
            lvTranslateStrings.Columns[2].ImageIndex := cArrowDown;
          end
          else
          begin
            FTranslateFile.Items.Sort := stInvertIndex;
            lvTranslateStrings.Columns[2].ImageIndex := cArrowUp;
          end;
        end;
    end; // case
  finally
    //    lvTranslateStrings.Items.Count := FTranslateFile.Count;
    lvTranslateStringsChange(Sender, SelectedListItem, ctText);
    lvTranslateStrings.Invalidate;
  end;
end;

procedure TfrmMain.acRestoreSortExecute(Sender:TObject);
var
  i, j:integer;
begin
  if not lvTranslateStrings.HandleAllocated then
    Exit;
  WaitCursor;
  if SelectedListItem <> nil then
    i := SelectedListItem.Index
  else
    i := 0;
  ScrollToTop;
  lvTranslateStrings.Items.Count := 0;
  try
    FTranslateFile.Items.Sort := stIndex;
    for j := 0 to lvTranslateStrings.Columns.Count - 1 do
      lvTranslateStrings.Columns[j].ImageIndex := -1;
  finally
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    if FTranslateFile.Items.Count > 0 then
    begin
      SelectedListItem := lvTranslateStrings.Items[i];
      lvTranslateStrings.Invalidate;
    end;
  end;
end;

procedure TfrmMain.pnlBottomResize(Sender:TObject);
var
  W:integer;
begin
  W := pnlBottom.Height - pnlOrig.Height - pnlTrans.Height;
  if W < 0 then
    Exit;
  reOriginal.Height := W div 2;
end;

procedure TfrmMain.acDictSaveExecute(Sender:TObject);
begin
  if FDictionary.Count = 0 then
  begin
    ErrMsg(_(ClassName, SErrDictEmpty), _(ClassName, SInfoCaption));
    Exit;
  end;
  SaveDictDlg.FileName := GlobalAppOptions.DictionaryFile;
  if SaveDictDlg.Execute then
  begin
    SaveDictionary(SaveDictDlg.FileName);
    UpdateStatus;
  end;
end;

procedure TfrmMain.acDictLoadExecute(Sender:TObject);
begin
  OpenDictDlg.Filename := GlobalAppOptions.DictionaryFile;
  if OpenDictDlg.Execute then
  begin
    LoadDictionary(OpenDictDlg.FileName);
    UpdateStatus;
  end;
end;

procedure TfrmMain.acDictCreateExecute(Sender:TObject);
begin
  CreateDict(YesNo(_(ClassName, SClearDictPrompt), _(ClassName, SConfirmCaption)));
  InfoMsg(_(ClassName, SDictCreated), _(ClassName, SInfoCaption));
end;

procedure TfrmMain.acDictTranslateExecute(Sender:TObject);
begin
  if FDictionary.Count = 0 then
  begin
    ErrMsg(_(ClassName, SErrDictEmpty), _(ClassName, SInfoCaption));
    Exit;
  end;
  WaitCursor;
  try
    UseDictionary;
  finally
    lvTranslateStrings.Invalidate;
  end;
end;

procedure TfrmMain.acExitExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrmMain.SetUpLangFile;
begin
  GlobalLanguageFile.OnRead := DoReadObject;
  GlobalLanguageFile.SkipProperty('Name');
  GlobalLanguageFile.SkipProperty('Category');
  GlobalLanguageFile.SkipProperty('HelpKeyWord');
  GlobalLanguageFile.SkipProperty('HelpFile');
  GlobalLanguageFile.SkipProperty('Filename');
  GlobalLanguageFile.SkipProperty('ImeName');
  GlobalLanguageFile.SkipProperty('SecondaryShortCuts');
  GlobalLanguageFile.SkipProperty('DefaultExt');
  GlobalLanguageFile.SkipProperty('InitialDir');
  GlobalLanguageFile.SkipProperty('FindText');
  GlobalLanguageFile.SkipProperty('ReplaceText');
  GlobalLanguageFile.SkipProperty('FindHistory');
  GlobalLanguageFile.SkipProperty('ReplaceHistory');

  GlobalLanguageFile.SkipClass(TPanel);
  GlobalLanguageFile.SkipClass(THintWindow);
  GlobalLanguageFile.SkipClass(TStatusBar);
  GlobalLanguageFile.SkipClass(TStatusPanel);
  GlobalLanguageFile.SkipClass(TAction);
  GlobalLanguageFile.SkipClass(TCustomEdit);
  GlobalLanguageFile.SkipClass(TTBXStatusBar);
  GlobalLanguageFile.SkipClass(TTBXStatusPanel);
  GlobalLanguageFile.SkipClass(TSpTBXSeparatorItem);
  GlobalLanguageFile.SkipClass(TSpTBXThemeGroupItem);
  GlobalLanguageFile.SkipClass(TTBXSwitcher);
  GlobalLanguageFile.SkipClass(TTBXMRUList);
  GlobalLanguageFile.SkipClass(TProgressBar);
  GlobalLanguageFile.SkipClass(TTBXSeparatorItem);
  GlobalLanguageFile.SkipClass(TTBXComboBoxItem);
end;

procedure TfrmMain.CreateEverything;
begin
  FApplicationServices := TApplicationServices.Create(self);
  GlobalApplicationServicesFunc := TApplicationServicesFunc(@InternalApplicationServicesFunc);
  FTranslateFile := TTranslateFiles.Create;
  FFindReplace := TFindReplace.Create(Self);
  FDictionary := TDictionaryItems.Create;

  ClearBookmarks;
  SetUpLangFile;
end;

procedure TfrmMain.FreeEverything;
var
  i:integer;
begin
  FreeAndNil(FNotify);
  FreeAndNil(FTranslateFile);
  FreeAndNil(FDictionary);
  FreeAndNil(FExternalToolItems);
  FreeAndNil(FUndoList);
  for i := 0 to Length(FFileMonitors) - 1 do
    if FFileMonitors[i] <> nil then
    begin
      FFileMonitors[i].FreeOnTerminate := false;
      FFileMonitors[i].Terminate;
      FFileMonitors[i].Free;
      FFileMonitors[i] := nil;
    end;
  FApplicationServices := nil;
end;

procedure TfrmMain.FormCreate(Sender:TObject);
begin
  ScreenCursor(crAppStart);
  CreateEverything;

  DragAcceptFiles(Handle, true);
  ToolbarFont.CharSet := DEFAULT_CHARSET;
  SetLength(FFileMonitors, 3);

  LoadSettings(true);
  BuildExternalToolMenu(mnuPlugins);

  HandleCommandLine;
  UpdateStatus;
  Windows.SetFocus(reTranslation.Handle);
  // strange bug here: form picks up "Show about box" hint (something to do with TBX maybe?)
  Hint := '';
end;

function TfrmMain.CloseApp:boolean;
begin
  Result := CheckModified and CheckDictModified;
  if Result then
  begin
    lvTranslateStrings.Items.Count := 0; // clear
    if acFullScreen.Checked then
      acFullScreen.Execute;
    DragAcceptFiles(Handle, false);
    SaveEditChanges;
    SaveSettings;
    FreeEverything;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender:TObject; var CanClose:boolean);
begin
  WaitCursor;
  CanClose := CloseApp;
end;

procedure TfrmMain.lvTranslateStringsChange(Sender:TObject;
  Item:TListItem; Change:TItemChange);
begin
  if Item <> nil then
    with FTranslateFile.Items[Item.Index] do
    begin
      reOriginal.Text := AddQuotes(MyWideDequotedStr(Original, OrigQuote));
      reTranslation.Text := AddQuotes(MyWideDequotedStr(Translation, TransQuote));
      reTranslation.Modified := false;
      if frmComments <> nil then
      begin
        frmComments.SetComments(FTranslateFile.Items[Item.Index], FTranslateFile.CommentChars);
        frmComments.OnCommentModified := DoCommentModified;
      end;
    end
  else if frmComments <> nil then
    frmComments.SetComments(nil, FTranslateFile.CommentChars);
  UpdateStatus;
end;

procedure TfrmMain.reTranslationExit(Sender:TObject);
var
  i:integer;
begin
  if reTranslation.Modified and (SelectedListItem <> nil) then
  begin
    i := SelectedListItem.Index;
    with FTranslateFile.Items[i] do
    begin
      if not NotifyChanging(NOTIFY_ITEM_TRANS_CHANGE, Integer(PWideChar(Translation)), Integer(PWideChar(reTranslation.Text))) then
        Exit;
      AddUndo(SelectedItem, _(ClassName, SUndoEdit), cUndoEdit);
      Translation := RemoveQuotes(trimCRLFRight(reTranslation.Text));
      NotifyChanged(NOTIFY_ITEM_TRANS_CHANGE, Integer(PWideChar(Translation)), 0);
      Translated := MyWideDequotedStr(Translation, TransQuote) <> '';
      lvTranslateStrings.Invalidate;
      if GlobalAppOptions.UseTranslationEverywhere then
      begin
        reTranslation.Modified := false; // avoid infinite recursion
        acReplaceEverywhere.Execute;
      end;
      Modified := true;
    end;
    UpdateStatus;
  end
end;

procedure TfrmMain.lvTranslateStringsData(Sender:TObject;
  Item:TListItem);
begin
  if Item = nil then
    Exit;

  with FTranslateFile.Items[Item.Index] do
  begin
    TTntListItem(Item).Caption := MyWideDequotedStr(Original, OrigQuote);
    if not Translated then
    begin
      Item.ImageIndex := cDefaultUntranslatedImage;
      if (trim(OrigComments) <> '') or (trim(TransComments) <> '') then
        Item.ImageIndex := cUntranslatedCommentImage;
    end
    else
    begin
      Item.ImageIndex := cDefaultItemImage;
      if (trim(OrigComments) <> '') or (trim(TransComments) <> '') then
        Item.ImageIndex := cTranslatedCommentImage;
    end;
    TTntListItem(Item).SubItems.Add(MyWideDequotedStr(Translation, TransQuote));
    TTntListItem(Item).SubItems.Add(IntToStr(Index + 1));
  end;

  Item.StateIndex := GetBookmark(Item.Index);
end;

function TfrmMain.SelectOriginal(ShowDialog, ShowTransDialog:boolean):boolean;
begin
  Result := CheckModified;
  if not Result then
    Exit;
  OpenOrigDlg.FileName := GetFilename(GlobalAppOptions.OriginalFile);
  OpenOrigDlg.FilterIndex := GlobalAppOptions.FilterIndex;
  OpenOrigDlg.EncodingIndex := GlobalAppOptions.OrigEncoding;
  if not ShowDialog or OpenOrigDlg.Execute then
  begin
    GlobalAppOptions.FilterIndex := OpenOrigDlg.FilterIndex;
    Modified := false;
    LoadOriginal(OpenOrigDlg.FileName, TEncoding(OpenOrigDlg.EncodingIndex));
    Result := SelectTranslation(ShowTransDialog, true);
  end
  else
    Result := false;
end;

function TfrmMain.SelectTranslation(ShowDialog, CalledByOrig:boolean):boolean;
begin
  Result := CheckModified;
  if not Result then
    Exit;
  OpenTransDlg.FileName := GetFilename(GlobalAppOptions.TranslationFile);
  OpenTransDlg.FilterIndex := GlobalAppOptions.FilterIndex;
  OpenTransDlg.EncodingIndex := GlobalAppOptions.TransEncoding;
  if not ShowDialog or OpenTransDlg.Execute then
  begin
    GlobalAppOptions.FilterIndex := OpenOrigDlg.FilterIndex;
    Modified := false;
    LoadTranslation(OpenTransDlg.FileName, TEncoding(OpenTransDlg.EncodingIndex));
    FIsImport := false;
    // jump directly to first untranslated item (if available)
  end
  else if not CalledByOrig then
    Exit
  else if FileExists(GlobalAppOptions.TranslationFile) then
    LoadTranslation(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding))
  else
  begin
    acNewTrans.Execute;
    Result := false;
  end;
end;

procedure TfrmMain.acOpenOrigExecute(Sender:TObject);
begin
  SelectOriginal(true, true);
end;

procedure TfrmMain.acOpenTransExecute(Sender:TObject);
begin
  SelectTranslation(true, false);
end;

procedure TfrmMain.acSaveTransExecute(Sender:TObject);
begin
  SaveTranslation(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding));
end;

procedure TfrmMain.acSaveTransAsExecute(Sender:TObject);
begin
  SaveTranslationAs(GlobalAppOptions.TranslationFile, TEncoding(GlobalAppOptions.TransEncoding));
end;

procedure TfrmMain.acSaveOriginalExecute(Sender:TObject);
begin
  SaveOriginal(GlobalAppOptions.OriginalFile, TEncoding(GlobalAppOptions.OrigEncoding));
end;

procedure TfrmMain.acSaveOrigAsExecute(Sender:TObject);
begin
  SaveOrigAs(GlobalAppOptions.OriginalFile, TEncoding(GlobalAppOptions.OrigEncoding));
end;

procedure TfrmMain.acPrevExecute(Sender:TObject);
begin
  if (SelectedListItem = nil) then
    MoveListViewSelection(0)
  else
    MoveListViewSelection(SelectedListItem.Index - 1);
end;

procedure TfrmMain.acNextExecute(Sender:TObject);
begin
  if (SelectedListItem = nil) then
    MoveListViewSelection(0)
  else
    MoveListViewSelection(SelectedListItem.Index + 1)
end;

procedure TfrmMain.acCopyFromOriginalExecute(Sender:TObject);
begin
  reTranslation.Text := reOriginal.Text;
  Modified := true;
end;

procedure TfrmMain.reTranslationEnter(Sender:TObject);
begin
  reTranslation.SelectAll;
end;

procedure TfrmMain.acAboutExecute(Sender:TObject);
var
  S:WideString;
begin
  S := WideFormat(_(ClassName, SFmtAboutText), [Caption, GetAppVersion, GetCurrentYear]);
  AboutMsg(S, WideFormat(_(ClassName, SFmtAboutCaption), [Caption]));
end;

procedure TfrmMain.acCutExecute(Sender:TObject);
begin
  if ActiveControl is TTntRichEdit then
  begin
    TntClipboard.AsWideText := trimCRLFRight(TTntRichEdit(ActiveControl).SelText);
    TTntRichEdit(ActiveControl).SelText := '';
    TTntRichEdit(ActiveControl).Modified := true;
  end
  else if ActiveControl is TWinControl then
    SendMessage(TWinControl(ActiveControl).Handle, WM_CUT, 0, 0);
end;

procedure TfrmMain.acCopyExecute(Sender:TObject);
begin
  if ActiveControl is TTntRichEdit then
    TntClipboard.AsWideText := trimCRLFRight(TTntRichEdit(ActiveControl).SelText)
  else if ActiveControl is TWinControl then
    SendMessage(TWinControl(ActiveControl).Handle, WM_COPY, 0, 0);
end;

procedure TfrmMain.acPasteExecute(Sender:TObject);
begin
  if ActiveControl is TTntRichEdit then
  begin
    TTntRichEdit(ActiveControl).SelText := trimCRLFRight(TntClipboard.AsWideText);
    TTntRichEdit(ActiveControl).Modified := true;
  end
  else if ActiveControl is TWinControl then
    SendMessage(TWinControl(ActiveControl).Handle, WM_PASTE, 0, 0);
end;

procedure TfrmMain.acSelectAllExecute(Sender:TObject);
begin
  if ActiveControl is TWinControl then
    SendMessage(TWinControl(ActiveControl).Handle, EM_SETSEL, 0, -1);
end;

procedure TfrmMain.acUndoExecute(Sender:TObject);
begin
  if FUndoList.CanUndo then
    FUndoList.Undo
  else if reTranslation.CanUndo then
  begin
    reTranslation.Undo;
    reTranslation.Modified := reTranslation.CanUndo;
  end
  else if ActiveControl is TWinControl then
    SendMessage(TWinControl(ActiveControl).Handle, WM_UNDO, 0, 0);
end;

procedure TfrmMain.lvTranslateStringsEnter(Sender:TObject);
begin
  if (SelectedListItem = nil) and (lvTranslateStrings.Items.Count > 0) then
    SelectedListItem := lvTranslateStrings.Items[0];
  if (SelectedListItem <> nil) then
    SelectedListItem.Focused := true;
end;

procedure TfrmMain.acToggleFocusExecute(Sender:TObject);
begin
  if lvTranslateStrings.Focused then
    reTranslation.SetFocus
  else
    lvTranslateStrings.SetFocus;
end;

procedure TfrmMain.acFocusTranslationExecute(Sender:TObject);
begin
  reTranslation.SetFocus;
  reTranslation.SelectAll;
end;

procedure TfrmMain.acFindExecute(Sender:TObject);
begin
  if not FFindReplace.Showing then
  begin
    SaveEditChanges;
    FFindReplace.Expanded := false;
    FFindReplace.FindInIndex := TFindIn(GlobalAppOptions.FindInIndex);
    FFindReplace.Execute;
  end;
end;

procedure TfrmMain.acFindNextExecute(Sender:TObject);
begin
  if FFindReplace.FindText = '' then
    acFind.Execute
  else
  begin
    SaveEditChanges;
    DoFindNext(Sender);
  end;
end;

procedure TfrmMain.acReplaceExecute(Sender:TObject);
begin
  if not FFindReplace.Showing then
  begin
    FFindReplace.Expanded := true;
    FFindReplace.Execute;
  end;
end;

procedure TfrmMain.lvTranslateStringsAdvancedCustomDrawItem(
  Sender:TCustomListView; Item:TListItem; State:TCustomDrawState;
  Stage:TCustomDrawStage; var DefaultDraw:boolean);
begin
  if (Item <> nil) and (Stage = cdPrePaint) then
  begin
    Sender.Canvas.Font := TListView(Sender).Font;
    if [cdsFocused] * State <> [] then
    begin
      Sender.Canvas.Brush.Color := clHighlight;
      Sender.Canvas.Font.Color := clHighlightText;
    end
    else if not FTranslateFile.Items[Item.Index].Translated then
    begin
      Sender.Canvas.Brush.Color := GlobalAppOptions.ColorUntranslated;
      Sender.Canvas.Font.Color := GlobalAppOptions.ColorFontUntranslated;
    end
    else if Odd(Item.Index) then
    begin
      Sender.Canvas.Brush.Color := GlobalAppOptions.ColorEvenRow;
      Sender.Canvas.Font.Color := GlobalAppOptions.ColorFontEvenRow;
    end
    else
    begin
      Sender.Canvas.Brush.Color := GlobalAppOptions.ColorOddRow;
      Sender.Canvas.Font.Color := GlobalAppOptions.ColorFontOddRow;
    end;
    DefaultDraw := true;
    ;
  end;
end;

procedure TfrmMain.acNextUntranslatedExecute(Sender:TObject);
var
  i:integer;
begin
  SaveEditChanges;
  if SelectedListItem = nil then
    i := 0
  else
    i := SelectedListItem.Index + 1;
  if i >= FTranslateFile.Items.Count then
    i := 0; // wrap
  while i < FTranslateFile.Items.Count do
  begin
    if not FTranslateFile.Items[i].Translated then
    begin
      SelectedListItem := lvTranslateStrings.Items[i];
      SelectedListItem.MakeVisible(false);
      Exit;
    end;
    Inc(i);
  end;
end;

procedure TfrmMain.acPrevUntranslatedExecute(Sender:TObject);
var
  i:integer;
begin
  SaveEditChanges;
  if SelectedListItem = nil then
    i := FTranslateFile.Items.Count - 1
  else
    i := SelectedListItem.Index - 1;
  if i < 0 then
    i := FTranslateFile.Items.Count - 1; // wrap
  while i > -1 do
  begin
    if not FTranslateFile.Items[i].Translated then
    begin
      SelectedListItem := lvTranslateStrings.Items[i];
      SelectedListItem.MakeVisible(false);
      Exit;
    end;
    Dec(i);
  end;
end;

procedure TfrmMain.acFocusListViewExecute(Sender:TObject);
begin
  lvTranslateStrings.SetFocus;
end;

procedure TfrmMain.acFocusOriginalExecute(Sender:TObject);
begin
  reOriginal.SetFocus;
  reOriginal.SelectAll;
end;

procedure TfrmMain.acShowQuotesExecute(Sender:TObject);
begin
  acShowQuotes.Checked := not acShowQuotes.Checked;
  lvTranslateStringsChange(Sender, SelectedListItem, ctText);
end;

procedure TfrmMain.acDictInvertExecute(Sender:TObject);
begin
  WaitCursor;
  acDictInvert.Checked := not acDictInvert.Checked;
  FDictionary.Invert;
  UpdateStatus;
end;

procedure TfrmMain.acDictAddExecute(Sender:TObject);
var
  Index:integer;
begin
  Index := SelectedListItem.Index;
  with FTranslateFile.Items[Index] do
    if acDictInvert.Checked then
      FDictionary.Add(Translation).Translations.Add(Original)
    else
      FDictionary.Add(Original).Translations.Add(Translation);
end;

procedure TfrmMain.acHelpExecute(Sender:TObject);
begin
  if not WideFileExists(GlobalAppOptions.HelpFile) then
    ErrMsg(WideFormat(_(ClassName, SFmtErrHelpNotFound), [GlobalAppOptions.HelpFile]),
      _(ClassName, SErrorCaption))
  else
    Tnt_ShellExecuteW(Handle, '', PWideChar(GlobalAppOptions.HelpFile), nil, nil, SW_SHOWNORMAL);
  //
end;

procedure TfrmMain.lvTranslateStringsDataFind(Sender:TObject;
  Find:TItemFind; const FindString:WideString;
  const FindPosition:TPoint; FindData:Pointer; StartIndex:integer;
  Direction:TSearchDirection; Wrap:boolean; var Index:integer);
begin
  // since DataFind is called as soon as the user types in the listview, we can check
  // for auto focus here instead of using the keydown event
  Index := -1;
  if GlobalAppOptions.AutoFocusTranslation then
  begin
    reTranslation.Text := FindString;
    reTranslation.SetFocus;
    reTranslation.SelStart := Length(FindString);
    Exit;
  end;

  // we ignore most properties here
  while (StartIndex >= 0) and (StartIndex < FTranslateFile.Items.Count) do
  begin
    if WideStartsText(FindString, FTranslateFile.Items[StartIndex].Original) then
    begin
      Index := StartIndex;
      Exit;
    end;
    if Direction <> sdAbove then
      Inc(StartIndex)
    else
      Dec(StartIndex);
  end;
end;

procedure TfrmMain.acNewTransExecute(Sender:TObject);
var
  i, j:integer;
begin
  if SelectedListItem <> nil then
    j := SelectedListItem.Index
  else
    j := 0;
  ScrollToTop;
  FUndoList.Clear;
  lvTranslateStrings.Items.Count := 0;
  try
    for i := 0 to FTranslateFile.Items.Count - 1 do
    begin
      FTranslateFile.Items[i].Translation := '';
      FTranslateFile.Items[i].TransComments := '';
      FTranslateFile.Items[i].Translated := false;
    end;
  finally
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    lvTranslateStrings.Invalidate;
    if j < FTranslateFile.Items.Count then
      SelectedListItem := lvTranslateStrings.Items[j];
  end;
  GlobalAppOptions.TranslationFile := '';
  GlobalAppOptions.TransEncoding := GlobalAppOptions.DefaultTransEncoding;
  UpdateStatus;
end;

procedure TfrmMain.acCreateTranslationFileExecute(Sender:TObject);
const
  cTranslatableForms:array[0..10] of TFormClass =
  (TfrmOptions, TfrmOrphans, TfrmConfigKbd, TfrmImportExport, TfrmTools, TfrmPromptArgs,
    TfrmEditItem, TfrmConfigSuspicious, TfrmDictTranslationSelect,
    TfrmDictEdit, TfrmColors);

var
  i:integer;
  AForms:array[0..11] of TForm;
begin
  with TTntSaveDialog.Create(nil) do
  try
    Options := Options + [ofOverwritePrompt];
    Title := _(ClassName, SSaveTranslationTemplate);
    Filter := SFileFilter;
    DefaultExt := 'lng';
    if Execute then
    begin
      WaitCursor;
      try
        mnuPlugins.Clear; // let the plugins translate themselves!
        while mnuTools.Count > 1 do
          mnuTools.Delete(mnuTools.Count - 1); // tool items should not be translated

        RenameFile(FileName, FileName + '.bak');
        DeleteFile(FileName); // make sure there are no redundant items in the file
        GlobalLanguageFile.OnWriting := DoAllowWriting;
        GlobalLanguageFile.OnWrite := DoWriteObject;
        GlobalLanguageFile.OnWriteAdditional := DoSaveExtra;
      // Create the forms so we can access their properties
      // (I wonder if there is a more generic way to create all forms in an application?)
        for i := Low(cTranslatableForms) to High(cTranslatableForms) do
          AForms[i] := cTranslatableForms[i].Create(Application);
        try
        // this call iterates all the forms of the app and gets the translatable strings
          GlobalLanguageFile.CreateTemplate(FileName, Application);
        finally
          for i := Low(cTranslatableForms) to High(cTranslatableForms) do
            AForms[i].Free;
        end;
        DeleteFile(FileName + '.bak'); // remove backup
        BuildToolMenu(mnuTools);
        BuildExternalToolMenu(mnuPlugins);
      except
        // something went wrong, restore old file
        RenameFile(Filename + '.bak', Filename);
        raise;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.acCopyAllFromOrigExecute(Sender:TObject);
var
  i:integer;
begin
  FUndoList.Clear;
  lvTranslateStrings.Items.Count := 0;
  try
    for i := 0 to FTranslateFile.Items.Count - 1 do
      if not FTranslateFile.Items[i].Translated then
      begin
        FTranslateFile.Items[i].Translation := FTranslateFile.Items[i].Original;
        FTranslateFile.Items[i].Translated := FTranslateFile.Items[i].Translation <> '';
      end;
  finally
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    lvTranslateStrings.Invalidate;
  end;
end;

procedure TfrmMain.acViewDetailsExecute(Sender:TObject);
begin
  acViewDetails.Checked := not acViewDetails.Checked;
  pnlKeyBack.Visible := acViewDetails.Checked;
end;

procedure TfrmMain.acPasteUpdate(Sender:TObject);
begin
  // the standard edit cut/paste actions doesn't do this right:
  if (ActiveControl is TCustomEdit) and TCustomEdit(ActiveControl).HandleAllocated then
  begin
    acPaste.Enabled := GetWindowLong(TCustomEdit(ActiveControl).Handle, GWL_STYLE) and ES_READONLY = 0;
    acCut.Enabled := acPaste.Enabled and (TCustomEdit(ActiveControl).SelLength > 0);
  end
  else
  begin
    acCut.Enabled := false;
    acPaste.Enabled := false;
  end;
end;

procedure TfrmMain.reTranslationKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if GlobalAppOptions.SaveOnReturn then
      reTranslationExit(Sender); // save changes
    if GlobalAppOptions.AutoMoveToNext then
    begin
      if ssShift in Shift then
        acPrev.Execute
      else
        acNext.Execute;
    end;
    Key := 0;
  end;
end;

procedure TfrmMain.acCopyFromNameExecute(Sender:TObject);
begin
  if SelectedItem <> nil then
  begin
    reTranslation.Text := SelectedItem.Name;
    Modified := true;
  end;
end;

procedure TfrmMain.acPreferencesExecute(Sender:TObject);
begin
  SaveSettings;
  if TfrmOptions.Execute(GlobalAppOptions) then
    LoadSettings(false);
end;

procedure TfrmMain.acViewCommentsExecute(Sender:TObject);
begin
  if frmComments <> nil then
  begin
    if frmComments.Visible then
      frmComments.Hide
    else
    begin
      frmComments.Show;
      MoveCommentWindow;
      SetFocus;
    end;
  end;
end;

procedure TfrmMain.acAsciiValuesExecute(Sender:TObject);
var
  S, T:WideString;
  i:integer;
begin
  if reOriginal.Focused then
    S := reOriginal.SelText
  else
    S := reTranslation.SelText;
  T := '  ';
  for i := 1 to Length(S) do
    T := T + ' $' + IntToHex(Ord(S[i]), 2);
  T := T + #13#10'  ';
  for i := 1 to Length(S) do
    T := T + WideFormat('Alt+%.5d ', [Ord(S[i])]);
  if YesNo(_(ClassName, SAsciiValue) + #13#10 + T + #13#10#13#10 + _(ClassName, SQCopyToClipboard),
    _(ClassName, SDecodedCharsCaption)) then
    TntClipboard.AsWideText := T;
end;

procedure TfrmMain.lvTranslateStringsInfoTip(Sender:TObject;
  Item:TListItem; var InfoTip:string);
var
  P:TPoint;
  AInfoTip:WideString;
  AItem:ITranslationItem;
begin
  InfoTip := '';
  AInfoTip := '';
  if Item <> nil then
  begin
    GetCursorPos(P);
    AItem := FTranslateFile.Items[Item.Index];
    if PtInRect(Rect(Left, Top, Left + Width div 2, Height), P) then
    begin
      if trim(AItem.OrigComments) <> '' then
        AInfoTip := _(ClassName, SOriginal) + ':'#13#10 + trim(AItem.OrigComments)
      else
        AInfoTip := AItem.Original;
    end
    else if PtInRect(Rect(Left + Width div 2, Top, Left + Width, Height), P) then
    begin
      if trim(AItem.TransComments) <> '' then
        AInfoTip := _(ClassName, STranslation) + ':'#13#10 + trim(AItem.TransComments)
      else
        AInfoTip := AItem.Translation;
    end
    else
    begin
      if trim(AItem.OrigComments) <> '' then
        AInfoTip := _(ClassName, SOriginal) + ':'#13#10 + trim(AItem.OrigComments) +
          #13#10#13#10;
      if trim(AItem.TransComments) <> '' then
        AInfoTip := _(ClassName, STranslation) + ':'#13#10 +
          trim(AItem.TransComments);
      if AInfoTip = '' then
        AInfoTip := AItem.Original + ' - ' + AItem.Translation;
    end;
  end;
  InfoTip := AInfoTip;
  lvTranslateStrings.Hint := AInfoTip;
end;

procedure TfrmMain.MRUFilesClick(Sender:TObject; const FileName:string);
begin
  if not CheckModified then
    Exit;
  OpenMRUFiles(FileName);
end;

procedure TfrmMain.acClearMRUExecute(Sender:TObject);
begin
  MRUFiles.Items.Clear;
end;

procedure TfrmMain.acClearInvalidMRUExecute(Sender:TObject);
var
  i:integer;
begin
  for i := MRUFiles.Items.Count - 1 downto 0 do
    if not MRUFilesExists(MRUFiles.Items[i]) then
      MRUFiles.Items.Delete(i);
end;

procedure TfrmMain.mnuFileSelect(Sender:TTBCustomItem;
  Viewer:TTBItemViewer; Selecting:boolean);
begin
  miRecentlyUsed.Enabled := MRUFiles.Items.Count > 0;
end;

procedure TfrmMain.acFindUnmatchedShortCutExecute(Sender:TObject);
var
  i:integer;

begin
  SaveEditChanges;
  if SelectedListItem = nil then
    i := 0
  else
    i := SelectedListItem.Index + 1;
  if i < 0 then
    i := lvTranslateStrings.Items.Count - 1;
  if i > lvTranslateStrings.Items.Count - 1 then
    i := 0;
  while (i >= 0) and (i < lvTranslateStrings.Items.Count - 1) do
  begin
    if (FTranslateFile.Items[i].Translation <> '') and (SubStrCount('&', FTranslateFile.Items[i].Original) <> SubStrCount('&', FTranslateFile.Items[i].Translation)) then
    begin
      SelectedListItem := lvTranslateStrings.Items[i];
      if SelectedListItem <> nil then
        SelectedListItem.MakeVisible(false);
      Exit;
    end;
    Inc(i);
  end;
end;

procedure TfrmMain.acHomeExecute(Sender:TObject);
begin
  MoveListViewSelection(0);
end;

procedure TfrmMain.acEndExecute(Sender:TObject);
begin
  MoveListViewSelection(lvTranslateStrings.Items.Count - 1);
end;

procedure TfrmMain.acPageUpExecute(Sender:TObject);
begin
  if SelectedListItem = nil then
    MoveListViewSelection(0)
  else
    MoveListViewSelection(SelectedListItem.Index - lvTranslateStrings.VisibleRowCount + 1);
end;

procedure TfrmMain.acPageDownExecute(Sender:TObject);
begin
  if SelectedListItem = nil then
    MoveListViewSelection(lvTranslateStrings.Items.Count - 1)
  else
    MoveListViewSelection(SelectedListItem.Index + lvTranslateStrings.VisibleRowCount - 1);
end;

procedure TfrmMain.GotoBookmarkExecute(Sender:TObject);
begin
  with Sender as TAction do
    GotoBookmark(Tag);
end;

procedure TfrmMain.ToggleBookmarkExecute(Sender:TObject);
begin
  if SelectedListItem <> nil then
    ToggleBookmark((Sender as TAction).Tag, SelectedListItem.Index);
end;

procedure TfrmMain.acClearAllTranslationsExecute(Sender:TObject);
var
  i:integer;
begin
  FUndoList.Clear;
  for i := 0 to FTranslateFile.Items.Count - 1 do
  begin
    FTranslateFile.Items[i].Translation := '';
    FTranslateFile.Items[i].Translated := false;
  end;
  Modified := true;
  lvTranslateStrings.Refresh;
end;

procedure TfrmMain.MakeTranslationsConsistent;
var
  i, j, FOldSort:integer;
  FOrig, FTrans:WideString;
begin
  SaveEditChanges;
  FOldSort := FTranslateFile.Items.Sort;
  try
    FTranslateFile.Items.Sort := stTranslation; // empty items at the top
    for i := 0 to FTranslateFile.Items.Count - 1 do
    begin
      FTrans := FTranslateFile.Items[i].Translation;
      if FTrans <> '' then
      begin
        FOrig := FTranslateFile.Items[i].Original;
        for j := 0 to FTranslateFile.Items.Count - 1 do
        begin
          if WideSameText(FOrig, FTranslateFile.Items[j].Original) and
            not WideSameText(FTrans, FTranslateFile.Items[j].Translation) then
          begin
            AddUndo(FTranslateFile.Items[j], _(ClassName, SUndoEdit), cUndoEdit);
            FTranslateFile.Items[j].Translation := FTrans;
            FTranslateFile.Items[j].Translated := true;
            Modified := true;
          end;
        end;
      end;
    end;
  finally
    FTranslateFile.Items.Sort := FOldSort;
    lvTranslateStrings.Refresh;
  end;
end;

procedure TfrmMain.acReplaceEverywhereExecute(Sender:TObject);
var
  AItem:ITranslationItem;
  FOrig, FTrans:WideString;
  i:integer;
  FModified:boolean;
begin
  SaveEditChanges;
  FModified := false;
  AItem := SelectedItem;
  FOrig := AItem.Original;
  FTrans := AItem.Translation;
  for i := 0 to FTranslateFile.Items.Count - 1 do
  begin
    if (AItem <> FTranslateFile.Items[i]) and WideSameText(FOrig, FTranslateFile.Items[i].Original) then
    begin
      AddUndo(FTranslateFile.Items[i], _(ClassName, SUndoEdit), cUndoEdit);
      FTranslateFile.Items[i].Translation := FTrans;
      FTranslateFile.Items[i].Translated := FTrans <> '';
      FModified := true;
    end;
  end;
  lvTranslateStrings.Refresh;
  Modified := Modified or FModified;
end;

procedure TfrmMain.acMakeConsistentExecute(Sender:TObject);
begin
  WaitCursor;
  MakeTranslationsConsistent;
end;

procedure TfrmMain.acNextSuspiciousExecute(Sender:TObject);
const
  cWideSpace = WideChar(#32);

var
  i:integer;
  FLoop:boolean;
  MisMatchList:TTntStringlist;

  function LeadingSpaces(const S:WideString):integer;
  var
    j:integer;
  begin
    Result := 0;
    if not GlobalAppOptions.MisMatchLeadingSpaces then
      Exit;
    for j := 1 to Length(S) do
      if IsCharSpace(S[j]) then
        Inc(Result)
      else
        Exit;
  end;

  function TrailingSpaces(const S:WideString):integer;
  var
    j:integer;
  begin
    Result := 0;
    if not GlobalAppOptions.MisMatchTrailingSpaces then
      Exit;
    for j := Length(S) downto 1 do
      if IsCharSpace(S[j]) then
        Inc(Result)
      else
        Exit;
  end;

  function EndControl(const S:WideString):WideString;
  var
    W:WideChar;
    i:integer;
  begin
    Result := '';
    for i := Length(S) downto 1 do
    begin
      W := TntWideLastChar(S[i]);
      if IsCharPunct(W) then
        Result := W + Result
      else
        break;
    end;
  end;

  function IsSameEndControl(const Original, Translation:WideString):boolean;
  begin
    Result := not GlobalAppOptions.MisMatchEndControl
      or WideSameStr(EndControl(Original), EndControl(Translation));
  end;

  function CountMisMatch(const Original, Translation:WideString):boolean;
  var
    i:Integer;
  begin
    Result := MisMatchList.Count > 0;
    for i := 0 to MisMatchList.Count - 1 do
      if SubStrCount(MisMatchList[i], Original) <> SubStrCount(MisMatchList[i], Translation) then
        Exit;
    Result := false;
  end;

  function IsSame(const Original, Translation:WideString):boolean;
  begin
    Result := GlobalAppOptions.MisMatchIdentical and WideSameStr(Original, Translation);
  end;

  function IsUntranslated(Value:boolean):boolean;
  begin
    Result := GlobalAppOptions.MisMatchEmptyTranslation and not Value;
  end;
begin
  // this action finds any translation that doesn't match the original in the following manner:
  // * terminating character mismatch if the character is any combination of one or more punctutation markers
  // * leading and/or trailing space count mismatch
  // * original and translation is the same (this doesn't have to be an error, but it is "suspicious")
  // * translation is empty (same as acNextUntranslated)
  // * if any of the items in the "MisMatch" list doesn't match between Original and Translation
  MisMatchList := TTntStringlist.Create;
  try
    MisMatchList.CommaText := GlobalAppOptions.MisMatchItems;
    SaveEditChanges;
    if SelectedListItem <> nil then
      i := SelectedListItem.Index
    else
      i := -1;
    if i = lvTranslateStrings.Items.Count - 1 then
      i := -1;
    Inc(i);
    FLoop := false;
    while i < FTranslateFile.Items.Count do
    begin
      with FTranslateFile.Items[i] do
      begin
        if IsSame(Original, Translation) then
          Break;
        if IsUntranslated(Translated) then
          Break
        else if Translation <> '' then
        begin
          if (LeadingSpaces(Original) <> LeadingSpaces(Translation))
            or (TrailingSpaces(Original) <> TrailingSpaces(Translation))
            or not IsSameEndControl(Original, Translation)
            or CountMismatch(Original, Translation) then
            Break;
        end;
        Inc(i);
        if i = FTranslateFile.Items.Count - 1 then
        begin
          if FLoop then // already looped once, so break out
          begin
            i := -1; // don't change selection
            Break;
          end;
          i := 0;
          FLoop := true;
        end;
      end;
    end;
    if (i >= 0) and (i < FTranslateFile.Items.Count) then
      SelectedListItem := lvTranslateStrings.Items[i];
    if SelectedListItem <> nil then
      SelectedListItem.MakeVisible(true);
  finally
    MisMatchList.Free;
  end;
end;

procedure TfrmMain.acViewOrphansExecute(Sender:TObject);
begin
//  lvTranslateStrings.Items.BeginUpdate;
  try
    TfrmOrphans.Edit(GlobalApplicationServices, (FCapabilitesSupported = 0) or (FCapabilitesSupported and CAP_ITEM_INSERT = CAP_ITEM_INSERT), DoMergeOrphans);
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
  finally
//    lvTranslateStrings.Items.EndUpdate;
  end;
end;

procedure TfrmMain.acConfigureKeyboardExecute(Sender:TObject);
begin
  TfrmConfigKbd.EditShortCuts(alMain);
end;

procedure TfrmMain.acImportExecute(Sender:TObject);
begin
  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_IMPORT, 0, 0) then
    Exit;
  SaveEditChanges;
  //  (FTranslateFile.Items as ITranslationItems)._AddRef;
  if not CheckModified then
    Exit;
  SelectedListItem := nil;
  ScrollToTop;
  lvTranslateStrings.Items.Count := 0;
  reOriginal.Clear;
  reTranslation.Clear;
  FUndoList.Clear;
  if TfrmImportExport.Edit(FTranslateFile.Items, FTranslateFile.Orphans,
    GetPluginsFolder, true, FImportIndex, FCapabilitesSupported) then
  begin
    FIsImport := true;
    StopMonitor(FFileMonitors[cOrigMonitor]);
    StopMonitor(FFileMonitors[cTransMonitor]);
    //    StopMonitor(FFileMonitors[cDictMonitor]);
    // make sure the "Save As" dialog is shown on Ctrl+S to prevent inadverent saving to wrong file
    GlobalAppOptions.TranslationFile := '';
    GlobalAppOptions.OriginalFile := '';
    acRestoreSort.Execute;
    Modified := true;
    NotifyChanged(NOTIFY_ITEM_IMPORT, 0, 0);
  end;
  reTranslation.Modified := false;
  lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
  ScrollToTop;
  lvTranslateStrings.Invalidate;
  UpdateStatus;
end;

procedure TfrmMain.acExportExecute(Sender:TObject);
var
  Dummy:integer;
begin
  //  (FTranslateFile.Items as ITranslationItems)._AddRef;
  WaitCursor;
  if not NotifyChanging(NOTIFY_ITEM_EXPORT, 0, 0) then
    Exit;
  if TfrmImportExport.Edit(FTranslateFile.Items, FTranslateFile.Orphans, GetPluginsFolder,
    false, FImportIndex, Dummy) then
  begin
    NotifyChanged(NOTIFY_ITEM_EXPORT, 0, 0);
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    Modified := false;
  end;
end;

procedure TfrmMain.acToggleTranslatedExecute(Sender:TObject);
begin
  with SelectedListItem do
    FTranslateFile.Items[Index].Translated := not FTranslateFile.Items[Index].Translated
end;

procedure TfrmMain.DoCommentModified(Sender:TObject;
  const AText:WideString);

{  function MakeComment(const S: WideString): WideString;
  var
    CChar: WideChar;
  begin
    CChar := FTranslateFile.CommentChar;
    Result := CChar + Tnt_WideStringReplace(trim(S), SLineBreak, SLineBreak + CChar, [rfReplaceAll]);
    while (Length(Result) > 0) and (Result[Length(Result)] = CChar) do
      SetLength(Result, Length(Result) - 1);
  end;
  }
begin
  if SelectedListItem <> nil then
    with SelectedListItem do
      FTranslateFile.Items[Index].TransComments := AText;
end;

procedure TfrmMain.UpdateColumn(Index:integer; const AFileName:WideString);
begin
  case Index of
    0:
      if AFileName <> '' then
        lvTranslateStrings.Columns[0].Caption := WideFormat(_(ClassName, SFmtOriginalColumn),
          [GetMinimizedFilename(AFileName, not GlobalAppOptions.ShowFullNameInColumns)])
      else
        lvTranslateStrings.Columns[0].Caption := _(ClassName, SOriginal);
    1:
      if AFileName <> '' then
        lvTranslateStrings.Columns[1].Caption := WideFormat(_(ClassName, SFmtTranslationColumn),
          [GetMinimizedFilename(AFileName, not GlobalAppOptions.ShowFullNameInColumns)])
      else
        lvTranslateStrings.Columns[1].Caption := _(ClassName, STranslation);
  end;
end;

procedure TfrmMain.acTestExceptionHandlerExecute(Sender:TObject);
begin
  raise Exception.Create(
    '01. This is just a test for the exception handler. Please ignore.'#10 +
    '02. This is just a test for the exception handler. Please ignore.'#10 +
    '03. This is just a test for the exception handler. Please ignore.'#10 +
    '04. This is just a test for the exception handler. Please ignore.'#10 +
    '05. This is just a test for the exception handler. Please ignore.'#10 +
    '06. This is just a test for the exception handler. Please ignore.'#10 +
    '07. This is just a test for the exception handler. Please ignore.'#10 +
    '08. This is just a test for the exception handler. Please ignore.'#10 +
    '09. This is just a test for the exception handler. Please ignore.'#10 +
    '10. This is just a test for the exception handler. Please ignore.'#10 +
    '11. This is just a test for the exception handler. Please ignore.'#10 +
    '12. This is just a test for the exception handler. Please ignore.'#10 +
    '13. This is just a test for the exception handler. Please ignore.'#10 +
    '14. This is just a test for the exception handler. Please ignore.'#10 +
    '15. This is just a test for the exception handler. Please ignore.'#10 +
    '16. This is just a test for the exception handler. Please ignore.'#10 +
    '17. This is just a test for the exception handler. Please ignore.'#10 +
    '18. This is just a test for the exception handler. Please ignore.'#10 +
    '19. This is just a test for the exception handler. Please ignore.'#10 +
    '20. This is just a test for the exception handler. Please ignore.'#10 +
    '21. This is just a test for the exception handler. Please ignore.'#10 +
    '22. This is just a test for the exception handler. Please ignore.'#10 +
    '23. This is just a test for the exception handler. Please ignore.'#10 +
    '24. This is just a test for the exception handler. Please ignore.'#10 +
    '25. This is just a test for the exception handler. Please ignore.'#10 +
    '26. This is just a test for the exception handler. Please ignore.'#10 +
    '27. This is just a test for the exception handler. Please ignore.'#10 +
    '28. This is just a test for the exception handler. Please ignore.'#10 +
    '29. This is just a test for the exception handler. Please ignore.'#10 +
    '30. This is just a test for the exception handler. Please ignore.'#10
    );
end;

procedure TfrmMain.acFullScreenExecute(Sender:TObject);
var
  P:TWindowPlacement;
begin
  acFullScreen.Checked := not acFullScreen.Checked;
  FillChar(P, sizeof(P), 0);
  P.length := sizeof(P);
  // get default and current values
  GetWindowPlacement(Handle, @P);
  // adjust UI
  if acFullScreen.Checked then
  begin
    sbBottom.Visible := false;
    tbTools.Tag := Ord(tbTools.Visible);
    tbTools.Visible := false;
    BorderStyle := bsNone;
    P.showCmd := SW_SHOWMAXIMIZED;
  end
  else
  begin
    sbBottom.Visible := true;
    tbTools.Visible := tbTools.Visible or (tbTools.Tag = 1);
    BorderStyle := bsSizeable;
    P.showCmd := SW_RESTORE;
  end;
  // set new size/position
  SetWindowPlacement(Handle, @P);
end;

procedure TfrmMain.DoTranslateSuggestionClick(Sender:TObject);
begin
  reTranslation.SelText := (Sender as TSpTBXItem).Caption;
end;

procedure TfrmMain.popEditPopup(Sender:TObject);
var
  R:TCustomEdit;
  M:TSpTBXItem;
  i, j:integer;
  S:WideString;
begin
  smiDictionary.Clear;
  if popEdit.PopupComponent is TCustomEdit then
    R := TCustomEdit(popEdit.PopupComponent)
  else
    R := nil;
  i := -1;
  if Assigned(R) and (FDictionary.Count > 0) then
  begin
    if R.SelLength = 0 then
      S := R.Text
    else
      S := R.SelText;
    i := FDictionary.IndexOf(trim(S));
    if i >= 0 then
      for j := 0 to FDictionary[i].Translations.Count - 1 do
      begin
        M := TSpTBXItem.Create(popEdit);
        M.Caption := FDictionary[i].Translations[j];
        M.OnClick := DoTranslateSuggestionClick;
        smiDictionary.Add(M);
      end;
  end;
  if i < 0 then
  begin
    M := TSpTBXItem.Create(popEdit);
    M.Caption := SNoCategory;
    smiDictionary.Add(M);
  end;
end;

{$IFDEF USEADDICTSPELLCHECKER}

procedure TfrmMain.SpellCheckExecute(Sender:TObject);
var
  i, j:integer;
begin
  if not NotifyChanging(NOTIFY_ITEM_SPELLCHECK, 0, 0) then
    Exit;
  CreateSpellChecker;
  adSpellChecker.StartSequenceCheck;
  try
    if SelectedListItem <> nil then
      j := SelectedListItem.Index
    else
      j := 0;
    for i := j to lvTranslateStrings.Items.Count - 1 do
    begin
      // this copies the content of the listview item to the richedit control (reTranslation)
      SelectedListItem := lvTranslateStrings.Items[i];
      SelectedListItem.MakeVisible(false);
      // the OnCompleteCheck event is hooked up to save any changes to the richedit back to the listview
      adSpellChecker.CheckWinControl(reTranslation, ctAll);
      if adSpellChecker.CheckCanceled then
        Exit;
    end;
    if j <> 0 then
      for i := 0 to j do
      begin
        // this copies the content of the listview item to the richedit control (reTranslation)
        SelectedListItem := lvTranslateStrings.Items[i];
        SelectedListItem.MakeVisible(false);
        // the OnCompleteCheck event is hooked up to save any changes to the richedit back to the listview
        adSpellChecker.CheckWinControl(reTranslation, ctAll);
        if adSpellChecker.CheckCanceled then
          Exit;
      end;
  finally
    adSpellChecker.StopSequenceCheck;
    FreeAndNil(adSpellChecker);
  end;
  NotifyChanged(NOTIFY_ITEM_SPELLCHECK, 0, 0);
end;

procedure TfrmMain.SpellCheckComplete(Sender:TObject);
begin
  reTranslationExit(reTranslation);
end;

procedure WriteToFile(const Name, Value:WideString);
begin
  with TWideMemIniFile.Create(ChangeFileExt(Application.ExeName, '.spl')) do
  try
    WriteString('SpellChecker', Name, Value);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TfrmMain.SpellCheckGetString(Sender:TObject; LanguageString:TSpellLanguageString; var Text:string);
var
  AText:WideString;
begin
  AText := Text;
  Text := GlobalLanguageFile.Translate('SpellChecker', Text, Text);
{$IFDEF TRANSLATOR_DEBUG}
  WriteToFile(AText, Text);
{$ENDIF}
end;

procedure TfrmMain.CreateSpellChecker;
begin
  if adSpellChecker <> nil then
    Exit;
  adSpellChecker := TAddictSpell3.Create(Self);
  with adSpellChecker do
  begin
    ConfigStorage := csFile;
    ConfigID := '%UserName%';
    ConfigFilename := '%AppDir%\dictionaries\Spell.cfg';
//    ConfigRegistryKey := 'Software\Addictive Software\%AppName%';
    ConfigDictionaryDir.Add('%AppDir%\dictionaries');
    ConfigAvailableOptions := [soUpcase, soNumbers, soInternet, soPrimaryOnly, soRepeated, soDUalCaps];
    ConfigUseMSWordCustom := True;
    ConfigDefaultMain.Add('%AppDir%\dictionaries\American.adm');
    ConfigDefaultActiveCustom := '%AppDir%\dictionaries\%ConfigID%.adu';
    ConfigDefaultOptions := [soInternet, soAbbreviations, soRepeated, soDUalCaps];
    ConfigDefaultUseMSWordCustom := False;
    SuggestionsAutoReplace := False;
    SuggestionsLearning := True;
    SuggestionsLearningDict := '%AppDir%\dictionaries\%UserName%_sp.adl';
    QuoteChars := '>';
    DialogInitialPos := ipLastUserPos;
    DialogSelectionAvoid := saAvoid;
    DialogShowImmediate := False;
    DialogShowModal := False;
    EndMessage := emExceptCancel;
    EndCursorPosition := epOriginal;
    EndMessageWordCount := False;
    MaxUndo := -1;
    MaxSuggestions := -1;
    KeepDictionariesActive := False;
    SynchronousCheck := True;
    UseHourglassCursor := True;
    CommandsVisible := [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults];
    CommandsEnabled := [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults];
    PhoneticSuggestions := True;
    PhoneticMaxDistance := 4;
    PhoneticDivisor := 2;
    PhoneticDepth := 2;
    MappingAutoReplace := True;
    UseExcludeWords := True;
    UseAutoCorrectFirst := False;
    RecheckReplacedWords := True;
    ResumeFromLastPosition := False;
    AllowedCases := cmInitialCapsOrUpcase;
    UILanguage := ltEnglish;
    UIType := suiDialog;
    UILanguageFontControls := Self.Font;
    UILanguageFontText := Self.Font;
    UILanguageUseFonts := True;
    OnCompleteCheck := reTranslationExit;
    OnSpellDialogHide := SpellCheckComplete;
    OnGetString := SpellCheckGetString;
    OnWordCheck := SpellCheckWordCheck; // check ampersand characters separately
    TMainParsingEngine(ParsingEngine).ForbidMidWord := ''; // don't skip &'s
  end;
end;

procedure TfrmMain.SpellCheckWordCheck(Sender:TObject; const Word:string; var CheckType:TWordCheckType; var Replacement:string);
begin
  if (CheckType = wcDenied) then
  begin
    Replacement := StripHotkey(Word);
    if not AnsiSameText(Word, Replacement) and adSpellChecker.WordAcceptable(Replacement) then
      CheckType := wcAccepted;
  end;
end;

{$ENDIF USEADDICTSPELLCHECKER}

procedure TfrmMain.acToolsCustomizeExecute(Sender:TObject);
begin
  // DONE: add test click event
  TfrmTools.Edit(GlobalAppOptions, alMain, DoTestToolClick);
end;

procedure TfrmMain.BuildToolMenu(Parent:TTBCustomItem);
var
  P:TSpTBXSubmenuItem;
  M:TSpTBXItem;
  i:integer;
begin
  P := Parent as TSpTBXSubmenuItem;
  while P.Count > 1 do
    P.Delete(P.Count - 1); //remove previous menu items
  if GlobalAppOptions.Tools.Count > 0 then
  begin
    P.Add(TTBXSeparatorItem.Create(Parent)); // add a separator
    for i := 0 to GlobalAppOptions.Tools.Count - 1 do
    begin
      if GlobalAppOptions.Tools[i].Title = '-' then
        P.Add(TTBXSeparatorItem.Create(Parent))
      else
      begin
        M := TSpTBXItem.Create(P);
        M.Caption := GlobalAppOptions.Tools[i].Title;
        M.Tag := integer(GlobalAppOptions.Tools[i]);
        M.ShortCut := GlobalAppOptions.Tools[i].ShortCut;
        M.OnClick := DoToolMenuClick;
        P.Add(M);
      end;
    end;
  end;
end;

procedure TfrmMain.DoExternalToolClick(Sender:TObject);
var
  T:TExternalToolItem;
  i:integer;
  AItem:ITranslationItem;
begin

  i := lvTranslateStrings.ItemIndex;
//  lvTranslateStrings.Items.BeginUpdate;
  try
    T := TExternalToolItem((Sender as TTBCustomItem).Tag);
    AItem := SelectedItem;
    T.Execute(FTranslateFile.Items, FTranslateFile.Orphans, AItem);
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    lvTranslateStrings.Invalidate;
  finally

//    lvTranslateStrings.Items.EndUpdate;
    if AItem <> nil then
      SelectedItem := AItem
    else
      lvTranslateStrings.ItemIndex := i;
  end;

  if SelectedListItem <> nil then
  begin
    SelectedListItem.Focused := true;
    SelectedListItem.MakeVisible(false);
  end;
end;

procedure TfrmMain.BuildExternalToolMenu(Parent:TTBCustomItem);
var
  M:TSpTBXItem;
  i:integer;
  E:TExternalToolItem;
begin
  if FExternalToolItems = nil then
  begin
    FExternalToolItems := TExternalToolItems.Create(GetPluginsFolder);
    FExternalToolItems.InitAll();
  end;
  Parent.Clear;
  for i := 0 to FExternalToolItems.Count - 1 do
  begin
    E := FExternalToolItems[i];
    M := TSpTBXItem.Create(Parent);
    M.Caption := E.DisplayName;
    M.OnClick := DoExternalToolClick;
    M.Images := FExternalToolItems.Images;
    M.ImageIndex := E.ImageIndex;

    M.Tag := Integer(E);
    Parent.Add(M);
  end;
  Parent.Visible := Parent.Count > 0;
end;

procedure TfrmMain.mnuPluginsPopup(Sender:TTBCustomItem; FromLink:Boolean);
var
  i, AStatus:integer;
begin
  for i := 0 to mnuPlugins.Count - 1 do
  begin
    with TExternalToolItem(mnuPlugins[i].Tag) do
      AStatus := Status(FTranslateFile.Items, FTranslateFile.Orphans, SelectedItem);
    mnuPlugins[i].Enabled := AStatus and TOOL_ENABLED = TOOL_ENABLED;
    mnuPlugins[i].Checked := AStatus and TOOL_CHECKED = TOOL_CHECKED;
    mnuPlugins[i].Visible := AStatus and TOOL_VISIBLE = TOOL_VISIBLE;
  end;
end;

function TfrmMain.MacroReplace(const AMacros:WideString):WideString;
var
  S, tmp:WideString;
begin
  Result := AMacros;

  Result := Tnt_WideStringReplace(Result, '$(OrigLine)', reOriginal.Text, [rfReplaceAll, rfIgnoreCase]);
  if reOriginal.SelLength = 0 then
    S := reOriginal.Text
  else
    S := reOriginal.SelText;
  tmp := GlobalAppOptions.OriginalFile;
  Result := Tnt_WideStringReplace(Result, '$(OrigText)', S, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(OrigPath)', tmp, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(OrigDir)', tmp, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(OrigName)', WideChangeFileExt(WideExtractFilename(tmp), ''), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(OrigExt)', WideExtractFileExt(tmp), [rfReplaceAll, rfIgnoreCase]);

  Result := Tnt_WideStringReplace(Result, '$(TransLine)', reTranslation.Text, [rfReplaceAll, rfIgnoreCase]);
  if reTranslation.SelLength = 0 then
    S := reTranslation.Text
  else
    S := reTranslation.SelText;
  tmp := GlobalAppOptions.TranslationFile;
  Result := Tnt_WideStringReplace(Result, '$(TransText)', S, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(TransPath)', tmp, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(TransDir)', WideExtractFilePath(tmp), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(TransName)', WideChangeFileExt(WideExtractFilename(tmp), ''), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(TransExt)', WideExtractFileExt(tmp), [rfReplaceAll, rfIgnoreCase]);

  tmp := GlobalAppOptions.DictionaryFile;
  Result := Tnt_WideStringReplace(Result, '$(DictPath)', tmp, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(DictDir)', WideExtractFilePath(tmp), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(DictName)', WideChangeFileExt(WideExtractFilename(tmp), ''), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(DictExt)', WideExtractFileExt(tmp), [rfReplaceAll, rfIgnoreCase]);

  Result := Tnt_WideStringReplace(Result, '$(AppDir)', WideExtractFilePath(Application.ExeName), [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(WinDir)', WinDir, [rfReplaceAll, rfIgnoreCase]);
  Result := Tnt_WideStringReplace(Result, '$(SysDir)', SysDir, [rfReplaceAll, rfIgnoreCase]);
end;

procedure TfrmMain.DoMacroReplace(Sender:TObject; var Args:WideString);
begin
  Args := MacroReplace(Args);
end;

function TfrmMain.QueryArgs(const Title, CmdLine:WideString; var Args:WideString):boolean;
begin
  Result := TfrmPromptArgs.Edit(Title, CmdLine, Args, DoMacroReplace);
end;

procedure TfrmMain.ExecuteTool(ATool:TToolItem);
var
  Cmd, Args, Dir:WideString;
  ReturnValue:Cardinal;
begin
  Cmd := MacroReplace(ATool.Command);
  if ATool.PromptForArguments then
  begin
    Args := ATool.Arguments;
    if not QueryArgs(StripHotkey(ATool.Title), Cmd, Args) then
      Exit;
    Args := MacroReplace(Args);
  end
  else
    Args := MacroReplace(ATool.Arguments);
  Dir := trim(MacroReplace(ATool.InitialDirectory));

  if ATool.UseShellExecute then
  begin
    ReturnValue := Tnt_ShellExecuteW(Handle, nil, PWideChar(Cmd), PWideChar(Args), PWideChar(Dir), SW_SHOWNORMAL);
    if ReturnValue <= 32 then
      ReturnValue := GetLastError
    else
      ReturnValue := 0;
  end
  else
  begin
    if RunProcess(trim(Cmd), trim(Args), trim(Dir), ATool.WaitForCompletion,
      ATool.WaitForCompletion, SW_SHOWNORMAL, ReturnValue) then
      ReturnValue := 0;
  end;

  if (ReturnValue <> 0) and (ATool.WaitForCompletion or ATool.UseShellExecute) then
    ErrMsg(WideFormat(_(ClassName, SFmtErrToolExec), [Cmd, Args, SysErrorMessage(ReturnValue)]), StripHotkey(ATool.Title));
end;

procedure TfrmMain.DoToolMenuClick(Sender:TObject);
begin
  ExecuteTool(TToolItem(TSpTBXItem(Sender).Tag));
end;

procedure TfrmMain.DoTestToolClick(Sender:TObject; Tool:TToolItem);
begin
  ExecuteTool(Tool);
end;

procedure TfrmMain.GetSections(Strings:TTntStringlist);
var
  i:integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    Strings.Sorted := true;
    for i := 0 to FTranslateFile.Items.Count - 1 do
      Strings.Add(FTranslateFile.Items[i].Section);
  finally
    Strings.EndUpdate;
  end;

end;

procedure TfrmMain.AddItem(AItem:ITranslationItem);
var
  AIndex, i:integer;
  FOldSort:TTranslateSortType;
begin
  if not NotifyChanging(NOTIFY_ITEM_NEW_ITEM, Integer(AItem), 0) then
    Exit;
  FOldSort := FTranslateFile.Items.Sort;
  try
    FTranslateFile.Items.Sort := stIndex;
    AIndex := FTranslateFile.Items.Add(AItem);
    i := 0;
    while i <= AIndex do
    begin
      // find first item with same section name
      if WideSameText(FTranslateFile.Items[i].Section, AItem.Section) then
      begin
        while i <= AIndex do
        begin
          // find first item with another section name
          if not WideSameText(FTranslateFile.Items[i].Section, AItem.Section) then
          begin
            // insert our new item into the list
            FTranslateFile.Items[AIndex].Index := i;
            // increment index of all subsequent items
            while i < AIndex do
            begin
              FTranslateFile.Items[i].Index := FTranslateFile.Items[i].Index + 1;
              Inc(i);
            end;
          end;
          Inc(i);
        end;
      end;
      Inc(i);
    end;
    NotifyChanged(NOTIFY_ITEM_NEW_ITEM, Integer(AItem), 0);
  finally
    FTranslateFile.Items.Sort := FOldSort;
  end;
end;

procedure TfrmMain.AddItem(const Section, Original, Translation, OrigComments, TransComments:WideString);
var
  AItem:ITranslationItem;
begin
  AItem := FTranslateFile.Items.CreateItem;
  AItem.Section := Section;
  AItem.Original := Original;
  AItem.Translation := Translation;
  AItem.OrigComments := OrigComments;
  AItem.TransComments := TransComments;
  AddItem(AItem);
end;

procedure TfrmMain.InsertItem(AItem:ITranslationItem);
var
  i, aIndex:integer;
  FOldSort:TTranslateSortType;
begin
  aIndex := AItem.Index;
  FOldSort := FTranslateFile.Items.Sort;
  try
    FTranslateFile.Items.Sort := stNone;
    for i := 0 to FTranslateFile.Items.Count - 1 do
      if FTranslateFile.Items[i].Index >= aIndex then
        FTranslateFile.Items[i].Index := FTranslateFile.Items[i].Index + 1;
    FTranslateFile.Items.Add(AItem);
    AItem.Index := aIndex;
  finally
    FTranslateFile.Items.Sort := FOldSort;
  end;
end;

procedure TfrmMain.DeleteItem(Index:integer);
var
  i:integer;
  FOldSort:TTranslateSortType;
begin
  if (Index >= 0) and (Index < FTranslateFile.Items.Count) then
  begin
    if not NotifyChanging(NOTIFY_ITEM_DEL_ITEM, Index, 0) then
      Exit;
    FTranslateFile.Items.Delete(Index);
    FTranslateFile.Items.Modified := true;
    FOldSort := FTranslateFile.Items.Sort;
    try
      FTranslateFile.Items.Sort := stIndex;
      for i := 0 to FTranslateFile.Items.Count - 1 do
        FTranslateFile.Items[i].Index := i;
    finally
      FTranslateFile.Items.Sort := FOldSort;
    end;
    NotifyChanged(NOTIFY_ITEM_DEL_ITEM, Index, 0);
  end;
end;

procedure TfrmMain.DeleteItem(const Item:ITranslationItem);
var
  i:integer;
begin
  i := FTranslateFile.Items.IndexOf(Item);
  if i >= 0 then
    DeleteItem(i);
end;

procedure TfrmMain.acAddItemExecute(Sender:TObject);
var
  AItem:ITranslationItem;
  ASections:TTntStringlist;
begin
  AItem := FTranslateFile.Items.CreateItem;
  with lvTranslateStrings do
    if ItemIndex > -1 then
      AItem.Section := FTranslateFile.Items[ItemIndex].Section;
  ASections := TTntStringlist.Create;
  try
    GetSections(ASections);
    if TfrmEditItem.Edit(_(ClassName, SCaptionAddItem), ASections, AItem, true) then
    begin
      AddUndo(AItem, _(ClassName, SUndoAdd), cUndoAdd);
      if (AItem.Section = '') then
        ErrMsg(_(ClassName, SErrSectionEmpty), SErrorCaption)
      else if (AItem.Name = '') then
        ErrMsg(_(ClassName, SErrNameEmpty), SErrorCaption)
      else if (AItem.Original = '') then
        ErrMsg(_(ClassName, SErrOrigTextEmpty), SErrorCaption)
      else if (FTranslateFile.Items.IndexOf(AItem.Section, AItem.Name, false) > -1) then
        ErrMsg(_(ClassName, SErrSectionNameExists), SErrorCaption)
      else
      begin
        lvTranslateStrings.Items.BeginUpdate;
        try
          // insert the new item at the correct location
          AddItem(AItem);
          Modified := true;
          lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
          UpdateStatus;
        finally
          lvTranslateStrings.Items.EndUpdate;
        end;
        // scroll it into view
        lvTranslateStrings.ItemIndex := FTranslateFile.Items.IndexOf(AItem.Section, AItem.Name);
        if SelectedListItem <> nil then
          SelectedListItem.MakeVisible(true);
      end;
    end;
  finally
    ASections.Free;
  end;
end;

procedure TfrmMain.acEditItemExecute(Sender:TObject);
var
  Index:integer;
  AItem, ANewItem:ITranslationItem;
  ASections:TTntStringlist;

  procedure CopyItem(const Src, Dest:ITranslationItem);
  begin
    Dest.Index := Src.Index;
    Dest.Translated := Src.Translated;
    Dest.TransComments := Src.TransComments;
    Dest.OrigComments := Src.OrigComments;
    Dest.Original := Src.Original;
    Dest.Translation := Src.Translation;
    Dest.Section := Src.Section;
    Dest.Name := Src.Name;
    Dest.ClearOriginal := Src.ClearOriginal;
    Dest.ClearTranslation := Src.ClearTranslation;
    Dest.PrivateStorage := Src.PrivateStorage;
  end;

  function EqualItems(const Src, Dest:ITranslationItem):boolean;
  begin
    Result :=
      WideSameStr(Src.Section, Dest.Section)
      and WideSameStr(Src.Name, Dest.Name)
      and WideSameStr(Src.Original, Dest.Original)
      and WideSameStr(Src.Translation, Dest.Translation)
      and WideSameStr(Src.OrigComments, Dest.OrigComments)
      and WideSameStr(Src.TransComments, Dest.TransComments);
  end;
begin
  Index := SelectedListItem.Index;
  AItem := FTranslateFile.Items[Index];
  if not NotifyChanging(NOTIFY_ITEM_EDIT_ITEM, Integer(AItem), 0) then
    Exit;
  ANewItem := FTranslateFile.Items.CreateItem;
  ASections := TTntStringlist.Create;
  try
    GetSections(ASections);
    CopyItem(AItem, ANewItem);
    if TfrmEditItem.Edit(_(ClassName, SCaptionEditItem), ASections, ANewItem, false) then
    begin
      if EqualItems(AItem, ANewItem) then
        Exit;
      AddUndo(AItem, _(ClassName, SUndoEdit), cUndoEdit);
      lvTranslateStrings.Items.BeginUpdate;
      try
        if (ANewItem.Section = '') then
          ErrMsg(_(ClassName, SErrSectionEmpty), SErrorCaption)
        else if (ANewItem.Name = '') then
          ErrMsg(_(ClassName, SErrNameEmpty), SErrorCaption)
        else if (ANewItem.Original = '') then
          ErrMsg(_(ClassName, SErrOrigTextEmpty), SErrorCaption)
        else
        begin
          lvTranslateStrings.ItemIndex := -1;
          CopyItem(ANewItem, AItem);
          Modified := true;
          lvTranslateStrings.ItemIndex := Index;
          if SelectedListItem <> nil then
            SelectedListItem.MakeVisible(true);
          UpdateStatus;
        end;
      finally
        lvTranslateStrings.Items.EndUpdate;
      end;
    end;
    NotifyChanged(NOTIFY_ITEM_EDIT_ITEM, Integer(AItem), 0);
  finally
    ASections.Free;
  end;
end;

procedure TfrmMain.acDeleteItemExecute(Sender:TObject);
var
  i:integer;
begin
  if (SelectedItem <> nil)
    and YesNo(_(ClassName, SPromptDeleteItem), _(ClassName, SConfirmDelete)) then
  begin
    i := SelectedListItem.Index;
    AddUndo(SelectedItem, _(ClassName, SUndoDelete), cUndoDelete);
    DeleteItem(SelectedItem);
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
    if i >= FTranslateFile.Items.Count then
      i := FTranslateFile.Items.Count - 1
    else if i < 0 then
      i := 0;
    lvTranslateStrings.ItemIndex := i;
    if lvTranslateStrings.ItemIndex = -1 then
      lvTranslateStrings.ItemIndex := 0;
    if SelectedListItem <> nil then
      SelectedListItem.MakeVisible(false);
    lvTranslateStrings.Invalidate;
    lvTranslateStringsChange(Sender, SelectedListItem, ctText);
    UpdateStatus;
  end;
end;

procedure TfrmMain.lvTranslateStringsDblClick(Sender:TObject);
begin
  acEditItem.Execute;
end;

procedure TfrmMain.acConfigSuspiciousExecute(Sender:TObject);
begin
  TfrmConfigSuspicious.Edit(GlobalAppOptions);
end;

procedure TfrmMain.acDictEditExecute(Sender:TObject);
begin
  TfrmDictEdit.Edit(FDictionary);
end;

function TfrmMain.GetSelectedItem:ITranslationItem;
begin
  if SelectedListItem <> nil then
    Result := FTranslateFile.Items[lvTranslateStrings.Selected.Index]
  else
    Result := nil;
end;

procedure TfrmMain.SetSelectedItem(const Value:ITranslationItem);
begin
  if Value <> nil then
    lvTranslateStrings.ItemIndex := FTranslateFile.Items.IndexOf(Value)
  else
    lvTranslateStrings.ItemIndex := -1;
  if lvTranslateStrings.Selected <> nil then
    lvTranslateStrings.Selected.MakeVisible(false);
end;

function TfrmMain.GetSelectedListItem:TTntListItem;
begin
  Result := lvTranslateStrings.Selected;
end;

procedure TfrmMain.SetSelectedListItem(const Value:TTntListItem);
begin
  lvTranslateStrings.Selected := Value;
end;

function TfrmMain.BeginUpdate:Integer;
begin
  lvTranslateStrings.Items.BeginUpdate;
end;

function TfrmMain.EndUpdate:Integer;
begin
  lvTranslateStrings.Items.EndUpdate;
  if lvTranslateStrings.Items.Count <> FTRanslateFile.Items.Count then
  begin
    lvTranslateStrings.Items.Count := FTRanslateFile.Items.Count;
    lvTranslateStrings.Invalidate;
  end;
end;

function TfrmMain.GetAppHandle:Cardinal;
begin
  Result := Application.Handle;
end;

function TfrmMain.GetMainFormHandle:Cardinal;
begin
  Result := self.Handle;
end;

function TfrmMain.GetAppOption(const Section, Name,
  Default:WideString):WideString;
begin
  Result := GlobalAppOptions.Option[Section, Name];
  if Result = '' then
    Result := Default;
end;

function TfrmMain.GetDictionaryItems:IDictionaryItems;
begin
  Result := FDictionary;
end;

function TfrmMain.GetFooter:WideString;
begin
  Result := GlobalAppOptions.Footer.Text;
end;

function TfrmMain.GetHeader:WideString;
begin
  Result := GlobalAppOptions.Header.Text;
end;

function TfrmMain.GetItems:ITranslationItems;
begin
  Result := FTranslateFile.Items;
end;

function TfrmMain.GetOrphans:ITranslationItems;
begin
  Result := FTranslateFile.Orphans;
end;

procedure TfrmMain.RegisterNotify(const ANotify:INotify);
begin
  if FNotify = nil then
    FNotify := TInterfaceList.Create;
  FNotify.Add(ANotify);
end;

procedure TfrmMain.SetAppOption(const Section, Name, Value:WideString);
var
  S:WideString;
begin
  S := GlobalAppOptions.Option[Section, Name];
  if not WideSameStr(S, Value) then
  begin
    SaveSettings;
    GlobalAppOptions.Option[Section, Name] := Value;
    LoadSettings(false);
  end;
end;

procedure TfrmMain.SetFooter(const Value:WideString);
begin
  GlobalAppOptions.Footer.Text := Value;
end;

procedure TfrmMain.SetHeader(const Value:WideString);
begin
  GlobalAppOptions.Header.Text := Value;
end;

procedure TfrmMain.UnRegisterNotify(const ANotify:INotify);
begin
  if FNotify <> nil then
    FNotify.Remove(ANotify);
end;

procedure TfrmMain.NotifyChanged(Msg, WParam, LParam:integer);
var
  i:integer;
begin
  if FNotify <> nil then
    for i := 0 to FNotify.Count - 1 do
      INotify(FNotify[i]).Changed(Msg, WParam, LParam);
end;

function TfrmMain.NotifyChanging(Msg, WParam, LParam:integer):WordBool;
var
  i:integer;
  AllowChange:WordBool;
begin
  Result := true;
  if FNotify <> nil then
    for i := 0 to FNotify.Count - 1 do
    begin
      AllowChange := true;
      INotify(FNotify[i]).Changing(Msg, WParam, LParam, AllowChange);
      if not AllowChange then
      begin
        Result := false;
        Break;
      end;
    end;
end;

function TfrmMain.Translate(const Section, Name, Value:WideString):WideString;
begin
  Result := GlobalLanguageFile.Translate(Section, Name, Value);
end;

procedure TfrmMain.DoMergeOrphans(Sender:TObject);
var
  i:integer;
  AItem:ITranslationItem;
  FOldSort:TTranslateSortType;
begin
  AItem := SelectedItem;
  FOldSort := FTranslateFile.Items.Sort;
  lvTranslateStrings.Items.BeginUpdate;
  try
    FTranslateFile.Items.Sort := stIndex;
    for i := 0 to FTranslateFile.Orphans.Count - 1 do
      AddItem(FTranslateFile.Orphans[i]);
    FTranslateFile.Orphans.Clear;
    lvTranslateStrings.Items.Count := FTranslateFile.Items.Count;
  finally
    FTranslateFile.Items.Sort := FOldSort;
    lvTranslateStrings.Items.EndUpdate;
    SelectedItem := AItem;
  end;
end;

procedure TfrmMain.DoUndoEvent(Sender:TObject; AItem:TUndoItem);
var
  i:integer;
  ItemOrig, ItemNew:ITranslationItem;
begin
  ItemOrig := TTranslationUndoItem(AItem.Data).Item;
  case AItem.UndoType of
    cUndoAdd: // an item was added, remove it
      begin
        SelectedItem := ItemOrig;
        DeleteItem(ItemOrig);
      end;
    cUndoEdit: // an item was changed, restore it
      begin
        i := FTranslateFile.Items.IndexOf(ItemOrig);
        if i >= 0 then
        begin
          ItemNew := FTranslateFile.Items[i];
          ItemNew.Index := ItemOrig.Index;
          ItemNew.Translated := ItemOrig.Translated;
          ItemNew.TransComments := ItemOrig.TransComments;
          ItemNew.OrigComments := ItemOrig.OrigComments;
          ItemNew.Original := ItemOrig.Original;
          ItemNew.Translation := ItemOrig.Translation;
          ItemNew.Section := ItemOrig.Section;
          ItemNew.Name := ItemOrig.Name;
          ItemNew.PrivateStorage := ItemOrig.PrivateStorage;
          ItemNew.PreData := ItemOrig.PreData;
          ItemNew.PostData := ItemOrig.PostData;
          ItemNew.Modified := ItemOrig.Modified;
          SelectedItem := ItemNew;
          reTranslation.Modified := false;
        end;
      end;
    cUndoDelete: // an item was deleted, recreate it
      begin
        InsertItem(ItemOrig);
        SelectedItem := ItemOrig;
      end;
  end;
  if SelectedListItem <> nil then
    SelectedListItem.MakeVisible(false);
  lvTranslateStrings.Invalidate;
end;

procedure TfrmMain.AddUndo(const Item:ITranslationItem;
  Description:WideString; UndoType:integer);
begin
  FUndoList.Add(TTranslationUndoItem.Create(FTranslateFile.Items, Item),
    Description, UndoType);
end;

procedure TfrmMain.mnuToolsPopup(Sender:TTBCustomItem; FromLink:Boolean);
begin
  BuildToolMenu(Sender);
end;

end.
