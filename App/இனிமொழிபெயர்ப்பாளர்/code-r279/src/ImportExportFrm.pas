{@abstract(Import / export form: lists available import or export plugins) }
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
// $Id: ImportExportFrm.pas 249 2007-08-14 16:29:55Z peter3 $
unit ImportExportFrm;

{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ActnList,
  BaseForm, TranslateFile, TransIntf, WideIniFiles,
  TntActnList, TntStdCtrls, TntComCtrls;

type
  TfrmImportExport = class(TfrmBase)
    lvItems:TTntListView;
    btnOK:TTntButton;
    btnCancel:TTntButton;
    lblList:TTntLabel;
    acImportExport:TTntActionList;
    acImport:TTntAction;
    acExport:TTntAction;
    btnConfigure:TTntButton;
    acConfigure:TTntAction;
    stNothingToShow:TTntStaticText;
    procedure lvItemsDblClick(Sender:TObject);
    procedure acImportExportUpdate(Action:TBasicAction;
      var Handled:boolean);
    procedure lvItemsEnter(Sender:TObject);
    procedure acImportExecute(Sender:TObject);
    procedure acExportExecute(Sender:TObject);
    procedure acConfigureExecute(Sender:TObject);
    procedure FormShow(Sender:TObject);
  private
    { Private declarations }
    FCapabilitiesSupported:integer;
    FItems, FOrphans:ITranslationItems;
    FImport:boolean;
    function DoTranslate(const S:WideString):WideString;
    function LoadPlugins(const PluginFolder:WideString; ForImport:boolean):integer;
  public
    { Public declarations }
    class procedure GetStrings(const PluginFolder:WideString; ini:TWideCustomIniFile);
    class function Edit(const Items, Orphans:ITranslationItems; const PluginFolder:WideString;
      const DoImport:boolean; var ItemIndex, CapabilitesSupported:integer):boolean;
  end;

implementation
uses
  AppConsts, AppUtils, CommonUtils, TntClasses, TntWindows, TntSysUtils;

{$R *.dfm}
var
  FLoadedLibs:TList = nil;

type
  TLibItem = class
    LibName:WideString;
    LibHandle:HMODULE;
    Parser:IFileParser;
  end;

function InternalLoadLibrary(const LibName:WideString):TLibItem;
var
  LibHandle:HMODULE;
  ExportFunc:TExportFileParserFunc;
  i:integer;
begin
  Result := nil;
  // find already loaded DLL's
  for i := 0 to FLoadedLibs.Count - 1 do
    if WideSameText(TLibItem(FLoadedLibs[i]).LibName, LibName) then
    begin
      Result := FLoadedLibs[i];
      Exit;
    end;
  // check if this module is already in the adress space
  LibHandle := GetModuleHandle(PAnsiChar(AnsiString(LibName)));
  // load DLL
  if LibHandle = 0 then
    LibHandle := Tnt_LoadLibraryW(PWideChar(LibName));
  // check for the exported function
  if LibHandle <> 0 then
  begin
    ExportFunc := GetProcAddress(LibHandle, cRegisterTransFileParserFuncName);
    if (@ExportFunc <> nil) then
    begin
      Result := TLibItem.Create;
      // check that we can get an implementation
      if (ExportFunc(Result.Parser) <> S_OK) then
        FreeAndNil(Result)
      else
      begin
        Result.LibName := LibName;
        Result.LibHandle := LibHandle;
        FLoadedLibs.Add(Result);
      end;
    end;
  end;
end;

procedure FreeLibraries;
var
  i:integer;
begin
  for i := 0 to FLoadedLibs.Count - 1 do
    if FLoadedLibs[i] <> nil then
    begin
      TLibItem(FLoadedLibs[i]).Parser := nil;
      FreeLibrary(TLibItem(FLoadedLibs[i]).LibHandle);
      TLibItem(FLoadedLibs[i]).Free;
    end;
  FLoadedLibs.Count := 0;
end;

{ TfrmImportExport }

class function TfrmImportExport.Edit(const Items, Orphans:ITranslationItems;
  const PluginFolder:WideString; const DoImport:boolean; var ItemIndex, CapabilitesSupported:integer):boolean;
var
  frmImportExport:TfrmImportExport;
  i:integer;
begin
  frmImportExport := Self.Create(Application);
  with frmImportExport do
  try
    FImport := DoImport;
    FItems := Items;
    FOrphans := Orphans;
    if DoImport then
    begin
      Caption := DoTranslate(SImportCaption);
      lblList.Caption := DoTranslate(SImportLabelCaption);
      btnOK.Action := acImport;
      btnOK.Caption := DoTranslate(SImportButtonCaption);
    end
    else
    begin
      Caption := DoTranslate(SExportCaption);
      lblList.Caption := DoTranslate(SExportLabelCaption);
      btnOK.Action := acExport;
      btnOK.Caption := DoTranslate(SExportButtonCaption);
    end;
{    if LoadPlugins(PluginFolder, DoImport) = 0 then
    begin
      ErrMsg(DoTranslate(SNoPluginsAvaliable), DoTranslate(SPluginError));
      Result := false;
      Exit;
    end; }
    i := LoadPlugins(PluginFolder, DoImport);
    lvItems.AlphaSort;
    if (ItemIndex >= 0) and (ItemIndex < lvItems.Items.Count) then
      with lvItems.Items[ItemIndex] do
      begin
        Selected := true;
        Focused := true;
      end;
    Result := (ShowModal = mrOK) and (i > 0);
    if Result then
    begin
      if DoImport then
        CapabilitesSupported := FCapabilitiesSupported;
      ItemIndex := lvItems.ItemIndex;
    end;
  finally
    Free;
  end;
end;

procedure TfrmImportExport.lvItemsDblClick(Sender:TObject);
begin
  btnOK.Click;
end;

procedure TfrmImportExport.acImportExportUpdate(Action:TBasicAction;
  var Handled:boolean);
begin
  if btnOK.Action <> nil then
    TAction(btnOK.Action).Enabled := lvItems.Selected <> nil;
  acConfigure.Enabled := (lvItems.Selected <> nil) and
    (TLibItem(lvItems.Selected.Data).Parser.Capabilities and CAP_CONFIGURE = CAP_CONFIGURE);
end;

function TfrmImportExport.LoadPlugins(const PluginFolder:WideString;
  ForImport:boolean):integer;
const
  cCapability:array[boolean] of integer = (CAP_EXPORT, CAP_IMPORT);
var
  F:TSearchRecW;
  APath:WideString;
  li:TListItem;
  LibItem:TLibItem;
begin
  Result := 0;
  APath := WideIncludeTrailingPathDelimiter(PluginFolder);
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
  if WideFindFirst(APath + '*.dll', faAnyFile and not (faDirectory or faVolumeID), F) = 0 then
  try
    repeat
      if WideFileExists(APath + F.Name) then
      begin
        LibItem := InternalLoadLibrary(APath + F.Name);
        if LibItem <> nil then
        begin
          begin
            if (LibItem.Parser.Capabilities and cCapability[ForImport] = cCapability[ForImport]) then
            begin
              li := lvItems.Items.Add;
              LibItem.Parser.Init(GlobalApplicationServices);
              li.Caption := LibItem.Parser.DisplayName(cCapability[ForImport]);
              li.Data := LibItem;
              Inc(Result);
            end;
          end;
        end;
      end;
    until WideFindNext(F) <> 0;
  finally
    WideFindClose(F);
  end;
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_DEPRECATED ON}
  if lvItems.Items.Count = 0 then
  begin
