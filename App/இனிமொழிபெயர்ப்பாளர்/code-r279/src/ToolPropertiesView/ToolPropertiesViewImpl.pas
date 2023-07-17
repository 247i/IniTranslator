{@abstract(Implementation of ToolPropertiesView) }
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

// $Id: ToolPropertiesViewImpl.pas 250 2007-08-14 16:42:00Z peter3 $
unit ToolPropertiesViewImpl;

interface
uses
  Classes, TransIntf;

type
  TToolPropertiesViewPlugins = class(TInterfacedObject, IInterface, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT; safecall;
  end;

  TToolPropertiesViewPlugin = class(TInterfacedObject, IInterface, IToolItem)
  private
    FAppServices:IApplicationServices;
  public
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Execute(const Items:ITranslationItems;
      const Orphans:ITranslationItems;
      var SelectedItem:ITranslationItem):HRESULT; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Status(const Items:ITranslationItems;
      const Orphans:ITranslationItems;
      const SelectedItem:ITranslationItem):Integer; safecall;
  end;

implementation
uses
  ToolPropertiesViewFrm;

{ TToolPropertiesViewPlugins }

function TToolPropertiesViewPlugins.Count:Integer;
begin
  Result := 1;
end;

function TToolPropertiesViewPlugins.ToolItem(Index:Integer;
  out ToolItem:IToolItem):HRESULT;
begin
  if Index = 0 then
  begin
    ToolItem := TToolPropertiesViewPlugin.Create;
    Result := S_OK;
  end
  else
    Result := S_FALSE;
end;

{ TToolPropertiesViewPlugin }

function TToolPropertiesViewPlugin.About:WideString;
begin
  Result := 'Plugin to display all properties of the translation items';
end;


function TToolPropertiesViewPlugin.DisplayName:WideString;
begin
  Result := 'View all &properties...';
end;

function TToolPropertiesViewPlugin.Execute(const Items,
  Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
begin
  if TfrmToolPropertiesView.Execute(FAppServices, SelectedItem) then
    Result := S_OK
  else
    Result := S_FALSE;
end;

function TToolPropertiesViewPlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TToolPropertiesViewPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  FAppServices := ApplicationServices;
end;

function TToolPropertiesViewPlugin.Status(const Items,
  Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
