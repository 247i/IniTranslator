{@abstract(Translation file class (loads and handles original and translated items as a unit)) }
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

// $Id: TranslateFile.pas 262 2007-10-20 12:49:32Z peter3 $

unit TranslateFile;

{$I TRANSLATOR.INC}

interface
uses
  Classes, SysUtils, AppConsts, AppUtils, TransIntf, TntClasses, TntSysUtils;

type
  TTranslationItems = class;
  TTranslateFiles = class;

  TTranslationItem = class(TInterfacedObject, IInterface, ITranslationItem)
  private
    FOwner: ITranslationItems;
    FOriginal: WideString;
    FSection: WideString;
    FTranslation: WideString;
    FName: WideString;
    FIndex: integer;
    FTransComments: WideString;
    FOrigComments: WideString;
    FPrivateStorage, FPreData, FPostData: WideString;
    FTranslated, FModified: WordBool;
    FOrigQuote, FTransQuote: WideChar;
    { ITranslationItem }
    function GetIndex: integer;
    function GetName: WideString;
    function GetOriginal: WideString;
    function GetSection: WideString;
    function GetTransComments: WideString;
    function GetTranslation: WideString;
    function GetOrigComments: WideString;
    function GetOwner: ITranslationItems;
    function GetTranslated: WordBool;
    procedure SetIndex(const Value: integer);
    procedure SetName(const Value: WideString);
    procedure SetOrigComments(const Value: WideString);
    procedure SetOriginal(const Value: WideString);
    procedure SetTranslation(const Value: WideString);
    procedure SetSection(const Value: WideString);
    procedure SetTransComments(const Value: WideString);
    procedure SetOwner(const Value: ITranslationItems);
    procedure SetTranslated(const Value: WordBool);
    { ITranslationItem2 }
    procedure SetClearOriginal(const Value: WideString);
    procedure SetClearTranslation(const Value: WideString);
    { ITranslationItem3 }
    procedure SetPrivateStorage(const Value: WideString);
    function GetPrivateStorage: WideString;
    function GetModified: WordBool;
    procedure SetModified(Value: WordBool);
    function GetPreData: WideString;
    procedure SetPreData(const Value: WideString);
    function GetPostData: WideString;
    procedure SetPostData(const Value: WideString);
  private
    function GetQuote(const S: WideString): WideChar;
    procedure Change(Changed: boolean);
