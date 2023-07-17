{@abstract(Project file for INI Translator) }
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
// $Id: translator.dpr 256 2007-10-17 20:57:18Z peter3 $
program translator;
{%File '..\Changelog.txt'}

{$I TRANSLATOR.INC}
uses
{$IFDEF USE_FASTMM4}
  FastMM4 in 'FastMM4.pas',
{$ENDIF}
  Forms,
  AppConsts in 'AppConsts.pas',
  AppOptions in 'AppOptions.pas',
  AppUtils in 'AppUtils.pas',
  CommonUtils in 'CommonUtils.pas',
  Dictionary in 'Dictionary.pas',
  FileMonitor in 'FileMonitor.pas',
  MsgTranslate in 'MsgTranslate.pas',
  ShortCutEdit in 'ShortCutEdit.pas',
  TransIntf in 'TransIntf.pas',
  TranslateFile in 'TranslateFile.pas',
  BaseForm in 'BaseForm.pas' {frmBase},
  CommentsFrm in 'CommentsFrm.pas' {frmComments},
  EncodingDlgs in 'EncodingDlgs.pas' {frmEncoding},
  EditItemFrm in 'EditItemFrm.pas' {frmEditItem: TTntForm},
  ExceptDlg in 'ExceptDlg.pas' {ExceptionDialog},
  ExceptDlgMail in 'ExceptDlgMail.pas' {ExceptionDialogMail},
  ExtToolsFrm in 'ExtToolsFrm.pas' {frmTools},
  FindReplaceFrm in 'FindReplaceFrm.pas' {frmFindReplace},
  ImportExportFrm in 'ImportExportFrm.pas' {frmImportExport},
  MainFrm in 'MainFrm.pas' {frmMain},
  KbdCfgFrame in 'KbdCfgFrame.pas' {FrmKbdCfg: TTntFrame},
  KbdCfgFrm in 'KbdCfgFrm.pas' {frmConfigKbd},
  OptionsFrm in 'OptionsFrm.pas' {frmOptions},
  OrphansFrm in 'OrphansFrm.pas' {frmOrphans},
  PromptArgsFrm in 'PromptArgsFrm.pas' {frmPromptArgs},
  SuspiciousConfigFrm in 'SuspiciousConfigFrm.pas' {frmConfigSuspicious: TTntForm},
  DictTranslationSelectDlg in 'DictTranslationSelectDlg.pas' {frmDictTranslationSelect: TTntForm},
  DictEditFrm in 'DictEditFrm.pas' {frmDictEdit: TTntForm},
  ToolItems in 'ToolItems.pas',
  ColorsFrm in 'ColorsFrm.pas' {frmColors: TTntForm},
  ApplicationServices in 'ApplicationServices.pas',
  UndoList in 'UndoList.pas';

{$R *.res}
{$R 'manifest.res' 'manifest.rc'}

begin
  Application.Initialize;
  Application.Title := 'Translator';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmComments, frmComments);
  Application.Run;
end.

