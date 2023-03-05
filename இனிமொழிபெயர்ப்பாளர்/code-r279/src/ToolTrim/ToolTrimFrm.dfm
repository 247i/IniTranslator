object frmToolTrim: TfrmToolTrim
  Left = 636
  Top = 240
  ActiveControl = edTrimWhat
  BorderStyle = bsDialog
  Caption = 'Trim Options'
  ClientHeight = 228
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    390
    228)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTrimWhat: TTntLabel
    Left = 8
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Trim wh&at:'
    FocusControl = edTrimWhat
  end
  object lblTrimWhere: TTntLabel
    Left = 8
    Top = 88
    Width = 57
    Height = 13
    Caption = 'Trim wh&ere:'
    FocusControl = cbTrimWhere
  end
  object lblTrimHow: TTntLabel
    Left = 8
    Top = 136
    Width = 47
    Height = 13
    Caption = 'Trim h&ow:'
    FocusControl = cbTrimHow
  end
  object edTrimWhat: TTntEdit
    Left = 8
    Top = 31
    Width = 373
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 0
  end
  object cbTrimWhere: TTntComboBox
    Left = 8
    Top = 104
    Width = 373
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 2
    Text = 'Both'
    Items.Strings = (
      'Original'
      'Translation'
      'Both')
  end
  object cbTrimHow: TTntComboBox
    Left = 8
    Top = 152
    Width = 373
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 3
    Text = 'Both'
    Items.Strings = (
      'Leading'
      'Trailing'
      'Both')
  end
  object chkTrimWhitespace: TTntCheckBox
    Left = 16
    Top = 60
    Width = 364
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Trim additional &whitespace also'
    TabOrder = 1
  end
  object btnOK: TTntButton
    Left = 204
    Top = 190
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TTntButton
    Left = 292
    Top = 190
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
end
