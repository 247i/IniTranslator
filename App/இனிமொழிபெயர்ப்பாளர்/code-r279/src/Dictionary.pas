{@abstract(Utility functions and procedures) }
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
// $Id: Dictionary.pas 249 2007-08-14 16:29:55Z peter3 $
unit Dictionary;

interface
uses
  SysUtils, Classes, TntClasses, TransIntf;

type
  TDictionaryItem = class(TInterfacedObject, IInterface, IDictionaryItem)
  private
    FTranslations:TTntStrings;
    FOriginal:WideString;
    FDefaultIndex:integer;
    FOnChange:TNotifyEvent;
    procedure SetTranslations(const Value:TTntStrings);
    procedure Change;
    {IDictionaryItem}
    procedure SetOriginal(const Value:WideString);
    function GetOriginal:WideString;
    function TranslationCount:integer;
    function GetTranslation(Index:Integer):WideString;
    procedure SetTranslation(Index:integer; const Value:WideString);
    function Add(const Translation:WideString):Integer;
    procedure Delete(Index:integer);
    function IndexOf(const Translation:WideString):integer;
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;
    function DefaultTranslation:WideString;
    property Original:WideString read GetOriginal write SetOriginal;
    property Translations:TTntStrings read FTranslations write SetTranslations;
    property DefaultIndex:integer read FDefaultIndex write FDefaultIndex;
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  end;

  TDictionaryItems = class(TInterfacedPersistent, IInterface, IDictionaryItems)
  private
    FItems:TList;
    FIgnorePunctuation:WordBool;
    FModified:WordBool;
    FAutoRemoveQuotes:boolean;
    function GetCount:integer;
    function GetItems(Index:integer):TDictionaryItem;
    {IDictionaryItems}
    function IDictionaryItems.Add = DictAdd;
    function GetModified:WordBool;
    procedure SetModified(Value:WordBool);
    function GetItem(Index:integer):IDictionaryItem;
    function GetIgnorePunctuation:WordBool;
    procedure SetIgnorePunctuation(Value:WordBool);
    function DictAdd(const AOriginal:WideString):IDictionaryItem;
  protected
    procedure DoChange(Sender:TObject);
    procedure Merge;
  public
    procedure Invert;
    procedure Assign(Source:TPersistent); override;
    procedure LoadFromFile(const Filename:WideString);
    procedure SaveToFile(const Filename:WideString);
    function Add(const AOriginal:WideString):TDictionaryItem; overload;
    function Add(var Item:TDictionaryItem):integer; overload;
    procedure Delete(Index:integer);
    function IndexOf(const S:WideString):integer;
    // find is like IndexOf but returns the index of where the item should be located
    function Find(const S:WideString; var Index:integer):boolean;
    procedure Clear;
    procedure Sort;
    procedure TrimTranslations; // removes empty translations
    constructor Create;
    destructor Destroy; override;
    property AutoRemoveQuotes:boolean read FAutoRemoveQuotes write FAutoRemoveQuotes default true;
    property Items[Index:integer]:TDictionaryItem read GetItems; default;
    property Count:integer read GetCount;
    property Modified:WordBool read GetModified write SetModified;
    property IgnorePunctuation:WordBool read GetIgnorePunctuation write SetIgnorePunctuation;
  end;

implementation
uses
  AppUtils, CommonUtils;

function StripPunctuation(const S:WideString):WideString;
var
  i, j:integer;
begin
  Result := S;
  j := 0;
  for i := 1 to Length(S) do
    if not IsCharPunct(S[i]) then
    begin
      Inc(j);
      Result[j] := S[i];
    end;
  SetLength(Result, j);
end;

function OriginalCompareIgnore(Item1, Item2:Pointer):integer;
begin
  Result := WideCompareText(StripPunctuation(TDictionaryItem(Item1).Original), StripPunctuation(TDictionaryItem(Item2).Original));
end;

function OriginalCompare(Item1, Item2:Pointer):integer;
begin
  Result := WideCompareText(TDictionaryItem(Item1).Original, TDictionaryItem(Item2).Original);
end;

{ TDictionaryItem }

function TDictionaryItem.Add(const Translation:WideString):Integer;
begin
  Result := Translations.Add(Translation);
end;

procedure TDictionaryItem.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TDictionaryItem.Clear;
begin
  Translations.Clear;
end;

constructor TDictionaryItem.Create;
begin
  inherited Create;
  FTranslations := TTntStringlist.Create;
  TTntStringlist(FTranslations).Sorted := true;
