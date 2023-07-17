{@abstract(Options class for application) }
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
// $Id: AppOptions.pas 269 2007-10-21 15:49:52Z peter3 $
unit AppOptions;
{$I TRANSLATOR.INC}

interface
uses
  Classes, Forms, Types, SysUtils, Graphics, WideIniFiles,
  TntClasses, TransIntf;

type
  PAppWindowInfo = ^TAppWindowInfo;
  TAppWindowInfo = record
    Name:shortstring;
    BoundsRect:TRect;
    WindowState:TWindowState;
  end;

  TToolItem = class(TCollectionItem)
  private
    FCaptureOutput:boolean;
    FWaitForCompletion:boolean;
    FPromptForArguments:boolean;
    FInitialDirectory:WideString;
    FArguments:WideString;
    FTitle:WideString;
    FCommand:WideString;
    FUseShellExecute:boolean;
    FShortCut:Word;
    function GetAsString:WideString;
    procedure SetAsString(const Value:WideString);
  public
    procedure Assign(Source:TPersistent); override;
    property AsString:WideString read GetAsString write SetAsString;
  published
    property Title:WideString read FTitle write FTitle;
    property Command:WideString read FCommand write FCommand;
    property Arguments:WideString read FArguments write FArguments;
    property InitialDirectory:WideString read FInitialDirectory write FInitialDirectory;
    property CaptureOutput:boolean read FCaptureOutput write FCaptureOutput;
    property PromptForArguments:boolean read FPromptForArguments write FPromptForArguments;
    property WaitForCompletion:boolean read FWaitForCompletion write FWaitForCompletion;
    property UseShellExecute:boolean read FUseShellExecute write FUseShellExecute;
    property ShortCut:Word read FShortCut write FShortCut;
  end;

  TToolItems = class(TCollection)
  private
    function GetItem(Index:integer):TToolItem;
    procedure SetItem(Index:integer; const Value:TToolItem);
  public
    constructor Create;
    procedure Assign(Source:TPersistent); override;
    function Add:TToolItem;
    function IndexOf(const Title:WideString):integer;
    procedure Exchange(Index1, Index2:integer);
    procedure LoadFromIni(ini:TWideCustomIniFile);
    procedure SaveToIni(ini:TWideCustomIniFile);
    property Items[Index:integer]:TToolItem read GetItem write SetItem; default;
  end;

  TAppOptions = class
  private
    FWindowInfos:TTntStrings;
    FInvertDictionary:boolean;
    FSaveFormPos:boolean;
    FSaveOnReturn:boolean;
    FShowToolTips:boolean;
    FAutoMoveToNext:boolean;
    FShowDetails:boolean;
    FShowQuotes:boolean;
    FShowToolTipShortCuts:boolean;
    FSaveMinMaxState:boolean;
    FSplitterPosition:integer;
    FAppTitle:WideString;
    FOriginalFile:WideString;
    FLanguageFile:WideString;
    FTranslationFile:WideString;
    FHelpFile:WideString;
    FDictionaryFile:WideString;
    FFilename:WideString;
    FFilterIndex:integer;
    FGlobalPath:boolean;
    FPinCommentWindow:boolean;
    FMatchCase:boolean;
    FMatchLine:boolean;
    FSearchUp:boolean;
    FFindText:WideString;
    FReplaceText:WideString;
    FReplaceHistory:WideString;
    FFindHistory:WideString;
    FFindInIndex:integer;
    FTransEncoding:integer;
    FOrigEncoding:integer;
    FMonitorFiles:boolean;
    FTheme:WideString;
    FFuzzySearch:boolean;
    FDictIgnoreSpeedKeys:boolean;
    FShowFullNameInColumns:boolean;
    FUseTranslationEverywhere:boolean;
    FAutoFocusTranslation:boolean;
    FTools:TToolItems;
    FMisMatchItems:WideString;
    FMisMatchTrailingSpaces:boolean;
    FMisMatchLeadingSpaces:boolean;
    FMisMatchIdentical:boolean;
    FMisMatchEmptyTranslation:boolean;
    FMisMatchEndControl:boolean;
    FDictIgnoreNonEmpty:boolean;
    FDictEditFilter:Integer;
    FColorEvenRow:TColor;
    FColorUntranslated:TColor;
    FColorOddRow:TColor;
    FColorFontUntranslated:TColor;
    FColorFontOddRow:TColor;
    FColorFontEvenRow:TColor;
    FDefaultOrigEncoding:integer;
    FDefaultTransEncoding:integer;
    FFooter:TTntStrings;
    FHeader:TTntStrings;
    FFontSize:integer;
    FFontName:WideString;
    FSectionEnd: WideString;
    FSectionStart: WideString;
    FSeparatorChars: WideString;
    
    FPreviewText: WideString;
    procedure ReadWindowInfos(ini:TWideCustomIniFile);
    procedure WriteWindowInfos(ini:TWideCustomIniFile);
    function GetWindowInfo(AForm:TForm):TAppWindowInfo;
    procedure SetWindowInfo(AForm:TForm; const Value:TAppWindowInfo);
    procedure SetTools(const Value:TToolItems);
    procedure SetFooter(const Value:TTntStrings);
    procedure SetHeader(const Value:TTntStrings);
    function GetOption(const Section, Name:WideString):WideString;
    procedure SetOption(const Section, Name, Value:WideString);
    procedure SetSectionEnd(const Value: WideString);
    procedure SetSectionStart(const Value: WideString);
    procedure SetSeparatorChars(const Value: WideString);
  public
    constructor Create(const AFilename:WideString);
    destructor Destroy; override;
    procedure ClearWindowInfos;
    procedure SaveToFile(AFilename:WideString);
    procedure LoadFromFile(AFilename:WideString);
    property Filename:WideString read FFilename;
    property WindowInfos[AForm:TForm]:TAppWindowInfo read GetWindowInfo write SetWindowInfo;
  public
    property Option[const Section, Name:WideString]:WideString read GetOption write SetOption;
    property ShowQuotes:boolean read FShowQuotes write FShowQuotes;
    property InvertDictionary:boolean read FInvertDictionary write FInvertDictionary;
    property SaveFormPos:boolean read FSaveFormPos write FSaveFormPos default true;
    property SaveMinMaxState:boolean read FSaveMinMaxState write FSaveMinMaxState default true;
    property ShowDetails:boolean read FShowDetails write FShowDetails;
    property SaveOnReturn:boolean read FSaveOnReturn write FSaveOnReturn;
    property AutoMoveToNext:boolean read FAutoMoveToNext write FAutoMoveToNext;
    property ShowToolTips:boolean read FShowToolTips write FShowToolTips;
    property ShowToolTipShortCuts:boolean read FShowToolTipShortCuts write FShowToolTipShortCuts;
    property DictIgnoreSpeedKeys:boolean read FDictIgnoreSpeedKeys write FDictIgnoreSpeedKeys;
    property LanguageFile:WideString read FLanguageFile write FLanguageFile;
    property GlobalPath:boolean read FGlobalPath write FGlobalPath;
    property UseTranslationEverywhere:boolean read FUseTranslationEverywhere write FUseTranslationEverywhere;
    property AutoFocusTranslation:boolean read FAutoFocusTranslation write FAutoFocusTranslation;
    property HelpFile:WideString read FHelpFile write FHelpFile;
    property DictionaryFile:WideString read FDictionaryFile write FDictionaryFile;

    property TranslationFile:WideString read FTranslationFile write FTranslationFile;
    property DefaultTransEncoding:integer read FDefaultTransEncoding write FDefaultTransEncoding;
    property DefaultOrigEncoding:integer read FDefaultOrigEncoding write FDefaultOrigEncoding;
    property TransEncoding:integer read FTransEncoding write FTransEncoding;
    property OriginalFile:WideString read FOriginalFile write FOriginalFile;
    property OrigEncoding:integer read FOrigEncoding write FOrigEncoding;
    property SplitterPosition:integer read FSplitterPosition write FSplitterPosition default 160;
    property FilterIndex:integer read FFilterIndex write FFilterIndex default 1;
    property AppTitle:WideString read FAppTitle write FAppTitle;
    property FontName:WideString read FFontName write FFontName;
    property FontSize:integer read FFontSize write FFontSize;
    property PreviewText:WideString read FPreviewText write FPreviewText; 
    property MonitorFiles:boolean read FMonitorFiles write FMonitorFiles default true;
    property Theme:WideString read FTheme write FTheme;
    property Header:TTntStrings read FHeader write SetHeader;
    property Footer:TTntStrings read FFooter write SetFooter;

    // find replace
    property FindText:WideString read FFindText write FFindText;
    property ReplaceText:WideString read FReplaceText write FReplaceText;
    property FindHistory:WideString read FFindHistory write FFindHistory;
    property ReplaceHistory:WideString read FReplaceHistory write FReplaceHistory;
    property MatchLine:boolean read FMatchLine write FMatchLine;
    property MatchCase:boolean read FMatchCase write FMatchCase;
    property SearchUp:boolean read FSearchUp write FSearchUp;
    property FuzzySearch:boolean read FFuzzySearch write FFuzzySearch;
    property FindInIndex:integer read FFindInIndex write FFindInIndex;

    property MisMatchItems:WideString read FMisMatchItems write FMisMatchItems;
    property MisMatchLeadingSpaces:boolean read FMisMatchLeadingSpaces write FMisMatchLeadingSpaces;
    property MisMatchTrailingSpaces:boolean read FMisMatchTrailingSpaces write FMisMatchTrailingSpaces;
    property MisMatchEndControl:boolean read FMisMatchEndControl write FMisMatchEndControl;
    property MisMatchIdentical:boolean read FMisMatchIdentical write FMisMatchIdentical;
    property MisMatchEmptyTranslation:boolean read FMisMatchEmptyTranslation write FMisMatchEmptyTranslation;

    property PinCommentWindow:boolean read FPinCommentWindow write FPinCommentWindow default true;
    property ShowFullNameInColumns:boolean read FShowFullNameInColumns write FShowFullNameInColumns default false;
    property Tools:TToolItems read FTools write SetTools;

    property DictIgnoreNonEmpty:boolean read FDictIgnoreNonEmpty write FDictIgnoreNonEmpty;
    property DictEditFilter:Integer read FDictEditFilter write FDictEditFilter;

    property ColorUntranslated:TColor read FColorUntranslated write FColorUntranslated;
    property ColorFontUntranslated:TColor read FColorFontUntranslated write FColorFontUntranslated;

    property ColorEvenRow:TColor read FColorEvenRow write FColorEvenRow;
    property ColorFontEvenRow:TColor read FColorFontEvenRow write FColorFontEvenRow;
    property ColorOddRow:TColor read FColorOddRow write FColorOddRow;
    property ColorFontOddRow:TColor read FColorFontOddRow write FColorFontOddRow;

    property SeparatorChars:WideString read FSeparatorChars write SetSeparatorChars;
    property SectionStart:WideString read FSectionStart write SetSectionStart;
    property SectionEnd:WideString read FSectionEnd write SetSectionEnd;
  end;

