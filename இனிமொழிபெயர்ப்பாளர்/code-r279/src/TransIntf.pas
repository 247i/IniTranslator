{@abstract(Translation interfaces. Used by plugins) }
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

// $Id: TransIntf.pas 249 2007-08-14 16:29:55Z peter3 $

unit TransIntf;

{$I TRANSLATOR.INC}

interface

type
  TTranslateSortType = integer;

const
  // IFileParser.Capabilities
  CAP_IMPORT = 1; // we can import
  CAP_EXPORT = 2; // we can export
  CAP_CONFIGURE = 4; // we have a configuration dialog
  CAP_ITEM_DELETE = 8; // we support deleting items
  CAP_ITEM_INSERT = 16; // we support adding items
  CAP_ITEM_EDIT = 32; // we support modifying the items

  // ITranslationItem.Sort (TTranslateSortType)
  stNone = 0;
  stSection = 1;
  stOriginal = 2;
  stInvertOriginal = 3;
  stTranslation = 4;
  stInvertTranslation = 5;
  stIndex = 6;
  stInvertIndex = 7;

  // IToolItem.Status
  TOOL_ENABLED = 1;
  TOOL_CHECKED = 2;
  TOOL_VISIBLE = 4;

  // INotify
  NOTIFY_ITEM_TRANS_CHANGE = 1; // WParam = PWideChar(original), LParam = PWideChar(new)
  NOTIFY_ITEM_ORIG_CHANGE = 2; // WParam = PWideChar(original), LParam = PWideChar(new)
  NOTIFY_ITEM_FILE_OPEN = 3; // WParam = 0 if original, 1 if translation,  LParam = PWideChar(Filename)
  NOTIFY_ITEM_FILE_SAVE = 4; // WParam = 0 if original, 1 if translation , LParam = PWideChar(Filename)
  NOTIFY_ITEM_DICT_OPEN = 5; // WParam = PWideChar(Filename)
  NOTIFY_ITEM_DICT_SAVE = 6; // WParam = PWideChar(Filename)
  NOTIFY_ITEM_DICT_NEW = 7; // no params
  NOTIFY_ITEM_IMPORT = 8; // no params
  NOTIFY_ITEM_EXPORT = 9; // no params
  NOTIFY_ITEM_SPELLCHECK = 10; // no params
  NOTIFY_ITEM_NEW_ITEM = 11; // WParam = Integer(Item) to be added (ITranslationItem)
  NOTIFY_ITEM_EDIT_ITEM = 12; // WParam = Integer(Item) to be edited (ITranslationItem)
  NOTIFY_ITEM_DEL_ITEM = 13; // WParam = Index of item to delete

