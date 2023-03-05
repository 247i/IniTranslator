{@abstract(Generic undo implementation) }

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
// $Id: UndoList.pas 249 2007-08-14 16:29:55Z peter3 $
unit UndoList;

interface
uses
  SysUtils, Classes;

type
  TUndoData = class(TObject);

  TUndoItem = class;

  TUndoEvent = procedure(Sender:TObject; AItem:TUndoItem) of object;

  TUndoItem = class
  private
    FItems:TList;
    FUserData:integer;
    FData:TUndoData;
    FDescription:WideString;
    function GetCount:integer;
    function GetItem(Index:integer):TUndoItem;
  public
    constructor Create(Data:TUndoData; Description:WideString; UndoType:integer);
    destructor Destroy; override;
    procedure Add(AItem:TUndoItem);
    procedure Delete(Index:integer);
    procedure Clear;
    property Data:TUndoData read FData write FData;
    property UndoType:integer read FUserData write FUserData;
    property Description:WideString read FDescription write FDescription;
    property Item[Index:integer]:TUndoItem read GetItem;
    property Count:integer read GetCount;
  end;

  TUndoList = class
  private
    FItems:TList;
    FMaxCount, FUpdateCount:integer;
    FOnUndo:TUndoEvent;
    FGroupItem:TUndoItem;
    function GetCurrent:TUndoItem;
  protected
    procedure InternalAdd(AItem:TUndoItem);
    procedure InternalDelete(Index:integer);
  public
    constructor Create(MaxCount:integer = 0);
    destructor Destroy; override;
    procedure Add(Data:TUndoData; Description:WideString; UndoType:integer);
    procedure Clear;
    function CanUndo:boolean;
    procedure Undo;
    procedure BeginUpdate;
    procedure EndUpdate;
    function Updating:boolean;
    procedure BeginGroup(Description:WideString);
    procedure EndGroup;
    property Current:TUndoItem read GetCurrent;
    property OnUndo:TUndoEvent read FOnUndo write FOnUndo;
  end;

implementation

uses Math;

{ TUndoItem }

procedure TUndoItem.Add(AItem:TUndoItem);
begin
  if FItems = nil then
    FItems := TList.Create;
  FItems.Add(AItem);
end;

procedure TUndoItem.Clear;
var
  i:integer;
  AItem:TUndoItem;
begin
  if FItems <> nil then
  begin
    for i := 0 to FItems.Count - 1 do
    begin
      AItem := TUndoItem(FItems[i]);
      FItems[i] := nil;
      FreeAndNil(AItem);
    end;
    FItems.Clear;
  end;
end;

constructor TUndoItem.Create(Data:TUndoData; Description:WideString; UndoType:integer);
begin
  inherited Create;
  self.Data := Data;
  self.Description := Description;
  self.UndoType := UndoType;
end;

procedure TUndoItem.Delete(Index:integer);
begin
  TUndoItem(FItems[Index]).Free;
  FItems.Delete(Index);
end;

destructor TUndoItem.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  FreeAndNil(FData);
  inherited Destroy;
end;

function TUndoItem.GetCount:integer;
begin
  if FItems <> nil then
    Result := FItems.Count
  else
    Result := 0;
end;

function TUndoItem.GetItem(Index:integer):TUndoItem;
begin
  Result := TUndoItem(FItems[Index]);
end;

{ TUndoList }

procedure TUndoList.Add(Data:TUndoData; Description:WideString;
  UndoType:integer);
var
  AItem:TUndoItem;
begin
  AItem := TUndoItem.Create(Data, Description, UndoType);
  InternalAdd(AItem);
end;

procedure TUndoList.BeginGroup(Description:WideString);
begin
  if not Updating then
  begin
    FGroupItem := TUndoItem.Create(nil, Description, -1);
    InternalAdd(FGroupItem);
  end;
end;

procedure TUndoList.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

function TUndoList.CanUndo:boolean;
begin
  Result := not Updating and (Current <> nil);
end;

procedure TUndoList.Clear;
var
  i:integer;
  AItem:TUndoItem;
begin
  if not Updating and Assigned(FItems) then
  begin
    for i := 0 to FItems.Count - 1 do
    begin
      AItem := TUndoItem(FItems[i]);
      FItems[i] := nil;
      FreeAndNil(AItem);
    end;
    FItems.Clear;
  end;
end;

constructor TUndoList.Create(MaxCount:integer = 0);
begin
  inherited Create;
  FMaxCount := MaxCount;
end;

procedure TUndoList.InternalDelete(Index:integer);
begin
  if not Updating and Assigned(FItems) then
  begin
    TUndoItem(FItems[Index]).Free;
    FItems.Delete(Index);
  end;
end;

destructor TUndoList.Destroy;
begin
  FUpdateCount := 0;
  Clear;
  FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TUndoList.EndGroup;
begin
  if not Updating then
    FGroupItem := nil;
end;

procedure TUndoList.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount < 0 then
    FUpdateCount := 0;
end;

procedure TUndoList.InternalAdd(AItem:TUndoItem);
begin
  if not Updating then
  begin
    if FItems = nil then
      FItems := TList.Create;
    while (FMaxCount > 0) and (FItems.Count >= FMaxCount) do
      InternalDelete(0);
    if FGroupItem = nil then
      FItems.Add(AItem)
    else
      FGroupItem.Add(AItem);
  end;
end;

procedure TUndoList.Undo;
var
  i:integer;
  AItem:TUndoItem;
begin
  if not Updating and Assigned(FOnUndo) and (Current <> nil) then
  begin
    if FGroupItem <> nil then
    begin
      for i := 0 to FGroupItem.Count - 1 do
        FOnUndo(self, FGroupItem.Item[i]);
      FItems.Remove(FGroupItem);
      FreeAndNil(FGroupItem);
    end
    else
    begin
      AItem := Current;
      FOnUndo(self, AItem);
      FItems.Remove(AItem);
      FreeAndNil(AItem);
    end;
  end;
end;

function TUndoList.Updating:boolean;
begin
  Result := FUpdateCount > 0;
end;

function TUndoList.GetCurrent:TUndoItem;
begin
  if (FItems = nil) or (FItems.Count = 0) then
    Result := nil
  else
    Result := TUndoItem(FItems[FItems.Count - 1]);
end;

end.