//  protected
//    property Deleted:boolean read FDeleted write FDeleted;
  public
    destructor Destroy; override;
    function TransQuote: WideChar;
    function OrigQuote: WideChar;
  public

    property Owner: ITranslationItems read GetOwner write SetOwner;
    property Index: integer read GetIndex write SetIndex;
    property TransComments: WideString read GetTransComments write SetTransComments;
    property OrigComments: WideString read GetOrigComments write SetOrigComments;
    property Original: WideString read GetOriginal write SetOriginal;
    property Translation: WideString read GetTranslation write SetTranslation;
    property Section: WideString read GetSection write SetSection;
    property Name: WideString read GetName write SetName;
    property Translated: WordBool read GetTranslated write SetTranslated;
    property Modified: WordBool read GetModified write SetModified;
    property PreData: WideString read GetPreData write SetPreData;
    property PostData: WideString read GetPostData write SetPostData;
  end;

  TTranslationItems = class(TInterfacedObject, IInterface, ITranslationItems)
  private
    FItems: TList;
    FSort: TTranslateSortType;
    FTranslatedCount: integer;
    FModified: WordBool;
    function GetCount: integer;
    function GetItem(Index: integer): ITranslationItem;
    procedure SetSort(const Value: TTranslateSortType);
    function GetTranslatedCount: integer;
    procedure SetTranslatedCount(const Value: integer);
    function GetSort: TTranslateSortType;
    function GetModified: WordBool;
    procedure SetModified(Value: WordBool);
  public
    function Add: ITranslationItem; overload;
    function Add(const Item: ITranslationItem): integer; overload;
    function CreateItem: ITranslationItem;
    procedure Delete(Index: integer);
    procedure Clear;
    constructor Create;
    destructor Destroy; override;
    function Find(const Section, Name: WideString; CaseSense: WordBool; var Index: integer): boolean;
    function IndexOf(const Section, Name: WideString; CaseSense: WordBool = false): integer; overload;
    function IndexOf(const AItem: ITranslationItem): integer; overload;
    // NB! sorting is *not* maintained when new items are inserted!
    property Sort: TTranslateSortType read GetSort write SetSort;
    property Count: integer read GetCount;
    property Items[Index: integer]: ITranslationItem read GetItem; default;
    property TranslatedCount: integer read GetTranslatedCount write SetTranslatedCount;
    property Modified: WordBool read GetModified write SetModified;

  end;

  TTranslateFiles = class
  private
    FItems: ITranslationItems;
    FOrphans: ITranslationItems;
    FEndSection: WideChar;
    FStartSection: WideChar;
    FSeparatorChars: WideString;
    FHeader: WideString;
    FFooter: WideString;
    FCommentChars: TTntStrings;
  public
    constructor Create;
    destructor Destroy; override;

    property Header: WideString read FHeader write FHeader;
    property Footer: WideString read FFooter write FFooter;
    property Items: ITranslationItems read FItems;
    // Orphans are the items in the translation file that didn't match up with
    // any items in the original file
    property Orphans: ITranslationItems read FOrphans;
    function LoadOriginal(const Filename: WideString; Encoding: TEncoding): TEncoding;
    function LoadTranslation(const Filename: WideString; Encoding: TEncoding): TEncoding;
    procedure SaveOriginal(const Filename: WideString; Encoding: TEncoding);
    procedure SaveTranslation(const Filename: WideString; Encoding: TEncoding);
    // various delimiters used to parse the file (should probably not be changed)
    property StartSection: WideChar read FStartSection write FStartSection default '[';
    property EndSection: WideChar read FEndSection write FEndSection default ']';
    property SeparatorChars: WideString read FSeparatorChars write FSeparatorChars;
    property CommentChars: TTntStrings read FCommentChars;
  end;

implementation
uses
  Windows, TntSystem, CommonUtils;

function trimQuotes(const S: WideString; Quote: WideChar): WideString;
begin
  if (Length(S) > 0) and (S[1] = Quote) and (S[Length(S)] = Quote) then
    Result := Copy(S, 2, Length(S) - 2)
  else
    Result := S;
end;

{ TTranslationItems }

function TTranslationItems.Add: ITranslationItem;
begin
  Result := CreateItem;
  Add(Result);
end;

function TTranslationItems.Add(const Item: ITranslationItem): integer;
begin
  Item.Index := Count;
  Item.Owner := self;
  //  Item._AddRef;
  Result := FItems.Add(nil);
  ITranslationItem(FItems.List[Result]) := Item;
  FSort := stNone;
end;

procedure TTranslationItems.Clear;
var
  i: integer;
begin
  for i := 0 to FItems.Count - 1 do
    IInterface(FItems.List[i]) := nil;
  FItems.Clear;
end;

constructor TTranslationItems.Create;
begin
  inherited Create;
  FItems := TList.Create;
  FSort := stNone;
end;

function TTranslationItems.CreateItem: ITranslationItem;
begin
  Result := TTranslationItem.Create;
end;

procedure TTranslationItems.Delete(Index: integer);
begin
  // sorting isn't affected when deleting
  IInterface(FItems.List[Index]) := nil;
  FItems.Delete(Index);
end;

destructor TTranslationItems.Destroy;
begin
  Clear;
  FItems.Free;
  inherited;
end;

function SectionCompare(Item1, Item2: ITranslationItem): integer;
begin
  Result := WideCompareText(Item1.Section, Item2.Section);
  if Result = 0 then
    Result := WideCompareText(Item1.Name, Item2.Name);
end;

function CaseSectionCompare(Item1, Item2: ITranslationItem): integer;
begin
  Result := WideCompareStr(Item1.Section, Item2.Section);
  if Result = 0 then
    Result := WideCompareStr(Item1.Name, Item2.Name);
