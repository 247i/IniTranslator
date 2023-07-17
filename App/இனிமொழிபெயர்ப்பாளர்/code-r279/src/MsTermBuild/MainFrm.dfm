object frmMain: TfrmMain
  Left = 218
  Top = 250
  BorderStyle = bsDialog
  Caption = 'MS Terminology Translations Builder'
  ClientHeight = 258
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    577
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 22
    Top = 26
    Width = 73
    Height = 13
    Caption = '&Input filename:'
    FocusControl = edInput
  end
  object TntLabel2: TTntLabel
    Left = 22
    Top = 135
    Width = 81
    Height = 13
    Caption = '&Output filename:'
    FocusControl = edOutput
  end
  object TntLabel3: TTntLabel
    Left = 21
    Top = 78
    Width = 40
    Height = 13
    Caption = 'O&riginal:'
    FocusControl = cbOriginal
  end
  object TntLabel4: TTntLabel
    Left = 287
    Top = 78
    Width = 57
    Height = 13
    Caption = '&Translation:'
    FocusControl = cbTranslation
  end
  object TntLabel5: TTntLabel
    Left = 21
    Top = 227
    Width = 538
    Height = 13
    Cursor = crHandPoint
    Caption = 
      'Get Microsoft Terminology Translations.csv from http://www.micro' +
      'soft.com/globaldev/tools/MILSGlossary.mspx '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsUnderline]
    ParentFont = False
    ShowAccelChar = False
    OnClick = TntLabel5Click
  end
  object edInput: TTntEdit
    Left = 21
    Top = 42
    Width = 444
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = edInputChange
  end
  object btnInput: TTntButton
    Left = 478
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Browse...'
    TabOrder = 1
    OnClick = btnInputClick
  end
  object edOutput: TTntEdit
    Left = 21
    Top = 151
    Width = 444
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    OnChange = edOutputChange
  end
  object btnOutput: TTntButton
    Left = 478
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Bro&wse...'
    TabOrder = 5
    OnClick = btnOutputClick
  end
  object cbOriginal: TTntComboBox
    Left = 21
    Top = 95
    Width = 253
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 2
  end
  object cbTranslation: TTntComboBox
    Left = 287
    Top = 95
    Width = 264
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 3
  end
  object btnCreate: TTntButton
    Left = 366
    Top = 193
    Width = 187
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Create dictionary'
    Default = True
    TabOrder = 7
    OnClick = btnCreateClick
  end
  object chkOverwrite: TTntCheckBox
    Left = 21
    Top = 192
    Width = 239
    Height = 17
    Caption = 'Over&write output file'
    TabOrder = 6
  end
  object dlgInput: TTntOpenDialog
    DefaultExt = '.csv'
    FileName = 'Microsoft Terminology.csv'
    Filter = 'Microsoft Terminology Files|*.csv|All files|*.*'
    InitialDir = '.'
    Options = [ofFileMustExist, ofEnableSizing]
    Left = 455
    Top = 50
  end
  object dlgOutput: TTntSaveDialog
    DefaultExt = 'dct'
    Filter = 'Dictionary files|*.dct|All files|*.*'
    InitialDir = '.'
    Options = [ofEnableSizing]
    Left = 455
    Top = 116
  end
end
