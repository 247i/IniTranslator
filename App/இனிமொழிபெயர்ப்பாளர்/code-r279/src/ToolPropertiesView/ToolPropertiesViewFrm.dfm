object frmToolPropertiesView: TfrmToolPropertiesView
  Left = 460
  Top = 210
  Width = 699
  Height = 514
  Caption = 'View all properties'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TntStatusBar1: TTntStatusBar
    Left = 0
    Top = 461
    Width = 691
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object lvItems: TTntListView
    Left = 0
    Top = 0
    Width = 691
    Height = 461
    Align = alClient
    BevelKind = bkFlat
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Index'
      end
      item
        Caption = 'Section'
        Width = 100
      end
      item
        Caption = 'Name'
        Width = 100
      end
      item
        Caption = 'Original'
        Width = 100
      end
      item
        Caption = 'Translation'
        Width = 100
      end
      item
        Caption = 'OrigComments'
        Width = 100
      end
      item
        Caption = 'TransComments'
        Width = 100
      end
      item
        Caption = 'PreData'
        Width = 100
      end
      item
        Caption = 'PostData'
        Width = 100
      end
      item
        Caption = 'OrigQuote'
        Width = 70
      end
      item
        Caption = 'TransQuote'
        Width = 70
      end
      item
        Caption = 'PrivateStorage'
        Width = 100
      end
      item
        Caption = 'ClearOriginal'
        Width = 100
      end
      item
        Caption = 'ClearTranslation'
        Width = 100
      end>
    GridLines = True
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = popListView
    TabOrder = 1
    ViewStyle = vsReport
    OnData = lvItemsData
  end
  object alMain: TTntActionList
    Left = 184
    Top = 96
    object acSync: TTntAction
      Caption = 'Select in main list'
      ShortCut = 16416
      OnExecute = acSyncExecute
    end
    object acClose: TTntAction
      Caption = 'Close'
      ShortCut = 27
      OnExecute = acCloseExecute
    end
  end
  object popListView: TTntPopupMenu
    Left = 256
    Top = 112
    object Selectinmainlist1: TTntMenuItem
      Action = acSync
    end
    object N1: TTntMenuItem
      Caption = '-'
    end
    object Close1: TTntMenuItem
      Action = acClose
    end
  end
end