end;

function TDictionaryItem.DefaultTranslation:WideString;
begin
  if (DefaultIndex >= 0) and (DefaultIndex < Translations.Count) then
    Result := Translations[DefaultIndex]
  else if Translations.Count > 0 then
    Result := Translations[0]
  else
    Result := '';
end;

procedure TDictionaryItem.Delete(Index:integer);
begin
  Translations.Delete(Index);
end;

destructor TDictionaryItem.Destroy;
begin
  FTranslations.Free;
  inherited Destroy;
end;

function TDictionaryItem.GetOriginal:WideString;
begin
  Result := FOriginal;
end;

function TDictionaryItem.GetTranslation(Index:Integer):WideString;
begin
  Result := Translations[Index]
end;

function TDictionaryItem.IndexOf(const Translation:WideString):integer;
begin
  Result := TRanslations.IndexOf(Translation);
end;

procedure TDictionaryItem.SetOriginal(const Value:WideString);
begin
  if FOriginal <> Value then
  begin
    FOriginal := Value;
    Change;
  end;
end;

procedure TDictionaryItem.SetTranslation(Index:integer;
  const Value:WideString);
begin
  Translations[Index] := Value;
end;

procedure TDictionaryItem.SetTranslations(const Value:TTntStrings);
begin
  FTranslations.Assign(Value);
  Change;
end;

function TDictionaryItem.TranslationCount:integer;
begin
  Result := Translations.Count;
end;

{ TDictionaryItems }

function TDictionaryItems.Add(const AOriginal:WideString):TDictionaryItem;
begin
  Assert(AOriginal <> '', 'The original string must not be empty');
  Result := TDictionaryItem.Create;
  Result.Original := AOriginal;
  Result.OnChange := DoChange;
  Add(Result);
end;

function TDictionaryItems.Add(var Item:TDictionaryItem):integer;
begin
  Assert(Item <> nil, 'Item not assigned');
  Assert(Item.Original <> '', 'The original string must not be empty');
  if not Find(Item.Original, Result) then
  begin
    FItems.Insert(Result, Item); // add a new item in it's correct position (no need to sort)
    Item.OnChange := DoChange; // make sure any changes to the original string is detected
  end
  else
  begin // just add any new translations
    Items[Result].Translations.AddStrings(Item.Translations);
    FreeAndNil(Item);
    Item := Items[Result];
  end;
  Modified := true;
end;

procedure TDictionaryItems.Assign(Source:TPersistent);
var
  i:integer;
begin
  if Source = nil then
    Clear
  else if Source is TDictionaryItems then
  begin
    Clear;
    for i := 0 to TDictionaryItems(Source).Count - 1 do
      Add(TDictionaryItems(Source).Items[i].Original).Translations.Assign(TDictionaryItems(Source).Items[i].Translations);
    TrimTranslations;
  end
  else
  begin
    inherited Assign(Source);
    Exit;
  end;
  Modified := true;
end;

procedure TDictionaryItems.Clear;
var
  i:integer;
begin
  for i := FItems.Count - 1 downto 0 do
    TDictionaryItems(FItems[i]).Free;
  FItems.Clear;
  Modified := true;
end;

constructor TDictionaryItems.Create;
begin
  inherited Create;
  FItems := TList.Create;
  FAutoRemoveQuotes := true;
end;

procedure TDictionaryItems.Delete(Index:integer);
var
  P:TDictionaryItem;
begin
  P := Items[Index];
  FItems.Delete(Index);
  P.Free;
  Modified := true;
end;

destructor TDictionaryItems.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  inherited;
end;

function TDictionaryItems.DictAdd(const AOriginal:WideString):IDictionaryItem;
begin
  Result := Add(AOriginal);
end;

procedure TDictionaryItems.DoChange(Sender:TObject);
begin
  // always sort after the original string has been changed, so it ends up in the right position
  Sort;
  Merge;
  Modified := true;
end;

function TDictionaryItems.Find(const S:WideString;
  var Index:integer):boolean;
var
  AItem:TDictionaryItem;
begin
  AItem := TDictionaryItem.Create;
  try
    AItem.Original := S;
    if IgnorePunctuation then
      Result := BinarySearch(FItems, 0, FItems.Count - 1, AItem, OriginalCompareIgnore, Index)
    else
      Result := BinarySearch(FItems, 0, FItems.Count - 1, AItem, OriginalCompare, Index);
  finally
    AItem.Free;
  end;
end;

function TDictionaryItems.GetCount:integer;
begin
  Result := FItems.Count;
