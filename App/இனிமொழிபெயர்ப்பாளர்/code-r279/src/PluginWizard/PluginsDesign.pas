{@abstract(Implementation for PluginWizard) }
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

// $Id: PluginsDesign.pas 250 2007-08-14 16:42:00Z peter3 $
unit PluginsDesign;

interface
uses
  Classes, ToolsAPI;

type
  // creates a repository wizard for IniTranslator plugins.
  // The wizard can be access from the "New" tab in the Repository
  TPluginWizard = class(TInterfacedObject, IInterface, IOTANotifier,
      IOTAWizard, IOTARepositoryWizard, IOTAProjectWizard)
  public
    { IOTANotifier }
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    { IOTAWizard }
    function GetIDString:string;
    function GetName:string;
    function GetState:TWizardState;
    procedure Execute;
    { IOTARepositoryWizard }
    function GetAuthor:string;
    function GetComment:string;
    function GetGlyph:Cardinal;
    function GetPage:string;
  end;

procedure Register;

implementation
uses
  Windows, SysUtils, PluginOptions, PluginWizardForm;

{$R includes.res}

procedure Register;
begin
  RegisterPackageWizard(TPluginWizard.Create);
end;

var
  FModuleServices:IOTAModuleServices = nil;

function ModuleServices:IOTAModuleServices;
begin
  if FModuleServices = nil then
    FModuleServices := (BorlandIDEServices as IOTAModuleServices);
  Result := FModuleServices;
end;

function GetActiveProjectGroup:IOTAProjectGroup;
var
  i:Integer;
begin
  for i := 0 to ModuleServices.ModuleCount - 1 do
    if Supports(ModuleServices.Modules[i], IOTAProjectGroup, Result) then
      Exit;
  Result := nil;
end;

function LoadResourceText(const ResID:string):string;
var
  HRes:HRSRC;
  ResInstance:Cardinal;
begin
  ResInstance := hInstance;
  HRes := FindResource(ResInstance, MakeIntResource(ResID), RT_RCDATA);
  Result := PChar(LockResource(LoadResource(ResInstance, HRes)));
  SetLength(Result, SizeofResource(ResInstance, HRes));
end;

function ReplaceMacros(const S:string; Options:TPluginOptions):string;
begin
// %transpath% %project% %pluginclassname% %unit% %title%
  Result := StringReplace(S, '%transpath%', Options.TransIntfPath, [rfReplaceAll]);
  Result := StringReplace(Result, '%project%', Options.ProjectName, [rfReplaceAll]);
  Result := StringReplace(Result, '%pluginclassname%', Options.PluginClassName, [rfReplaceAll]);
  Result := StringReplace(Result, '%unit%', Options.UnitName, [rfReplaceAll]);
  Result := StringReplace(Result, '%title%', Options.Title, [rfReplaceAll]);
end;

type
  // sets up the project for creation
  TPluginCreator = class(TInterfacedObject, IInterface, IOTACreator, IOTAProjectCreator)
  private
    FOptions:TPluginOptions;
  public
    // IOTACreator
    function GetCreatorType:string;
    function GetExisting:Boolean;
    function GetFileSystem:string;
    function GetOwner:IOTAModule;
    function GetUnnamed:Boolean;
    // IOTAProjectCreator
    function GetFileName:string;
    function GetOptionFileName:string;
    function GetShowSource:Boolean;
    procedure NewDefaultModule;
    function NewOptionSource(const ProjectName:string):IOTAFile;
    procedure NewProjectResource(const Project:IOTAProject);
    function NewProjectSource(const ProjectName:string):IOTAFile;
    constructor Create(Options:TPluginOptions);
  end;
  // creates the project file
  TProjectFile = class(TInterfacedObject, IInterface, IOTAFile)
  private
    FOptions:TPluginOptions;
  public
    constructor Create(Options:TPluginOptions; const ProjectName:string);
    function GetAge:TDateTime;
    function GetSource:string;
  end;
  // sets up the implementation file for creation
  TUnitCreator = class(TInterfacedObject, IInterface, IOTACreator, IOTAModuleCreator)
  private
    FOwner:IOTAModule;
    FOptions:TPluginOptions;
  public
    procedure FormCreated(const FormEditor:IOTAFormEditor);
    function GetAncestorName:string;
    function GetCreatorType:string;
    function GetExisting:Boolean;
    function GetFileSystem:string;
    function GetFormName:string;
    function GetImplFileName:string;
    function GetIntfFileName:string;
    function GetMainForm:Boolean;
    function GetOwner:IOTAModule;
    function GetShowForm:Boolean;
    function GetShowSource:Boolean;
    function GetUnnamed:Boolean;
    function NewFormFile(const FormIdent:string;
      const AncestorIdent:string):IOTAFile;
    function NewImplSource(const ModuleIdent:string;
      const FormIdent:string; const AncestorIdent:string):IOTAFile;
    function NewIntfSource(const ModuleIdent:string;
      const FormIdent:string; const AncestorIdent:string):IOTAFile;
    constructor Create(const Owner:IOTAModule; Options:TPluginOptions);
  end;

  // creates implementation file
  TUnitFile = class(TInterfacedObject, IInterface, IOTAFile)
  private
    FOptions:TPluginOptions;
  public
    function GetAge:TDateTime;
    function GetSource:string;
    constructor Create(Options:TPluginOptions; const ModuleIdent:string);
  end;

{ TPluginWizard }

procedure TPluginWizard.AfterSave;
begin
  // do nothing
end;

procedure TPluginWizard.BeforeSave;
begin
  // do nothing
end;

procedure TPluginWizard.Destroyed;
begin
  // do nothing
end;

