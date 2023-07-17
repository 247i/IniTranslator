object frmImportExport: TfrmImportExport
  Left = 315
  Top = 158
  ActiveControl = lvItems
  BorderStyle = bsDialog
  Caption = 'Import/Export'
  ClientHeight = 283
  ClientWidth = 332
  Color = clBtnFace
  Constraints.MinHeight = 170
  Constraints.MinWidth = 280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    332
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object lblList: TTntLabel
    Left = 10
    Top = 12
    Width = 68
    Height = 13
    Caption = 'Import/Export'
    FocusControl = lvItems
  end
  object lvItems: TTntListView
    Left = 7
    Top = 29
    Width = 317
    Height = 207
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    Columns = <
      item
        AutoSize = True
      end>
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvItemsDblClick
    OnEnter = lvItemsEnter
  end
  object btnOK: TTntButton
    Left = 154
    Top = 247
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TTntButton
    Left = 240
    Top = 247
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 3
  end
  object btnConfigure: TTntButton
    Left = 16
    Top = 247
    Width = 80
    Height = 23
    Action = acConfigure
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object stNothingToShow: TTntStaticText
    Left = 76
    Top = 38
    Width = 184
    Height = 17
    Anchors = [akTop]
    Caption = '(there is nothing to show in this view)'
    TabOrder = 4
  end
  object acImportExport: TTntActionList
    OnUpdate = acImportExportUpdate
    Left = 40
    Top = 40
    object acImport: TTntAction
      Caption = 'Import'
      OnExecute = acImportExecute
    end
    object acExport: TTntAction
      Caption = 'Export'
      OnExecute = acExportExecute
    end
    object acConfigure: TTntAction
      Caption = 'Configure...'
      OnExecute = acConfigureExecute
    end
  end
end
