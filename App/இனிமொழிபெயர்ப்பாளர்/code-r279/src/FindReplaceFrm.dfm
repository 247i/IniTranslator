object frmFindReplace: TfrmFindReplace
  Left = 214
  Top = 156
  ActiveControl = cbFindWhat
  BorderStyle = bsDialog
  Caption = 'Find/Replace'
  ClientHeight = 154
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 34
    Top = 12
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fi&nd what:'
    FocusControl = cbFindWhat
  end
  object lblReplaceWith: TTntLabel
    Left = 20
    Top = 38
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Re&place with:'
    FocusControl = cbReplaceWith
    Visible = False
  end
  object lblFindIn: TTntLabel
    Left = 196
    Top = 67
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Caption = 'Find &in:'
    FocusControl = cbFindWhere
  end
  object chkMatchLine: TTntCheckBox
    Left = 18
    Top = 69
    Width = 170
    Height = 17
    Hint = 'Text must match the entire line'
    Caption = 'Match &line'
    TabOrder = 2
  end
  object chkMatchCase: TTntCheckBox
    Left = 18
    Top = 88
    Width = 170
    Height = 17
    Hint = 'Case of letters (UPPER/lower) must match'
    Caption = 'Match &case'
    TabOrder = 3
  end
  object cbFindWhat: TTntComboBox
    Left = 90
    Top = 9
    Width = 235
    Height = 21
    Hint = 'The text to search for'
    BevelInner = bvNone
    BevelOuter = bvRaised
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbFindWhatChange
  end
  object btnFindNext: TTntButton
    Left = 337
    Top = 6
    Width = 80
    Height = 23
    Hint = 'Find next occurence of the text'
    Caption = '&Find Next'
    Default = True
    Enabled = False
    TabOrder = 7
    OnClick = btnFindNextClick
  end
  object btnClose: TTntButton
    Left = 337
    Top = 83
    Width = 80
    Height = 23
    Hint = 'Close this dialog'
    Action = acClose
    Cancel = True
    ModalResult = 2
    TabOrder = 10
  end
  object cbReplaceWith: TTntComboBox
    Left = 90
    Top = 35
    Width = 235
    Height = 21
    Hint = 'The text to replace the found text with'
    BevelInner = bvNone
    BevelOuter = bvRaised
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object chkSearchUp: TTntCheckBox
    Left = 18
    Top = 107
    Width = 170
    Height = 17
    Hint = 'Search upwards in the list'
    Caption = 'Search &up'
    TabOrder = 4
  end
  object cbFindWhere: TTntComboBox
    Left = 236
    Top = 64
    Width = 89
    Height = 21
    Hint = 'Select the field(s) to search in'
    BevelInner = bvNone
    BevelOuter = bvRaised
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Original'
    Items.Strings = (
      'Original'
      'Translation'
      'Both')
  end
  object btnReplace: TTntBitBtn
    Left = 337
    Top = 31
    Width = 80
    Height = 23
    Hint = 'Replace one item/show replace options'
    Caption = '&Replace'
    TabOrder = 8
    OnClick = btnReplaceClick
    Glyph.Data = {
      C6030000424DC60300000000000036000000280000000F000000130000000100
      1800000000009003000000000000000000000000000000000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600000000
      0000000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D600000000000000000000
      0000000000000000000000CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D600000000
      0000000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D600000000000000000000
      0000000000000000000000CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
      D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6
      CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
      D6CED3D6CED3D6000000}
    Layout = blGlyphRight
    Margin = 2
  end
  object btnReplaceAll: TTntButton
    Left = 337
    Top = 57
    Width = 80
    Height = 23
    Hint = 'Replace all occurences of the text'
    Caption = 'Replace &All'
    TabOrder = 9
    Visible = False
    OnClick = btnReplaceAllClick
  end
  object chkFuzzy: TTntCheckBox
    Left = 18
    Top = 126
    Width = 170
    Height = 17
    Hint = 'Skip any control characters (non-alphanumeric) when searching'
    Caption = 'Ignore control c&haracters'
    TabOrder = 5
  end
  object acClipboard: TTntActionList
    Left = 294
    Top = 102
    object acCut: TTntAction
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
      OnExecute = acCutExecute
    end
    object acCopy: TTntAction
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
      OnExecute = acCopyExecute
    end
    object acPaste: TTntAction
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
      OnExecute = acPasteExecute
    end
    object acSelectAll: TTntAction
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
      OnExecute = acSelectAllExecute
    end
    object acUndo: TTntAction
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ShortCut = 16474
      OnExecute = acUndoExecute
    end
    object acClose: TTntAction
      Caption = 'Close'
      ShortCut = 27
      SecondaryShortCuts.Strings = (
        'Alt+F4')
      OnExecute = acCloseExecute
    end
  end
end
