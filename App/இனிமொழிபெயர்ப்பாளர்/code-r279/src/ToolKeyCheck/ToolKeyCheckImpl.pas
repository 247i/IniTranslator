{@abstract(ToolKeyCheck implementation) }
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

// $Id: ToolKeyCheckImpl.pas 250 2007-08-14 16:42:00Z peter3 $

unit ToolKeyCheckImpl;

interface
uses
  TransIntf;

type
  TToolKeyCheckPlugins = class(TInterfacedObject, IUnknown, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT; safecall;
  end;

  TTToolKeyCheckPlugin = class(TInterfacedObject, IUnknown, IToolItem, ILocalizable)
  private
    FOldAppHandle:Cardinal;
    FIndex:integer;
  public
    { IToolItem }
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall;
    destructor Destroy; override;
    { ILocalizable }
    function GetString(out Section:WideString; out Name:WideString;
      out Value:WideString):WordBool; safecall;
  end;

implementation
uses
  Forms, ToolKeyCheckFrm, ToolKeyCheckConsts;

{ TTToolKeyCheckPlugins }

function TToolKeyCheckPlugins.Count:Integer;
begin
  Result := 1;
end;

function TToolKeyCheckPlugins.ToolItem(Index:Integer;
  out ToolItem:IToolItem):HRESULT;
begin
  Result := S_FALSE;
  if Index = 0 then
  begin
    ToolItem := TTToolKeyCheckPlugin.Create;
    Result := S_OK;
  end;
end;

{ TTToolKeyCheckPlugin }

function TTToolKeyCheckPlugin.About:WideString;
begin
  Result := Translate(SAbout);
end;

destructor TTToolKeyCheckPlugin.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TTToolKeyCheckPlugin.DisplayName:WideString;
begin
  Result := Translate(SDisplayName);
end;

function TTToolKeyCheckPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
begin
  TfrmToolKeyCheck.Edit(Items);
  Result := S_OK;
end;

function TTToolKeyCheckPlugin.GetString(out Section, Name, Value:WideString):WordBool;
begin
  Result := true;
  case FIndex of
    0:Value := SDisplayName;
    1:Value := SAbout;
    2:Value := SMainFormCaption;
    3:Value := SIgnoreEmpty;
    4:Value := SUpdate;
    5:Value := SEdit;
    6:Value := SClose;
    7:Value := SSync;
    8:Value := SOriginal;
    9:Value := STranslation;
    10:Value := SAccelKey;
    11:Value := SAccessKey;
    12:Value := SEditFormCaption;
    13:Value := SOriginalLabel;
    14:Value := STranslationLabel;
    15:Value := SOK;
    16:Value := SCancel;
  else
    Result := false;
  end;

  if Result then
  begin
    Inc(FIndex);
    Section := SSectionName;
    Name := Value;
  end
  else
    FIndex := 0;
end;

function TTToolKeyCheckPlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TTToolKeyCheckPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
  GlobalAppServices := ApplicationServices;
end;

function TTToolKeyCheckPlugin.Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