end;

type
  TTransSortCompare = function(Item1, Item2: ITranslationItem): integer;

procedure QuickSort(SortList: PPointerList; L, R: Integer;
  SCompare: TTransSortCompare);
var
  I, J: Integer;
  P, T: ITranslationItem;
begin
  repeat
    I := L;
    J := R;
    P := ITranslationItem(SortList^[(L + R) shr 1]);
    repeat
      while SCompare(ITranslationItem(SortList^[I]), P) < 0 do
        Inc(I);
      while SCompare(ITranslationItem(SortList^[J]), P) > 0 do
        Dec(J);
      if I <= J then
      begin
        T := ITranslationItem(SortList^[I]);
        ITranslationItem(SortList^[I]) := ITranslationItem(SortList^[J]);
        ITranslationItem(SortList^[J]) := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(SortList, L, J, SCompare);
    L := I;
  until I >= R;
end;

function BinarySearch(AList: TList; L, R: integer; CompareItem: ITranslationItem; CompareFunc: TTransSortCompare; var Index: integer): boolean;
var
  M: integer;
  CompareResult: integer;
begin

  while L <= R do
  begin
    M := (L + R) div 2;
    CompareResult := CompareFunc(ITranslationItem(AList[M]), CompareItem);
    if (CompareResult < 0) then
      L := M + 1
    else if (CompareResult > 0) then
      R := M - 1
    else
    begin
      Index := M;
      Result := true;
      Exit;
    end;
  end;
  // not found, should be located here:
  Result := false;
  Index := L;
end;

function TTranslationItems.Find(const Section, Name: WideString; CaseSense: WordBool;
  var Index: integer): boolean;
var
  AItem: ITranslationItem;
begin
  Index := 0;
  if Sort = stSection then
  begin
    AItem := TTranslationItem.Create;
    try
      AItem.Section := Section;
      AItem.Name := Name;
      if not CaseSense then
        Result := BinarySearch(FItems, 0, FItems.Count - 1, AItem, SectionCompare, Index)
      else
        Result := BinarySearch(FItems, 0, FItems.Count - 1, AItem, CaseSectionCompare, Index)
    finally
      AItem := nil;
    end;
  end
  else
  begin
    if not CaseSense then
    begin
      while Index < FItems.Count do
      begin
        if WideSameText(ITranslationItem(FItems[Index]).Section, Section) and
          WideSameText(ITranslationItem(FItems[Index]).Name, Name) then
        begin
          Result := true;
          Exit;
        end;
        Inc(Index);
      end;
    end
    else
    begin
      while Index < FItems.Count do
      begin
        if WideSameStr(ITranslationItem(FItems[Index]).Section, Section) and
          WideSameStr(ITranslationItem(FItems[Index]).Name, Name) then
        begin
          Result := true;
          Exit;
        end;
        Inc(Index);
      end;
    end;
    Result := false;
  end;
end;

function TTranslationItems.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TTranslationItems.GetItem(Index: integer): ITranslationItem;
begin
  Result := ITranslationItem(FItems[Index]);
end;

function TTranslationItems.GetModified: WordBool;
var i: integer;
begin
  Result := FModified;
  if not Result then
    for i := 0 to Count - 1 do
      if Items[i].Modified then
      begin
        Result := true;
        Exit;
      end;
end;

function TTranslationItems.GetSort: TTranslateSortType;
begin
  Result := FSort;
end;

function TTranslationItems.GetTranslatedCount: integer;
begin
  Result := FTranslatedCount;
end;

function TTranslationItems.IndexOf(const Section, Name: WideString; CaseSense: WordBool = false): integer;
begin
  if not Find(Section, Name, CaseSense, Result) then
    Result := -1;
end;

function IndexSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := Item1.Index - Item2.Index;
end;

function InvertIndexSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := Item2.Index - Item1.Index;
end;

function TransSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := WideCompareText(Item1.Translation, Item2.Translation);
  if Result = 0 then
    Result := IndexSort(Item1, Item2);
