inherited frmColors: TfrmColors
  BorderStyle = bsDialog
  Caption = 'Color Preferences'
  ClientHeight = 237
  ClientWidth = 397
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 16
    Width = 94
    Height = 13
    Caption = '&Untranslated items:'
    FocusControl = cbUntranslated
  end
  object TntLabel2: TTntLabel
    Left = 8
    Top = 72
    Width = 54
    Height = 13
    Caption = '&Even rows:'
    FocusControl = cbEvenRows
  end
  object TntLabel3: TTntLabel
    Left = 8
    Top = 128
    Width = 50
    Height = 13
    Caption = '&Odd rows:'
    FocusControl = cbOddRows
  end
  object TntLabel4: TTntLabel
    Left = 192
    Top = 16
    Width = 52
    Height = 13
    Caption = '&Font color:'
    FocusControl = cbUntranslatedFont
  end
  object TntLabel5: TTntLabel
    Left = 192
    Top = 72
    Width = 52
    Height = 13
    Caption = 'Fo&nt color:'
    FocusControl = cbEvenRowFont
  end
  object TntLabel6: TTntLabel
    Left = 192
    Top = 128
    Width = 52
    Height = 13
    Caption = 'Fon&t color:'
    FocusControl = cbOddRowFont
  end
  object btnCancel: TTntButton
    Left = 293
    Top = 190
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
  object btnOK: TTntButton
    Left = 209
    Top = 190
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object cbUntranslated: TColorBox
    Left = 8
    Top = 32
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 0
  end
  object cbEvenRows: TColorBox
    Left = 8
    Top = 88
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 2
  end
  object cbOddRows: TColorBox
    Left = 8
    Top = 144
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 4
  end
  object cbUntranslatedFont: TColorBox
    Left = 192
    Top = 32
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 1
  end
  object cbEvenRowFont: TColorBox
    Left = 192
    Top = 88
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 3
  end
  object cbOddRowFont: TColorBox
    Left = 192
    Top = 144
    Width = 175
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    TabOrder = 5
  end
end