type
  ITranslationItems = interface;
  IDictionaryItem = interface;
  IDictionaryItems = interface;
  IApplicationServices = interface;

  ITranslationItem = interface(IInterface)
    ['{5B400D54-5B0E-48B4-BEE3-9DBDA02AE3D6}']
    function GetIndex:integer;
    function GetName:WideString;
    function GetOrigComments:WideString;
    function GetOriginal:WideString;
    function GetSection:WideString;
    function GetTransComments:WideString;
    function GetTranslation:WideString;
    function GetTranslated:WordBool;
    function GetOwner:ITranslationItems;
    procedure SetTranslated(const Value:WordBool);
    procedure SetIndex(const Value:integer);
    procedure SetName(const Value:WideString);
    procedure SetOrigComments(const Value:WideString);
    procedure SetOriginal(const Value:WideString);
    procedure SetSection(const Value:WideString);
    procedure SetTransComments(const Value:WideString);
    procedure SetTranslation(const Value:WideString);
    procedure SetOwner(const Value:ITranslationItems);

    function TransQuote:WideChar;
    function OrigQuote:WideChar;

    property Index:integer read GetIndex write SetIndex;
    property Translated:WordBool read GetTranslated write SetTranslated;
    property TransComments:WideString read GetTransComments write SetTransComments;
    property OrigComments:WideString read GetOrigComments write SetOrigComments;
    property Original:WideString read GetOriginal write SetOriginal;
    property Translation:WideString read GetTranslation write SetTranslation;
    property Section:WideString read GetSection write SetSection;
    property Name:WideString read GetName write SetName;
    property Owner:ITranslationItems read GetOwner write SetOwner;
    // Works just as SetOriginal and SetTranslation in ITranslationItem, but
    // also sets OrigQuote/TransQuote to #0
    procedure SetClearOriginal(const Value:WideString);
    procedure SetClearTranslation(const Value:WideString);

    property ClearOriginal:WideString read GetOriginal write SetClearOriginal;
    property ClearTranslation:WideString read GetTranslation write SetClearTranslation;

    procedure SetModified(Value:WordBool);
    function GetModified:WordBool;
    procedure SetPrivateStorage(const Value:WideString);
    function GetPrivateStorage:WideString;
    // Some imported formats carry baggage not available in a standard translation item.
    // This property is provided so these formats can store whatever they
    // like along with each item.
    property PrivateStorage:WideString read GetPrivateStorage write SetPrivateStorage;
    property Modified:WordBool read GetModified write SetModified;
    function GetPreData:WideString;
    procedure SetPreData(const Value:WideString);
    function GetPostData:WideString;
    procedure SetPostData(const Value:WideString);
    property PreData:WideString read GetPreData write SetPreData;
    property PostData:WideString read GetPostData write SetPostData;
  end;

  ITranslationItems = interface(IInterface)
    ['{6ACD4934-9B26-4232-B11E-95FB18B60FCA}']
    function GetTranslatedCount:integer;
    procedure SetTranslatedCount(const Value:integer);
    function GetSort:TTranslateSortType;
    procedure SetSort(const Value:TTranslateSortType);
    procedure SetModified(Value:WordBool);
    function GetModified:WordBool;
    function GetItem(Index:integer):ITranslationItem;
    function GetCount:integer;

    function Add:ITranslationItem; overload;
    function Add(const Item:ITranslationItem):integer; overload;
    function CreateItem:ITranslationItem; // create an item that isn't added to the list
    procedure Delete(Index:integer);
    procedure Clear;
    function IndexOf(const Section, Name:WideString; CaseSense:WordBool = false):integer; overload;
    function IndexOf(const AItem:ITranslationItem):integer; overload;

    property Count:integer read GetCount;
    property Items[Index:integer]:ITranslationItem read GetItem; default;
    property TranslatedCount:integer read GetTranslatedCount write SetTranslatedCount;
    property Sort:TTranslateSortType read GetSort write SetSort;
    property Modified:WordBool read GetModified write SetModified;
  end;

  IFileParser = interface(IInterface)
    ['{3E556846-9B4D-4722-B48F-48D020715509}']
    function ExportItems(const Items, Orphans:ITranslationItems):HResult; safecall;
    function ImportItems(const Items, Orphans:ITranslationItems):HResult; safecall;
    function DisplayName(Capability:integer):WideString; safecall;
    // return combination of the CAP_ constants
    function Capabilities:integer; safecall;
    function Configure(Capability:integer):HResult; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
  end;

  // NB! not used!
  IFileParsers = interface(IInterface)
    ['{492B53C5-4FE1-4B3C-9A0B-4E9B3541E5C5}']
    function Count:Integer; safecall;
    // return S_OK if the index is valid
    function FileParser(Index:Integer; out FileParser:IFileParsers):HResult; safecall;
  end;

  // Plugins that support localizing should implement this interface.
  // When the user wants to create a new translation template,
  // IniTranslator searches the plugins for implementors of this interface
  // and repeatedly calls GetString to get all the untranslated strings
  ILocalizable = interface(IInterface)
    ['{E10D0143-B334-4CCE-898A-F25384D79C6E}']
    // Fill out the out params and return true for each translatable string in your plugin.
    // Return false when you have no more strings to translate.
    // The out params are not used when the method returns false
    // NB! To get the translated value of a string, call the
    // IApplicationServices.Translate method
    //
    // Params:
    // Section - should be unique to your plugin/company/application unless you are sure your strings are "common"
    // Name    - must be unique within a Section, cannot contain the equal sign "=" or start with semi-colon ";"
    // Value   - can be anything
    //
    // Multiple calls do not have to use the same Section
    function GetString(out Section:WideString; out Name:WideString; out Value:WideString):WordBool; safecall;
  end;

  // An item that can reside on the "Plugins" menu
  // When clicked, the Execute function is called
  IToolItem = interface(IInterface)
    ['{E14F5620-0EC9-43B5-816C-1A265C3FF237}']
    function DisplayName:WideString; safecall; // what to display on the menu
    function About:WideString; safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall; // TOOL_VISIBLE, TOOL_ENABLED, TOOL_CHECKED
    function Icon:LongWord; safecall; // HICON: return <= 0 for no icon

    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HResult; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
  end;

  // A list of IToolItem
  IToolItems = interface(IInterface)
    ['{05D4D3AB-366D-48A1-8913-F4EAEEE4DE2F}']
    function Count:Integer; safecall;
    // return S_OK if the index is valid
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HResult; safecall;
  end;

  INotify = interface(IInterface)
    ['{01A00A6A-2AC6-478C-872D-E75E9F5D6D42}']
    // Msg is one of the NOTIFY_ message constants, WParam and LParam are dependent on context
    // If you set AllowChange to false, IniTranslator will abort the change *without notifying the user*
    procedure Changing(Msg:Integer; WParam, LParam:Integer; out AllowChange:WordBool); safecall;
    procedure Changed(Msg:Integer; WParam, LParam:Integer); safecall;
  end;

  // implemented by IniTranslator
  IApplicationServices = interface(IInterface)
    ['{61FD76C9-714C-4DDF-BEB2-19A4631B444C}']
    function GetItems:ITranslationItems;
    function GetOrphans:ITranslationItems;
    function GetAppHandle:Cardinal;
    function GetMainFormHandle:Cardinal;
    function GetDictionaryItems:IDictionaryItems;
    function GetHeader:WideString;
    procedure SetHeader(const Value:WideString);
    function GetFooter:WideString;
    procedure SetFooter(const Value:WideString);
    function GetSelectedItem:ITranslationItem;
    procedure SetSelectedItem(const Value:ITranslationItem);

    function GetAppOption(const Section, Name, Default:WideString):WideString; safecall;
    procedure SetAppOption(const Section, Name, Value:WideString); safecall;
    function BeginUpdate:Integer; safecall;
    function EndUpdate:Integer; safecall;
    procedure RegisterNotify(const ANotify:INotify); safecall;
    procedure UnRegisterNotify(const ANotify:INotify); safecall;
    function Translate(const Section, Name, Value:WideString):WideString; safecall;

    property Items:ITranslationItems read GetItems;
    property Orphans:ITranslationItems read GetOrphans;
    property SelectedItem:ITranslationItem read GetSelectedItem write SetSelectedItem;
    property Dictionary:IDictionaryItems read GetDictionaryItems;
    property AppHandle:Cardinal read GetAppHandle;
    property MainFormHandle:Cardinal read GetMainFormHandle;
    property Header:WideString read GetHeader write SetHeader;
    property Footer:WideString read GetFooter write SetFooter;

  end;

  // return S_OK if all is fine
  TExportFileParserFunc = function(out Parser:IFileParser):HResult; stdcall;
  TExportFileParsersFunc = function(out Parsers:IFileParsers):HResult; stdcall;
  TExportToolItemsFunc = function(out ToolItems:IToolItems):HResult; stdcall;

  IDictionaryItem = interface(IInterface)
    ['{C3AC69B2-1062-4929-A127-DA878CFDFB9F}']
    procedure SetOriginal(const Value:WideString);
    function GetOriginal:WideString;
    function Add(const Translation:WideString):Integer;
    function IndexOf(const Translation:WideString):integer;
    procedure Delete(Index:integer);
    procedure Clear;
    function GetTranslation(Index:Integer):WideString;
    procedure SetTranslation(Index:Integer; const Value:WideString);
    function TranslationCount:integer;
    property Original:WideString read GetOriginal write SetOriginal;
    property Translation[Index:integer]:WideString read GetTranslation write SetTranslation; default;
  end;

  IDictionaryItems = interface(IInterface)
    ['{252A86F1-D50A-4433-A556-030C145A7E33}']
    function GetModified:WordBool;
    procedure SetModified(Value:WordBool);
    function GetItem(Index:integer):IDictionaryItem;
    function GetCount:integer;
    function GetIgnorePunctuation:WordBool;
    procedure SetIgnorePunctuation(Value:WordBool);
    procedure Invert;
    function Add(const AOriginal:WideString):IDictionaryItem;
    procedure Delete(Index:integer);
    function IndexOf(const S:WideString):integer;
    procedure Clear;
    procedure Sort;
    property Items[Index:integer]:IDictionaryItem read GetItem; default;
    property Count:integer read GetCount;
    property Modified:WordBool read GetModified write SetModified;
    property IgnorePunctuation:WordBool read GetIgnorePunctuation write SetIgnorePunctuation;
  end;

const
  cRegisterTransFileParserFuncName = 'RegisterTransFileParser001';
  cRegisterTransFileParsersFuncName = 'RegisterTransFileParsers001';
  cRegisterTransToolItemsFuncName = 'RegisterTransToolItems001';

implementation

end.
