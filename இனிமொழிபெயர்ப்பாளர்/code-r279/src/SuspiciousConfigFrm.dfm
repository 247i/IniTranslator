inherited frmConfigSuspicious: TfrmConfigSuspicious
  Left = 374
  Top = 194
  ActiveControl = chkLeading
  BorderStyle = bsDialog
  Caption = 'Configure suspicious translations'
  ClientHeight = 332
  ClientWidth = 334
  PixelsPerInch = 96
  TextHeight = 13
  object TntBevel1: TTntBevel
    Left = 8
    Top = 11
    Width = 315
    Height = 113
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object TntLabel2: TTntLabel
    Left = 8
    Top = 140
    Width = 289
    Height = 13
    Caption = '&Match between original and translation (one string per row):'
    FocusControl = reItems
  end
  object TntLabel1: TTntLabel
    Left = 17
    Top = 5
    Width = 95
    Height = 13
    Caption = 'Treat as suspicious:'
    Transparent = False
  end
  object chkLeading: TTntCheckBox
    Left = 16
    Top = 27
    Width = 299
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = '&Leading spaces mismatch'
    TabOrder = 0
  end
  object chkTrailing: TTntCheckBox
    Left = 16
    Top = 43
    Width = 299
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = '&Trailing spaces mismatch'
    TabOrder = 1
  end
  object chkEndControl: TTntCheckBox
    Left = 16
    Top = 59
    Width = 299
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Mismatched &control characters at end'
    TabOrder = 2
  end
  object chkIdentical: TTntCheckBox
    Left = 16
    Top = 75
    Width = 299
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = '&Original and translation are the same'
    TabOrder = 3
  end
  object chkEmptyTranslation: TTntCheckBox
    Left = 16
    Top = 91
    Width = 299
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Translation is &empty'
    TabOrder = 4
  end
  object btnOK: TTntButton
    Left = 145
    Top = 301
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object btnCancel: TTntButton
    Left = 233
    Top = 301
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
  object reItems: TTntRichEdit
    Left = 8
    Top = 160
    Width = 314
    Height = 132
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkFlat
    BorderStyle = bsNone
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 5
    WantTabs = True
  end
end