implementation
uses
  StrUtils, AppConsts, AppUtils, CommonUtils, TntSysUtils;

function StrToFontStyles(const S:WideString):TFontStyles;
begin
  Result := [];
  if Pos('B', S) > 0 then
    Include(Result, fsBold);
  if Pos('I', S) > 0 then
    Include(Result, fsItalic);
  if Pos('U', S) > 0 then
    Include(Result, fsUnderline);
  if Pos('S', S) > 0 then
    Include(Result, fsStrikeout);
end;

function FontStylesToStr(Styles:TFontStyles):WideString;
const
  cStyles:array[TFontStyle] of PWideChar = ('B', 'I', 'U', 'S');
var
  i:TFontStyle;
begin
  Result := '';
  for i := Low(cStyles) to High(cStyles) do
    if i in Styles then
      Result := Result + cStyles[i];
end;

{ TToolItem }

procedure TToolItem.Assign(Source:TPersistent);
begin
  if Source is TToolItem then
    AsString := TToolItem(Source).AsString
  else
    inherited;
end;

function TToolItem.GetAsString:WideString;
var
  S:TTntStringlist;
begin
  S := TTntStringlist.Create;
  try
    S.Add(Title);
    S.Add(Command);
    S.Add(Arguments);
    S.Add(InitialDirectory);
    S.Add(BoolToStr(CaptureOutput, true));
    S.Add(BoolToStr(PromptForArguments, true));
    S.Add(BoolToStr(WaitForCompletion, true));
    S.Add(BoolToStr(UseShellExecute, true));
    S.Add(IntToStr(ShortCut));
    Result := S.CommaText;
  finally
    S.Free;
  end;
