object frmMain: TfrmMain
  Left = 379
  Top = 181
  Width = 573
  Height = 453
  Action = acAbout
  ActiveControl = reTranslation
  Caption = 'Ini Translator'
  Color = clBtnFace
  Constraints.MinHeight = 375
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClick = acAboutExecute
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbBottom: TTBXStatusBar
    Left = 0
    Top = 402
    Width = 565
    Height = 19
    Panels = <
      item
        Size = 100
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Size = 110
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Size = 110
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Size = 110
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Size = 110
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Size = 150
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Alignment = taCenter
        Control = pbTranslated
        Framed = False
        Size = 100
        StretchPriority = 1
        Tag = 0
      end
      item
        Alignment = taCenter
        Framed = False
        Size = 75
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Alignment = taRightJustify
        Framed = False
        MaxSize = 32
        Size = 32
        Tag = 0
      end>
    UseSystemFont = False
    object pbTranslated: TTntProgressBar
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      Position = 50
      Smooth = True
      Step = 1
      TabOrder = 0
    end
  end
  object TopDock: TSpTBXDock
    Left = 0
    Top = 0
    Width = 565
    Height = 49
    FixAlign = True
    object tbMenu: TSpTBXToolbar
      Left = 0
      Top = 0
      Caption = 'Menu'
      ChevronHint = 'More Buttons|Click to see more buttons'
      CloseButton = False
      DblClickUndock = True
      DefaultDock = TopDock
      FullSize = True
      HideWhenInactive = False
      Images = il16
      MenuBar = True
      Options = [tboLongHintInMenuOnly, tboShowHint]
      ProcessShortCuts = True
      TabOrder = 0
      object mnuFile: TSpTBXSubmenuItem
        Caption = '&File'
        OnSelect = mnuFileSelect
        object OpenOriginal1: TSpTBXItem
          Caption = 'Open Original...'
          Hint = 'Open original and translation file'
          Action = acOpenOrig
        end
        object TBXItem13: TSpTBXItem
          Caption = 'Save Original'
          Hint = 'Save current original file'
          Action = acSaveOriginal
        end
        object TBXItem1: TSpTBXItem
          Caption = 'Save Original As...'
          Hint = 'Save current original file with a new filename'
          Action = acSaveOrigAs
        end
        object TBSeparatorItem3: TSpTBXSeparatorItem
        end
        object ClearTranslation1: TSpTBXItem
          Caption = 'New Translation'
          Hint = 'Create new translation'
          Action = acNewTrans
        end
        object OpenTranslation1: TSpTBXItem
          Caption = 'Open Translation...'
          Hint = 'Open existing translation file'
          Action = acOpenTrans
        end
        object SaveTranslation1: TSpTBXItem
          Caption = 'Save Translation'
          Hint = 'Save current translation file'
          Action = acSaveTrans
        end
        object SaveTranslationAs1: TSpTBXItem
          Caption = 'Save Translation As...'
          Hint = 'Save current translation with a new filename'
          Action = acSaveTransAs
        end
        object N1: TSpTBXSeparatorItem
        end
        object TBXItem4: TSpTBXItem
          Caption = 'Import...'
          Hint = 'Import from an external file or files'
          Action = acImport
        end
        object TBXItem3: TSpTBXItem
          Caption = 'Export...'
          Hint = 'Export to an external file or files'
          Action = acExport
        end
        object TBXSeparatorItem4: TSpTBXSeparatorItem
        end
        object SelectLanguage1: TSpTBXItem
          Caption = 'Preferences...'
          Hint = 'Display the settings dialog'
          Action = acPreferences
        end
        object TBSeparatorItem16: TSpTBXSeparatorItem
        end
        object miRecentlyUsed: TSpTBXSubmenuItem
          Caption = 'Reopen'
          DropdownCombo = True
          object TBMRUListItem1: TTBXMRUListItem
            MRUList = MRUFiles
          end
          object TBSeparatorItem15: TSpTBXSeparatorItem
          end
          object TBItem31: TSpTBXItem
            Caption = 'Clear'
            Hint = 'Clear the MRU list'
            Action = acClearMRU
          end
          object TBItem32: TSpTBXItem
            Caption = 'Remove Invalid'
            Hint = 'Remove invalid entries from the MRU list'
            Action = acClearInvalidMRU
          end
        end
        object N11: TSpTBXSeparatorItem
        end
        object Exit1: TSpTBXItem
          Caption = 'Exit'
          Hint = 'Exit application'
          Action = acExit
        end
      end
      object Edit1: TSpTBXSubmenuItem
        Caption = '&Edit'
        ShortCut = 16474
        object TBItem14: TSpTBXItem
          Caption = 'Undo'
          Hint = 'Undo last action'
          Action = acUndo
        end
        object TBSeparatorItem8: TSpTBXSeparatorItem
        end
        object TBItem5: TSpTBXItem
          Caption = 'Cut'
          Hint = 'Cut selected text'
          Action = acCut
        end
        object TBItem7: TSpTBXItem
          Caption = 'Copy'
          Hint = 'Copy selected text'
          Action = acCopy
        end
        object acCopyFromOriginal1: TSpTBXItem
          Caption = 'Copy from Original'
          Hint = 'Copy the value of Original to Translation'
          Action = acCopyFromOriginal
        end
        object TBItem13: TSpTBXItem
          Caption = 'Copy from Name'
          Hint = 'Copy the value of Name to Translation'
          Action = acCopyFromName
        end
        object TBItem6: TSpTBXItem
          Caption = 'Paste'
          Hint = 'Paste from clipboard'
          Action = acPaste
        end
        object TBSeparatorItem6: TSpTBXSeparatorItem
        end
        object Find1: TSpTBXItem
          Caption = 'Find...'
          Hint = 'Search for text'
          Action = acFind
        end
        object FindNext1: TSpTBXItem
          Caption = 'Find Next'
          Hint = 'Continue searching'
          Action = acFindNext
        end
        object Replace1: TSpTBXItem
          Caption = 'Replace...'
          Hint = 'Replace text'
          Action = acReplace
        end
        object N8: TSpTBXSeparatorItem
        end
        object ToggleFocus1: TSpTBXItem
          Caption = 'Toggle Focus'
          Hint = 'Toggle focus between list and translation'
          Action = acToggleFocus
        end
      end
      object Navigation1: TSpTBXSubmenuItem
        Caption = '&Actions'
        object tbxSpellCheck: TSpTBXItem
          Caption = 'Spelling...'
          Hint = 'Spell check the translations'
          Action = acSpellCheck
        end
        object Previous1: TSpTBXItem
          Caption = 'Previous'
          Hint = 'Go to previous item in list'
          Action = acPrev
        end
        object Next1: TSpTBXItem
          Caption = 'Next'
          Hint = 'Go to next item in list'
          Action = acNext
        end
        object About2: TSpTBXSeparatorItem
        end
        object Previousuntranslated1: TSpTBXItem
          Caption = 'Prev untranslated'
          Hint = 'Go to previous untranslated item'
          Action = acPrevUntranslated
        end
        object Nextuntranslated1: TSpTBXItem
          Caption = 'Next untranslated'
          Hint = 'Go to next untranslated item'
          Action = acNextUntranslated
        end
        object SpTBXSeparatorItem1: TSpTBXSeparatorItem
        end
        object SpTBXItem2: TSpTBXItem
          Caption = 'Use this translation everywhere'
          Hint = 'Use this translation everywhere'
          Action = acReplaceEverywhere
        end
        object SpTBXItem1: TSpTBXItem
          Caption = 'Make all translations consistent'
          Action = acMakeConsistent
        end
        object N4: TSpTBXSeparatorItem
        end
        object Unsort1: TSpTBXItem
          Caption = 'Restore original sort'
          Hint = 'Restore original sort'
          Action = acRestoreSort
        end
        object TBSeparatorItem10: TSpTBXSeparatorItem
        end
        object TBSubmenuItem3: TSpTBXSubmenuItem
          Caption = 'Toggle Bookmark'
          object TBItem41: TSpTBXItem
            Caption = 'Bookmark 0'
            Hint = 'Toggle Bookmark 0 on/off'
            Action = acToggleBookmark0
            Images = ilBookmarks
          end
          object TBItem40: TSpTBXItem
            Caption = 'Bookmark 1'
            Hint = 'Toggle Bookmark 1 on/off'
            Action = acToggleBookmark1
            Images = ilBookmarks
          end
          object TBItem39: TSpTBXItem
            Caption = 'Bookmark 2'
            Hint = 'Toggle Bookmark 2 on/off'
            Action = acToggleBookmark2
            Images = ilBookmarks
          end
          object TBItem38: TSpTBXItem
            Caption = 'Bookmark 3'
            Hint = 'Toggle Bookmark 3 on/off'
            Action = acToggleBookmark3
            Images = ilBookmarks
          end
          object TBItem37: TSpTBXItem
            Caption = 'Bookmark 4'
            Hint = 'Toggle Bookmark 4 on/off'
            Action = acToggleBookmark4
            Images = ilBookmarks
          end
          object TBItem30: TSpTBXItem
            Caption = 'Bookmark 5'
            Hint = 'Toggle Bookmark 5 on/off'
            Action = acToggleBookmark5
            Images = ilBookmarks
          end
          object TBItem28: TSpTBXItem
            Caption = 'Bookmark 6'
            Hint = 'Toggle Bookmark 6 on/off'
            Action = acToggleBookmark6
            Images = ilBookmarks
          end
          object TBItem26: TSpTBXItem
            Caption = 'Bookmark 7'
            Hint = 'Toggle Bookmark 7 on/off'
            Action = acToggleBookmark7
            Images = ilBookmarks
          end
          object TBItem23: TSpTBXItem
            Caption = 'Bookmark 8'
            Hint = 'Toggle Bookmark 8 on/off'
            Action = acToggleBookmark8
            Images = ilBookmarks
          end
          object TBItem22: TSpTBXItem
            Caption = 'Bookmark 9'
            Hint = 'Toggle Bookmark 9 on/off'
            Action = acToggleBookmark9
            Images = ilBookmarks
          end
        end
        object TBSubmenuItem4: TSpTBXSubmenuItem
          Caption = 'Goto Bookmark'
          object TBItem51: TSpTBXItem
            Caption = 'Bookmark 0'
            Hint = 'Goto Bookmark 0'
            Action = acGotoBookmark0
            Images = ilBookmarks
          end
          object TBItem50: TSpTBXItem
            Caption = 'Bookmark 1'
            Hint = 'Goto Bookmark 1'
            Action = acGotoBookmark1
            Images = ilBookmarks
          end
          object TBItem49: TSpTBXItem
            Caption = 'Bookmark 2'
            Hint = 'Goto Bookmark 2'
            Action = acGotoBookmark2
            Images = ilBookmarks
          end
          object TBItem48: TSpTBXItem
            Caption = 'Bookmark 3'
            Hint = 'Goto Bookmark 3'
            Action = acGotoBookmark3
            Images = ilBookmarks
          end
          object TBItem47: TSpTBXItem
            Caption = 'Bookmark 4'
            Hint = 'Goto Bookmark 4'
            Action = acGotoBookmark4
            Images = ilBookmarks
          end
          object TBItem46: TSpTBXItem
            Caption = 'Bookmark 5'
            Hint = 'Goto Bookmark 5'
            Action = acGotoBookmark5
            Images = ilBookmarks
          end
          object TBItem45: TSpTBXItem
            Caption = 'Bookmark 6'
            Hint = 'Goto Bookmark 6'
            Action = acGotoBookmark6
            Images = ilBookmarks
          end
          object TBItem44: TSpTBXItem
            Caption = 'Bookmark 7'
            Hint = 'Goto Bookmark 7'
            Action = acGotoBookmark7
            Images = ilBookmarks
          end
          object TBItem43: TSpTBXItem
            Caption = 'Bookmark 8'
            Hint = 'Goto Bookmark 8'
            Action = acGotoBookmark8
            Images = ilBookmarks
          end
          object TBItem42: TSpTBXItem
            Caption = 'Bookmark 9'
            Hint = 'Goto Bookmark 9'
            Action = acGotoBookmark9
            Images = ilBookmarks
          end
        end
        object TBXSeparatorItem2: TSpTBXSeparatorItem
        end
        object TBXItem2: TSpTBXItem
          Caption = 'Configure Keyboard...'
          Hint = 'Display the keyboard configuration window'
          Action = acConfigureKeyboard
        end
      end
      object TBSubmenuItem2: TSpTBXSubmenuItem
        Caption = '&View'
        object TBItem36: TSpTBXItem
          Caption = 'Next unmatched shortcut'
          Hint = 
            'Find next translated item that is missing a shortcut key present' +
            ' in the original'
          Action = acFindUnmatchedShortCut
        end
        object TBItem55: TSpTBXItem
          Caption = 'Next suspicious translation'
          Hint = 
            'Move to next item that is suspected not being translated correct' +
            'ly'
          Action = acNextSuspicious
        end
        object TBXItem15: TSpTBXItem
          Caption = 'Configure suspicious translations...'
          Hint = 'Configure the behavior of Next Suspicious Translation'
          Action = acConfigSuspicious
        end
        object N9: TSpTBXSeparatorItem
        end
        object ShowQuotes1: TSpTBXItem
          Caption = 'Show Quotes'
          Hint = 'Show quotes in texts'
          Action = acShowQuotes
        end
        object ShowDetails1: TSpTBXItem
          Caption = 'Show Key Details'
          Hint = 'Display the details pane'
          Action = acViewDetails
        end
        object N10: TSpTBXSeparatorItem
        end
        object TBItem16: TSpTBXItem
          Caption = 'View Comments'
          Hint = 'Toggle the comments window'
          Action = acViewComments
        end
        object TBItem56: TSpTBXItem
          Caption = 'View Orphaned Items'
          Hint = 
            'Display orphans (items in translation that are not in the origin' +
            'al)'
          Action = acViewOrphans
        end
        object TBXSeparatorItem3: TSpTBXSeparatorItem
        end
        object TBXVisibilityToggleItem1: TSpTBXItem
          Caption = 'Tools'
          Control = tbTools
        end
        object TBXItem8: TSpTBXItem
          Caption = 'Full Screen'
          Hint = 'Toggle full screen mode'
          Action = acFullScreen
        end
      end
      object Dictionary1: TSpTBXSubmenuItem
        Caption = '&Dictionary'
        object CreateDictionary1: TSpTBXItem
          Caption = 'New Dictionary...'
          Hint = 'Create new dictionary'
          Action = acDictCreate
        end
        object LoadDictionary1: TSpTBXItem
          Caption = 'Load Dictionary...'
          Hint = 'Load existing dictionary'
          Action = acDictLoad
        end
        object SaveDictionary1: TSpTBXItem
          Caption = 'Save Dictionary...'
          Hint = 'Save current dictionary to file'
          Action = acDictSave
        end
        object N5: TSpTBXSeparatorItem
        end
        object Translatewithdictionary1: TSpTBXItem
          Caption = 'Translate using Dictionary'
          Hint = 'Translate using the dictionary'
          Action = acDictTranslate
        end
        object TBXItem6: TSpTBXItem
          Caption = 'Add to Dictionary'
          Hint = 'Add current item to the dictionary'
          Action = acDictAdd
        end
        object N6: TSpTBXSeparatorItem
        end
        object TBXItem16: TSpTBXItem
          Caption = 'Edit Dictionary...'
          Hint = 'Edit the currently loaded dictionary'
          Action = acDictEdit
        end
        object TBXSeparatorItem8: TSpTBXSeparatorItem
        end
        object acDictInvert1: TSpTBXItem
          Caption = 'Invert Dictionary'
          Hint = 'Invert the dictionary'
          Action = acDictInvert
        end
      end
      object mnuPlugins: TSpTBXSubmenuItem
        Caption = '&Plugins'
        Visible = False
        OnPopup = mnuPluginsPopup
      end
      object mnuTools: TSpTBXSubmenuItem
        Caption = 'T&ools'
        OnPopup = mnuToolsPopup
        object TBXItem10: TSpTBXItem
          Caption = 'Customize...'
          Hint = 'Display the tools window'
          Action = acToolsCustomize
        end
      end
      object Help1: TSpTBXSubmenuItem
        Caption = '&Help'
        object Help2: TSpTBXItem
          Caption = 'Help'
          Hint = 'Show help file'
          Action = acHelp
        end
        object N7: TSpTBXSeparatorItem
        end
        object About1: TSpTBXItem
          Caption = 'About...'
          Hint = 'Show about box'
          Action = acAbout
        end
      end
    end
    object tbTools: TSpTBXToolbar
      Left = 0
      Top = 23
      Caption = 'Tools'
      ChevronHint = 'More Buttons|Click to see more buttons'
      DblClickUndock = True
      DefaultDock = TopDock
      DockPos = 0
      DockRow = 1
      FullSize = True
      HideWhenInactive = False
      Images = il16
      Options = [tboLongHintInMenuOnly, tboShowHint]
      TabOrder = 1
      object TBItem1: TSpTBXItem
        Caption = 'Open Original...'
        Hint = 'Open original and translation file'
        Action = acOpenOrig
      end
      object TBSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBItem2: TSpTBXItem
        Caption = 'New Translation'
        Hint = 'Create new translation'
        Action = acNewTrans
      end
      object TBItem3: TSpTBXItem
        Caption = 'Open Translation...'
        Hint = 'Open existing translation file'
        Action = acOpenTrans
      end
      object TBItem4: TSpTBXItem
        Caption = 'Save Translation'
        Hint = 'Save current translation file'
        Action = acSaveTrans
      end
      object TBSeparatorItem1: TSpTBXSeparatorItem
      end
      object SpTBXItem3: TSpTBXItem
        Caption = 'Undo'
        Hint = 'Undo last action'
        Action = acUndo
      end
      object SpTBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBItem12: TSpTBXItem
        Caption = 'Cut'
        Hint = 'Cut selected text'
        Action = acCut
      end
      object TBItem10: TSpTBXItem
        Caption = 'Copy'
        Hint = 'Copy selected text'
        Action = acCopy
      end
      object TBItem8: TSpTBXItem
        Caption = 'Paste'
        Hint = 'Paste from clipboard'
        Action = acPaste
      end
      object TBSeparatorItem7: TSpTBXSeparatorItem
      end
      object TBItem9: TSpTBXItem
        Caption = 'Find...'
        Hint = 'Search for text'
        Action = acFind
      end
      object TBItem11: TSpTBXItem
        Caption = 'Replace...'
        Hint = 'Replace text'
        Action = acReplace
      end
      object TBSeparatorItem12: TSpTBXSeparatorItem
      end
      object TBItem18: TSpTBXItem
        Caption = 'Prev untranslated'
        Hint = 'Go to previous untranslated item'
        Action = acPrevUntranslated
      end
      object TBItem19: TSpTBXItem
        Caption = 'Next untranslated'
        Hint = 'Go to next untranslated item'
        Action = acNextUntranslated
      end
      object TBSeparatorItem4: TSpTBXSeparatorItem
      end
      object TBItem27: TSpTBXItem
        Caption = 'Translate using Dictionary'
        Hint = 'Translate using the dictionary'
        Action = acDictTranslate
      end
      object TBSeparatorItem5: TSpTBXSeparatorItem
      end
      object TBItem29: TSpTBXItem
        Caption = 'Help'
        Hint = 'Show help file'
        Action = acHelp
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object mnuThemes: TSpTBXSubmenuItem
        Caption = 'Themes'
        DisplayMode = nbdmImageAndText
        MinWidth = 90
        DropdownCombo = True
        object mnuThemesGroup: TSpTBXThemeGroupItem
        end
      end
    end
  end
  object TBDock1: TSpTBXDock
    Left = 0
    Top = 49
    Width = 9
    Height = 344
    Position = dpLeft
  end
  object TBDock2: TSpTBXDock
    Left = 556
    Top = 49
    Width = 9
    Height = 344
    Position = dpRight
  end
  object TBDock3: TSpTBXDock
    Left = 0
    Top = 393
    Width = 565
    Height = 9
    Position = dpBottom
  end
  object pnlBack: TTntPanel
    Left = 9
    Top = 49
    Width = 547
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 5
    object splitHorz: TSplitter
      Left = 4
      Top = 144
      Width = 539
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      AutoSnap = False
      MinSize = 100
      ResizeStyle = rsUpdate
    end
    object pnlBottom: TTntPanel
      Left = 4
      Top = 149
      Width = 539
      Height = 191
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      OnResize = pnlBottomResize
      object pnlTrans: TTntPanel
        Left = 1
        Top = 97
        Width = 537
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentBackground = False
        TabOrder = 0
        object lblTrans: TTntLabel
          Left = 8
          Top = 5
          Width = 57
          Height = 13
          Caption = '&Translation:'
          FocusControl = reTranslation
        end
      end
      object reTranslation: TTntRichEdit
        Left = 1
        Top = 120
        Width = 537
        Height = 70
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        HideSelection = False
        PlainText = True
        PopupMenu = popEdit
        ScrollBars = ssBoth
        TabOrder = 3
        WantReturns = False
        OnEnter = reTranslationEnter
        OnExit = reTranslationExit
        OnKeyDown = reTranslationKeyDown
      end
      object pnlOrig: TTntPanel
        Left = 1
        Top = 1
        Width = 537
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentBackground = False
        TabOrder = 2
        object lblOrig: TTntLabel
          Left = 8
          Top = 4
          Width = 40
          Height = 13
          Caption = 'Ori&ginal:'
          FocusControl = reOriginal
          Layout = tlCenter
        end
      end
      object reOriginal: TTntRichEdit
        Left = 1
        Top = 24
        Width = 537
        Height = 73
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        HideSelection = False
        PlainText = True
        PopupMenu = popEdit
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        WantReturns = False
      end
    end
    object lvTranslateStrings: TTntListView
      Left = 4
      Top = 45
      Width = 539
      Height = 99
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvRaised
      Columns = <
        item
          AutoSize = True
          Caption = 'Original'
        end
        item
          AutoSize = True
          Caption = 'Translation'
          Tag = 1
        end
        item
          Alignment = taRightJustify
          Caption = '#'
          Tag = 2
          Width = 46
        end>
      GridLines = True
      HideSelection = False
      OwnerData = True
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      PopupMenu = popList
      ShowHint = True
      SmallImages = il16
      TabOrder = 1
      ViewStyle = vsReport
      OnAdvancedCustomDrawItem = lvTranslateStringsAdvancedCustomDrawItem
      OnChange = lvTranslateStringsChange
      OnColumnClick = lvTranslateStringsColumnClick
      OnData = lvTranslateStringsData
      OnDataFind = lvTranslateStringsDataFind
      OnDblClick = lvTranslateStringsDblClick
      OnEnter = lvTranslateStringsEnter
      OnInfoTip = lvTranslateStringsInfoTip
    end
    object pnlKeyBack: TTntPanel
      Left = 4
      Top = 4
      Width = 539
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 2
      ParentBackground = False
      TabOrder = 2
      object pnlKeyDetails: TTntPanel
        Left = 2
        Top = 2
        Width = 535
        Height = 37
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 4
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -19
        Font.Name = 'MS Shell Dlg 2'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object lblViewDetails: TTntLabel
          Left = 4
          Top = 4
          Width = 527
          Height = 29
          Align = alClient
          AutoSize = False
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          WordWrap = True
        end
      end
    end
  end
  object alMain: TTntActionList
    Images = il16
    OnUpdate = alMainUpdate
    Left = 118
    Top = 158
    object acOpenOrig: TTntAction
      Category = 'File'
      Caption = 'Open Original...'
      Hint = 'Open original and translation file'
      ImageIndex = 68
      ShortCut = 24655
      OnExecute = acOpenOrigExecute
    end
    object acSaveOriginal: TTntAction
      Category = 'File'
      Caption = 'Save Original'
      Hint = 'Save current original file'
      ImageIndex = 18
      ShortCut = 24659
      OnExecute = acSaveOriginalExecute
    end
    object acSaveOrigAs: TTntAction
      Category = 'File'
      Caption = 'Save Original As...'
      Hint = 'Save current original file with a new filename'
      OnExecute = acSaveOrigAsExecute
    end
    object acCopyFromName: TTntAction
      Category = 'Edit'
      Caption = 'Copy from Name'
      Hint = 'Copy the value of Name to Translation'
      ShortCut = 24653
      OnExecute = acCopyFromNameExecute
    end
    object acCopyFromOriginal: TTntAction
      Category = 'Edit'
      Caption = 'Copy from Original'
      Hint = 'Copy the value of Original to Translation'
      ShortCut = 24643
      OnExecute = acCopyFromOriginalExecute
    end
    object acCopyAllFromOrig: TTntAction
      Category = 'Edit'
      Caption = 'Copy All From Original'
      Hint = 'Copy all text from original file to translation'
      ShortCut = 57411
      OnExecute = acCopyAllFromOrigExecute
    end
    object acNewTrans: TTntAction
      Category = 'File'
      Caption = 'New Translation'
      Hint = 'Create new translation'
      ImageIndex = 16
      ShortCut = 16462
      OnExecute = acNewTransExecute
    end
    object acOpenTrans: TTntAction
      Category = 'File'
      Caption = 'Open Translation...'
      Hint = 'Open existing translation file'
      ImageIndex = 17
      ShortCut = 16463
      OnExecute = acOpenTransExecute
    end
    object acSaveTrans: TTntAction
      Category = 'File'
      Caption = 'Save Translation'
      Hint = 'Save current translation file'
      ImageIndex = 18
      ShortCut = 16467
      OnExecute = acSaveTransExecute
    end
    object acSaveTransAs: TTntAction
      Category = 'File'
      Caption = 'Save Translation As...'
      Hint = 'Save current translation with a new filename'
      OnExecute = acSaveTransAsExecute
    end
    object acExit: TTntAction
      Category = 'File'
      Caption = 'Exit'
      Hint = 'Exit application'
      ShortCut = 32883
      OnExecute = acExitExecute
    end
    object acPrev: TTntAction
      Category = 'View'
      Caption = 'Previous'
      Hint = 'Go to previous item in list'
      ShortCut = 16422
      OnExecute = acPrevExecute
    end
    object acNext: TTntAction
      Category = 'View'
      Caption = 'Next'
      Hint = 'Go to next item in list'
      ShortCut = 16424
      OnExecute = acNextExecute
    end
    object acAbout: TTntAction
      Category = 'Help'
      Caption = 'About...'
      Hint = 'Show about box'
      OnExecute = acAboutExecute
    end
    object acToggleFocus: TTntAction
      Category = 'View'
      Caption = 'Toggle Focus'
      Hint = 'Toggle focus between list and translation'
      ShortCut = 117
      OnExecute = acToggleFocusExecute
    end
    object acFind: TTntAction
      Category = 'Edit'
      Caption = 'Find...'
      Hint = 'Search for text'
      ImageIndex = 22
      ShortCut = 16454
      OnExecute = acFindExecute
    end
    object acFindNext: TTntAction
      Category = 'Edit'
      Caption = 'Find Next'
      Hint = 'Continue searching'
      ShortCut = 114
      OnExecute = acFindNextExecute
    end
    object acReplace: TTntAction
      Category = 'Edit'
      Caption = 'Replace...'
      Hint = 'Replace text'
      ImageIndex = 23
      ShortCut = 16456
      OnExecute = acReplaceExecute
    end
    object acNextUntranslated: TTntAction
      Category = 'Actions'
      Caption = 'Next untranslated'
      Hint = 'Go to next untranslated item'
      ImageIndex = 9
      ShortCut = 16469
      OnExecute = acNextUntranslatedExecute
    end
    object acPrevUntranslated: TTntAction
      Category = 'Actions'
      Caption = 'Prev untranslated'
      Hint = 'Go to previous untranslated item'
      ImageIndex = 8
      ShortCut = 24661
      OnExecute = acPrevUntranslatedExecute
    end
    object acFocusTranslation: TTntAction
      Category = 'View'
      Caption = 'Focus Translation'
      Hint = 'Set focus to the translation edit field'
      ShortCut = 32852
      OnExecute = acFocusTranslationExecute
    end
    object acFocusListView: TTntAction
      Category = 'View'
      Caption = 'Focus ListView'
      Hint = 'Set focus to the listview'
      ShortCut = 32844
      OnExecute = acFocusListViewExecute
    end
    object acFocusOriginal: TTntAction
      Category = 'View'
      Caption = 'Focus Original'
      Hint = 'Set focus to the original edit field'
      ShortCut = 32839
      OnExecute = acFocusOriginalExecute
    end
    object acShowQuotes: TTntAction
      Category = 'View'
      Caption = 'Show Quotes'
      Hint = 'Show quotes in texts'
      ShortCut = 16465
      OnExecute = acShowQuotesExecute
    end
    object acRestoreSort: TTntAction
      Category = 'Actions'
      Caption = 'Restore original sort'
      Hint = 'Restore original sort'
      ShortCut = 24658
      OnExecute = acRestoreSortExecute
    end
    object acDictCreate: TTntAction
      Category = 'Dictionary'
      Caption = 'New Dictionary...'
      Hint = 'Create new dictionary'
      ImageIndex = 65
      ShortCut = 49230
      OnExecute = acDictCreateExecute
    end
    object acDictSave: TTntAction
      Category = 'Dictionary'
      Caption = 'Save Dictionary...'
      Hint = 'Save current dictionary to file'
      ImageIndex = 67
      ShortCut = 49235
      OnExecute = acDictSaveExecute
    end
    object acDictLoad: TTntAction
      Category = 'Dictionary'
      Caption = 'Load Dictionary...'
      Hint = 'Load existing dictionary'
      ImageIndex = 66
      ShortCut = 49231
      OnExecute = acDictLoadExecute
    end
    object acDictTranslate: TTntAction
      Category = 'Dictionary'
      Caption = 'Translate using Dictionary'
      Hint = 'Translate using the dictionary'
      ImageIndex = 64
      ShortCut = 49236
      OnExecute = acDictTranslateExecute
    end
    object acDictEdit: TTntAction
      Category = 'Dictionary'
      Caption = 'Edit Dictionary...'
      Hint = 'Edit the currently loaded dictionary'
      ShortCut = 49221
      OnExecute = acDictEditExecute
    end
    object acDictInvert: TTntAction
      Category = 'Dictionary'
      Caption = 'Invert Dictionary'
      Hint = 'Invert the dictionary'
      ImageIndex = 32
      ShortCut = 49225
      OnExecute = acDictInvertExecute
    end
    object acDictAdd: TTntAction
      Category = 'Dictionary'
      Caption = 'Add to Dictionary'
      Hint = 'Add current item to the dictionary'
      ImageIndex = 31
      ShortCut = 49217
      OnExecute = acDictAddExecute
    end
    object acHelp: TTntAction
      Category = 'Help'
      Caption = 'Help'
      Hint = 'Show help file'
      ImageIndex = 47
      ShortCut = 112
      OnExecute = acHelpExecute
    end
    object acCreateTranslationFile: TTntAction
      Caption = 'Create Translation File...'
      Hint = 'Create a new translation template file for IniTranslator itself'
      ShortCut = 57489
      Visible = False
      OnExecute = acCreateTranslationFileExecute
    end
    object acViewDetails: TTntAction
      Category = 'View'
      Caption = 'Show Key Details'
      Checked = True
      Hint = 'Display the details pane'
      ShortCut = 16452
      OnExecute = acViewDetailsExecute
    end
    object acCut: TTntAction
      Category = 'Edit'
      Caption = 'Cut'
      Enabled = False
      Hint = 'Cut selected text'
      ImageIndex = 10
      ShortCut = 16472
      OnExecute = acCutExecute
    end
    object acCopy: TTntAction
      Category = 'Edit'
      Caption = 'Copy'
      Enabled = False
      Hint = 'Copy selected text'
      ImageIndex = 11
      ShortCut = 16451
      OnExecute = acCopyExecute
    end
    object acPaste: TTntAction
      Category = 'Edit'
      Caption = 'Paste'
      Enabled = False
      Hint = 'Paste from clipboard'
      ImageIndex = 12
      ShortCut = 16470
      OnExecute = acPasteExecute
      OnUpdate = acPasteUpdate
    end
    object acSelectAll: TTntEditSelectAll
      Category = 'Edit'
      Caption = 'Select All'
      Hint = 'Select all text'
      ShortCut = 16449
    end
    object acUndo: TTntAction
      Category = 'Edit'
      Caption = 'Undo'
      Hint = 'Undo last action'
      ImageIndex = 13
      ShortCut = 16474
      OnExecute = acUndoExecute
    end
    object acPreferences: TTntAction
      Category = 'File'
      Caption = 'Preferences...'
      Hint = 'Display the settings dialog'
      ImageIndex = 20
      ShortCut = 32781
      OnExecute = acPreferencesExecute
    end
    object acViewComments: TTntAction
      Category = 'View'
      Caption = 'View Comments'
      Hint = 'Toggle the comments window'
      ImageIndex = 44
      ShortCut = 16461
      OnExecute = acViewCommentsExecute
    end
    object acAsciiValues: TTntAction
      Category = 'View'
      Caption = 'ASCII Value(s)...'
      Hint = 'Show the ASCII values for the selected text'
      ShortCut = 16457
      OnExecute = acAsciiValuesExecute
    end
    object acClearMRU: TTntAction
      Category = 'MRU'
      Caption = 'Clear'
      Hint = 'Clear the MRU list'
      ImageIndex = 15
      OnExecute = acClearMRUExecute
    end
    object acClearInvalidMRU: TTntAction
      Category = 'MRU'
      Caption = 'Remove Invalid'
      Hint = 'Remove invalid entries from the MRU list'
      OnExecute = acClearInvalidMRUExecute
    end
    object acFindUnmatchedShortCut: TTntAction
      Category = 'Actions'
      Caption = 'Next unmatched shortcut'
      Hint = 
        'Find next translated item that is missing a shortcut key present' +
        ' in the original'
      ShortCut = 119
      OnExecute = acFindUnmatchedShortCutExecute
    end
    object acHome: TTntAction
      Category = 'View'
      Caption = 'Home'
      Hint = 'Move to the top of the list'
      ShortCut = 16420
      OnExecute = acHomeExecute
    end
    object acEnd: TTntAction
      Category = 'View'
      Caption = 'End'
      Hint = 'Move to the bottom of the list'
      ShortCut = 16419
      OnExecute = acEndExecute
    end
    object acPageUp: TTntAction
      Category = 'View'
      Caption = 'Page Up'
      Hint = 'Move one page up in the list'
      ShortCut = 16417
      OnExecute = acPageUpExecute
    end
    object acPageDown: TTntAction
      Category = 'View'
      Caption = 'Page Down'
      Hint = 'Move one page down in the list'
      ShortCut = 16418
      OnExecute = acPageDownExecute
    end
    object acNoRichEditTntAction: TTntAction
      Tag = -1
      Caption = 'NoRichEditTntAction'
      Enabled = False
      Hint = 
        'This action is just here to disable shortcuts in rich edits (no ' +
        'need to translate this text)'
      SecondaryShortCuts.Strings = (
        'Ctrl+L'
        'Ctrl+R'
        'Ctrl+B'
        'Ctrl+I'
        'Ctrl+U')
    end
    object acClearAllTranslations: TTntAction
      Category = 'View'
      Caption = 'Clear All Translations'
      Hint = 'Clear the translated text'
      ShortCut = 24622
      OnExecute = acClearAllTranslationsExecute
    end
    object acReplaceEverywhere: TTntAction
      Category = 'View'
      Caption = 'Use this translation everywhere'
      Hint = 'Use this translation everywhere'
      ImageIndex = 19
      ShortCut = 24648
      OnExecute = acReplaceEverywhereExecute
    end
    object acNextSuspicious: TTntAction
      Category = 'Actions'
      Caption = 'Next suspicious translation'
      Hint = 
        'Move to next item that is suspected not being translated correct' +
        'ly'
      ShortCut = 8311
      OnExecute = acNextSuspiciousExecute
    end
    object acConfigSuspicious: TTntAction
      Category = 'Actions'
      Caption = 'Configure suspicious translations...'
      Hint = 'Configure the behavior of Next Suspicious Translation'
      ShortCut = 32887
      OnExecute = acConfigSuspiciousExecute
    end
    object acViewOrphans: TTntAction
      Category = 'View'
      Caption = 'View Orphaned Items'
      Hint = 
        'Display orphans (items in translation that are not in the origin' +
        'al)'
      OnExecute = acViewOrphansExecute
    end
    object acConfigureKeyboard: TTntAction
      Category = 'Actions'
      Caption = 'Configure Keyboard...'
      Hint = 'Display the keyboard configuration window'
      ShortCut = 24651
      OnExecute = acConfigureKeyboardExecute
    end
    object acImport: TTntAction
      Category = 'File'
      Caption = 'Import...'
      Hint = 'Import from an external file or files'
      ImageIndex = 9
      OnExecute = acImportExecute
    end
    object acExport: TTntAction
      Category = 'File'
      Caption = 'Export...'
      Hint = 'Export to an external file or files'
      ImageIndex = 8
      OnExecute = acExportExecute
    end
    object acToggleTranslated: TTntAction
      Category = 'Actions'
      Caption = 'Translated'
      Hint = 'Toggle the Translated status of the item'
      ShortCut = 16468
      OnExecute = acToggleTranslatedExecute
    end
    object acTestExceptionHandler: TTntAction
      Tag = 1
      Caption = 'Test exception'
      Hint = 'Test the exception handler'
      ShortCut = 57467
      OnExecute = acTestExceptionHandlerExecute
    end
    object acFullScreen: TTntAction
      Category = 'View'
      Caption = 'Full Screen'
      Hint = 'Toggle full screen mode'
      ShortCut = 122
      OnExecute = acFullScreenExecute
    end
    object acSpellCheck: TTntAction
      Category = 'Actions'
      Caption = 'Spelling...'
      Hint = 'Spell check the translations'
      ShortCut = 118
    end
    object acToolsCustomize: TTntAction
      Category = 'Tools'
      Caption = 'External Tools...'
      Hint = 'Display the tools window'
      ImageIndex = 36
      OnExecute = acToolsCustomizeExecute
    end
    object acAddItem: TTntAction
      Category = 'Edit'
      Caption = 'Add Item...'
      Hint = 'Add new item to original and translation'
      ImageIndex = 31
      ShortCut = 16429
      OnExecute = acAddItemExecute
    end
    object acEditItem: TTntAction
      Category = 'Edit'
      Caption = 'Edit Item...'
      Hint = 'Edit all parts of the current item'
      ImageIndex = 35
      ShortCut = 8237
      OnExecute = acEditItemExecute
    end
    object acDeleteItem: TTntAction
      Category = 'Edit'
      Caption = 'Delete Item...'
      Hint = 'Delete the current item from both original and translation'
      ImageIndex = 15
      ShortCut = 16430
      OnExecute = acDeleteItemExecute
    end
    object acMakeConsistent: TTntAction
      Category = 'Actions'
      Caption = 'Make all translations consistent'
      ShortCut = 120
      OnExecute = acMakeConsistentExecute
    end
  end
  object SaveDictDlg: TTntSaveDialog
    DefaultExt = 'dct'
    Filter = 'Dictionary files|*.dct;*.cat|All files|*.*'
    InitialDir = '.'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Dictionary File'
    Left = 78
    Top = 192
  end
  object OpenDictDlg: TTntOpenDialog
    DefaultExt = 'dct'
    Filter = 'Dictionary files|*.dct;*.cat|All files|*.*'
    InitialDir = '.'
    Title = 'Open Dictionary File'
    Left = 38
    Top = 192
  end
  object il16: TImageList
    AllocBy = 24
    Left = 158
    Top = 192
    Bitmap = {
      494C010146004A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002001000001002000000000000020
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630000636300009CCE00009C
      CE0000848400009CCE0000848400009CCE0000848400009CCE00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF0000636300009C
      CE00009CCE00009CCE00009CCE0000848400009CCE0000848400009CCE000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF0000CEFF000063
      6300009CCE00009CCE00009CCE00009CCE00009CCE00009CCE0000848400009C
      CE00008484000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF00FFFFFF0000CE
      FF0000636300009CCE00009CCE00009CCE00009CCE00009CCE00009CCE000084
      8400009CCE000084840000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF000063630000636300006363000063630000636300006363000063
      6300006363000063630000636300000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF00FFFFFF0000CE
      FF00FFFFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF0000CEFF00FFFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000636300FFFFFF009CFFFF009CCE
      CE00006363000063630000636300006363000063630000636300006363000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009CCE0000636300006363000063
      6300009CCE0000848400009CCE00008484000000000084000000000000000000
      0000000000008400000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000848400009CCE000084840000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630000636300006363000063
      6300006363000063630000000000000000000000000084000000000000000000
      0000000000008400000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000063630000636300009C
      CE00009CCE0000848400009CCE0000848400009CCE0000848400009CCE000084
      840000000000000000000000000000000000000000000000000031636300639C
      9C00639C9C00313131003131310031313100313131003131310031313100B5B5
      B500B5B5B5003131310000636300000000008400840084008400840084008400
      8400840084008400840084848400840084008400840084008400840084008400
      840084008400FFFFFF00C6C6C600000000008400840084008400840084008400
      8400840084008400840084848400840084008400840084008400840084008400
      840084008400FFFFFF00C6C6C600000000008400840084008400840084008400
      8400840084008400840000848400840084008400840084008400840084008400
      8400840084000000000000000000000000000000000084008400840084008400
      8400840084008400840084008400FFFFFF008400840084008400840084008400
      84008400840084008400639C9C00000000000000000000000000C6C6C600C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6C6008484
      840000000000FFFFFF00C6C6C600000000000000000000000000C6C6C600C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6C6008484
      840000000000FFFFFF00C6C6C600000000000000000000000000C6C6C600C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6C6008484
      840000000000008484000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6
      C6008484840000000000639C9C00000000000000000084848400000000000000
      000000000000C6C6C60084848400C6C6C6000000000000000000000000000000
      000084008400FFFFFF00C6C6C600000000000000000084848400000000000000
      000000000000C6C6C60084848400C6C6C6000000000000000000000000000000
      000084008400FFFFFF00C6C6C600000000000000000084848400000000000000
      000000000000C6C6C60084848400C6C6C6000000000000000000000000000000
      000084008400009CCE0000848400000000000000000000000000848484000000
      00000000000000000000C6C6C60084848400C6C6C60000000000000000000000
      00000000000084008400639C9C00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400006363000063630000636300000000000000000084848400FFFF
      FF00FFFFFF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C6000000000084008400639C9C00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C6000000000084008400639C9C00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000840084009CCECE00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000840084009CCECE00000000000000000000000000FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400633100006331000063310000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000840084009CCECE00000000000000000000000000848484008484
      840000000000000000000000000000000000848484008484840000000000C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000FF000000FF000000FF008484
      840000000000000000000000FF0000000000848484008484840000000000C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000848484008484
      8400000000000000000000000000000000008484840084848400000000000000
      000000000000000000009C310000633100000000000000000000000000008484
      8400848484000000000000000000FFFFFF000000000084848400848484000000
      0000CEFFFF00316363009CCECE00000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00C6C6C60000FFFF00C6C6C600C6C6C600FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF00FFFFFF000000FF000000FF000000000000FFFF00C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C310000000000000000
      0000000000009C3100000000000063310000000000000000000031636300CEFF
      FF00639C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFF
      FF009CFFFF003163630031636300000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C600FFFFFF008484840000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C3100009C31
      00009C310000000000000000000000000000000000000000000031636300FFFF
      FF00639C9C00639C6300639C6300639C6300639C6300639C6300639C6300639C
      6300639C630031636300C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000FF000000FF00000000000000
      FF000000FF000000FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000316363003163
      6300639C9C00639C6300639C6300639C6300639C6300639C6300639C6300639C
      6300639C63003163630031636300000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      FF00848484000000FF000000FF00848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084008400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084008400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0084008400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0084008400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF008400840084008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF008400840084008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF008400840084008400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF008400840084008400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      FF0084848400FFFFFF000000FF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00840084008400840084008400FFFFFF00FFFF
      FF0084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      FF0084848400FFFFFF000000FF00840084008400840084008400FFFFFF00FFFF
      FF0084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF008400840084008400840084008400
      840084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF00FFFFFF008400840084008400840084008400
      840084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000FF000000FF000000FF00FFFFFF000000FF000000FF0084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084008400840084008400
      840084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000FF000000FF000000FF00FFFFFF000000FF000000FF00840084008400
      840084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000000000000000C6C6
      C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF008400840084008400840084008400
      840084008400FFFFFF00C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0084008400840084008400
      840084008400FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF000000FF00FFFFFF000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C600FFFFFF00848484000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000FFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C600FFFFFF00848484000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000FFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600848484000000000000000000000000000000FF000000FF000000
      00000000FF000000FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600848484000000000000000000000000000000FF000000FF000000
      00000000FF000000FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000FF00848484000000FF000000FF008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000FF00848484000000FF000000FF008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600840000008400000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000C6C6C600840000008400000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000C6C6C600840000008400000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000C6C6C600840000008400000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000000000000C6C6
      C60084000000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C60000000000000000000000000000000000C6C6
      C60084000000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C60000000000000000000000000000000000C6C6
      C60084000000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C60000000000000000000000000000000000C6C6
      C60084000000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000000000008400
      0000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00C6C6C600000000000000000000000000000000008400
      0000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00C6C6C600000000000000000000000000000000008400
      0000FF000000FF000000FF00000084848400FFFFFF0000FFFF00840000008400
      0000C6C6C600FFFFFF00C6C6C600000000000000000000000000000000008400
      0000FF000000FF000000FF00000084848400FFFFFF0000FFFF00840000008400
      0000C6C6C600FFFFFF00C6C6C600000000000000000000000000C6C6C600FF00
      000000840000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000C6C6C600FF00
      000000840000FF000000FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C600000000000000000000000000C6C6C600FF00
      000000840000FF000000FF00000084848400FFFFFF0084840000FF000000FF00
      000084000000C6C6C600C6C6C600000000000000000000000000C6C6C600FF00
      000000840000FF000000FF00000084848400FFFFFF0084840000FF000000FF00
      000084000000C6C6C600C6C6C600000000000000000000000000848484000084
      0000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00C6C6C600000000000000000000000000848484000084
      0000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00C6C6C600000000000000000000000000848484000084
      0000FF000000FF000000FF00000084848400FFFFFF0084840000848484000084
      00008400000084848400C6C6C600000000000000000000000000848484000084
      0000FF000000FF000000FF00000084848400FFFFFF0084840000848484000084
      00008400000084848400C6C6C60000000000000000000000000084848400C6C6
      C600FF000000FF000000848400008484840000FFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000084848400C6C6
      C600FF000000FF000000848400008484840000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000084848400C6C6
      C600FF000000FF0000008484000084848400FFFFFF0084840000FFFFFF008484
      840084000000C6C6C600C6C6C60000000000000000000000000084848400C6C6
      C600FF000000FF0000008484000084848400FFFFFF0084840000FFFFFF008484
      840084000000C6C6C600C6C6C600000000000000000000000000848484008484
      0000C6C6C600FF000000C6C6C60084848400FFFFFF00FFFFFF00FF000000FF00
      0000C6C6C60000000000000000000000000000000000000000000000FF008484
      0000C6C6C6000000FF00C6C6C60084848400FFFFFF00FFFFFF00FF000000FF00
      0000C6C6C6000000000000000000000000000000000000000000848484008484
      0000C6C6C600FF000000C6C6C60084848400FFFFFF0000FFFF00848400008484
      0000C6C6C60000000000000000000000000000000000000000000000FF008484
      0000C6C6C6000000FF00C6C6C60084848400FFFFFF0000FFFF00848400008484
      0000C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF00848484008484840000000000000000000000FF000000
      FF00FFFFFF000000FF00FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF008484840084848400000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF00848484008484840000000000000000000000FF000000
      FF00FFFFFF000000FF00FF00000084848400FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0084848400848484000000000000000000C6C6C6008484
      8400C6C6C600FFFFFF000084000084848400FFFFFF00FFFFFF00FFFFFF0000FF
      FF00C6C6C6008484840084848400C6C6C6000000000000000000C6C6C6000000
      FF000000FF000000FF00008400000000FF000000FF00FFFFFF00FFFFFF0000FF
      FF00C6C6C6008484840084848400C6C6C6000000000000000000C6C6C6008484
      8400C6C6C600FFFFFF000084000084848400FFFFFF00FFFFFF00FFFFFF0000FF
      FF00C6C6C6008484840084848400C6C6C6000000000000000000C6C6C6000000
      FF000000FF000000FF00008400000000FF000000FF00FFFFFF00FFFFFF0000FF
      FF00C6C6C6008484840084848400C6C6C6000000000000000000000000008484
      8400FFFFFF00C6C6C60084840000848484008484840084848400848484008484
      8400848484008484840000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C60084840000848484008484840084848400848484008484
      8400848484008484840000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF008484840084848400848484008484
      840084848400848484000000000000000000000000000000000000000000C6C6
      C60084848400FFFFFF00C6C6C600FFFFFF0000840000FF000000008400000084
      0000FF00000084000000C6C6C6000000000000000000000000000000FF000000
      FF00FFFFFF000000FF000000FF00FFFFFF0000840000FF000000008400000084
      0000FF00000084000000C6C6C60000000000000000000000000000000000C6C6
      C60084848400FFFFFF00C6C6C600FFFFFF0000840000FF000000008400000084
      0000FF00000084000000C6C6C6000000000000000000000000000000FF000000
      FF00FFFFFF000000FF000000FF00FFFFFF0000840000FF000000008400000084
      0000FF00000084000000C6C6C600000000000000000000000000000000000000
      0000C6C6C6008484840084848400C6C6C600FF0000008484000084840000FF00
      0000FF000000C6C6C6000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF008484000084840000FF00
      0000FF000000C6C6C60000000000000000000000000000000000000000000000
      0000C6C6C6008484840084848400C6C6C600FF0000008484000084840000FF00
      0000FF000000C6C6C6000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF008484000084840000FF00
      0000FF000000C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60084848400848484008484840084848400C6C6
      C600000000000000000000000000000000000000FF000000FF00000000000000
      FF000000FF000000FF00C6C6C60084848400848484008484840084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60084848400848484008484840084848400C6C6
      C600000000000000000000000000000000000000FF000000FF00000000000000
      FF000000FF000000FF00C6C6C60084848400848484008484840084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400840084008400
      8400840084008400840084008400000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000840084008400840000000000FFFFFF00C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084008400FFFFFF00000000008484840084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000000000000000000000000
      00008400840084008400840084000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008400
      840084008400FFFFFF0000000000C6C6C600FFFFFF008484840084848400C6C6
      C600FFFFFF00FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000008400
      8400840084008400840084008400C6C6C600000000000000000084848400C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000840084008400
      8400FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF008484
      8400C6C6C600FFFFFF0084008400000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000840084008400
      84008400840084008400C6C6C600840084008400840084008400000000000000
      000084848400FFFFFF008484840000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000084008400840084008400
      840084008400C6C6C60084008400840084008400840084008400840084008400
      840000000000000000008484840000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000840084000000FF008400
      8400C6C6C6000000FF0084008400840084008400840084008400840084008400
      84008400840084008400000000000000000000000000000000000000FF00FFFF
      FF00FFFFFF000000FF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000840084000000FF000000
      FF00840084000000FF0084008400840084008400840084008400840084008400
      84008400840084008400000000000000000000000000000000000000FF000000
      FF00FFFFFF000000FF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      FF0084848400FFFFFF000000FF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00C6C6C600000000000000000084008400C6C6C6000000
      FF000000FF000000FF00840084000000FF000000FF0084008400840084008400
      8400840084000000000000000000000000000000000000000000840084000000
      FF000000FF000000FF00000000000000FF000000FF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00C6C6C600000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF008400840084008400840084008400
      8400000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FF000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000FF000000FF000000FF00FF0000000000FF000000FF00FF000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000FF000000
      FF00FFFFFF000000FF000000FF00840084008400840084008400840084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00FFFFFF000000FF000000FF00000000008484840084848400FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0084008400000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      FF000000FF00FFFFFF000000FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000000FF000000FF00000000000000
      FF000000FF000000FF0000000000840084008400840000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00848484000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00C6C6C60084848400000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF0000FF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      FF00000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      840084848400000000000000000000000000000000000000FF000000FF000000
      00000000FF000000FF000000FF00848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400840084008400
      8400840084008400840084008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000840084008400840000000000FFFFFF00C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084008400FFFFFF00000000008484840084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400840084008400840084000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008400
      840084008400FFFFFF0000000000C6C6C600FFFFFF008484840084848400C6C6
      C600FFFFFF00FFFFFF0084008400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400840084008400840084008400C6C6C600000000000000000084848400C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000840084008400
      8400FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF008484
      8400C6C6C600FFFFFF0084008400000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      84008400840084008400C6C6C600840084008400840084008400000000000000
      000084848400FFFFFF008484840000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084008400840084008400
      840084008400C6C6C60084008400840084008400840084008400840084008400
      840000000000000000008484840000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      00000000000084848400848484000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084008400840084008400
      8400C6C6C6008400840084008400840084008400840084008400840084008400
      840084008400840084000000000000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      00000000000000000000848484000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000008400840084008400C6C6
      C600840084008400840084008400840084008400840084008400840084008400
      840084008400840084000000000000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084008400C6C6C6008400
      8400840084008400840084008400840084008400840084008400840084008400
      840084008400000000000000000000000000000000000000000084008400FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0084008400000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      84000000000000000000000000000000000000000000C6C6C600840084008400
      8400840084008400840084008400840084008400840084008400840084008400
      840000000000000000000000000000000000000000000000000084008400FFFF
      FF00FFFFFF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF0000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400840084008400840084008400840084008400840084008400840084000000
      000000000000000000000000000000000000000000000000000084008400FFFF
      FF00FFFFFF008484840000000000000000008484840084848400FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400000000000000
      000000000000000000000000000000000000000000000000000084008400FFFF
      FF00C6C6C6008484840000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084008400840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210042424200A5A5A5008442840021002100000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000C6C6C600000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000042424200A5A5A500C6C6C600DEDEDE00C6C6C60084428400210021000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000042424200A5A5
      A500C6C6C600DEDEDE00CECECE0094949400B5B5B500C6C6C600842184002100
      2100000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00848484000000000000000000CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000002100210094949400C6C6C600DEDE
      DE00CECECE0094949400846384000000000084638400B5B5B500C6C6C6008421
      8400210021000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF000000000000000000000000009CFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE00000000000000000000000000000000000000
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000084008400A5A5A500CECECE008484
      8400846384000000000021002100840084000000000084638400B5B5B500C6C6
      C600842184002100210000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000009CFF
      FF00FFFFFF009CFFFF00CECECE000000000000000000000000000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFF
      FF00FFFFFF000000000000000000000000008400840084848400846384000000
      000021002100840084008400840084008400840084000000000084638400B5B5
      B500C6C6C6008442840021002100000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF008484840000000000000000000000000000000000FFFF
      FF009CFFFF00FFFFFF00CECECE000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
      FF00FFFFFF000000000000000000000000008400840000000000210021008400
      8400840084008400840084008400840084008400840084008400000000008463
      8400B5B5B500C6C6C600844284000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000009CFF
      FF00FFFFFF009CFFFF00CECECE000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000008400840084638400840084008400
      84008400840084008400009C9C00008484008421840084008400840084000000
      000084638400B5B5B500424242000000000000000000C6C6C600FF000000C6C6
      C600FFFFFF00FFFFFF008484840000000000000000000000000000000000FFFF
      FF009CFFFF00FFFFFF00CECECE000000000000000000000000000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000084008400846384008400
      84008400840084008400844284009494940000FFFF0000DEDE00842184008400
      840021002100846384002121210000000000000000000000000084848400FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000009CFF
      FF00FFFFFF009CFFFF00CECECE00000000000000000000000000000000000000
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000840084008463
      8400840084008400840000848400218484008484840000FFFF0000DEDE008421
      84008400840021002100000000000000000000000000C6C6C600FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF009CFFFF00CECECE00CECECE00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      840084638400840084006321840000DEDE0000FFFF0000FFFF00009C9C008400
      8400840084008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF009CFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000840084008463840084008400844284008442840084428400842184008400
      8400840084002100210000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084638400840084008400840084008400840084002100
      2100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400846384008400840021002100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084002100210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084424200840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000000000000000000084000000FF000000DE0000008442
      42008442420084424200A5A5A50084212100BD00000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FF000000FF000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000840000000000000000000000000000000000
      00000000000084000000FF000000FF000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000840000008400000084000000840000000000
      000000000000C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C60084848400000000000000000000000000000000008400000084424200B5B5
      B500CECECE00FFFFFF00B5B5B500846363008400000084000000840000008421
      2100840000008400000084000000000000000000000000000000000000000000
      0000000000008400000084000000FF00000084000000C6C6C600840000008400
      000084000000FF000000FF000000840000000000000000000000000000000000
      0000000000008400000084000000FF00000084000000C6C6C600840000008400
      000084000000FF000000FF0000008400000084000000FF000000840000000000
      0000C6C6C600FFFFFF00FFFFFF00848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400FFFFFF00DEDEDE009494940042424200842121008400000084424200A5A5
      A50084424200DE0000008400000084000000009C9C00CEFFFF0063CECE0063CE
      CE0063CECE0063CECE00840000008400000084848400C6C6C600FFFFFF00C6C6
      C600C6C6C600840000008400000000000000000000000000000063CECE0063CE
      CE0063CECE0063CECE00840000008400000084848400C6C6C600FFFFFF00C6C6
      C600C6C6C600840000008400000000000000FF000000FF000000FF0000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600848484008484
      840000FFFF008484840000000000000000000000000000000000000000002121
      2100CECECE00C6C6C600C6C6C600C6C6C600B5B5B50021000000BDBDBD00B5B5
      B50084848400840000008400000000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CCEFF009CFFFF009CCEFF00840000000000000084848400FFFFFF00FFFF
      FF0084848400000000000000000000000000000000000000000063CECE00CEFF
      FF009CFFFF009CFFFF009CFFFF00840000000000000084848400FFFFFF00FFFF
      FF00848484000000000000000000000000008484000084840000848400000000
      0000848484008484840084848400848484008484840084848400C6C6C60000FF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      000042424200DEDEDE00FFFFFF00FFFFFF00DEDEDE0042424200BDBDBD00A5A5
      A50063424200840000000000000000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0000000000C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000063CECE00CEFFFF009CFF
      FF009CFFFF009CFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000008400000084000000840000008400
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000084848400000000000000000000000000000000000000
      000094949400FFFFFF00FFFFFF00FFFFFF00B5B5B5004242420094949400C6C6
      C600B5B5B500B5B5B5004242420000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000063CECE00CEFFFF009CFF
      FF009CFFFF009CFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00000000008484840084848400000000000000000000000000000000004242
      4200DEDEDE00FFFFFF00FFFFFF00FFFFFF00CECECE00A5A5A50042424200DEDE
      DE00FFFFFF00EFEFEF004242420000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF008484
      84000000000000000000000000000000000063CECE00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF008484
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000C6C6C60084848400000000000000000000000000000000000000
      000094949400DEDEDE00FFFFFF00C6C6C600DE2121009494940042424200DEDE
      DE00FFFFFF00DEDEDE004242420000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000063CECE00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000000000000000000000000000000000
      00000000000042424200B5B5B500EFEFEF009494940084848400A5A5A500FFFF
      FF00FFFFFF00EFEFEF00B5B5B50042424200009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF0000000000C6C6C600FF000000C6C6C600FFFFFF00FFFFFF008484
      84000000000000000000000000000000000063CECE0063CECE0063CECE0063CE
      CE0063CECE0000000000C6C6C600FF000000C6C6C600FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000021212100CECECE00C6C6C6009494940042424200CECE
      CE00CECECE00CE525200A5A5A50042424200009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF000000000084848400FFFFFF00C6C6C600000000000000
      00000000000000000000000000000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF000000000084848400FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      000000000000000000000000000042424200424242002121210000000000A5A5
      A500EFEFEF00A5A5A5006363630000000000009C9C00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0000000000C6C6C600FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF0000000000C6C6C600FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C600FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100CECECE00EFEFEF00A5A5A50021212100009C9C0063CECE0063CECE0063CE
      CE0063CECE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009C9C0063CECE0063CE
      CE0063CECE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004242420042424200424242000000000000000000009C9C00F7F7F700CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00009C
      9C00009C9C00009C9C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003163000031
      6300003163000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000FF000031
      9C00000084000031630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600848484008484
      8400000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000063630000FFFF0000CEFF0000FF
      FF0000CEFF00009CCE0000CEFF00009CCE00009CCE000031CE0063CEFF000063
      FF0000319C000031630000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000084000000840000008400
      00000000000000000000C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600848484000000000000000000006363009CFFFF009CFFFF0000CE
      FF009CFFFF0000CEFF00009CCE0000CEFF00009CCE000031CE0063CEFF000063
      FF0000319C000031630000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000840000C6C6C600C6C6C600C6C6C600848484008484
      84000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000000084000000FF0000008400
      000000000000C6C6C600FFFFFF00FFFFFF008484840084848400848484000000
      000000000000000000000000000000000000006363009CFFFF0000CEFF009CFF
      FF0000CEFF009CFFFF0000CEFF00009CCE0000CEFF000031CE0063CEFF000063
      FF0000319C00003163000000000000000000000000000000000084848400C6C6
      C600C6C6C60000840000008400000084000000840000C6C6C600848484008484
      84008484840000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0084848400000000000000000000000000FF000000FF000000FF00
      000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C6008484
      84008484840000FFFF008484840000000000006363009CFFFF00FFFFFF0000CE
      FF009CFFFF0000CEFF009CFFFF0000CEFF00009CCE000031CE0063CEFF000063
      FF0000319C00003163000000000000000000000000000000000084848400C6C6
      C60000840000C6C6C60000840000C6C6C60000840000C6C6C600848484008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60084848400C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000000084840000848400008484
      000000000000848484008484840084848400848484008484840084848400C6C6
      C60000FFFF00C6C6C6008484840000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF009CFFFF0000CEFF009CFFFF0000CEFF000031CE0063CEFF000063
      FF0000319C000031630000000000000000000000000084848400C6C6C600C6C6
      C60000840000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84008484840000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF000000000000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000084000000840000008400
      00008400000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF008484840000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF0000FFFF000031CE009CFFFF000063
      FF0000319C000031630000000000000000000000000084848400C6C6C6000084
      00000084000000840000C6C6C6000084000000840000C6C6C600848484008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF0000000000000000000000000000FF
      FF00C6C6C6008484840000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000063630000636300006363000063
      630000636300006363000063630000636300006363000031CE009CFFFF0063CE
      FF0000319C000000840000000000000000000000000084848400C6C6C600C6C6
      C60000840000C6C6C600C6C6C6000084000000840000C6C6C600848484008484
      84008484840084848400000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF0000000000FFFF000084840000848400000000
      000000FFFF008484840000000000000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000636300F7FFFF009CFF
      FF009CFFFF00009CCE00000000000000000000000000008484006363CE006363
      CE0000319C000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C6000084000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84008484840084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFF00008484000000000000848400008484
      0000000000008484840000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000000000000006363000063
      630000636300000000000000000000000000000000000000000042424200F7CE
      A5000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF0084848400C6C6C600C6C6C600C6C6C600FFFF
      FF00FFFFFF0084848400000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000000000FFFF00000000000084840000000000008484
      0000000000008484840000000000000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      000000000000000000000000000073737300424242000000000042424200F7CE
      A5000000000000000000000000000000000084848400C6C6C600C6C6C600FFFF
      FF00FFFFFF00000000008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C600000000000000000084840000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000073737300FFEFCE00424242004242420084848400F7CE
      A5009C313100000000009C3131000000000084848400FFFFFF00FFFFFF008484
      8400848484000000000084848400C6C6C600C6C6C600C6C6C600FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF0084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00C6C6C600C6C6C600C6C6C600FFFF
      FF00C6C6C600C6C6C600F7CEA500000000008484840084848400FFFFFF00FFFF
      FF008484840000000000C6C6C600C6C6C600FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084840000FFFF0000848400000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7CEA50000000000FFFFFF00FFFF
      FF00FFEFCE00FFEFCE0000000000000000000000000000000000848484008484
      8400FFFFFF0084848400FFFFFF00FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373007373730000000000737373007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      0000006363009CFFFF0000CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000006363009CFFFF0000CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000006363009CFFFF0000CEFF0000CEFF0000CE
      FF00009CCE00009CCE0000000000000000000000000000000000633100000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE00000000000000000000000000000000000000
      0000006363009CFFFF009CFFFF0000CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000006363009CFFFF009CFFFF0000CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000006363009CFFFF00FFFFFF0000CEFF0000CE
      FF0000CEFF00009CCE00000000000000000000000000000000009C3100006331
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE00000000000000000000000000000000000000
      0000006363009CFFFF0000CEFF009CFFFF0000CEFF0000CEFF0000CEFF0000CE
      FF00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000006363009CFFFF0000CEFF009CFFFF0000CEFF0000CEFF0000CEFF0000CE
      FF00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000006363009CFFFF0000CEFF00FFFFFF0000CE
      FF0000CEFF00009CCE0000000000000000000000000063310000CE310000CE31
      00009C3100000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE00000000000000000000000000000000000000
      0000006363009CFFFF00FFFFFF0000CEFF009CFFFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000006363009CFFFF00FFFFFF0000CEFF009CFFFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000006363009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000000000006331000000000000CE3100009C31
      0000000000000000000084848400CECECE00CECECE0084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE00000000000000000000000000000000000000
      0000006363009CFFFF0000CEFF00FFFFFF0000CEFF009CFFFF0000CEFF0000CE
      FF0000CEFF00009CCE00000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00006363009CFFFF0000CEFF00FFFFFF0000CEFF009CFFFF0000CEFF0000CE
      FF0000CEFF00009CCE000000000000000000000000000000000073737300CECE
      CE00CECECE00CECECE00CECECE00006363009CFFFF009CFFFF009CFFFF000063
      6300006363000063630000000000000000009C310000000000009C3100000000
      0000000000000000000084848400FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000006363009CFFFF0000CEFF0000CE
      FF00006363009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00006363009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000000000000000000000000000737373009CFF
      FF00FFFFFF009CFFFF00FFFFFF00CECECE000063630000636300006363000063
      6300000000000000000000000000000000009C31000000000000000000000000
      0000000000000000000084848400FFFFFF009CFFFF0084848400848484008484
      840084848400848484008484840000000000006363009CFFFF009CFFFF0000CE
      FF00006363009CFFFF009CFFFF009CFFFF009CCECE0000636300006363000063
      63000063630000636300000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00006363009CFFFF009CFFFF009CFFFF000063630000636300006363000063
      63000063630000636300000000000000000084848400CECECE0073737300FFFF
      FF009CFFFF00FFFFFF009CFFFF00CECECE000000000000000000000000000000
      0000000000000000000000000000000000009C31000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000006363009CFFFF0000CEFF009CFF
      FF0000CEFF0000636300006363000063630000636300009CCE00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF000063630000636300006363000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE0073737300FFFF
      FF00FFFFFF009CFFFF00FFFFFF00CECECE000000000000000000000000000000
      000000000000000000000000000000000000000000009C310000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF009CFFFF00CECE
      CE0000000000000000000000000000000000006363009CFFFF00FFFFFF0000CE
      FF009CFFFF0000CEFF0000CEFF0000CEFF00009CCE00009CCE00000000000000
      00000000000084000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00CECECE000000000000000000000000000000
      00000000000084000000000000000000000084848400CECECE0073737300FFFF
      FF009CFFFF00FFFFFF009CFFFF00CECECE000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF009CFFFF0000CEFF0000CEFF0000CEFF00009CCE00000000000000
      0000840000009C310000840000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE00CECECE000000000000000000000000000000
      0000840000009C310000840000000000000084848400CECECE0073737300FFFF
      FF00FFFFFF009CFFFF00FFFFFF00CECECE000000000000000000000000000000
      0000840000009C31000084000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      000000000000000000000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF0000000000CE31
      0000CE3100009C310000840000008400000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00000000000000000000000000000000000000000000000000CE31
      0000CE3100009C310000840000008400000084848400CECECE0073737300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CECECE00000000000000000000000000CE31
      0000CE3100009C31000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CCECE000063630000636300006363000063630000636300000000000000
      00000000000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00000000000000000000000000000000000000
      00000000000084000000000000000000000084848400CECECE00737373007373
      7300737373007373730073737300737373000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000636300006363000063
      6300006363000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000840000008400
      00008400000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE0000000000006363009CFFFF0000CEFF0000CE
      FF00009CCE0000CEFF00009CCE0000CEFF00009CCE00009CCE00009CCE00639C
      9C00009CCE00639C9C000000000000000000006363009CFFFF0000CEFF0000CE
      FF00009CCE0000CEFF00009CCE00009CCE00009CCE00009CCE00009CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE0000000000006363009CFFFF0000CEFF0000CE
      FF0000CEFF00009CCE0000CEFF00009CCE0000CEFF00009CCE00009CCE00009C
      CE00639C9C00009CCE000000000000000000006363009CFFFF0000CEFF0000CE
      FF0000CEFF00009CCE0000CEFF00009CCE00009CCE00009CCE00009CCE000000
      0000000000000000000000000000000000000000000000000000633100000000
      0000000000000000000084848400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE000000000084848400FFFFFF00FFFFFF009C31
      0000FFFFFF00FFFFFF00CE310000CE310000CE310000FFFFFF00CE310000CE31
      0000CE310000FFFFFF00CECECE0000000000006363009CFFFF00FFFFFF0000CE
      FF0000CEFF00313131003131310031313100313131003131310031313100009C
      CE00009CCE00639C9C000000000000000000006363009CFFFF00CEFFFF0000CE
      FF0000CEFF0000CEFF00009CCE0000CEFF00009CCE00009CCE00009CCE000000
      00000000000000000000000000000000000000000000000000009C3100006331
      0000000000000000000084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE0000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF003131310000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE00009CCE00009CCE000000000000000000006363009CFFFF0000CEFF00CEFF
      FF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009CCE00009CCE000000
      CE00000000000000000000000000000000000000000063310000CE310000CE31
      00009C3100000000000084848400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE000000000084848400FFFFFF00FFFFFF009C31
      0000FFFFFF00FFFFFF00FF633100FF633100FF633100FFFFFF00FF633100FF63
      3100FF633100FFFFFF00CECECE0000000000006363009CFFFF00FFFFFF0000CE
      FF00FFFFFF003131310000CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE00009CCE000000000000000000006363009CFFFF00CEFFFF0000CE
      FF00CEFFFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009CCE000000
      000000000000000000000000CE00000000006331000000000000CE3100009C31
      0000000000000000000084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE0000000000006363009CFFFF0000CEFF003131
      31003131310031313100313131003131310000CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE000000000000000000006363009CFFFF0000CEFF00CEFF
      FF0000CEFF00CEFFFF0000CEFF0000CEFF0000CEFF000000CE0000CEFF000000
      CE00000000000000CE0000000000000000009C310000000000009C3100000000
      0000000000000000000084848400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE000000000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400FFFFFF00CECECE0000000000006363009CFFFF00FFFFFF0000CE
      FF0031313100313131003131310000CEFF00FFFFFF0000CEFF0000CEFF0000CE
      FF00009CCE0000CEFF000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF000000CE000000
      9C000000CE000000000000000000000000009C31000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00CECECE00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE0000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF003131310000CEFF00FFFFFF0000CEFF00FFFFFF0000CEFF0000CE
      FF0000CEFF00009CCE0000000000000000000063630000636300006363000063
      63000063630000636300006363000000CE000000CE000000CE0000009C00FFFF
      FF0000009C000000CE00000000000000CE009C31000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF633100FF633100FF633100FFFFFF00FF633100FF63
      3100FF633100FFFFFF00CECECE0000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000000000000000000000636300FFFFFF009CFF
      FF009CFFFF009CFFFF00000000000000000000000000000000000000CE000000
      9C000000CE00000000000000000000000000000000009C310000000000000000
      00000000CE00000000000000CE00FFFFFF000000CE00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE00000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300006363000063630000000000000000000000000000000000006363000063
      630000636300006363000000000000000000000000000000CE00000000000000
      CE00000000000000CE0000000000000000000000000000000000000000000000
      0000000000000000CE0000009C000000CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000000000000000000000006363009CFFFF009CFF
      FF009CCECE009CCECE00009C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE0000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      00000000CE0000009C00FFFFFF0000009C000000CE0084848400848484008484
      840084848400000000000000000000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100000000000000000000000000006363000063
      6300006363000063630000636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000009C000000CE000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE00000000000000CE00000000000000CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00B5B5B500B5B5B5000000
      00005A5A5A0000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF009C31
      00009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF009C3100009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C3100009C310000FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE0000FF000000FF000000FF0000CECECE00CECE
      CE000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FF63
      31009C310000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FF6331009C31
      0000FFFFFF000000000000000000FFFFFF00FFFFFF00FF6331009C310000FFFF
      FF000000000000000000CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00CECECE00CECECE00008400000084000000840000CECECE00CECE
      CE000000000084848400000000000000000084848400FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF009C3100009C3100009C31
      00009C310000FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84000000000084848400848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF633100CECECE00CECE
      CE009C310000FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C3100009C310000FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF009C3100009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C3100009C310000FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00CECECE000000
      00008484840000000000848484000000000084848400FFFFFF00FFFFFF009C31
      00009C3100009C3100009C310000FFFFFF00FFFFFF00FF633100FFFFFF009C31
      00009C310000FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF6331009C310000FFFF
      FF000000000000000000CECECE000000000084848400FFFFFF00FF6331009C31
      0000FFFFFF000000000000000000FFFFFF00FFFFFF00FF6331009C310000FFFF
      FF000000000000000000CECECE00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84000000000084848400000000000000000084848400FFFFFF00FFFFFF00FF63
      3100CECECE00CECECE009C310000FFFFFF00FFFFFF00FF633100FF633100FF63
      3100FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE0000000000000000000000000084848400CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00008484840000000000848484000000000084848400FFFFFF00FFFFFF00FF63
      3100FFFFFF009C3100009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF009C31
      00009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF009C3100009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C3100009C310000FFFF
      FF00FFFFFF00FFFFFF00CECECE00000000000000000000000000000000008484
      8400FFFFFF00FF313100FF313100FF313100FF313100FF313100FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FF633100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FF63
      31009C310000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FF6331009C31
      0000FFFFFF000000000000000000FFFFFF00FFFFFF00FF6331009C310000FFFF
      FF000000000000000000CECECE00000000000000000000000000000000008484
      8400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE00000000000000000000000000000000000000
      000084848400FFFFFF00FF633100FF633100FF633100FF633100FF633100FFFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000084848400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00000000000000000000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100FF63310000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100FF63310000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CE00009CFF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE00009CFF000000CE00000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00009C
      FF000000FF000000CE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00009CFF000000FF000000CE00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      00009CFFFF00FF000000FF000000FF000000FF000000FF000000CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00009CFF000000
      FF000000CE000000000000000000000000000000000000000000000000000000
      00000000000000000000009CFF000000FF000000CE0000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009CCE000000000000000000000000000000000000000000FF633100FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009CFF000000FF000000
      CE00000000000000000000000000000000000000000084848400FFCE3100FFCE
      3100CE9C31009C633100000000000000CE000000000000000000000000000000
      000031319C0000000000000000000000000084848400FFFFFF00FF633100FF63
      31009CFFFF00FF633100FF633100FF633100FF633100FF633100CECECE000000
      000000000000000000000000000000000000009CCE000000000000000000009C
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000CE9C0000CE9C0000CE9C00009C6331009C633100000000000000CE000000
      00000000000000000000000000000000000084848400FFCE9C00FFFF3100FFFF
      3100FFCE9C00CE9C31009C633100000000000000000000000000000000003131
      9C000000CE0000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00CECECE000000
      000000000000000000000000000000000000009CCE009CFFFF0000000000009C
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500FFCE
      3100FFCE3100FFCE3100FFCE3100CE9C0000CE9C00009C633100000000000000
      00000000000000000000000000000000000084848400FFCE9C00FFFFCE00FFFF
      9C00FFFF3100FFCE9C00CE9C310000000000000000000000000031319C000000
      FF000000CE0031319C0031319C000000000084848400FFFFFF00CECECE00CECE
      CE009CFFFF00FFFFFF009CFFFF00CECECE0000000000CECECE00CECECE000000
      000000000000000000000000000000000000009CCE009CFFFF0000CEFF0000CE
      FF00009CCE000000000000000000000000000000000000000000FF633100FF9C
      3100000000000000000000000000000000000000000084848400FFFF9C00FFFF
      9C00FFFF9C00FFCE9C00FFCE3100FFCE3100CE9C0000CE9C0000000000000000
      00000000000000000000000000000000000084848400FFCE9C00FFFFFF00FFFF
      CE00FFFF9C00FFFF3100FFCE3100000000000000000000000000000000000000
      CE000000FF00000000000000000031319C0084848400FFFFFF00000000000000
      0000CECECE009CFFFF00CECECE00000000009CCECE0000000000CECECE000000
      000000000000000000000000000000000000009CCE009CFFFF009CFFFF0000CE
      FF0000CEFF00009CCE000000000000000000000000000000000000000000FF63
      3100FF9C310000000000000000000000000084848400FFCE9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE3100CE9C00009C6331000000
      00000000000000000000000000000000000084848400B5B5B500FFFFFF00FFFF
      FF00FFFFCE00FFFF3100FFCE3100000000000000000000000000000000000000
      00000000CE00000000000000000031319C0084848400FFFFFF00639C9C00CEFF
      FF0000000000CECECE00000000009CCECE00316363009CCECE00000000000000
      000000000000000000000000000000000000009CCE009CFFFF0063CEFF0000CE
      FF00009CCE000000000000000000000000000000000000000000000000000000
      0000FF633100FF9C3100000000000000000084848400FFCE9C00FFFFCE00FFFF
      CE00FFFFCE00FFFF9C00FFFF9C00FFFF9C00FFCE3100CE9C0000CE9C00000000
      0000000000000000000000000000000000000000000084848400B5B5B500FFCE
      9C00FFCE9C00FFCE9C0084848400000000000000000000000000000000000000
      000000000000000000000000000031319C0084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00000000009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF633100009CCE0063CEFF009CFFFF00009C
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C31000000000084848400FFCE9C00FFFFFF00FFFF
      FF00FFFFCE00FFFFCE00FFFF9C00FFFF9C00FFCE9C00FFCE3100CE9C00000000
      0000000000000000000000000000000000000000000000000000848484008484
      840084848400848484000000000000000000000000000000CE00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400639C9C00CEFFFF00000000009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C3100009CCE009CFFFF00009CCE000000
      0000000000000000000000000000FF633100FFCE310000000000000000000000
      000000000000FF633100FFCE31000000000084848400B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFCE00FFFFCE00FFFF9C00FFFF9C00FFCE3100CE9C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00000000000000
      000031319C000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000000000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE3100009CCE0063CEFF00000000000000
      0000000000000000000000000000FF633100FFCE310000000000000000000000
      000000000000FF633100FFCE3100000000000000000084848400FFCE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFCE00FFFF9C00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00000000000000
      00000000CE0031319C0000000000000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C00009CCE0000000000000000000000
      000000000000000000000000000000000000FF633100FFCE3100000000000000
      000000000000FF9C3100FF633100000000000000000084848400B5B5B500FFCE
      9C00FFFFFF00FFFFFF00FFFFCE00FFFF9C00FFCE9C00CE9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000000FF000000FF0031319C00000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C0000000000FF633100FF633100009CCE0000000000000000000000
      00000000000000000000000000000000000000000000FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000848484008484
      8400B5B5B500FFCE9C00FFCE9C00FFCE9C008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808000000CE00009C
      FF000000CE000000000000000000000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000063630000636300009CCE00009C
      CE0000848400009CCE0000848400009CCE0000848400009CCE00008484000000
      0000000000000000000000000000000000000000000031636300639C9C00639C
      9C00313131003131310031313100313131003131310031313100B5B5B500B5B5
      B500313131000063630000000000000000000000000000000000000000000000
      000084848400CECECE00CECECE00CECECE00CECECE000000CE00009CFF000000
      FF000000CE0000000000C6C6C600000000000000000000000000000000008484
      8400CEFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000000000000000006363009CFFFF0000636300009C
      CE00009CCE00009CCE00009CCE0000848400009CCE0000848400009CCE000084
      8400000000000000000000000000000000000000000031636300639C9C009CCE
      CE004A4A4A004A4A4A0031313100313131003131310031313100CECECE00B5B5
      B50031313100639C9C0000000000000000000000000000000000000000000000
      000084848400FFFFFF009CFFFF00FFFFFF000000CE00009CFF000000FF000000
      CE0000000000FFFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00CECECE00000000000000000000000000006363009CFFFF0000CEFF000063
      6300009CCE00009CCE00009CCE00009CCE00009CCE00009CCE0000848400009C
      CE000084840000000000000000000000000000000000316363009CCECE009CCE
      CE004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0031313100FFFFFF00CECE
      CE0031313100639C9C0000000000000000000000000000000000000000000000
      0000848484009CFFFF00FFFFFF000000CE00009CFF000000FF000000CE000000
      0000FFFFFF009CFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000000000000000006363009CFFFF00FFFFFF0000CE
      FF0000636300009CCE00009CCE00009CCE00009CCE00009CCE00009CCE000084
      8400009CCE0000848400000000000000000000000000316363009CCECE009CCE
      CE004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0031313100639C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000009CFF000000CE000000CE0000000000FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00CECECE00000000000000000000000000006363009CFFFF0000CEFF00FFFF
      FF0000CEFF000063630000636300006363000063630000636300006363000063
      6300006363000063630000636300000000000000000031636300CEFFFF009CCE
      CE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCE
      CE009CCECE00639C9C0000000000000000000000000029292900CE9C3100FFCE
      9C00B5B5B500FFCE9C00000000000000CE000000CE0000000000FFFFFF009CFF
      FF00FFFFFF009CFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000000000000000006363009CFFFF00FFFFFF0000CE
      FF00FFFFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF00000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF009CCE
      CE00316363003163630031636300316363003163630031636300316363003163
      63009CCECE00639C9C00000000000000000084848400CE9C3100FFCE9C00FFCE
      9C00B5B5B500FFFF9C009C6331000000000000000000FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00CECECE00000000000000000000000000006363009CFFFF0000CEFF00FFFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00CEFFFF00CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF00316363009CCECE00000000000000000084848400FFCE9C00FFCE9C00FFCE
      9C00B5B5B500FFFFCE00FFCE9C0000000000B5B5B5009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00CECE
      CE00CECECE0000000000000000000000000000636300FFFFFF009CFFFF009CCE
      CE00006363000063630000636300006363000063630000636300006363000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF009CFFFF009CFF
      FF00316363009CCECE00000000000000000084848400FFCE9C00FFCE9C00FFCE
      9C00B5B5B500FFFFFF00FFFF9C0000000000B5B5B500FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00000000000000
      0000000000000000000000000000000000000000000000636300006363000063
      6300000000000000000000000000000000000000000000000000000000000000
      0000633100006331000063310000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFFFF009CFF
      FF00316363009CCECE00000000000000000084848400FFCE9C00FFCE9C00FFCE
      9C00B5B5B500FFFFFF00FFFF9C0000000000B5B5B5009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C31000063310000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF009CFF
      FF00316363009CCECE00000000000000000084848400CE9C3100FFCE9C00FFCE
      9C00B5B5B500FFFF9C00FFCE9C0000000000FFFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00C6C6C600C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C31000000000000000000000000
      00009C3100000000000063310000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF009CFF
      FF00316363003163630000000000000000000000000084848400CE9C3100FFCE
      9C00B5B5B500FFCE9C0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF009CFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C3100009C3100009C31
      0000000000000000000000000000000000000000000031636300FFFFFF00639C
      9C00639C6300639C6300639C6300639C6300639C6300639C6300639C6300639C
      630031636300C6C6C60000000000000000000000000000000000848484008484
      84008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003163630031636300639C
      9C00639C6300639C6300639C6300639C6300639C6300639C6300639C6300639C
      6300316363003163630000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000084848400CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031636300639C9C00639C9C00639C
      9C00639C9C00639C9C00639C9C0084848400FFFFFF00CE310000CE310000CE31
      0000CE310000CE310000CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF6331000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE00319CFF000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000316363009CCECE009CCECE00639C
      9C009CCECE00639C9C00639C9C00848484009CFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00CECECE00CECECE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FFFF9C000000000000000000000000000000000000000000FF633100FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003131CE000063
      FF000000CE000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000031636300CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00639C9C0084848400FFFFFF00FF000000FF000000FFFF
      FF0073737300000000000000000000000000FF633100FFCE3100FFCE3100FFCE
      3100FFCE3100000000000000000000000000000000000000000000000000FF63
      3100FFFF9C00FFCE3100000000000000000000000000FF633100FFFF9C00FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFCE
      3100FFCE3100FFCE3100FFCE3100000000000000000000000000000000000000
      CE000000FF0000009C00000000000000000000000000000000000000FF000000
      9C0000000000000000000000000000000000316363009CCECE00CEFFFF009CCE
      CE009CCECE00639C9C009CCECE0084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF0084848400FFFFFF000000000000000000FF633100FFFFCE00FFFFCE00FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FF633100FFFF9C00000000000000000000000000FF633100FFFF9C000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FFFFFF00FFFF9C00FFCE3100000000000000000000000000000000000000
      00000000CE000000FF0000009C0000000000000000000000FF0000009C000000
      00000000000000000000000000000000000031636300CEFFFF009CCECE00CEFF
      FF009CCECE009CCECE009CCECE0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000FF633100FFFFCE00FFFFCE00FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000FF633100FFFF9C00000000000000000000000000FF633100FFFF9C000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FFFF9C00FFCE3100FFCE3100000000000000000000000000000000000000
      0000000000000000CE000000FF0000009C000000FF0000009C00000000000000
      00000000000000000000000000000000000031636300CEFFFF00CEFFFF009CCE
      CE00CEFFFF009CCECE009CCECE00848484008484840084848400848484008484
      840084848400000000000000000000000000FF633100FFFFFF0000000000FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      0000FF633100FFFF9C00000000000000000000000000FF633100FFFF9C000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      9C00FFCE310000000000FFCE3100000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000000000000000
      00000000000000000000000000000000000031636300CEFFFF00CEFFFF00CEFF
      FF009CCECE00CEFFFF009CCECE009CCECE00639C9C009CCECE00639C9C009CCE
      CE00639C9C00000000000000000000000000FF6331000000000000000000FF63
      3100FFFF9C00FFCE310000000000000000000000000000000000000000000000
      0000FFCE3100FFFF9C00000000000000000000000000FF633100FFFFFF00FFCE
      310000000000000000000000000000000000FF633100FF633100FFFF9C00FFCE
      31000000000000000000FF633100000000000000000000000000000000000000
      0000000000000000CE000000FF0000009C000000CE0000009C00000000000000
      00000000000000000000000000000000000031636300FFFFFF00CEFFFF000000
      000000000000000000000000000000000000000000000000000000000000639C
      9C00639C9C00000000000000000000000000FF63310000000000000000000000
      0000FF633100FFFF9C00FFFF9C00FFCE3100000000000000000000000000FFCE
      3100FFFF9C000000000000000000000000000000000000000000FF633100FFFF
      9C00FFCE3100000000000000000000000000FFFF9C00FFFF9C00FFCE3100FF63
      3100000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF0000009C0000000000000000000000CE0000009C000000
      00000000000000000000000000000000000031636300FFFFFF00CEFFFF00009C
      CE009CFFFF0031CEFF0031CEFF0031CEFF00009CCE0000639C0000000000639C
      9C00639C9C000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FFFF9C00FFFF9C00FFFF9C00FFFF9C00FFFF
      9C0000000000000000000000000000000000000000000000000000000000FF63
      3100FFFFFF00FFFF9C00FFFF9C00FFFF9C00FFCE3100FF633100FF6331000000
      00000000000000000000000000000000000000000000000000000000CE000000
      FF000000FF0000009C00000000000000000000000000000000000000CE000000
      9C000000000000000000000000000000000031636300FFFFFF00FFFFFF00FFFF
      FF00009CCE009CFFFF000063630000636300009CCE0000000000639C9C009CCE
      CE00639C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF633100FF633100FF633100FF633100FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000FF633100FF633100FF633100FF633100FF63310000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      CE0000009C000000000000000000000000000000000031636300316363003163
      630031636300009CCE00FFFFFF009CFFFF000000000031636300316363003163
      6300316363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063639C000000CE006363
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      000000000000009CCE00009CCE00009CCE0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF0000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF00000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484009CFFFF00FF000000FF000000FF00
      0000FF000000FF000000CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF00000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE00000000000000000000000000000000000000
      000000000000FF9C310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF6331000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF00000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00848484009CFFFF00FF000000FF000000FF00
      0000FF000000FF000000CECECE00000000000000000000000000000000000000
      0000FF9C3100FF9C310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C3100FF63
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009C31
      00009C3100009C3100009C31000084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE00CECECE0000000000000000000000000000000000FF9C
      3100FFCE3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000000000000FF633100FF9C
      3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FFCE
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000848484009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF0084848400FFFFFF00FF633100FF633100FFFF
      FF00000000000000000000000000000000000000000000000000FF633100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFFF9C00FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FF9C31000000000000000000000000000000000000000000FF633100FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009C31
      00009C3100009C3100009C31000084848400FFFFFF00FFFFFF00FFFFFF009CFF
      FF0084848400FFFFFF000000000000000000000000000000000000000000FF63
      3100FFFF9C00FFFF9C0000000000FF633100FF633100FF633100FF633100FF63
      3100FF6331000000000000000000000000000000000000000000FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FFFFCE00FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000FF633100FFFF9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF633100FFCE31000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009C31
      00009C310000FFFFFF0000000000848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF0084848400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002929290029292900292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000006363002929290000636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006363002929290000636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006363002929290000636300000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6002929
      2900000000000000000000000000000000000000000029292900292929000000
      0000006363000084840000636300000000002929290029292900000000000000
      0000000000000000000000000000000000000000000029292900292929000000
      0000006363000084840000636300000000002929290029292900000000000000
      0000000000000000000000000000000000000000000029292900292929000000
      0000006363000084840000636300000000002929290029292900000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      2900000000000000000000000000000000000000000000848400008484002929
      29000063630063CECE0000848400292929000084840063CECE00006363000000
      0000000000000000000000000000000000000000000000848400008484002929
      29000063630063CECE0000848400292929000084840063CECE00006363000000
      0000000000000000000000000000000000000000000000848400008484002929
      29000063630063CECE0000848400292929000084840063CECE00006363000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      8400FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00C6C6C6002929
      2900000000000000000000000000000000000000000029292900CEFFFF000084
      840000636300CEFFFF000084840000848400CEFFFF0000636300292929000000
      0000000000000000000000000000000000000000000029292900CEFFFF000084
      840000636300CEFFFF000084840000848400CEFFFF0000636300292929000000
      0000000000000000000000000000000000000000000029292900CEFFFF000084
      840000636300CEFFFF000084840000848400CEFFFF0000636300292929000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      FF0000008400FFFFFF0000840000FFFF0000FF000000FFFFFF00C6C6C6002929
      2900CECECE00CECECE00CECECE000000000000636300009C9C0029292900CEFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF0029292900008484000063630063CE
      CE0063CECE0063CECE0063CECE000000000000636300009C9C0029292900CEFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF0029292900008484000063630063CE
      CE0063CECE0063CECE00006363000000000000636300009C9C0029292900CEFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF00292929000084840000636300CECE
      CE00CECECE00CECECE00CECECE000000000084848400FFFFFF00FFFFFF0000FF
      FF0000008400FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6C6002929
      29009CFFFF00FFFFFF00CECECE00000000000063630063CECE00CEFFFF0063CE
      CE00009C9C004A4A4A00009C9C00CEFFFF009CFFFF00CEFFFF00006363009CCE
      FF009CCEFF009CCEFF0063CECE00000000000063630063CECE00CEFFFF0063CE
      CE00009C9C004A4A4A00009C9C00CEFFFF009CFFFF00CEFFFF00006363009CCE
      FF009CFFFF0063CECE0000636300000000000063630063CECE00CEFFFF0063CE
      CE00009C9C004A4A4A00009C9C00CEFFFF009CFFFF00CEFFFF0000636300FFFF
      FF009CFFFF00FFFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      2900FFFFFF009CFFFF00CECECE0000000000009C9C00009C9C009CFFFF00009C
      9C0084848400FFFFFF004A4A4A00009C9C0063CECE00009C9C00009C9C009CFF
      FF009CCEFF009CCEFF0063CECE0000000000009C9C00009C9C009CFFFF00009C
      9C0084848400FFFFFF004A4A4A00009C9C0063CECE00009C9C00009C9C009CFF
      FF009CCEFF000063630063CECE0000000000009C9C00009C9C009CFFFF00009C
      9C0084848400FFFFFF004A4A4A00009C9C0063CECE00009C9C00009C9C009CFF
      FF00FFFFFF009CFFFF00CECECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      29009CFFFF00FFFFFF00CECECE00000000000000000029292900009C9C00CEFF
      FF0084848400FFFFFF005252520063CECE00009C9C00006363009CFFFF009CCE
      FF009CFFFF009CCEFF0063CECE00000000000000000029292900009C9C00CEFF
      FF0084848400FFFFFF005252520063CECE00009C9C00006363009CFFFF009CCE
      FF0063CECE000063630063CECE00000000000000000029292900009C9C00CEFF
      FF0084848400FFFFFF005252520063CECE00009C9C00006363009CFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE00000000008484840073737300848484007373
      7300848484007373730084848400848484008484840084848400848484002929
      2900FFFFFF009CFFFF00CECECE00000000000000000000636300CEFFFF002929
      290084848400FFFFFF004A4A4A002929290063CECE00006363009CCEFF009CFF
      FF009CCEFF009CFFFF0063CECE000000000063CECE0000636300CEFFFF002929
      290084848400FFFFFF004A4A4A002929290063CECE00006363009CCEFF009CFF
      FF000063630063CECE0063CECE00000000000000000000636300CEFFFF002929
      290084848400FFFFFF004A4A4A002929290063CECE0000636300FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE000000000084848400FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE3100FF9C6300FF9C6300FF636300FF3131002929
      29009CFFFF00FFFFFF00CECECE00000000000000000000636300006363009CFF
      FF00C6C6C60084848400848484009CFFFF0000636300006363009CFFFF009CCE
      FF009CFFFF009CCEFF0063CECE000000000063CECE000063630000636300CEFF
      FF00C6C6C6008484840084848400CEFFFF000063630000636300CEFFFF0063CE
      CE00006363009CCEFF0063CECE00000000000000000000636300006363000000
      0000C6C6C6008484840084848400FFFFFF0000636300006363009CFFFF00FFFF
      FF009CFFFF00FFFFFF00CECECE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484002929
      2900FFFFFF009CFFFF00CECECE000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFF
      FF009CCEFF009CFFFF0063CECE000000000063CECE0063CECE0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
      CE0063CECE009CFFFF0063CECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00CECECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00CECECE00CECECE000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0063CECE000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0063CECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFF
      FF009CFFFF00CECECE00CECECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFF
      FF000000000000000000000000000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF009CFFFF0063CECE000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF009CFFFF0063CECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00000000000000000000000000009C9C0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C000000000000000000009C9C0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF00CEFFFF009CFFFF009CFFFF00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF00CEFFFF009CFFFF009CFFFF00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      840084848400000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C00009C9C00009C9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C00009C9C00009C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002929290029292900292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900000000000000000000000000000000002929290029292900292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6002929
      29000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      29000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      8400FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00C6C6C6002929
      29000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      8400FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00C6C6C6002929
      290000000000000000000000000000000000009C9C00CEFFFF0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
      CE0063CECE0063CECE000000000000000000000000000000000063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
      CE0063CECE0063CECE00006363000000000084848400FFFFFF00000084000000
      FF0000008400FFFFFF0000840000FFFF0000FF000000FFFFFF00C6C6C6002929
      290063CECE0063CECE0063CECE000000000084848400FFFFFF00000084000000
      FF0000008400FFFFFF0000840000FFFF0000FF000000FFFFFF00C6C6C6002929
      290063CECE0063CECE000063630000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CCEFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCEFF009CCE
      FF009CCEFF0063CECE000000000000000000000000000000000063CECE00CEFF
      FF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCE
      FF009CFFFF0063CECE00006363000000000084848400FFFFFF00FFFFFF0000FF
      FF0000008400FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6C6002929
      29009CCEFF009CCEFF0063CECE000000000084848400FFFFFF00FFFFFF0000FF
      FF0000008400FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6C6002929
      29009CFFFF0063CECE000063630000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCE
      FF009CCEFF0063CECE0000000000000000000000000063CECE00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFF
      FF009CCEFF000063630063CECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      29009CCEFF009CCEFF0063CECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      29009CCEFF000063630063CECE0000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCEFF009CFF
      FF009CCEFF0063CECE0000000000000000000000000063CECE00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCE
      FF0063CECE000063630063CECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      29009CFFFF009CCEFF0063CECE000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6002929
      290063CECE000063630063CECE0000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFFFF009CCE
      FF009CFFFF0063CECE00000000000000000063CECE00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFF
      FF000063630063CECE0063CECE00000000008484840073737300848484007373
      7300848484007373730084848400848484008484840084848400848484002929
      29009CCEFF009CFFFF0063CECE00000000008484840073737300848484007373
      7300848484007373730084848400848484008484840084848400848484002929
      29000063630063CECE0063CECE0000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCEFF009CFF
      FF009CCEFF0063CECE00000000000000000063CECE00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF0063CE
      CE00006363009CCEFF0063CECE000000000084848400FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE3100FF9C6300FF9C6300FF636300FF3131002929
      29009CFFFF009CCEFF0063CECE000000000084848400FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE3100FF9C6300FF9C6300FF636300FF3131002929
      2900006363009CCEFF0063CECE0000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CCE
      FF009CFFFF0063CECE00000000000000000063CECE0063CECE0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
      CE0063CECE009CFFFF0063CECE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484002929
      29009CCEFF009CFFFF0063CECE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484002929
      290063CECE009CFFFF0063CECE0000000000009C9C00CEFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CCEFF0063CECE00000000000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0063CECE000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0063CECE000000000000000000009C9C00CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CCEFF0063CECE0000000000009C9C00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF009CFFFF0063CECE00000000000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF009CFFFF0063CECE000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF009CFFFF0063CECE000000000000000000009C9C00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF009CFFFF0063CECE0000000000009C9C0063CECE0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C9C00009C
      9C00009C9C00009C9C00000000000000000000000000009C9C0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C000000000000000000009C9C0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C000000000000000000009C9C0063CECE0063CE
      CE0063CECE0063CECE0063CECE0063CECE0063CECE00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C000000000000000000009C9C00F7F7F700CEFF
      FF00CEFFFF009CFFFF009CFFFF00009C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF00CEFFFF009CFFFF009CFFFF00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF00CEFFFF009CFFFF009CFFFF00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00F7F7
      F700CEFFFF00CEFFFF009CFFFF009CFFFF00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00009C
      9C00009C9C00009C9C00009C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C00009C9C00009C9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C00009C9C00009C9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      9C00009C9C00009C9C00009C9C00009C9C000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200100000100010000000000000900000000000000000000
      000000000000000000000000FFFFFF00001FFFFF00000000000FF9FF00000000
      0007F6CF000000000003F6B7000000000001F6B7000000000000F8B700000000
      001FFE8F000000000018FE3F00000000001CFF7F00000000003AFE3F00000000
      0007FEBF00000000001FFC9F0000000003F8FDDF0000000003FCFDDF00000000
      03BAFDDF00000000FFC7FFFF00000000FFFFFFFFFFFFFFFFF000F000800FE000
      F000F0008007C000000000000003800000000000000180000000000000008000
      0000000000000000000000000007800000000000000780000000000000078000
      000000000000800082000000821CC000F000C100FFBAC000F0018001FFC7C000
      F0032003FFFFC000F007E007FFFFFFFFFFFFFFFFFFFFFFFFF000F000F000F000
      F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000
      F000F000F000F000F000F000F000F000F000E000F000E000F000E000F000E000
      F000F000F000F000F0008000F0008000F000E000F000E000F001C001F001C001
      F0039003F0039003F007F007F007F007FFFFFFFFFFFFFFFFFC00FC00FC00FC00
      F000F000F000F000E000E000E000E000E000E000E000E000C000C000C000C000
      C000C000C000C000C000C000C000C000C000C000C000C000C000C000C000C000
      C000C000C000C000E0010001E0010001E001C001E001C001F0038003F0038003
      FC0F200FFC0F200FFFFFE9FFFFFFE9FFFFFFFFFFFFFFFFFFFC7FF800F000F000
      F81FF000F000F000F007E000F000F000E001C000F000F000C0008000F000F000
      80018000F000F00000018000F000F00000008000F000F00000018000F000E000
      00038000F000E00000070001F000F000800F8107F0008000801F8047F001E001
      203F03FFF003C003E87FE9FFF0079007FFFFFFFFFFFFFFFFFFFFFFFFFC7FF800
      FFFFFFFFF81FF000FFFFFFFFF007E000FFFFFFFFE001C000F00FFE7FC0008000
      F3CFFC3F80018000FBDFFDBF00018000F99FF99F00008000FDBFFBDF00018000
      FC3FF3CF00038000FE7FF00F00078001FFFFFFFF800F8307FFFFFFFFE01F83C7
      FFFFFFFFF83FC7FFFFFFFFFFFE7FEFFFFFFFFFFFFFFFFE7F883FFC1FC003F83F
      D73FF007C003E01FE0C0E003C003800FE000C001C00300078000C001C0030003
      80008000C003000180008000C003000000008000C003000000008000C0038001
      8000C001C003C0010000C001C003E0010000E003C007F0010001F007C00FF807
      8003FC1FC01FFC1FF807FFFFFFFFFE7FFC1F803FF800F8000807001FF800F800
      000080018000E0000000C0000001C001000080010001C0010000800300018001
      0000000100018000000000010000000000000001000000000000000000000000
      800000000000800080008001000080008001C00000018001C07FE0008003C003
      E0FFFE00C007E007FFFFFF01FFFFFFFFFFC7FF0F8001FE0F0003FC0700018403
      0003F007000180000003C007000180000003C003000180000003C00300018000
      0003800300018000000380030001800000038001000180008187800100018000
      C3C7000100038000FE440001800F8000FC000003C01F8001FC00000FFE0FC07F
      FC01C03FFE0FE0FFFE43F0FFFF1FFFFFFFFFFFFFFFFFFFFFFF80F001F001FE01
      FF80F001F001FE01DF80F001F001FE01CF80F001F001FE018400F0010001C001
      4C0000010001C0035C0000010001000F7C0100030003007F7C07001F007F007F
      BC07001B007B007BFC07001100710071FC0F000000600060FFFF003B00FB007B
      FFFF87C701C701C7FFFFFFFF03FF01FFFFFFFFFFFFFFFFFF00000001000FFC00
      00000001000FFC0000000001000FDC0000000001000FCC0000000001000F8400
      00000001000D4C0000000001000B5C000000000100077C000000000100027C00
      0000000181C7B40100000001C3ABF803000080FFFF7DF0070000C1FFFFEFF8FF
      0000FFFFFFFFF57FFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFC007000000000000
      8003000000000000000100000000000000010000000000000001000000000000
      000000000000000000000000000000008000000000000000C000000000000000
      E001000000000000E007000000000000F007000000000000F003000000000000
      F803000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFF3FF3F000FF9FFFFE1FE1F
      000FF9FFFFC1FC1F000FF3C7FF83C03F000F73C7F0078077000F27FFC00F00E7
      000F07C7801F00C1000F00C7801F00E6000F01E3000F00F6000003F1000F81FE
      00000638000FC3BF00000E38000FFFB7F8001E38801FFFB3FC003F01801FFFC1
      FE047F83C03FFFF3FFFFFFFFF0FFFFF7FFFFFFFFFFFFFFE7E003001FC001F000
      E003000F8001F000E00300078001F000E00300038001F000E00300018001C000
      E003000080018000E003001F80010000E003001F80010000E003001F80010000
      E0038FF180010000E007FFF980010000E00FFF7580018000E01FFF8F8001C001
      FFFFFFFF8001F003FFFFFFFFFFFFF007FFFFFFFFFFFFFFFFFE00FFFFFFFFDFFB
      8000FFFFFFFF8FFF0000FFE3C7FF87F7000001E3C780C7EF000003E187C0E3CF
      000107F18FE0F19F000307F18FE0F83F000303F18FC0FC7F000320E18704F83F
      00037003C00EF19F0003F807E01FC3CF0003FE0FF07F87E78007FFFFFFFF8FFB
      F87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFE00
      FFFFFFFFED9FFE00FDFFFFBFED6FFE00F9FFFF9FED6F8000F1FFFF8FF16F8000
      E003C007FD1F8000C003C003FC7F8000C003C003FEFF8001E003C007FC7F8003
      F1FFFF8FFD7F8007F9FFFF9FF93F807FFDFFFFBFFBBF80FFFFFFFFFFFBBF81FF
      FFFFFFFFFBBFFFFFFFFFFFFFFFFFFFFF000FF1FFF1FFF1FF000F913F913F913F
      000F801F801F801F000080008000800000000000000000000000000000000000
      0000000000000000000080008000800000008000000080000000800000009000
      000080000000F800F80080008000F800F80080008000F800F80180018001F801
      F803C07FC07FF803F807E0FFE0FFF807FFFFFFFF000F000FFFFFFFFF000F000F
      FFFFFFFF000F000F8001E000000000000001C000000000000001C00000000000
      0001800000000000000180000000000000010000000000000001000000000000
      0001000000000000000180008000800000018000800080000003800180018001
      80FFC07FC07FC07FC1FFE0FFE0FFE0FF00000000000000000000000000000000
      000000000000}
  end
  object popEdit: TSpTBXPopupMenu
    Images = il16
    OnPopup = popEditPopup
    Left = 38
    Top = 158
    object Undo1: TSpTBXItem
      Caption = 'Undo'
      Hint = 'Undo last action'
      Action = acUndo
    end
    object N13: TSpTBXSeparatorItem
    end
    object Cut1: TSpTBXItem
      Caption = 'Cut'
      Hint = 'Cut selected text'
      Action = acCut
    end
    object Copy1: TSpTBXItem
      Caption = 'Copy'
      Hint = 'Copy selected text'
      Action = acCopy
    end
    object Paste1: TSpTBXItem
      Caption = 'Paste'
      Hint = 'Paste from clipboard'
      Action = acPaste
    end
    object N14: TSpTBXSeparatorItem
    end
    object TBItem54: TSpTBXItem
      Caption = 'Use this translation everywhere'
      Hint = 'Use this translation everywhere'
      Action = acReplaceEverywhere
    end
    object SelectAll1: TSpTBXItem
      Caption = 'Select All'
      Hint = 'Select all text'
      Action = acSelectAll
    end
    object TBSeparatorItem9: TSpTBXSeparatorItem
    end
    object TBItem17: TSpTBXItem
      Caption = 'ASCII Value(s)...'
      Hint = 'Show the ASCII values for the selected text'
      Action = acAsciiValues
    end
    object TBXSeparatorItem6: TSpTBXSeparatorItem
    end
    object smiDictionary: TSpTBXSubmenuItem
      Caption = 'Dictionary'
    end
  end
  object popList: TSpTBXPopupMenu
    Images = il16
    Left = 78
    Top = 158
    object TBItem20: TSpTBXItem
      Caption = 'Copy from Original'
      Hint = 'Copy the value of Original to Translation'
      Action = acCopyFromOriginal
    end
    object TBItem21: TSpTBXItem
      Caption = 'Copy from Name'
      Hint = 'Copy the value of Name to Translation'
      Action = acCopyFromName
    end
    object TBXItem7: TSpTBXItem
      Caption = 'Add to Dictionary'
      Hint = 'Add current item to the dictionary'
      Action = acDictAdd
    end
    object TBSeparatorItem14: TSpTBXSeparatorItem
    end
    object TBItem24: TSpTBXItem
      Caption = 'Next untranslated'
      Hint = 'Go to next untranslated item'
      Action = acNextUntranslated
    end
    object TBItem25: TSpTBXItem
      Caption = 'Prev untranslated'
      Hint = 'Go to previous untranslated item'
      Action = acPrevUntranslated
    end
    object TBSeparatorItem11: TSpTBXSeparatorItem
    end
    object TBItem53: TSpTBXItem
      Caption = 'Clear All Translations'
      Hint = 'Clear the translated text'
      Action = acClearAllTranslations
    end
    object TBItem52: TSpTBXItem
      Caption = 'Use this translation everywhere'
      Hint = 'Use this translation everywhere'
      Action = acReplaceEverywhere
    end
    object TBXSeparatorItem5: TSpTBXSeparatorItem
    end
    object TBXItem5: TSpTBXItem
      Caption = 'Translated'
      Hint = 'Toggle the Translated status of the item'
      Action = acToggleTranslated
    end
    object TBXSeparatorItem7: TSpTBXSeparatorItem
    end
    object TBXItem12: TSpTBXItem
      Caption = 'Add Item...'
      Hint = 'Add new item to original and translation'
      Action = acAddItem
    end
    object TBXItem11: TSpTBXItem
      Caption = 'Edit Item...'
      Hint = 'Edit all parts of the current item'
      Action = acEditItem
    end
    object TBXItem9: TSpTBXItem
      Caption = 'Delete Item...'
      Hint = 'Delete the current item from both original and translation'
      Action = acDeleteItem
    end
  end
  object MRUFiles: TTBXMRUList
    HidePathExtension = False
    MaxItems = 10
    OnClick = MRUFilesClick
    Prefix = 'MRU'
    Left = 118
    Top = 122
  end
  object ilBookmarks: TImageList
    AllocBy = 24
    Height = 15
    Width = 12
    Left = 118
    Top = 192
    Bitmap = {
      494C01010B000E0004000C000F00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000300000002D0000000100200000000000C021
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000084
      0000848400000084000084840000008400008484000000000000000000000000
      000000000000C6C6C60084840000008400008484000000840000848400000084
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600008400008484
      0000000000000000000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400000000
      0000008400000000000084848400000000000000000000000000000000000000
      0000088408000073000000730000004200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000848400000000
      000084840000000000008484840000000000000000000000000000000000218C
      21000073000010941000006B0000005200001863210008391800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400000000
      000000840000000000008484840000000000000000000000000010731000107B
      0800219C10000084000000840000087B080000630800105A2100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400000000000000000000848400000000
      000084840000000000008484840000000000000000007BCE7300318421004AAD
      310042B52100108C000018940000108C1000087B1000005A0800004200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400008484
      0000000000000000000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000000000000084000084840000000000000000
      000000840000000000008484840000000000000000007BB56B0063A54A006BB5
      420063BD310063CE31004ABD290008840000108C1000006B0000005200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000000000008484000000840000848400000000
      000084840000000000008484840000000000000000008CBD730073A552007BAD
      42007BB5390063AD21006BCE390052C6420000730000188C2100006300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000000000000084000084840000008400000000
      000000840000000000008484840000000000000000008CB57B008CAD6B0084A5
      5200BDEF8400B5F77B006BBD420052B54200218C2100006B0800218C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000084
      0000000000000000000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000008400000000000000000000000000000084
      00008484000000000000848484000000000000000000B5D6B5007B9C6B008CAD
      6300EFFFBD00BDEF8C0063A542005AAD5200106B180018732900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600008400008484
      0000008400008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400008484
      0000008400000000000084848400000000000000000000000000ADD6B50094B5
      7B007B9C5200739C52007BB5630063AD6B00317B420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000000000000ADD6
      A50094BD7B008CB56B008CBD7B0073B584000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000084
      0000848400000084000084840000008400008484000000000000000000000000
      000000000000C6C6C60084840000008400008484000000840000848400000084
      00008484000000000000000000000000000000000000C6C6C600848400000084
      0000848400000084000084840000008400008484000000000000000000000000
      000000000000C6C6C60084840000008400008484000000840000848400000084
      00008484000000000000000000000000000000000000C6C6C600008400008484
      0000008400008484000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000000000000000000000000008484
      00000084000000000000848484000000000000000000C6C6C600008400008484
      0000000000000000000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000000000000008400008484
      00000084000000000000848484000000000000000000C6C6C600848400000084
      0000848400000084000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000000000008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000000000848400000084
      00008484000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400000000
      00000084000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000000000000008400008484
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000000000000000000000000000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000000000000084
      00008484000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000000000000000000000000000000000008484
      00000084000000000000848484000000000000000000C6C6C600008400000000
      0000000000000000000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000000000008484
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000000000008484000000840000848400000084
      00008484000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000008400008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000000000000084000084840000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000000000000084000084840000008400000000
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000000000000000000000000000000000000000
      00008484000000000000848484000000000000000000C6C6C600848400000084
      0000000000000000000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000000000000000000000000000000000000000
      00008484000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400008484
      0000008400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848400000084
      0000848400000084000084840000008400008484000000000000000000000000
      000000000000C6C6C60084840000008400008484000000840000848400000084
      00008484000000000000000000000000000000000000C6C6C600848400000084
      0000848400000084000084840000008400008484000000000000000000000000
      000000000000C6C6C60084840000008400008484000000840000848400000084
      00008484000000000000000000000000000000000000C6C6C600008400008484
      0000000000000000000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000000000000000000000000000000000000000
      00000084000000000000848484000000000000000000C6C6C600008400000000
      0000000000000000000000000000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000000000000000000000000008484
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000000000848400000084
      00008484000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000008400008484000000000000848484000000
      000000000000C6C6C60084840000000000008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000000000000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400008484
      0000000000008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400000000
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000000000848400000084
      00008484000000000000848484000000000000000000C6C6C600848400000084
      0000848400000000000084840000008400008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000000000000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000000000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000000000000000000008484
      00000084000000000000848484000000000000000000C6C6C600848400000000
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000000000008484000000000000848400000084
      00008484000000000000848484000000000000000000C6C6C600848400000084
      0000848400000084000084840000000000008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000840000848400000000
      00008484000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000848400000000000000000000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400000000
      0000008400008484000000840000000000000084000000000000848484000000
      000000000000C6C6C60000840000000000000084000084840000008400000000
      00000084000000000000848484000000000000000000C6C6C600848400000084
      0000000000000000000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000008400008484000000000000848400000084
      00008484000000000000848484000000000000000000C6C6C600848400000084
      0000000000000000000000000000008400008484000000000000848484000000
      000000000000C6C6C60084840000008400000000000000000000000000000084
      00008484000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400008484
      00000084000000000000848484000000000000000000C6C6C600008400008484
      0000008400008484000000840000848400000084000000000000848484000000
      000000000000C6C6C60000840000848400000084000084840000008400008484
      0000008400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000300000002D0000000100010000000000680100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF0000000003003FFF0000000
      001001FFF0000000000000F0F0000000000000E030000000000000C030000000
      0000008010000000000000801000000000000080100000000000008010000000
      0000008030000000000000C070000000000000E0F0000000800800FFF0000000
      C01C01FFF0000000FFFFFFFFFFFF000000300300300300000010010010010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008008008008000000C01C01C01C010000
      FFFFFFFFFFFF0000003003003003000000100100100100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008008008008000000C01C01C01C0100000000000000000000
      0000000000000000000000000000}
  end
  object alBookmarks: TTntActionList
    Images = ilBookmarks
    OnUpdate = alMainUpdate
    Left = 158
    Top = 158
    object acGotoBookmark1: TTntAction
      Tag = 1
      Category = 'Bookmarks'
      Caption = 'Bookmark 1'
      Hint = 'Goto Bookmark 1'
      ImageIndex = 1
      ShortCut = 16433
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark2: TTntAction
      Tag = 2
      Category = 'Bookmarks'
      Caption = 'Bookmark 2'
      Hint = 'Goto Bookmark 2'
      ImageIndex = 2
      ShortCut = 16434
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark3: TTntAction
      Tag = 3
      Category = 'Bookmarks'
      Caption = 'Bookmark 3'
      Hint = 'Goto Bookmark 3'
      ImageIndex = 3
      ShortCut = 16435
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark4: TTntAction
      Tag = 4
      Category = 'Bookmarks'
      Caption = 'Bookmark 4'
      Hint = 'Goto Bookmark 4'
      ImageIndex = 4
      ShortCut = 16436
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark5: TTntAction
      Tag = 5
      Category = 'Bookmarks'
      Caption = 'Bookmark 5'
      Hint = 'Goto Bookmark 5'
      ImageIndex = 5
      ShortCut = 16437
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark6: TTntAction
      Tag = 6
      Category = 'Bookmarks'
      Caption = 'Bookmark 6'
      Hint = 'Goto Bookmark 6'
      ImageIndex = 6
      ShortCut = 16438
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark7: TTntAction
      Tag = 7
      Category = 'Bookmarks'
      Caption = 'Bookmark 7'
      Hint = 'Goto Bookmark 7'
      ImageIndex = 7
      ShortCut = 16439
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark8: TTntAction
      Tag = 8
      Category = 'Bookmarks'
      Caption = 'Bookmark 8'
      Hint = 'Goto Bookmark 8'
      ImageIndex = 8
      ShortCut = 16440
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark9: TTntAction
      Tag = 9
      Category = 'Bookmarks'
      Caption = 'Bookmark 9'
      Hint = 'Goto Bookmark 9'
      ImageIndex = 9
      ShortCut = 16441
      OnExecute = GotoBookmarkExecute
    end
    object acGotoBookmark0: TTntAction
      Category = 'Bookmarks'
      Caption = 'Bookmark 0'
      Hint = 'Goto Bookmark 0'
      ImageIndex = 0
      ShortCut = 16432
      OnExecute = GotoBookmarkExecute
    end
    object acToggleBookmark1: TTntAction
      Tag = 1
      Category = 'Bookmarks'
      Caption = 'Bookmark 1'
      Hint = 'Toggle Bookmark 1 on/off'
      ImageIndex = 1
      ShortCut = 24625
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark2: TTntAction
      Tag = 2
      Category = 'Bookmarks'
      Caption = 'Bookmark 2'
      Hint = 'Toggle Bookmark 2 on/off'
      ImageIndex = 2
      ShortCut = 24626
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark3: TTntAction
      Tag = 3
      Category = 'Bookmarks'
      Caption = 'Bookmark 3'
      Hint = 'Toggle Bookmark 3 on/off'
      ImageIndex = 3
      ShortCut = 24627
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark4: TTntAction
      Tag = 4
      Category = 'Bookmarks'
      Caption = 'Bookmark 4'
      Hint = 'Toggle Bookmark 4 on/off'
      ImageIndex = 4
      ShortCut = 24628
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark5: TTntAction
      Tag = 5
      Category = 'Bookmarks'
      Caption = 'Bookmark 5'
      Hint = 'Toggle Bookmark 5 on/off'
      ImageIndex = 5
      ShortCut = 24629
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark6: TTntAction
      Tag = 6
      Category = 'Bookmarks'
      Caption = 'Bookmark 6'
      Hint = 'Toggle Bookmark 6 on/off'
      ImageIndex = 6
      ShortCut = 24630
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark7: TTntAction
      Tag = 7
      Category = 'Bookmarks'
      Caption = 'Bookmark 7'
      Hint = 'Toggle Bookmark 7 on/off'
      ImageIndex = 7
      ShortCut = 24631
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark8: TTntAction
      Tag = 8
      Category = 'Bookmarks'
      Caption = 'Bookmark 8'
      Hint = 'Toggle Bookmark 8 on/off'
      ImageIndex = 8
      ShortCut = 24632
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark9: TTntAction
      Tag = 9
      Category = 'Bookmarks'
      Caption = 'Bookmark 9'
      Hint = 'Toggle Bookmark 9 on/off'
      ImageIndex = 9
      ShortCut = 24633
      OnExecute = ToggleBookmarkExecute
    end
    object acToggleBookmark0: TTntAction
      Category = 'Bookmarks'
      Caption = 'Bookmark 0'
      Hint = 'Toggle Bookmark 0 on/off'
      ImageIndex = 0
      ShortCut = 24624
      OnExecute = ToggleBookmarkExecute
    end
  end
  object ThemeSwitcher: TTBXSwitcher
    Theme = 'Default'
    Left = 78
    Top = 122
  end
end