end;

function InvertTransSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := -TransSort(Item1, Item2);
end;

function OrigSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := WideCompareText(Item1.Original, Item2.Original);
  if Result = 0 then
    Result := TransSort(Item1, Item2);
end;

function NameSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := WideCompareText(Item1.Name, Item2.Name);
end;

function SectionSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := WideCompareText(Item1.Section, Item2.Section);
  if Result = 0 then
    Result := NameSort(Item1, Item2);
end;

function InvertOrigSort(Item1, Item2: ITranslationItem): Integer;
begin
  Result := -OrigSort(Item1, Item2);
end;

function TTranslationItems.IndexOf(const AItem: ITranslationItem): integer;
begin
  if AItem <> nil then
    Result := IndexOf(AItem.Section, AItem.Name)
  else
    Result := -1;
end;

procedure TTranslationItems.SetModified(Value: WordBool);
var i: integer;
begin
  if GetModified <> Value then
  begin
    FModified := Value;
    if not FModified then
      for i := 0 to Count - 1 do
        Items[i].Modified := false;
  end;
end;

procedure TTranslationItems.SetSort(const Value: TTranslateSortType);
begin
  if FSort <> Value then
  begin
    FSort := Value;
    if FItems.Count < 2 then
      Exit;
    case FSort of
      stSection:
        QuickSort(FItems.List, 0, FItems.Count - 1, SectionSort);
      stOriginal:
        QuickSort(FItems.List, 0, FItems.Count - 1, OrigSort);
      stInvertOriginal:
        QuickSort(FItems.List, 0, FItems.Count - 1, InvertOrigSort);
      stTranslation:
        QuickSort(FItems.List, 0, FItems.Count - 1, TransSort);
      stInvertTranslation:
        QuickSort(FItems.List, 0, FItems.Count - 1, InvertTransSort);
      stIndex:
        QuickSort(FItems.List, 0, FItems.Count - 1, IndexSort);
      stInvertIndex:
        QuickSort(FItems.List, 0, FItems.Count - 1, InvertIndexSort);
    end;
  end;
end;

procedure TTranslationItems.SetTranslatedCount(const Value: integer);
begin
  if FTranslatedCount <> Value then
  begin
    FTranslatedCount := Value;
    if FTranslatedCount < 0 then
      FTranslatedCount := 0;
    if FTranslatedCount > Count then
      FTranslatedCount := Count;
  end;
end;

{ TTranslateFiles }

constructor TTranslateFiles.Create;
begin
  inherited Create;
  FCommentChars := TTntStringlist.Create;
  FItems := TTranslationItems.Create;
  FOrphans := TTranslationItems.Create;
  StartSection := '[';
  EndSection := ']';
  SeparatorChars := '=';
  FCommentChars.Add(';');
  FCommentChars.Add('//');
  FCommentChars.Add('#');
end;

destructor TTranslateFiles.Destroy;
begin
  FItems.Clear;
  FItems := nil;
  FOrphans.Clear;
  FOrphans := nil;
  FCommentChars.Free;
  inherited;
end;

function InStringList(List: TTntStrings; const Value: WideString): boolean;
var i: integer;
begin
  for i := 0 to List.Count - 1 do
    if WideTextPos(List[i], Value) = 1 then
    begin
      Result := true;
      Exit;
    end;
  Result := false;
end;

function WideTextContains(SubStr:WideString; Str:WideString):integer;
var i:integer;
begin
  for i := 1 to Length(SubStr) do
  begin
    Result := WideTExtPos(SubStr[i], Str);
    if Result > 0 then Exit;
  end;
  Result := 0;
end;

function TTranslateFiles.LoadOriginal(const Filename: WideString; Encoding: TEncoding): TEncoding;
var
  S, FComments: TTntStringlist;
  ASection, tmpString, tmpTrimString: WideString;
  i, j: integer;
