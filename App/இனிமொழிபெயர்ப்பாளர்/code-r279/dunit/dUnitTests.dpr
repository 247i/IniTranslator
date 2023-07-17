program dUnitTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options 
  to use the console test runner.  Otherwise the GUI test runner will be used by 
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TestApplicationServices in 'TestApplicationServices.pas',
  ApplicationServices in '..\src\ApplicationServices.pas',
  TestBaseForm in 'TestBaseForm.pas',
  BaseForm in '..\src\BaseForm.pas',
  TestColorsFrm in 'TestColorsFrm.pas',
  ColorsFrm in '..\src\ColorsFrm.pas',
  TestCommentsFrm in 'TestCommentsFrm.pas',
  CommentsFrm in '..\src\CommentsFrm.pas',
  TestDictEditFrm in 'TestDictEditFrm.pas',
  DictEditFrm in '..\src\DictEditFrm.pas',
  TestDictionary in 'TestDictionary.pas',
  Dictionary in '..\src\Dictionary.pas',
  TestDictTranslationSelectDlg in 'TestDictTranslationSelectDlg.pas',
  DictTranslationSelectDlg in '..\src\DictTranslationSelectDlg.pas',
  TestEditItemFrm in 'TestEditItemFrm.pas',
  EditItemFrm in '..\src\EditItemFrm.pas',
  TestExtToolsFrm in 'TestExtToolsFrm.pas',
  ExtToolsFrm in '..\src\ExtToolsFrm.pas',
  TestFileMonitor in 'TestFileMonitor.pas',
  FileMonitor in '..\src\FileMonitor.pas',
  TestFindReplaceFrm in 'TestFindReplaceFrm.pas',
  FindReplaceFrm in '..\src\FindReplaceFrm.pas',
  TestMainFrm in 'TestMainFrm.pas',
  MainFrm in '..\src\MainFrm.pas',
  TestImportExportFrm in 'TestImportExportFrm.pas',
  ImportExportFrm in '..\src\ImportExportFrm.pas',
  TestKbdCfgFrame in 'TestKbdCfgFrame.pas',
  KbdCfgFrame in '..\src\KbdCfgFrame.pas',
  TestKbdCfgFrm in 'TestKbdCfgFrm.pas',
  KbdCfgFrm in '..\src\KbdCfgFrm.pas',
  TestMsgTranslate in 'TestMsgTranslate.pas',
  MsgTranslate in '..\src\MsgTranslate.pas',
  TestOptionsFrm in 'TestOptionsFrm.pas',
  OptionsFrm in '..\src\OptionsFrm.pas',
  TestOrphansFrm in 'TestOrphansFrm.pas',
  OrphansFrm in '..\src\OrphansFrm.pas',
  TestPromptArgsFrm in 'TestPromptArgsFrm.pas',
  PromptArgsFrm in '..\src\PromptArgsFrm.pas',
  TestSuspiciousConfigFrm in 'TestSuspiciousConfigFrm.pas',
  SuspiciousConfigFrm in '..\src\SuspiciousConfigFrm.pas',
  TestToolItems in 'TestToolItems.pas',
  ToolItems in '..\src\ToolItems.pas',
  TestTranslateFile in 'TestTranslateFile.pas',
  TranslateFile in '..\src\TranslateFile.pas',
  TestUndoList in 'TestUndoList.pas',
  UndoList in '..\src\UndoList.pas',
  TestWideIniFiles in 'TestWideIniFiles.pas',
  WideIniFiles in '..\src\WideIniFiles.pas',
  TestCommonUtils in 'TestCommonUtils.pas',
  CommonUtils in '..\src\CommonUtils.pas',
  TestAppUtils in 'TestAppUtils.pas',
  AppUtils in '..\src\AppUtils.pas';

{$R *.RES}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.