end;

procedure TToolItem.SetAsString(const Value:WideString);
var
  S:TTntStringlist;
begin
  S := TTntStringlist.Create;
  try
    S.CommaText := Value;
    if S.Count > 0 then
      Title := S[0];
    if S.Count > 1 then
      Command := S[1];
    if S.Count > 2 then
      Arguments := S[2];
    if S.Count > 3 then
      InitialDirectory := S[3];
    if S.Count > 4 then
      CaptureOutput := WideSameText(S[4], 'true');
    if S.Count > 5 then
      PromptForArguments := WideSameText(S[5], 'true');
    if S.Count > 6 then
      WaitForCompletion := WideSameText(S[6], 'true');
    if S.Count > 7 then
      UseShellExecute := WideSameText(S[7], 'true');
    if S.Count > 8 then
      ShortCut := StrToIntDef(S[8], ShortCut);
  finally
    S.Free;
  end;
end;

{ TToolItems }

function TToolItems.Add:TToolItem;
begin
  Result := TToolItem(inherited Add);
end;

procedure TToolItems.Assign(Source:TPersistent);
var
  i:integer;
begin
  if Source is TToolItems then
  begin
    Clear;
    for i := 0 to TToolItems(Source).Count - 1 do
      Add.Assign(TToolItems(Source)[i]);
  end
  else
    inherited;
