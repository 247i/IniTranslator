inherited frmDictTranslationSelect: TfrmDictTranslationSelect
  ActiveControl = edTranslation
  BorderStyle = bsDialog
  Caption = 'Select Translation'
  ClientHeight = 363
  ClientWidth = 402
  Constraints.MinHeight = 390
  Constraints.MinWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 16
    Width = 40
    Height = 13
    Caption = '&Original:'
    FocusControl = edOriginal
  end
  object TntLabel2: TTntLabel
    Left = 8
    Top = 64
    Width = 57
    Height = 13
    Caption = '&Translation:'
    FocusControl = edTranslation
  end
  object TntLabel3: TTntLabel
    Left = 8
    Top = 112
    Width = 106
    Height = 13
    Caption = 'A&vailable translations:'
    FocusControl = lbTranslations
  end
  object edOriginal: TTntEdit
    Left = 8
    Top = 32
    Width = 379
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edTranslation: TTntEdit
    Left = 8
    Top = 80
    Width = 379
    Height = 21
    Hint = 'Suggested translation'
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
    OnChange = edTranslationChange
  end
  object lbTranslations: TTntListBox
    Left = 8
    Top = 128
    Width = 379
    Height = 139
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkFlat
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 2
    OnClick = lbTranslationsClick
    OnDblClick = lbTranslationsDblClick
  end
  object btnUse: TTntButton
    Left = 45
    Top = 324
    Width = 80
    Height = 23
    Hint = 'Use the suggested translation'
    Anchors = [akRight, akBottom]
    Caption = '&Change'
    Default = True
    ModalResult = 1
    TabOrder = 7
    OnClick = btnUseClick
  end
  object btnCancel: TTntButton
    Left = 306
    Top = 324
    Width = 80
    Height = 23
    Hint = 'Stop translating'
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 8
    OnClick = btnCancelClick
  end
  object btnIgnore: TTntButton
    Left = 219
    Top = 324
    Width = 80
    Height = 23
    Hint = 'Ignore this item (don'#39't translate)'
    Anchors = [akRight, akBottom]
    Caption = '&Ignore'
    ModalResult = 1
    TabOrder = 5
    OnClick = btnIgnoreClick
  end
  object btnAdd: TTntButton
    Left = 132
    Top = 324
    Width = 80
    Height = 23
    Hint = 'Add suggested translation to dictionary'
    Anchors = [akRight, akBottom]
    Caption = '&Add'
    TabOrder = 6
    OnClick = btnAddClick
  end
  object chkIgnoreNonEmpty: TTntCheckBox
    Left = 24
    Top = 275
    Width = 361
    Height = 17
    Hint = 'Skip items that are already translated'
    Anchors = [akLeft, akRight, akBottom]
    Caption = '&Don'#39't check translated items'
    TabOrder = 3
  end
  object chkDontAskAgain: TCheckBox
    Left = 24
    Top = 294
    Width = 361
    Height = 17
    Hint = 'Don'#39't show this dialog again and use the latest response'
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Don'#39't &ask again (in this session)'
    TabOrder = 4
  end
end
