object FrmKbdCfg: TFrmKbdCfg
  Left = 0
  Top = 0
  Width = 384
  Height = 392
  TabOrder = 0
  DesignSize = (
    384
    392)
  object Label1: TTntLabel
    Left = 8
    Top = 32
    Width = 53
    Height = 13
    Caption = 'Cate&gories:'
    FocusControl = lbCategories
  end
  object Label2: TTntLabel
    Left = 192
    Top = 32
    Width = 55
    Height = 13
    Caption = 'Co&mmands:'
    FocusControl = lvCommands
  end
  object lblNewShortCut: TTntLabel
    Left = 192
    Top = 192
    Width = 66
    Height = 13
    Caption = '&New shortcut:'
  end
  object Label4: TTntLabel
    Left = 8
    Top = 192
    Width = 83
    Height = 13
    Caption = '&Current shortcuts:'
    FocusControl = lbCurrentShortCuts
  end
  object lblAssignedTo: TTntLabel
    Left = 8
    Top = 278
    Width = 369
    Height = 13
    Anchors = [akLeft, akBottom]
  end
  object lblAssignedTo2: TTntLabel
    Left = 193
    Top = 278
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
  end
  object lblCommand: TTntLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Select command:'
  end
  object bvTop: TBevel
    Left = 96
    Top = 14
    Width = 280
    Height = 10
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object lblShortcut: TTntLabel
    Left = 8
    Top = 168
    Width = 74
    Height = 13
    Caption = 'Select shortcut:'
  end
  object bvMiddle: TBevel
    Left = 88
    Top = 174
    Width = 288
    Height = 10
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object lblDescription: TTntLabel
    Left = 23
    Top = 315
    Width = 355
    Height = 38
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    WordWrap = True
  end
  object lblBottom: TTntLabel
    Left = 8
    Top = 299
    Width = 56
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Description:'
  end
  object bvBottom: TBevel
    Left = 72
    Top = 306
    Width = 304
    Height = 6
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lvCommands: TTntListView
    Left = 192
    Top = 48
    Width = 180
    Height = 108
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    Columns = <
      item
        AutoSize = True
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = lvCommandsChange
    OnEnter = lvCommandsEnter
    OnSelectItem = lvCommandsSelectItem
  end
  object lbCategories: TTntListBox
    Left = 8
    Top = 48
    Width = 170
    Height = 108
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbCategoriesClick
    OnEnter = lbCategoriesEnter
  end
  object lbCurrentShortCuts: TTntListBox
    Left = 8
    Top = 208
    Width = 170
    Height = 64
    Anchors = [akLeft, akTop, akBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 2
  end
  object btnAdd: TTntButton
    Left = 8
    Top = 365
    Width = 80
    Height = 23
    Action = acAdd
    Anchors = [akLeft, akBottom]
    Default = True
    TabOrder = 3
  end
  object btnRemove: TTntButton
    Left = 90
    Top = 365
    Width = 80
    Height = 23
    Action = acRemove
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object btnReset: TTntButton
    Left = 172
    Top = 365
    Width = 80
    Height = 23
    Action = acReset
    Anchors = [akLeft, akBottom]
    Cancel = True
    TabOrder = 5
  end
  object btnClose: TTntButton
    Left = 255
    Top = 365
    Width = 80
    Height = 23
    Action = acClose
    Anchors = [akLeft, akBottom]
    ModalResult = 1
    TabOrder = 6
  end
  object alMain: TTntActionList
    OnUpdate = alMainUpdate
    Left = 56
    Top = 80
    object acAdd: TTntAction
      Caption = '&Add'
      OnExecute = acAddExecute
    end
    object acRemove: TTntAction
      Caption = '&Remove'
      OnExecute = acRemoveExecute
    end
    object acReset: TTntAction
      Caption = 'R&eset'
      OnExecute = acResetExecute
    end
    object acClose: TTntAction
      Caption = '&Close'
      OnExecute = acCloseExecute
    end
  end
end