end;

constructor TToolItems.Create;
begin
  inherited Create(TToolItem);
end;

procedure TToolItems.Exchange(Index1, Index2:integer);
var
  F:TToolItem;
begin
  F := Add;
  F.Assign(Items[Index1]);
  Items[Index1] := Items[Index2];
  Items[Index2] := F;
  Delete(Count - 1);
end;

function TToolItems.GetItem(Index:integer):TToolItem;
begin
  Result := TToolItem(inherited Items[Index]);
end;

function TToolItems.IndexOf(const Title:WideString):integer;
begin
  for Result := 0 to Count - 1 do
    if WideSameText(Items[Result].Title, Title) then
      Exit;
  Result := -1;
end;

procedure TToolItems.LoadFromIni(ini:TWideCustomIniFile);
var
  i:integer;
  S:TTntStringlist;
begin
  Clear;
  S := TTntStringlist.Create;
  try
    ini.ReadSectionValues('External Tools', S);
    for i := 0 to S.Count - 1 do
      Add.AsString := ValueFromIndex(S, i);
  finally
    S.Free;
  end;
end;

procedure TToolItems.SaveToIni(ini:TWideCustomIniFile);
var
  i:integer;
begin
  ini.EraseSection('External Tools');
  for i := 0 to Count - 1 do
    ini.WriteString('External Tools', IntToStr(i), Items[i].AsString);
end;

procedure TToolItems.SetItem(Index:integer; const Value:TToolItem);
begin
  inherited Items[Index] := Value;
end;

{ TAppOptions }

procedure TAppOptions.ClearWindowInfos;
var
  i:integer;
begin
  for i := 0 to FWindowInfos.Count - 1 do
    Dispose(PAppWindowInfo(FWindowInfos.Objects[i]));
  FWindowInfos.Clear;
end;

constructor TAppOptions.Create(const AFilename:WideString);
resourcestring
  sDefault = 'Default';
begin
  inherited Create;
  FTools := TToolItems.Create;
  // set defaults
  FWindowInfos := TTntStringlist.Create;
  TTntStringlist(FWindowInfos).Sorted := true;
  FHeader := TTntStringlist.Create;
  FFooter := TTntStringlist.Create;

  SplitterPosition := 160;
  SaveFormPos := true;
  SaveMinMaxState := true;
  AppTitle := SAppTitle;
  HelpFile := WideExtractFilePath(Application.ExeName) + 'help\translator.html';
  FilterIndex := 1;
  PinCommentWindow := true;
  MonitorFiles := true;
  Theme := sDefault;
  FontName := 'MS Shell Dlg 2';
  FontSize := 9;
  LoadFromFile(AFilename);
end;

destructor TAppOptions.Destroy;
begin
  ClearWindowInfos;
  FWindowInfos.Free;
  FTools.Free;
  FHeader.Free;
  FFooter.Free;
  inherited;
end;

