inherited frmDictEdit: TfrmDictEdit
  Left = 448
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Edit Dictionary'
  ClientHeight = 348
  ClientWidth = 429
  Constraints.MinHeight = 300
  Constraints.MinWidth = 315
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 15
    Width = 40
    Height = 13
    Caption = '&Original:'
    FocusControl = cbOriginal
  end
  object TntLabel2: TTntLabel
    Left = 8
    Top = 79
    Width = 62
    Height = 13
    Caption = '&Translations:'
    FocusControl = lbTranslations
  end
  object TntBevel1: TTntBevel
    Left = 1
    Top = 308
    Width = 427
    Height = 4
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object TntLabel3: TTntLabel
    Left = 8
    Top = 320
    Width = 30
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'S&how:'
    FocusControl = cbFilter
  end
  object cbOriginal: TTntComboBox
    Left = 8
    Top = 32
    Width = 408
    Height = 21
    Hint = 'The current original string'
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnChange = cbOriginalChange
  end
  object btnAddOriginal: TTntButton
    Left = 247
    Top = 64
    Width = 80
    Height = 23
    Hint = 'Add a new original'
    Action = acAddOriginal
    Anchors = [akTop, akRight]
    TabOrder = 1
  end
  object btnRemoveOriginal: TTntButton
    Left = 335
    Top = 64
    Width = 80
    Height = 23
    Hint = 'Remove selected original'
    Action = acRemoveOriginal
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object lbTranslations: TTntListBox
    Left = 8
    Top = 96
    Width = 408
    Height = 161
    Hint = 
      'Displays available translations. Bold items are the default tran' +
      'slations.'
    Style = lbVirtualOwnerDraw
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkFlat
    BorderStyle = bsNone
    ItemHeight = 13
    PopupMenu = popTranslations
    TabOrder = 3
    OnClick = lbTranslationsClick
    OnDblClick = lbTranslationsDblClick
    OnDrawItem = lbTranslationsDrawItem
  end
  object edTranslation: TTntEdit
    Left = 8
    Top = 273
    Width = 226
    Height = 21
    Hint = 'Type in a new translation here'
    Anchors = [akLeft, akRight, akBottom]
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 4
  end
  object btnAddTranslation: TTntButton
    Left = 247
    Top = 272
    Width = 80
    Height = 23
    Hint = 'Add a new translation'
    Action = acAddTranslation
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  object btnRemoveTranslation: TTntButton
    Left = 335
    Top = 272
    Width = 80
    Height = 23
    Hint = 'Remove the selected translation'
    Action = acRemoveTranslation
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object btnOK: TTntButton
    Left = 247
    Top = 317
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 8
  end
  object btnCancel: TTntButton
    Left = 335
    Top = 317
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object cbFilter: TTntComboBox
    Left = 48
    Top = 316
    Width = 184
    Height = 21
    Hint = 'Change the selection to see different subsets of the dictionary'
    Style = csDropDownList
    Anchors = [akLeft, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 7
    OnChange = cbFilterChange
    Items.Strings = (
      'All items'
      'Items with translations'
      'Items without translations'
      'Items with > 1 translations'
      'Items with 1 translation')
  end
  object alDictEdit: TTntActionList
    OnUpdate = alDictEditUpdate
    Left = 109
    Top = 51
    object acAddOriginal: TTntAction
      Caption = 'A&dd'
      OnExecute = acAddOriginalExecute
    end
    object acRemoveOriginal: TTntAction
      Caption = 'Re&move'
      OnExecute = acRemoveOriginalExecute
    end
    object acAddTranslation: TTntAction
      Caption = '&Add'
      OnExecute = acAddTranslationExecute
    end
    object acRemoveTranslation: TTntAction
      Caption = '&Remove'
      OnExecute = acRemoveTranslationExecute
    end
    object acMakeDefault: TTntAction
      Caption = 'Make Default'
      ShortCut = 16416
      OnExecute = acMakeDefaultExecute
    end
  end
  object popTranslations: TTntPopupMenu
    Left = 266
    Top = 119
    object MakeDefault1: TTntMenuItem
      Action = acMakeDefault
      Default = True
    end
  end
end