//    lvItems.Enabled := false;
    with stNothingToShow do
    begin
      Parent := lvItems;
      Left := (lvItems.ClientWidth - ClientWidth) div 2;
      Top := 8;
    end;
  end
  else
    stNothingToShow.Visible := false;
end;

procedure TfrmImportExport.lvItemsEnter(Sender:TObject);
begin
  if (lvItems.Selected = nil) and (lvItems.Items.Count > 0) then
  begin
    lvItems.Selected := lvItems.Items[0];
    lvItems.Selected.Focused := true;
    lvItems.Selected.MakeVisible(true);
  end;
end;

procedure TfrmImportExport.acImportExecute(Sender:TObject);
var
  Parser:IFileParser;
begin
  Parser := TLibItem(lvItems.Selected.Data).Parser;
  Parser.Init(GlobalApplicationServices);
  FCapabilitiesSupported := Parser.Capabilities;
  if FCapabilitiesSupported and CAP_CONFIGURE = CAP_CONFIGURE then
    if Parser.Configure(CAP_IMPORT) <> S_OK then
    begin
      ModalResult := mrAbort;
      Close;
      Exit;
    end;
  WaitCursor;
  if Parser.ImportItems(FItems, FOrphans) <> S_OK then
    ModalResult := mrNone;
end;