procedure TAppOptions.ReadWindowInfos(ini:TWideCustomIniFile);
var
  i:integer;
  S:TTntStringlist;

  procedure DecodeInfo(const Name, Value:WideString);
  var
    P:PAppWindowInfo;
  begin
    // format of Value: Left;Top;Right;Bottom;WindowState
    if (FWindowInfos.IndexOf(Name) < 0) then
    begin
      New(P);
      with P^.BoundsRect do
      begin
        Left := StrToIntDef(strtok(Value, ';'), 0);
        Top := StrToIntDef(strtok('', ';'), 0);
        Right := StrToIntDef(strtok('', ';'), 0);
        Bottom := StrToIntDef(strtok('', ';'), 0);
        P^.WindowState := TWindowState(StrToIntDef(strtok('', ';'), 0));
      end;
      FWindowInfos.AddObject(Name, TObject(P));
    end;
  end;
begin
  ClearWindowInfos;
  S := TTntStringlist.Create;
  try
    ini.ReadSectionValues('Windows', S);
    for i := 0 to S.Count - 1 do
      DecodeInfo(S.Names[i], ValueFromIndex(S, i));
  finally
    S.Free;
  end;
end;

procedure TAppOptions.LoadFromFile(AFilename:WideString);
var
  ini:TWideMemIniFile;