begin
  FItems.Clear;
  FOrphans.Clear;

  FItems.Sort := stNone;
  S := TTntStringlist.Create;

  FComments := TTntStringlist.Create;
  try
    if AppUtils.AutoDetectCharacterSet(Filename) = feAnsi then // only use the requested encoding if the file has no BOM
    begin
      case Encoding of
        feAnsi:
          S.AnsiStrings.LoadFromFile(Filename);
        feUTF8:
          begin
            S.AnsiStrings.LoadFromFileEx(Filename, CP_UTF8);
            S.AnsiStrings.Text := UTF8Decode(S.AnsiStrings.Text);
          end;
        feUnicode:
          S.LoadFromFile(Filename);
      end;
      Result := Encoding;
    end
    else
    begin
      S.LoadFromFile(Filename);
      Result := FileCharSetToEncoding(S.LastFileCharSet);
    end;
    for i := 0 to S.Count - 1 do
    begin
      tmpString := S[i];
      tmpTrimString := trim(tmpString);
      if InStringList(CommentChars, tmpString) then
        FComments.Add(tmpString)
      else if WideStartsText(StartSection, tmpTrimString) and WideEndsText(EndSection, tmpTrimString) then
        ASection := Copy(tmpTrimString, 2, Length(tmpTrimString) - 2)
      else if WideTextContains(SeparatorChars, tmpString) > 1 then
      begin
        j := WideTextContains(SeparatorChars, tmpString);
        if j > 1 then
        begin
          with FItems.Add do
          begin
            Section := ASection;
            Name := Copy(tmpString, 1, j - 1);
            Original := Copy(tmpString, j + 1, MaxInt);
            OrigComments := FComments.Text;
            FComments.Clear;
          end;
        end;
      end
      else
        FComments.Add(tmpString);
    end;
  finally
    S.Free;
    FComments.Free;
  end;
end;

function TTranslateFiles.LoadTranslation(const Filename: WideString; Encoding: TEncoding): TEncoding;
var
  S, FComments: TTNTStringlist;
  ASection, tmpString, tmpTrimString: WideString;
  i, j, k: integer;
  FOldSort: TTranslateSortType;
  FItem: ITranslationItem;
begin
  FOrphans.Clear;
  for i := 0 to Items.Count - 1 do
    Items[i].Translation := '';
  FComments := TTNTStringlist.Create;
  S := TTNTStringlist.Create;
  FOldSort := Items.Sort;
  try
    for i := 0 to Items.Count - 1 do
      Items[i].Translated := false;
    Items.Sort := stSection;
    if AppUtils.AutoDetectCharacterSet(Filename) = feAnsi then // only use the requested encoding if the file has no BOM
    begin
      case Encoding of
        feAnsi:
          S.AnsiStrings.LoadFromFile(Filename);
        feUTF8:
          S.AnsiStrings.LoadFromFileEx(Filename, CP_UTF8);
        feUnicode:
          S.LoadFromFile(Filename);
      end;
      Result := Encoding;
    end
    else
    begin
      S.LoadFromFile(Filename);
      Result := FileCharSetToEncoding(S.LastFileCharSet);
    end;
    for i := 0 to S.Count - 1 do
    begin
      tmpString := S[i];
      tmpTrimString := trim(tmpString);
      if InStringList(CommentChars, tmpString) then
        FComments.Add(tmpString)
      else if WideStartsText(StartSection, tmpTrimString) and WideEndsText(EndSection, tmpTrimString) then
        ASection := Copy(tmpTrimString, 2, Length(tmpTrimString) - 2)
      else
      begin
        j := WideTextContains(SeparatorChars, tmpString);
        if j > 1 then
        begin
          k := FItems.IndexOf(ASection, Copy(tmpString, 1, j - 1));
          if k >= 0 then
          begin
            FItems[k].Translation := Copy(tmpString, j + 1, MaxInt);
            // normal behavior is to regard empty translations as untranslated
            FItems[k].Translated := FItems[k].Translation <> '';
            FItems[k].TransComments := FComments.Text;
            FComments.Clear;
          end
          else // not found, so add to orphaned items
          begin
            FItem := FOrphans.Add;
            FItem.Section := ASection;
            FItem.Name := Copy(tmpString, 1, j - 1);
            FItem.Original := Copy(tmpString, 1, j - 1); // have to store something...
            FItem.Translation := Copy(tmpString, j + 1, MaxInt);
            // normal behavior is to regard empty translations as untranslated
