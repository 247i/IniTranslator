{@abstract(Implementation of ToolTrim) }
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

// $Id: ToolTrimImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit ToolTrimImpl;

interface
uses
  Classes, TransIntf;

type
  TToolTrimPlugins = class(TInterfacedObject, IInterface, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT;
      safecall;
  end;

  TToolTrimPlugin = class(TInterfacedObject, IInterface, IToolItem, ILocalizable)
  private
    { ILocalizable }
    FIndex:integer;
  public
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Execute(const Items:ITranslationItems; const Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Status(const Items:ITranslationItems; const Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall;
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;

  end;

implementation

uses
  ToolTrimFrm, ToolTrimConsts;

{ TToolTrimPlugins }

function TToolTrimPlugins.Count:Integer;
begin
  Result := 1;
end;

function TToolTrimPlugins.ToolItem(Index:Integer;
  out ToolItem:IToolItem):HRESULT;
begin
  if Index = 0 then
  begin
    ToolItem := TToolTrimPlugin.Create;
    Result := S_OK;
  end
  else
    Result := S_FALSE;
end;

{ TToolTrimPlugin }

function TToolTrimPlugin.About:WideString;
begin
  Result := Translate(SToolTrimAbout);
end;

function TToolTrimPlugin.DisplayName:WideString;
begin
  Result := Translate(SToolTrimPluginDisplayName);
end;

function TToolTrimPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
begin
  TfrmToolTrim.Execute(Items);
  Result := S_OK;
end;

function TToolTrimPlugin.GetString(out Section, Name,
  Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := SToolTrimAbout;
    1:Value := SToolTrimPluginDisplayName;
    2:Value := SFormCaption;
    3:Value := STrimWhatLabel;
    4:Value := STrimWhereLabel;
    5:Value := STrimHowLabel;
    6:Value := STrimWhiteSpace;
    7:Value := STrimWhereOptions;
    8:Value := STrimHowOptions;
    9:Value := SOK;
    10:Value := SCancel;
  else
    Result := false;
  end;
  if Result then
  begin
    Section := SSectionName;
    Name := Value;
    Inc(FIndex);
  end
  else
    FIndex := 0;
end;

function TToolTrimPlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TToolTrimPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  GlobalAppServices := ApplicationServices;
end;

function TToolTrimPlugin.Status(const Items,
  Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