procedure TPluginWizard.Execute;
var
  Module:IOTAModule;
  Options:TPluginOptions;
begin
  Options := TPluginOptions.Create;
  try
    if TfrmTranslatorPluginWizard.Execute(Options) then
    begin
      Module := ModuleServices.CreateModule(TPluginCreator.Create(Options));
      ModuleServices.CreateModule(TUnitCreator.Create(Module, Options));
    end;
  finally
    FreeAndNil(Options);
  end;
end;

function TPluginWizard.GetAuthor:string;
begin
  Result := 'Peter Thörnqvist';
end;

function TPluginWizard.GetComment:string;
begin
  Result := 'Create new IniTranslator plugin';
end;

function TPluginWizard.GetGlyph:Cardinal;
begin
  Result := LoadIcon(hInstance, MakeIntResource('IDI_ICON1'));
end;

function TPluginWizard.GetIDString:string;
begin
  Result := 'IniTranslator.PluginWizard';
end;

function TPluginWizard.GetName:string;
begin
  Result := 'IniTranslator Plugin';
end;

function TPluginWizard.GetPage:string;
begin
  Result := 'New';
end;

function TPluginWizard.GetState:TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TPluginWizard.Modified;
begin
  // do nothing
end;

{ TPluginCreator }

constructor TPluginCreator.Create(Options:TPluginOptions);
begin
  FOptions := Options;
end;

function TPluginCreator.GetCreatorType:string;
begin
  Result := ''; // custom
end;

function TPluginCreator.GetExisting:Boolean;
begin
  Result := false;
end;

function TPluginCreator.GetFileName:string;
begin
  Result := '';
end;

function TPluginCreator.GetFileSystem:string;
begin
  Result := '';
end;

function TPluginCreator.GetOptionFileName:string;
begin
  Result := '';
end;

function TPluginCreator.GetOwner:IOTAModule;
begin
  // TODO 5 -cBUG: Even if we return a valid project group here, Delphi still creates a new project group for the project...Why?
  Result := GetActiveProjectGroup;
end;

function TPluginCreator.GetShowSource:Boolean;
begin
  Result := true;
end;

function TPluginCreator.GetUnnamed:Boolean;
begin
  Result := true;
end;

procedure TPluginCreator.NewDefaultModule;
begin
  //
end;

function TPluginCreator.NewOptionSource(const ProjectName:string):IOTAFile;
begin
  Result := nil;
end;

procedure TPluginCreator.NewProjectResource(const Project:IOTAProject);
begin
  //
end;

function TPluginCreator.NewProjectSource(const ProjectName:string):IOTAFile;
begin
  Result := TProjectFile.Create(FOptions, ProjectName);
end;

{ TProjectFile }

constructor TProjectFile.Create(Options:TPluginOptions; const ProjectName:string);
begin
  FOptions := Options;
  FOptions.ProjectName := ProjectName;
end;

function TProjectFile.GetAge:TDateTime;
begin
  Result := -1;
end;

function TProjectFile.GetSource:string;
begin
  if FOptions.IsFileParser then
    Result := LoadResourceText('FILEPLUGINPROJECT')
  else
    Result := LoadResourceText('TOOLPLUGINPROJECT');
  Result := ReplaceMacros(Result, FOptions);
end;

{ TUnitCreator }

constructor TUnitCreator.Create(const Owner:IOTAModule; Options:TPluginOptions);
begin
  FOwner := Owner;
  FOptions := Options;
end;

procedure TUnitCreator.FormCreated(const FormEditor:IOTAFormEditor);
begin
//
end;

function TUnitCreator.GetAncestorName:string;
begin
  Result := '';
end;

function TUnitCreator.GetCreatorType:string;
begin
  Result := ''; // custom
end;

function TUnitCreator.GetExisting:Boolean;
begin
  Result := false;
end;

function TUnitCreator.GetFileSystem:string;
begin
  Result := '';
end;

function TUnitCreator.GetFormName:string;
begin
  Result := '';
end;

function TUnitCreator.GetImplFileName:string;
begin
  Result := '';
end;

function TUnitCreator.GetIntfFileName:string;
begin
  Result := '';
end;

function TUnitCreator.GetMainForm:Boolean;
begin
  Result := false;
end;

function TUnitCreator.GetOwner:IOTAModule;
begin
  Result := FOwner;
end;

function TUnitCreator.GetShowForm:Boolean;
begin
  Result := false;
end;

function TUnitCreator.GetShowSource:Boolean;
begin
  Result := true;
end;

function TUnitCreator.GetUnnamed:Boolean;
begin
  Result := true;
end;

function TUnitCreator.NewFormFile(const FormIdent, AncestorIdent:string):IOTAFile;
begin
  Result := nil;
end;

function TUnitCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent:string):IOTAFile;
begin
  Result := TUnitFile.Create(FOptions, ModuleIdent);
end;

function TUnitCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent:string):IOTAFile;
begin
  Result := nil;
end;

{ TUnitFile }

constructor TUnitFile.Create(Options:TPluginOptions; const ModuleIdent:string);
begin
  FOptions := Options;
  FOptions.UnitName := ModuleIdent;
end;

function TUnitFile.GetAge:TDateTime;
begin
  Result := -1;
end;

function TUnitFile.GetSource:string;
var
  s, dummy:string;
begin
  if FOptions.UnitName = '' then
  begin
    ModuleServices.GetNewModuleAndClassName('', s, dummy, dummy);
    FOptions.UnitName := s;
  end;
  if FOptions.IsFileParser then
    Result := LoadResourceText('FILEPLUGINUNIT')
  else
    Result := LoadResourceText('TOOLPLUGINUNIT');
  Result := ReplaceMacros(Result, FOptions);
end;

end.
