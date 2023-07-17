{@abstract("Tool" Plugin displaying the content in a treeview) }
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

// $Id: ToolPluginDemoImpl.pas 250 2007-08-14 16:42:00Z peter3 $
unit ToolPluginDemoImpl;

interface
uses
  TransIntf, Classes;

type
  TDemoPlugins = class(TInterfacedObject, IUnknown, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT; safecall;
  end;

  TUppercaseDemoPlugin = class(TInterfacedObject, IUnknown, IToolItem)
  private
    FOldAppHandle:Cardinal;
  public
    destructor Destroy; override;
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult; safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall; // TOOL_VISIBLE, TOOL_ENABLED, TOOL_CHECKED
  end;

  TLowercaseDemoPlugin = class(TInterfacedObject, IUnknown, IToolItem)
  private
    FOldAppHandle:Cardinal;
  public
    destructor Destroy; override;
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult; safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall; // TOOL_VISIBLE, TOOL_ENABLED, TOOL_CHECKED
  end;

  TCamelCasePlugin = class(TInterfacedObject, IUnknown, IToolItem)
  public
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult; safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall; // TOOL_VISIBLE, TOOL_ENABLED, TOOL_CHECKED
  end;

  TTrimDemoPlugin = class(TInterfacedObject, IUnknown, IToolItem)
  private
    FOldAppHandle:Cardinal;
  public
    destructor Destroy; override;
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult; safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall; // TOOL_VISIBLE, TOOL_ENABLED, TOOL_CHECKED
  end;

implementation
uses
  Forms, Windows, SysUtils;

{ TDemoPlugins }

function TDemoPlugins.Count:Integer;
begin
  // tell main app how many we are
  Result := 4;
end;

function TDemoPlugins.ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT;
begin
  Result := S_OK;
  // return one of two plugins or error
  case Index of
    0:
      ToolItem := TUppercaseDemoPlugin.Create;
    1:
      ToolItem := TLowercaseDemoPlugin.Create;
    2:
      ToolItem := TTrimDemoPlugin.Create;
    3:
      ToolItem := TCamelCasePlugin.Create;
  else
    Result := S_FALSE;
  end;
end;

{ TUppercaseDemoPlugin }

function TUppercaseDemoPlugin.About:WideString;
begin
  // tell us who you are
  // TODO: not yet used
  Result := 'This is a demo plugin that uppercases translations';
end;

destructor TUppercaseDemoPlugin.Destroy;
begin
  // restore original app handle
  if FOldAppHandle <> 0 then
    Application.Handle := FOldAppHandle;
  inherited Destroy;
  ;
end;

function TUppercaseDemoPlugin.DisplayName:WideString;
begin
  // this text is displayed on the menu item
  Result := 'Uppercase translations';
end;

function TUppercaseDemoPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
var
  i:integer;
  S:WideString;
begin
  for i := 0 to Items.Count - 1 do
  begin
    S := Items[i].Translation;
    Items[i].Translation := WideUpperCase(S);
    if not Items[i].Modified then
      Items[i].Modified := not WideSameStr(Items[i].Translation, S);
  end;
  Result := S_OK;
end;

function TUppercaseDemoPlugin.Icon:Cardinal;
begin
  // load a standard icon for simplicity
  // return 0 if you don't have an icon
  Result := LoadIcon(0, IDI_QUESTION);
end;

procedure TUppercaseDemoPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  // save old app handle and set new app handle
  // this is in case we need to display a dialog or similar
  // using AppHandle makes the dialog behave better with the main app
  FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
end;

function TUppercaseDemoPlugin.Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED; // can't do anything unless there are items...
end;

{ TLowercaseDemoPlugin }

function TLowercaseDemoPlugin.About:WideString;
begin
  // tell us who you are
  // TODO: not yet used
  Result := 'This is a demo plugin that lowercases translations';
end;

destructor TLowercaseDemoPlugin.Destroy;
begin
  // restore original app handle
  if FOldAppHandle <> 0 then
    Application.Handle := FOldAppHandle;
  inherited Destroy;
end;

function TLowercaseDemoPlugin.DisplayName:WideString;
begin
  // this text is displayed on the menu item
  Result := 'Lowercase translation';
end;

function TLowercaseDemoPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
var
  i:integer;
  S:WideString;
begin
  for i := 0 to Items.Count - 1 do
  begin
    S := Items[i].Translation;
    Items[i].Translation := WideLowerCase(S);
    if not Items[i].Modified then
      Items[i].Modified := not WideSameStr(Items[i].Translation, S);
  end;
  Result := S_OK;
end;

function TLowercaseDemoPlugin.Icon:Cardinal;
begin
  // load a standard icon for simplicity
  // return 0 if you don't have an icon
  Result := LoadIcon(0, IDI_EXCLAMATION);
end;

procedure TLowercaseDemoPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  // save old app handle and set new app handle
  // this is in case we need to display a dialog or similar
  // using AppHandle makes the dialog behave better with the main app
  FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
end;

function TLowercaseDemoPlugin.Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED; // can't do anything unless there are items...
end;

{ TTrimDemoPlugin }

function TTrimDemoPlugin.About:WideString;
begin
  // tell us who you are
  // TODO: not yet used
  Result := 'This is a demo plugin that trims leading and trailing spaces in translations';
end;

destructor TTrimDemoPlugin.Destroy;
begin
  // restore original app handle
  if FOldAppHandle <> 0 then
    Application.Handle := FOldAppHandle;
  inherited Destroy;
end;

function TTrimDemoPlugin.DisplayName:WideString;
begin
  // this text is displayed on the menu item
  Result := 'Trim translations';
end;

function TTrimDemoPlugin.Execute(const Items, Orphans:ITranslationItems;
  var SelectedItem:ITranslationItem):HResult;
var
  i:integer;
  S:WideString;
begin
  for i := 0 to Items.Count - 1 do
  begin
    S := Items[i].Translation;
    Items[i].Translation := Trim(S);
    if not Items[i].Modified then
      Items[i].Modified := not WideSameStr(Items[i].Translation, S);
  end;
  Result := S_OK;
end;

function TTrimDemoPlugin.Icon:Cardinal;
begin
  // return 0 if you don't have an icon
  Result := 0;
end;

procedure TTrimDemoPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  // save old app handle and set new app handle
  // this is in case we need to display a dialog or similar
  // using AppHandle makes the dialog behave better with the main app
  FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
end;

function TTrimDemoPlugin.Status(const Items, Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED; // can't do anything unless there are items...
end;

function WideCamelCase(const S:WideString; Delimiters:WideString):WideString;
const
  WideSpace:WideString = ' ';
var
{$IFDEF CLR}
  Index:Integer;
  LenS:Integer;
  sb:StringBuilder;
{$ELSE}
  Source, Dest:PWideChar;
  Index, Len:Integer;
{$ENDIF CLR}
begin
  Result := '';
  if Delimiters = '' then
    Delimiters := WideSpace;

  if S <> '' then
  begin
    Result := S;
{$IFDEF CLR}
    sb := StringBuilder.Create(S);
    LenS := Length(S);
    Index := 0;
    while Index < LenS do
    begin
      if (Pos(sb[Index], Delimiters) > 0) and (Index + 1 < LenS) and
        (Pos(sb[Index + 1], Delimiters) = 0) then
        sb[Index + 1] := WideUpperCase(sb[Index + 1])[1];
      Inc(Index);
    end;
    sb[0] := CharUpper(sb[0]);
    Result := sb.ToString();
{$ELSE}
    UniqueString(Result);

    Len := Length(S);
    Source := PWideChar(S);
    Dest := PWideChar(Result);
    Inc(Dest);

    for Index := 2 to Len do
    begin
      if (Pos(Source^, Delimiters) > 0) and (Pos(Dest^, Delimiters) = 0) then
        Dest^ := WideUpperCase(Dest^)[1];
      Inc(Dest);
      Inc(Source);
    end;
    Result[1] := WideUpperCase(Result[1])[1];
{$ENDIF CLR}
  end;
end;

{ TCamelCasePlugin }

function TCamelCasePlugin.About:WideString;
begin
  Result := 'Demo plugin that CamelCases the translation strings';
end;

function TCamelCasePlugin.DisplayName:WideString;
begin
  Result := 'Camel Case Translations';
end;

function TCamelCasePlugin.Execute(const Items, Orphans:ITranslationItems;
  var SelectedItem:ITranslationItem):HResult;
var
  i:integer;
  S:WideString;
begin
  for i := 0 to Items.Count - 1 do
  begin
    S := Items[i].Translation;
    Items[i].Translation := WideCamelCase(S, ' (.)''"!?|:');
    if not Items[i].Modified then
      Items[i].Modified := not WideSameStr(Items[i].Translation, S);
  end;
  Result := S_OK;
end;

function TCamelCasePlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TCamelCasePlugin.Init(const ApplicationServices:IApplicationServices);
begin
  //
end;

function TCamelCasePlugin.Status(const Items, Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