//            FItem.Translated := FItem.Translation <> '';
            FItem.TransComments := FComments.Text;
            FComments.Clear;
          end;
        end
        else
          FComments.Add(tmpString);
      end;
    end;
  finally
    S.Free;
    FComments.Free;
    Items.Sort := FOldSort;
  end;
end;

procedure FixAndAddComments(S: TTntStringlist; const Comments: WideString);
begin
  if Comments <> '' then
    S.Add(Comments);
end;

procedure TTranslateFiles.SaveOriginal(const Filename: WideString; Encoding: TEncoding);
var
  i: integer;
  S: TTNTStringlist;
  ASection: WideString;
  NewSection:boolean;
  FOldSort: TTranslateSortType;
begin
  S := TTNTStringlist.Create;
  ASection := '';
  FOldSort := Items.Sort;
  try
    S.Text := Header;
//    Items.Sort := stSection;
    Items.Sort := stIndex;
    for i := 0 to Items.Count - 1 do
    begin
      NewSection := ASection <> Items[i].Section;
      if NewSection then
      begin
        S.Add(StartSection + Items[i].Section + EndSection);
        ASection := Items[i].Section;
      end;
      if not NewSection then
        FixAndAddComments(S, Items[i].OrigComments);

      S.Add(Items[i].Name + Copy(SeparatorChars,1,1) + Items[i].Original);
    end;
    if Footer <> '' then
      S.Add(trim(Footer));
    case Encoding of
      feUnicode:
        S.SaveToFile(Filename);
      feUnicodeSwapped:
        raise Exception.Create('Unicode swapped not supported!');
      feUTF8:
        S.AnsiStrings.SaveToFileEx(Filename, CP_UTF8);
    else
      S.AnsiStrings.SaveToFile(Filename)
    end;
  finally
    S.Free;
    Items.Sort := FOldSort;
  end;
end;

procedure TTranslateFiles.SaveTranslation(const Filename: WideString; Encoding: TEncoding);
var
  i: integer;
  S: TTNTStringlist;
  ASection: WideString;
  NewSection:boolean;
  FOldSort: TTranslateSortType;
begin
  ASection := '';
  S := TTNTStringlist.Create;
  FOldSort := Items.Sort;
  try
    S.Text := Header;
//    Items.Sort := stSection;
    Items.Sort := stIndex;
    for i := 0 to Items.Count - 1 do
    begin
      NewSection := ASection <> Items[i].Section;
      if NewSection then
      begin
        //if ASection <> '' then
          //S.Add('');
        FixAndAddComments(S, Items[i].TransComments);

        ASection := Items[i].Section;
        S.Add(StartSection + ASection + EndSection);
      end;
      if not NewSection then
        FixAndAddComments(S, Items[i].TransComments);
      S.Add(Items[i].Name + TCommonUtils.StrDefault(Copy(SeparatorChars,1,1),'=') + Items[i].Translation);
    end;
    if Footer <> '' then
      S.Add(trim(Footer));
    case Encoding of
      feUnicode:
        S.SaveToFile(Filename);
      feUnicodeSwapped:
        raise Exception.Create('Unicode swapped not supported!');
      feUTF8:
        S.AnsiStrings.SaveToFileEx(Filename, CP_UTF8);
    else
      S.AnsiStrings.SaveToFile(Filename)
    end;

  finally
    S.Free;
    Items.Sort := FOldSort;
  end;
end;

{ TTranslationItem }

procedure TTranslationItem.Change(Changed: boolean);
begin
  if Changed then
    Modified := true;
end;

destructor TTranslationItem.Destroy;
begin
  if (Translated) and (Owner <> nil) then
    Owner.TranslatedCount := Owner.TranslatedCount - 1;
  inherited;