begin
  if AFilename = '' then
    AFilename := GetAppStoragePath + 'translator.ini';
  ini := TWideMemIniFile.Create(AFilename);
  try
    FFilename := AFilename;
    FontName := ini.ReadString('Font', 'FontName', FontName);
    FontSize := ini.ReadInteger('Font', 'FontSize', FontSize);
    PreviewText := ini.ReadString('Font', 'PreviewText', PreviewText);

    ShowQuotes := ini.ReadBool('General', 'ShowQuotes', ShowQuotes);
    InvertDictionary := ini.ReadBool('General', 'InvertDictionary', InvertDictionary);
    SaveFormPos := ini.ReadBool('General', 'SaveFormPos', SaveFormPos);
    SaveMinMaxState := ini.ReadBool('General', 'SaveMinMaxState', SaveMinMaxState);
    ShowDetails := ini.ReadBool('General', 'ShowDetails', ShowDetails);
    SaveOnReturn := ini.ReadBool('General', 'SaveOnReturn', SaveOnReturn);
    AutoMoveToNext := ini.ReadBool('General', 'AutoMoveToNext', AutoMoveToNext);
    ShowToolTips := ini.ReadBool('General', 'ShowToolTips', ShowToolTips);
    ShowToolTipShortCuts := ini.ReadBool('General', 'ShowToolTipShortCuts', ShowToolTipShortCuts);
    DictIgnoreSpeedKeys := ini.ReadBool('General', 'DictIgnoreSpeedKeys', DictIgnoreSpeedKeys);
    SplitterPosition := ini.ReadInteger('General', 'SplitterPosition', SplitterPosition);
    AppTitle := ini.ReadString('General', 'AppTitle', AppTitle);
    GlobalPath := ini.ReadBool('General', 'GlobalPath', GlobalPath);
    UseTranslationEverywhere := ini.ReadBool('General', 'UseTranslationEverywhere', UseTranslationEverywhere);
    AutoFocusTranslation := ini.ReadBool('General', 'AutoFocusTranslation', AutoFocusTranslation);
    Theme := ini.ReadString('General', 'Theme', Theme);
    DictIgnoreNonEmpty := ini.ReadBool('General', 'DictIgnoreNonEmpty', false);
    DictEditFilter := ini.ReadInteger('General', 'DictEditFilter', 0);
    ShowFullNameInColumns := ini.ReadBool('General', 'ShowFullNameInColumns', ShowFullNameInColumns);

    FilterIndex := ini.ReadInteger('Files', 'FilterIndex', FilterIndex);
    LanguageFile := ini.ReadString('Files', 'LanguageFile', LanguageFile);
    HelpFile := ini.ReadString('Files', 'HelpFile', HelpFile);
    DictionaryFile := ini.ReadString('Files', 'DictionaryFile', DictionaryFile);
    TranslationFile := ini.ReadString('Files', 'TranslationFile', TranslationFile);
    OriginalFile := ini.ReadString('Files', 'OriginalFile', OriginalFile);
    TransEncoding := ini.ReadInteger('Files', 'TransEncoding', TransEncoding);
    OrigEncoding := ini.ReadInteger('Files', 'OrigEncoding', OrigEncoding);
    DefaultTransEncoding := ini.ReadInteger('Files', 'DefaultTransEncoding', TransEncoding);
    DefaultOrigEncoding := ini.ReadInteger('Files', 'DefaultOrigEncoding', OrigEncoding);
    MonitorFiles := ini.ReadBool('Files', 'MonitorFiles', MonitorFiles);

    Header.Text := Tnt_WideStringReplace(ini.ReadString('UserData', 'Header', ''), #2, #13#10, [rfReplaceAll]);
    Footer.Text := Tnt_WideStringReplace(ini.ReadString('UserData', 'Footer', ''), #2, #13#10, [rfReplaceAll]);

    PinCommentWindow := ini.ReadBool('Comments', 'PinCommentWindow', PinCommentWindow);

    // find/replace dialog
    FindText := ini.ReadString('FindReplace', 'FindText', FindText);
    ReplaceText := ini.ReadString('FindReplace', 'ReplaceText', ReplaceText);
    FindHistory := ini.ReadString('FindReplace', 'FindHistory', FindHistory);
    ReplaceHistory := ini.ReadString('FindReplace', 'ReplaceHistory', ReplaceHistory);
    MatchLine := ini.ReadBool('FindReplace', 'MatchLine', MatchLine);
    MatchCase := ini.ReadBool('FindReplace', 'MatchCase', MatchCase);
    SearchUp := ini.ReadBool('FindReplace', 'SearchUp', SearchUp);
    FuzzySearch := ini.ReadBool('FindReplace', 'FuzzySearch', FuzzySearch);
    FindInIndex := ini.ReadInteger('FindReplace', 'FindInIndex', FindInIndex);
    if (FindInIndex < 0) or (FindInIndex > 2) then
      FindInIndex := 0;

    MisMatchItems := ini.ReadString('MisMatch', 'Items', '&,!,...,?,:,!');
    MisMatchLeadingSpaces := ini.ReadBool('MisMatch', 'MisMatchLeadingSpaces', true);
    MisMatchTrailingSpaces := ini.ReadBool('MisMatch', 'MisMatchTrailingSpaces', true);
    MisMatchEndControl := ini.ReadBool('MisMatch', 'MisMatchEndControl', true);
    MisMatchIdentical := ini.ReadBool('MisMatch', 'MisMatchIdentical', true);
    MisMatchEmptyTranslation := ini.ReadBool('MisMatch', 'MisMatchEmptyTranslation', true);

    ColorUntranslated := ini.ReadInteger('Colors', 'ColorUntranslated', $EFEFEF);
    ColorFontUntranslated := ini.ReadInteger('Colors', 'ColorFontUntranslated', $000000);
    ColorEvenRow := ini.ReadInteger('Colors', 'ColorEvenRow', $FFFFFF);
    ColorFontEvenRow := ini.ReadInteger('Colors', 'ColorFontEvenRow', $000000);
    ColorOddRow := ini.ReadInteger('Colors', 'ColorOddRow', $FFFFFF);
    ColorFontOddRow := ini.ReadInteger('Colors', 'ColorFontOddRow', $000000);

    SeparatorChars  := ini.ReadString('Parsing','SeparatorChars','=');
    SectionStart  := ini.ReadString('Parsing','SectionStart','[');
    SectionEnd  := ini.ReadString('Parsing','SectionEnd',']');


    ReadWindowInfos(ini);
    FTools.LoadFromIni(ini);
  finally
    ini.Free;
  end;
end;

procedure TAppOptions.WriteWindowInfos(ini:TWideCustomIniFile);
var
  i:integer;

  function EncodeInfo(Info:TAppWindowInfo):WideString;
  begin
    // format of value: Left;Top;Right;Bottom;WindowState;
    with Info.BoundsRect do
      Result :=
        WideFormat('%d;%d;%d;%d;%d;', [Left, Top, Right, Bottom, Ord(Info.WindowState)]);
  end;
begin
  ini.EraseSection('Windows');
  for i := 0 to FWindowInfos.Count - 1 do
    ini.WriteString('Windows', FWindowInfos[i],
      EncodeInfo(PAppWindowInfo(FWindowInfos.Objects[i])^));
end;

procedure TAppOptions.SaveToFile(AFilename:WideString);
var
  ini:TWideMemIniFile;
begin
  if AFilename = '' then
    AFilename := GetAppStoragePath + 'translator.ini';
  ini := TWideMemIniFile.Create(AFilename);
  try
    FFilename := AFilename;
    ini.WriteString('Font', 'FontName', FontName);
    ini.WriteInteger('Font', 'FontSize', FontSize);
    ini.WriteString('Font', 'PreviewText', PreviewText);

    ini.WriteBool('General', 'ShowQuotes', ShowQuotes);
    ini.WriteBool('General', 'InvertDictionary', InvertDictionary);
    ini.WriteBool('General', 'SaveFormPos', SaveFormPos);
    ini.WriteBool('General', 'SaveMinMaxState', SaveMinMaxState);
    ini.WriteBool('General', 'ShowDetails', ShowDetails);
    ini.WriteBool('General', 'SaveOnReturn', SaveOnReturn);
    ini.WriteBool('General', 'AutoMoveToNext', AutoMoveToNext);
    ini.WriteBool('General', 'ShowToolTips', ShowToolTips);
    ini.WriteBool('General', 'ShowToolTipShortCuts', ShowToolTipShortCuts);
    ini.WriteBool('General', 'DictIgnoreSpeedKeys', DictIgnoreSpeedKeys);
    ini.WriteInteger('General', 'SplitterPosition', SplitterPosition);
    ini.WriteString('General', 'AppTitle', AppTitle);
    ini.WriteBool('General', 'GlobalPath', GlobalPath);
    ini.WriteBool('General', 'UseTranslationEverywhere', UseTranslationEverywhere);
    ini.WriteBool('General', 'AutoFocusTranslation', AutoFocusTranslation);
    ini.WriteString('General', 'Theme', Theme);
    ini.WriteBool('General', 'DictIgnoreNonEmpty', DictIgnoreNonEmpty);
    ini.WriteInteger('General', 'DictEditFilter', DictEditFilter);
    ini.WriteBool('General', 'ShowFullNameInColumns', ShowFullNameInColumns);

    ini.WriteInteger('Files', 'FilterIndex', FilterIndex);
    ini.WriteString('Files', 'LanguageFile', LanguageFile);
    ini.WriteString('Files', 'HelpFile', HelpFile);
    ini.WriteString('Files', 'DictionaryFile', DictionaryFile);
    ini.WriteString('Files', 'TranslationFile', TranslationFile);
    ini.WriteString('Files', 'OriginalFile', OriginalFile);
    ini.WriteInteger('Files', 'OrigEncoding', OrigEncoding);
    ini.WriteInteger('Files', 'TransEncoding', TransEncoding);
    ini.WriteInteger('Files', 'DefaultTransEncoding', DefaultTransEncoding);
    ini.WriteInteger('Files', 'DefaultOrigEncoding', DefaultOrigEncoding);
    ini.WriteBool('Files', 'MonitorFiles', MonitorFiles);

    ini.WriteString('UserData', 'Header', Tnt_WideStringReplace(Header.Text, #13#10, #2, [rfReplaceAll]));
    ini.WriteString('UserData', 'Footer', Tnt_WideStringReplace(Footer.Text, #13#10, #2, [rfReplaceAll]));

    ini.WriteBool('Comments', 'PinCommentWindow', PinCommentWindow);
    // find replace dialog
    ini.WriteString('FindReplace', 'FindText', FindText);
    ini.WriteString('FindReplace', 'ReplaceText', ReplaceText);

    ini.WriteString('FindReplace', 'FindHistory', trim(FindHistory));
    ini.WriteString('FindReplace', 'ReplaceHistory', trim(ReplaceHistory));
    ini.WriteBool('FindReplace', 'MatchLine', MatchLine);
    ini.WriteBool('FindReplace', 'MatchCase', MatchCase);
    ini.WriteBool('FindReplace', 'SearchUp', SearchUp);
    ini.WriteBool('FindReplace', 'FuzzySearch', FuzzySearch);
    ini.WriteInteger('FindReplace', 'FindInIndex', FindInIndex);

    ini.WriteString('MisMatch', 'Items', MisMatchItems);
    ini.WriteBool('MisMatch', 'MisMatchLeadingSpaces', MisMatchLeadingSpaces);
    ini.WriteBool('MisMatch', 'MisMatchTrailingSpaces', MisMatchTrailingSpaces);
    ini.WriteBool('MisMatch', 'MisMatchEndControl', MisMatchEndControl);
    ini.WriteBool('MisMatch', 'MisMatchIdentical', MisMatchIdentical);
    ini.WriteBool('MisMatch', 'MisMatchEmptyTranslation', MisMatchEmptyTranslation);

    ini.WriteInteger('Colors', 'ColorUntranslated', ColorUntranslated);
    ini.WriteInteger('Colors', 'ColorFontUntranslated', ColorFontUntranslated);
    ini.WriteInteger('Colors', 'ColorEvenRow', ColorEvenRow);
    ini.WriteInteger('Colors', 'ColorFontEvenRow', ColorFontEvenRow);
    ini.WriteInteger('Colors', 'ColorOddRow', ColorOddRow);
    ini.WriteInteger('Colors', 'ColorFontOddRow', ColorFontOddRow);


    ini.WriteString('Parsing','SeparatorChars',SeparatorChars);
    ini.WriteString('Parsing','SectionStart',SectionStart);
    ini.WriteString('Parsing','SectionEnd',SectionEnd);

    WriteWindowInfos(ini);
    FTools.SaveToIni(ini);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

function TAppOptions.GetWindowInfo(AForm:TForm):TAppWindowInfo;
var
  i:integer;
  AName:WideString;
begin
  Result.BoundsRect := AForm.BoundsRect;
  Result.WindowState := AForm.WindowState;
  if not SaveFormPos then
    Exit;
  AName := AForm.Name;
  if AName = '' then
    AName := Copy(AForm.ClassName, 2, MaxInt);
  i := FWindowInfos.IndexOf(AName);
  if (i >= 0) then
  begin
    Result.BoundsRect := PAppWindowInfo(FWindowInfos.Objects[i])^.BoundsRect;
    if IsRectEmpty(Result.BoundsRect) then
      Result.BoundsRect := AForm.BoundsRect;
    if SaveMinMaxState then
      Result.WindowState := PAppWindowInfo(FWindowInfos.Objects[i])^.WindowState;
  end;
end;

procedure TAppOptions.SetWindowInfo(AForm:TForm; const Value:TAppWindowInfo);
var
  i:integer;
  P:PAppWindowInfo;
  AName:WideString;
begin
  if not SaveFormPos then
    Exit;
  AName := AForm.Name;
  if AName = '' then
    AName := Copy(AForm.ClassName, 2, MaxInt);
  i := FWindowInfos.IndexOf(AName);
  if (i >= 0) then
  begin
    P := PAppWindowInfo(FWindowInfos.Objects[i]);
    if Value.WindowState = wsNormal then
      P^.BoundsRect := Value.BoundsRect;
    if SaveMinMaxState then
      P^.WindowState := Value.WindowState
    else
      P^.WindowState := wsNormal;
  end
  else
  begin
    New(P);
    P^.BoundsRect := Value.BoundsRect;
    if SaveMinMaxState then
      P^.WindowState := Value.WindowState
    else
      P^.WindowState := wsNormal;
    FWindowInfos.AddObject(AForm.Name, TObject(P));
  end;
end;

procedure TAppOptions.SetTools(const Value:TToolItems);
begin
  FTools.Assign(Value);
end;

procedure TAppOptions.SetFooter(const Value:TTntStrings);
begin
  FFooter.Assign(Value);
end;

procedure TAppOptions.SetHeader(const Value:TTntStrings);
begin
  FHeader.Assign(Value);
end;

function TAppOptions.GetOption(const Section, Name:WideString):WideString;
begin
  with TWideMemIniFile.Create(Filename) do
  try
    Result := ReadString(Section, Name, '');
  finally
    Free;
  end;
end;

procedure TAppOptions.SetOption(const Section, Name, Value:WideString);
begin
  with TWideMemIniFile.Create(Filename) do
  try
    WriteString(Section, Name, Value);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TAppOptions.SetSectionEnd(const Value: WideString);
begin
  FSectionEnd := Value;
  if FSectionEnd = '' then
    FSectionEnd := ']';
end;

procedure TAppOptions.SetSectionStart(const Value: WideString);
begin
  FSectionStart := Value;
  if FSectionStart = '' then
    FSectionStart := '[';
end;

procedure TAppOptions.SetSeparatorChars(const Value: WideString);
begin
  FSeparatorChars := Value;
  if FSeparatorChars = '' then
    FSeparatorChars := '=';
end;

end.
