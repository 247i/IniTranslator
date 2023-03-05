{@abstract(Class to manage IToolItems plugins) }

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
// $Id: ToolItems.pas 249 2007-08-14 16:29:55Z peter3 $
unit ToolItems;

interface
uses
  SysUtils, Classes, Controls, TransIntf, WideIniFiles;

type
  EToolItem = class(Exception);
  TExternalToolItem = class
  private
    FToolItem:IToolItem;
    FImageIndex:integer;
    procedure SetImageIndex(Images:TImageList);
  protected
    property ToolItem:IToolItem read FToolItem;
  public
    constructor Create(Images:TImageList; const ToolItem:IToolItem);
    function DisplayName:WideString;
    function About:WideString;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer;
    function Icon:LongWord;

    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult;
    procedure Init(const ApplicationServices:IApplicationServices);
    property ImageIndex:integer read FImageIndex default -1;
  end;

  TExternalToolItems = class
  private
    FLibHandles, FItems:TList;
    FImages:TImageList;
    function GetCount:integer;
    function GetItem(Index:integer):TExternalToolItem;
  protected
    procedure LoadPlugins(const PluginFolder:WideString);
    procedure ReleasePlugins;
  public
    constructor Create(const PluginPath:WideString);
    destructor Destroy; override;
    procedure InitAll();
    procedure GetStrings(ini:TWideCustomIniFile);
    property Count:integer read GetCount;
    property Item[Index:integer]:TExternalToolItem read GetItem; default;
    property Images:TImageList read FImages;
  end;

implementation
uses
  Windows, CommCtrl, AppUtils, TntSysUtils;

{ TExternalToolItem }

function TExternalToolItem.About:WideString;
begin
  Result := FToolItem.About;
end;

constructor TExternalToolItem.Create(Images:TImageList; const ToolItem:IToolItem);
begin
  if ToolItem = nil then
    raise EToolItem.Create('ToolItem cannot be nil!');
  inherited Create;
  FToolItem := ToolItem;
  FImageIndex := -1;
  SetImageIndex(Images);
end;

function TExternalToolItem.DisplayName:WideString;
begin
  Result := FToolItem.DisplayName;
end;

function TExternalToolItem.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult;
begin
  Result := FToolItem.Execute(Items, Orphans, SelectedItem);
end;

function TExternalToolItem.Icon:LongWord;
begin
  Result := FToolItem.Icon;
end;

procedure TExternalToolItem.Init(const ApplicationServices:IApplicationServices);
begin
  FToolItem.Init(ApplicationServices);
end;

procedure TExternalToolItem.SetImageIndex(Images:TImageList);
begin
  if (FImageIndex < 0) and (Icon <> 0) then
    FImageIndex := ImageList_AddIcon(Images.Handle, Icon)
  else
    FImageIndex := -1;
end;

function TExternalToolItem.Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer;
begin
  Result := FToolItem.Status(Items, Orphans, SelectedItem);
end;

{ TExternalToolItems }

constructor TExternalToolItems.Create(const PluginPath:WideString);
begin
  inherited Create;
  LoadPlugins(PluginPath);
end;

destructor TExternalToolItems.Destroy;
begin
  ReleasePlugins;
  FreeAndNil(FItems);
  FreeAndNil(FLibHandles);
  FreeAndNil(FImages);
  inherited Destroy;
end;

function TExternalToolItems.GetCount:integer;
begin
  if FItems <> nil then
    Result := FItems.Count
  else
    Result := 0;
end;

function TExternalToolItems.GetItem(Index:integer):TExternalToolItem;
begin
  if FItems <> nil then
    Result := TExternalToolItem(FItems[Index])
  else
    Result := nil;
end;

procedure TExternalToolItems.GetStrings(ini:TWideCustomIniFile);
var
  i:integer;
  Obj:ILocalizable;
  Section, Name, Value:WideString;
begin
  for i := 0 to Count - 1 do
  begin
    Item[i].Init(GlobalApplicationServices);
    if Supports(Item[i].ToolItem, Ilocalizable, Obj) then
      while Obj.GetString(Section, Name, Value) do
        ini.WriteString(Section, Name, Value);
  end;
end;

procedure TExternalToolItems.InitAll();
var
  i:integer;
begin
  for i := 0 to Count - 1 do
    Item[i].Init(GlobalApplicationServices);
end;

procedure TExternalToolItems.LoadPlugins(const PluginFolder:WideString);
var
  F:TSearchRec;
  APath:WideString;
  i:integer;
  ALibHandle:HModule;
  ToolItems:IToolItems;
  ToolItem:IToolItem;
  ExportToolItemsFunc:TExportToolItemsFunc;
begin
  if FItems = nil then
    FItems := TList.Create;
  if FLibHandles = nil then
    FLibHandles := TList.Create;
  if FImages = nil then
    FImages := TImageList.Create(nil);
  // load all the matching plugin DLL's into a helper class
  APath := WideIncludeTrailingPathDelimiter(PluginFolder);
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
  if SysUtils.FindFirst(APath + '*.dll', faAnyFile and not (faDirectory or faVolumeID), F) = 0 then
  try
    repeat
      if WideFileExists(APath + F.Name) then
      begin
        ALibHandle := SafeLoadLibrary(APath + F.Name);
        if ALibHandle <> 0 then
        begin
          @ExportToolItemsFunc := GetProcAddress(ALibHandle, cRegisterTransToolItemsFuncName);
          if Assigned(ExportToolItemsFunc) then
          begin
            if (ExportToolItemsFunc(ToolItems) = S_OK) and (ToolItems <> nil) then
            begin
              FLibHandles.Add(Pointer(ALibHandle));
              for i := 0 to ToolItems.Count - 1 do
                if (ToolItems.ToolItem(i, ToolItem) = S_OK) and (ToolItem <> nil) then
                  FItems.Add(TExternalToolItem.Create(FImages, ToolItem));
            end;
          end
          else
            FreeLibrary(ALibHandle);
        end;
      end;
    until SysUtils.FindNext(F) <> 0;
  finally
    SysUtils.FindClose(F);
  end;
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_DEPRECATED ON}
end;

procedure TExternalToolItems.ReleasePlugins;
var
  i:integer;
begin
  if FItems <> nil then
    for i := FItems.Count - 1 downto 0 do
      TExternalToolItem(FItems[i]).Free;

  if FLibHandles <> nil then
    for i := FLibHandles.Count - 1 downto 0 do
      if FLibHandles[i] <> nil then
        FreeLibrary(Cardinal(FLibHandles[i]));
end;

end.
