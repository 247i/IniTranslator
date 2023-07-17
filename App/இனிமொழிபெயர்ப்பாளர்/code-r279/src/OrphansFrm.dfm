object frmOrphans: TfrmOrphans
  Left = 433
  Top = 172
  Width = 445
  Height = 340
  ActiveControl = lvOrphaned
  BorderIcons = [biSystemMenu]
  BorderWidth = 2
  Caption = 'Orphaned Items'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvOrphaned: TTntListView
    Left = 0
    Top = 64
    Width = 433
    Height = 223
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Original'
        Width = 200
      end
      item
        Caption = 'Translation'
        Width = 200
      end>
    GridLines = True
    HideSelection = False
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    PopupMenu = popList
    ShowHint = True
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvOrphanedChange
    OnData = lvOrphanedData
    OnResize = lvOrphanedResize
  end
  object StatusBar1: TTntStatusBar
    Left = 0
    Top = 287
    Width = 433
    Height = 19
    Panels = <>
  end
  object Panel1: TTntPanel
    Left = 0
    Top = 23
    Width = 433
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    object Panel2: TTntPanel
      Left = 3
      Top = 3
      Width = 427
      Height = 35
      Align = alClient
      BevelOuter = bvNone
      Color = clBtnShadow
      TabOrder = 0
      object lblSection: TTntLabel
        Left = 10
        Top = 7
        Width = 6
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -19
        Font.Name = 'MS Shell Dlg 2'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
      end
    end
  end
  object TopDock: TSpTBXDock
    Left = 0
    Top = 0
    Width = 433
    Height = 23
    FixAlign = True
    object tbMenu: TSpTBXToolbar
      Left = 0
      Top = 0
      Caption = 'Menu'
      ChevronHint = 'More Buttons|Click to see more buttons'
      CloseButton = False
      DefaultDock = TopDock
      DockMode = dmCannotFloatOrChangeDocks
      DockPos = 0
      FullSize = True
      HideWhenInactive = False
      MenuBar = True
      Options = [tboLongHintInMenuOnly, tboShowHint]
      ProcessShortCuts = True
      Resizable = False
      TabOrder = 0
      Customizable = False
      object Actions1: TSpTBXSubmenuItem
        CaptionW = '&Actions'
        object SpTBXItem19: TSpTBXItem
          Action = acSave
          CaptionW = '&Save...'
        end
        object SpTBXItem18: TSpTBXItem
          Action = acMerge
          CaptionW = '&Merge...'
        end
        object SpTBXSeparatorItem3: TSpTBXSeparatorItem
        end
        object SpTBXItem1: TSpTBXItem
          Action = acAdd
          CaptionW = 'Add to main list'
        end
        object SpTBXItem17: TSpTBXItem
          Action = acCopy
          CaptionW = 'Copy'
        end
        object SpTBXItem16: TSpTBXItem
          Action = acRemove
          CaptionW = 'Remove'
        end
        object SpTBXItem15: TSpTBXItem
          Action = acPaste
          CaptionW = 'Paste into current item'
        end
        object SpTBXItem14: TSpTBXItem
          Action = acClear
          CaptionW = 'Clear'
        end
        object SpTBXSeparatorItem4: TSpTBXSeparatorItem
        end
        object SpTBXItem13: TSpTBXItem
          Action = acFindItem
          CaptionW = 'Find Item'
        end
        object SpTBXItem12: TSpTBXItem
          Action = acFindNext
          CaptionW = 'Find Next'
        end
        object SpTBXSeparatorItem5: TSpTBXSeparatorItem
        end
        object SpTBXItem10: TSpTBXItem
          Action = acClose
          CaptionW = 'Close'
        end
      end
    end
  end
  object alOrphans: TTntActionList
    OnUpdate = alOrphansUpdate
    Left = 42
    Top = 100
    object acAdd: TTntAction
      Caption = 'Add to main list'
      OnExecute = acAddExecute
    end
    object acCopy: TTntAction
      Caption = 'Copy'
      ShortCut = 16451
      OnExecute = acCopyExecute
    end
    object acSave: TTntAction
      Caption = '&Save...'
      ShortCut = 16467
      OnExecute = acSaveExecute
    end
    object acMerge: TTntAction
      Caption = '&Merge...'
      ShortCut = 16461
      OnExecute = acMergeExecute
    end
    object acClear: TTntAction
      Caption = 'Clear'
      OnExecute = acClearExecute
    end
    object acClose: TTntAction
      Caption = 'Close'
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acRemove: TTntAction
      Caption = 'Remove'
      ShortCut = 16430
      OnExecute = acRemoveExecute
    end
    object acPaste: TTntAction
      Caption = 'Paste into current item'
      ShortCut = 16470
      OnExecute = acPasteExecute
    end
    object acFindItem: TTntAction
      Caption = 'Find Item'
      ShortCut = 16454
      OnExecute = acFindItemExecute
    end
    object acFindNext: TTntAction
      Caption = 'Find Next'
      ShortCut = 114
      OnExecute = acFindNextExecute
    end
  end
  object popList: TSpTBXPopupMenu
    Left = 86
    Top = 102
    object SpTBXItem2: TSpTBXItem
      Action = acAdd
      CaptionW = 'Add to main list'
    end
    object SpTBXItem7: TSpTBXItem
      Action = acCopy
      CaptionW = 'Copy'
    end
    object SpTBXItem6: TSpTBXItem
      Action = acRemove
      CaptionW = 'Remove'
    end
    object SpTBXSeparatorItem1: TSpTBXSeparatorItem
    end
    object SpTBXItem5: TSpTBXItem
      Action = acPaste
      CaptionW = 'Paste into current item'
    end
    object SpTBXSeparatorItem2: TSpTBXSeparatorItem
    end
    object SpTBXItem3: TSpTBXItem
      Action = acFindItem
      CaptionW = 'Find Item'
    end
    object SpTBXItem8: TSpTBXItem
      Action = acFindNext
      CaptionW = 'Find Next'
    end
  end
end
