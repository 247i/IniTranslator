{@abstract(Options class for PluginWizard) }
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

// $Id: PluginOptions.pas 250 2007-08-14 16:42:00Z peter3 $
unit PluginOptions;

interface

type
  TPluginOptions = class
  private
    procedure LoadSettings;
    procedure SaveSettings;
  public
    PluginClassName:string;
    ProjectName:string;
    UnitName:string;
    TransIntfPath:string;
    Title:string;
    IsFileParser:boolean;
    constructor Create;
    destructor Destroy; override;
  end;

implementation
uses
  Registry;

{ TPluginOptions }

constructor TPluginOptions.Create;
begin
  inherited;
  LoadSettings;
end;

destructor TPluginOptions.Destroy;
begin
  SaveSettings;
  inherited Destroy;
end;

procedure TPluginOptions.LoadSettings;
begin
  with TRegIniFile.Create('\Software\Borland\IniTranslatorWizard') do
  try
    PluginClassName := ReadString('Settings', 'PluginClassName', PluginClassName);
    ProjectName := ReadString('Settings', 'ProjectName', ProjectName);
    UnitName := ReadString('Settings', 'UnitName', UnitName);
    TransIntfPath := ReadString('Settings', 'TransIntfPath', TransIntfPath);
    Title := ReadString('Settings', 'Title', Title);
    IsFileParser := ReadBool('Settings', 'IsFileParser', IsFileParser);
  finally
    Free;
  end;
end;

procedure TPluginOptions.SaveSettings;
begin
  with TRegIniFile.Create('\Software\Borland\IniTranslatorWizard') do
  try
    WriteString('Settings', 'PluginClassName', PluginClassName);
    WriteString('Settings', 'ProjectName', ProjectName);
    WriteString('Settings', 'UnitName', UnitName);
    WriteString('Settings', 'TransIntfPath', TransIntfPath);
    WriteString('Settings', 'Title', Title);
    WriteBool('Settings', 'IsFileParser', IsFileParser);
  finally
    Free;
  end;
end;

end.