end;

function TTranslationItem.GetIndex: integer;
begin
  Result := FIndex;
end;

function TTranslationItem.GetModified: WordBool;
begin
  Result := FModified;
end;

function TTranslationItem.GetName: WideString;
begin
  Result := FName;
end;

function TTranslationItem.GetOrigComments: WideString;
begin
  Result := FOrigComments;
end;

function TTranslationItem.GetOriginal: WideString;
begin
  Result := FOriginal;
end;

function TTranslationItem.GetOwner: ITranslationItems;
begin
  Result := FOwner;
end;

function TTranslationItem.GetPostData: WideString;
begin
  Result := FPostData;
end;

function TTranslationItem.GetPreData: WideString;
begin
  Result := FPreData;
end;

function TTranslationItem.GetPrivateStorage: WideString;
begin
  Result := FPrivateStorage;
end;

function TTranslationItem.GetQuote(const S: WideString): WideChar;
var L: integer;
begin
  L := Length(S);
  if (L > 1) and (S[1] = S[L]) and (S[1] in [WideChar(#39), WideChar('"')]) then
    Result := S[1]
  else
    Result := WideChar(#0);
end;

function TTranslationItem.GetSection: WideString;
begin
  Result := FSection;
end;

function TTranslationItem.GetTransComments: WideString;
begin
  Result := FTransComments;
end;

function TTranslationItem.GetTranslated: WordBool;
begin
  Result := FTranslated;
end;

function TTranslationItem.GetTranslation: WideString;
begin
  Result := FTranslation;
end;

function TTranslationItem.OrigQuote: WideChar;
begin
  Result := FOrigQuote;
end;

procedure TTranslationItem.SetClearOriginal(const Value: WideString);
begin
  Original := Value;
  FOrigQuote := #0;
end;

procedure TTranslationItem.SetClearTranslation(const Value: WideString);
begin
  Translation := Value;
  FTransQuote := #0;
end;

procedure TTranslationItem.SetIndex(const Value: integer);
begin
  FIndex := Value;
end;

procedure TTranslationItem.SetModified(Value: WordBool);
begin
  FModified := Value;
end;

procedure TTranslationItem.SetName(const Value: WideString);
begin
  FName := Value;
end;

procedure TTranslationItem.SetOrigComments(const Value: WideString);
begin
  FOrigComments := Value;
end;

procedure TTranslationItem.SetOriginal(const Value: WideString);
begin
  FOriginal := Value;
  if FOriginal <> '' then
    FOrigQuote := GetQuote(FOriginal);
end;

procedure TTranslationItem.SetOwner(const Value: ITranslationItems);
begin
  FOwner := Value;
end;

procedure TTranslationItem.SetPostData(const Value: WideString);
begin
  FPostData := Value;
end;

procedure TTranslationItem.SetPreData(const Value: WideString);
begin
  FPreData := Value;
end;

procedure TTranslationItem.SetPrivateStorage(const Value: WideString);
begin
  FPrivateStorage := Value;
end;

procedure TTranslationItem.SetSection(const Value: WideString);
begin
  FSection := Value;
end;

procedure TTranslationItem.SetTransComments(const Value: WideString);
begin
  FTransComments := Value;
end;

procedure TTranslationItem.SetTranslated(const Value: WordBool);
begin
  if FTranslated <> Value then
  begin
    if FTranslated and (Owner <> nil) then
      Owner.TranslatedCount := Owner.TranslatedCount - 1;
    FTranslated := Value;
    if (FTranslated) and (Owner <> nil) then
      Owner.TranslatedCount := Owner.TranslatedCount + 1;
  end;
end;

procedure TTranslationItem.SetTranslation(const Value: WideString);
begin
  Change(FTranslation <> Value);
  FTranslation := Value;
  // NB! Changing Translation does not automatically set Translated!
  if FTranslation <> '' then
    FTransQuote := GetQuote(FTranslation);
end;

function TTranslationItem.TransQuote: WideChar;
begin
  Result := FTransQuote;
end;

end.

