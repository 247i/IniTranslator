object frmMain: TfrmMain
  Left = 199
  Top = 172
  BorderStyle = bsDialog
  Caption = 'SDF Split and Extract'
  ClientHeight = 206
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    506
    206)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 16
    Width = 40
    Height = 13
    Caption = 'SDF file:'
  end
  object Label2: TTntLabel
    Left = 8
    Top = 65
    Width = 69
    Height = 13
    Caption = 'Output folder:'
  end
  object edSDFFile: TTntEdit
    Left = 8
    Top = 31
    Width = 466
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object btnSDFFile: TTntButton
    Left = 478
    Top = 31
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 1
    OnClick = btnSDFFileClick
  end
  object edSaveFolder: TTntEdit
    Left = 8
    Top = 80
    Width = 466
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object btnSaveFolder: TTntButton
    Left = 478
    Top = 80
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 3
    OnClick = btnSaveFolderClick
  end
  object btnOK: TTntButton
    Left = 335
    Top = 170
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Split'
    Default = True
    ModalResult = 1
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancel: TTntButton
    Left = 419
    Top = 170
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 8
    OnClick = btnCancelClick
  end
  object chkExtractLanguage: TTntCheckBox
    Left = 16
    Top = 121
    Width = 120
    Height = 17
    Caption = 'E&xtract language:'
    TabOrder = 4
    OnClick = chkExtractLanguageClick
  end
  object cbLanguages: TTntComboBox
    Left = 147
    Top = 119
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
    Text = 'af'
    Items.Strings = (
      'af'
      'ar'
      'as-IN'
      'be-BY'
      'bg'
      'br'
      'bs'
      'ca'
      'cs'
      'cy'
      'da'
      'el'
      'en-GB'
      'en-ZA'
      'eo'
      'es'
      'et'
      'fi'
      'fr'
      'ga'
      'gu'
      'gu-IN'
      'he'
      'hi-IN'
      'hr'
      'hu'
      'it'
      'ja'
      'ka'
      'km'
      'ko'
      'ku'
      'lt'
      'mk'
      'ml-IN'
      'mr-IN'
      'nb'
      'ne'
      'nl'
      'nn'
      'nr'
      'ns'
      'or-IN'
      'pa-IN'
      'pl'
      'pt'
      'pt-BR'
      'ru'
      'rw'
      'sh-YU'
      'sk'
      'sl'
      'sr-CS'
      'ss'
      'st'
      'sv'
      'sw-TZ'
      'ta'
      'ta-IN'
      'te-IN'
      'tg'
      'th'
      'ti-ER'
      'tn'
      'tr'
      'ts'
      'uk'
      'ur-IN'
      've'
      'vi'
      'xh'
      'zh-CN'
      'zh-TW'
      'zu')
  end
  object chkSortItems: TTntCheckBox
    Left = 14
    Top = 154
    Width = 274
    Height = 17
    Caption = 'Sort items in output file(s)'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object odSDFFile: TTntOpenDialog
    DefaultExt = 'sdf'
    Filter = 'SDF files|*.sdf|GSI files|*.gsi|All files|*.*'
    InitialDir = '.'
    Left = 147
    Top = 7
  end
end