procedure TfrmImportExport.acExportExecute(Sender:TObject);
var
  Parser:IFileParser;
begin
  Parser := TLibItem(lvItems.Selected.Data).Parser;
  Parser.Init(GlobalApplicationServices);
  if Parser.Capabilities and CAP_CONFIGURE = CAP_CONFIGURE then
    if Parser.Configure(CAP_EXPORT) <> S_OK then
    begin
      ModalResult := mrAbort;
      Close;
      Exit;
    end;
  WaitCursor;
  if Parser.ExportItems(FItems, FOrphans) <> S_OK then
    ModalResult := mrNone;
end;

procedure TfrmImportExport.acConfigureExecute(Sender:TObject);
const
  cCapability:array[boolean] of integer = (CAP_EXPORT, CAP_IMPORT);
begin
  TLibItem(lvItems.Selected.Data).Parser.Init(GlobalApplicationServices);
  TLibItem(lvItems.Selected.Data).Parser.Configure(cCapability[FImport]);
end;

function TfrmImportExport.DoTranslate(const S:WideString):WideString;
begin
  if GlobalLanguageFile <> nil then
    Result := GlobalLanguageFile.Translate(Application.MainForm.ClassName, S, S)
  else
    Result := S;
end;

class procedure TfrmImportExport.GetStrings(const PluginFolder:WideString; ini:TWideCustomIniFile);
var
  i:integer;
  LibItem:TLibItem;
  frm:TfrmImportExport;
  Section, Name, Value:WideString;
  Obj:ILocalizable;
begin
  frm := self.Create(Application);
  try
    frm.LoadPlugins(PluginFolder, false);
    for i := 0 to frm.lvItems.Items.Count - 1 do
    begin
      LibItem := TLibItem(frm.lvItems.Items[i].Data);
      if Assigned(LibItem) and Supports(LibItem.Parser, ILocalizable, Obj) then
        while Obj.GetString(Section, Name, Value) do
          ini.WriteString(Section, Name, Value);
    end;
  finally
    frm.Free;
  end;
  frm := self.Create(Application);
  try
    frm.LoadPlugins(PluginFolder, true);
    for i := 0 to frm.lvItems.Items.Count - 1 do
    begin
      LibItem := TLibItem(frm.lvItems.Items[i].Data);
      if Assigned(LibItem) and Supports(LibItem.Parser, ILocalizable, Obj) then
        while Obj.GetString(Section, Name, Value) do
          ini.WriteString(Section, Name, Value);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmImportExport.FormShow(Sender:TObject);
begin
  if lvItems.Selected <> nil then
    lvItems.Selected.MakeVisible(false);
end;

initialization
  FLoadedLibs := TList.Create;

finalization
  FreeLibraries;
  FreeAndNil(FLoadedLibs);

end.