end;

function TDictionaryItems.GetIgnorePunctuation:WordBool;
begin
  Result := FIgnorePunctuation;
end;

function TDictionaryItems.GetItem(Index:integer):IDictionaryItem;
begin
  Result := Items[Index];
end;

function TDictionaryItems.GetItems(Index:integer):TDictionaryItem;
begin
  Result := TDictionaryItem(FItems[Index]);
end;

function TDictionaryItems.GetModified:WordBool;
begin
  Result := FModified;
end;

function TDictionaryItems.IndexOf(const S:WideString):integer;
begin
  if not Find(S, Result) then
    Result := -1;
end;

procedure TDictionaryItems.Invert;
var
  i, j:integer;
  tmp:TDictionaryItems;
begin
  tmp := TDictionaryItems.Create;
  try
    for i := 0 to Count - 1 do
      for j := 0 to Items[i].Translations.Count - 1 do
        tmp.Add(Items[i].Translations[j]).Translations.Add(Items[i].Original);
    Clear;
    for i := 0 to tmp.Count - 1 do
      Add(tmp[i].Original).Translations := tmp[i].Translations;
  finally
    tmp.Free;
  end;
  Modified := true;
end;

procedure TDictionaryItems.LoadFromFile(const Filename:WideString);
var
  AFile, AValues:TTntStringlist;
  i, j:integer;
  AItem:TDictionaryItem;

  function DoDequote(const S:WideString):WideString;
  begin
    if AutoRemoveQuotes then
      Result := AutoWideDequotedStr(S)
    else
      Result := S;
  end;
begin
  // format:
  // original=translation, translation, translation[,translation]
  Clear;
  AFile := TTntStringlist.Create;
  AValues := TTntStringlist.Create;
  try
    AFile.LoadFromFile(Filename);
    for i := 0 to AFile.Count - 1 do
    begin
      if DoDequote(AFile.Names[i]) <> '' then
      begin
        AItem := TDictionaryItem.Create;
        AItem.Original := DoDequote(AFile.Names[i]);
        AValues.CommaText := ValueFromIndex(AFile, i);
        if AutoRemoveQuotes then
          for j := 0 to AValues.Count - 1 do
            AValues[j] := AutoWideDequotedStr(AValues[j]);
        AItem.Translations := AValues;
        Add(AItem);
      end;
    end;
    Merge;

  finally
    AFile.Free;
    AValues.Free;
  end;
  Modified := false;
end;

procedure TDictionaryItems.Merge;
var
  ACurrentOriginal:WideString;
  i:integer;
begin
  ACurrentOriginal := ''; // we don't allow empty originals, so this value should never appear in the list
  i := 0;
  while true do
  begin
    while (i > 0) and (i < Count) and WideSameText(ACurrentOriginal, Items[i].Original) do
    begin
      // Since ACurrentOriginal is the same as the current item, it means that
      // we've already seen this item, i.e it's the same as the previous one (the list is sorted),
      // so copy the translations of the current item to the previous item...
      Items[i - 1].Translations.AddStrings(Items[i].Translations);
      // ...and remove the item
      Delete(i);
      Modified := true;
    end;
    if i < Count then
      ACurrentOriginal := Items[i].Original
    else
      Break;
    // TODO: merge duplicate items
    Inc(i);
  end;
  TrimTranslations;
end;

procedure TDictionaryItems.SaveToFile(const Filename:WideString);
var
  AFile:TTntStringlist;
  i:integer;
begin
  TrimTranslations;
  AFile := TTNtStringlist.Create;
  try
    for i := 0 to Count - 1 do
      AFile.Add(Items[i].Original + '=' + Items[i].Translations.CommaText);
    AFile.SaveToFile(Filename);
  finally
    AFile.Free;
  end;
  Modified := false;
end;

procedure TDictionaryItems.SetIgnorePunctuation(Value:WordBool);
begin
  FIgnorePunctuation := Value;
end;

procedure TDictionaryItems.SetModified(Value:WordBool);
begin
  FModified := Value;
end;

procedure TDictionaryItems.Sort;
begin
  FItems.Sort(OriginalCompare);
end;

procedure TDictionaryItems.TrimTranslations;
var
  i, j:integer;
begin
  for i := 0 to Count - 1 do
    for j := Items[i].Translations.Count - 1 downto 0 do
      if Items[i].Translations[j] = '' then
      begin
        Items[i].Translations.Delete(j);
        Modified := true;
      end;
end;

end.
