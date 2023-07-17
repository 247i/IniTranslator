{@abstract(Implementation of ToolConsistency) }
{
  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net
    Korney San - kora att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}

// $Id: ToolConsistencyImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit ToolConsistencyImpl;

interface
uses
  Classes, TransIntf;
type
  TToolConsistencyPlugins = class(TInterfacedObject, IInterface, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT;
      safecall;
  end;

  TToolConsistencyPlugin = class(TInterfacedObject, IInterface, IToolItem, ILocalizable)
  private
    FStringIndex:integer;
    FAppServices:IApplicationServices;
    function Translate(const Value:WideString):WideString;
    { ILocalizable }
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
  public
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Execute(const Items:ITranslationItems; const Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Status(const Items:ITranslationItems; const Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall;
  end;

implementation

uses ToolConsistencyFrm, ToolConsistencyConsts;

{ TToolConsistencyPlugins }

function TToolConsistencyPlugins.Count:Integer;
begin
  Result := 1;
end;

function TToolConsistencyPlugins.ToolItem(Index:Integer;
  out ToolItem:IToolItem):HRESULT;
begin
  if Index = 0 then
  begin
    ToolItem := TToolConsistencyPlugin.Create;
    Result := S_OK;
  end
  else
    Result := S_FALSE;
end;

{ TToolConsistencyPlugin }

function TToolConsistencyPlugin.Translate(const Value:WideString):WideString;
begin
  if FAppServices <> nil then
    Result := FAppServices.Translate(SLocalizeSectionName, Value, Value)
  else
    Result := Value;
end;

function TToolConsistencyPlugin.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Section := SLocalizeSectionName;
  Result := true;
  case FStringIndex of
    0:
      Name := SToolConsistencyAbout;
    1:
      Name := SToolConsistencyPluginDisplayName;
    2:
      Name := SToolConsistencyFormCaption;
    3:
      Name := SToolConsistencyLabel1;
    4:
      Name := SToolConsistencybtnClose;
    5:
      Name := SToolConsistencybtnCloseHint;
    6:
      Name := SToolConsistencybtnUpdate;
    7:
      Name := SToolConsistencybtnUpdateHint;
    8:
      Name := SToolConsistencychkIgnoreAccelChar;
    9:
      Name := SToolConsistencySynchronize;
    10:
      Name := SToolConsistencySynchronizeHint;
    11:
      Name := SToolConsistencychkIgnoreAccelCharHint;
    12:
      Name := SToolConsistencytvItemsHint;
    13:
      Name := SToolConsistencyUsethistranslation1;
    14:
      Name := SToolConsistencyUsethistranslation1Hint;
    15:
      Name := SToolConsistencyEdit1;
    16:
      Name := SToolConsistencyEdit1Hint;
    17:
      Name := SToolConsistencyIsConsistent;
  else
    Result := false;
  end;
  Value := Name;
  Inc(FStringIndex);
end;

function TToolConsistencyPlugin.About:WideString;
begin
  Result := Translate(SToolConsistencyAbout);
end;

function TToolConsistencyPlugin.DisplayName:WideString;
begin
  Result := Translate(SToolConsistencyPluginDisplayName);
end;

function TToolConsistencyPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
begin
  TfrmToolConsistency.Execute(FAppServices, Items, Orphans, SelectedItem);
  Result := S_OK;
end;

function TToolConsistencyPlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TToolConsistencyPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  FAppServices := ApplicationServices;
end;

function TToolConsistencyPlugin.Status(const Items,
  Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
