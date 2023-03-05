object frmTranslatorPluginWizard: TfrmTranslatorPluginWizard
  Left = 339
  Top = 183
  ActiveControl = edClassName
  BorderStyle = bsDialog
  Caption = 'Create IniTranslatorPlugin'
  ClientHeight = 247
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    447
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 256
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 347
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 7
    Width = 433
    Height = 195
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Options: '
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      433
      195)
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 84
      Height = 13
      Caption = '&Plugin classname:'
    end
    object Label2: TLabel
      Left = 16
      Top = 98
      Width = 24
      Height = 13
      Caption = 'Title:'
    end
    object Label3: TLabel
      Left = 16
      Top = 140
      Width = 108
      Height = 13
      Caption = 'Transintf.pas location:'
    end
    object edClassName: TEdit
      Left = 16
      Top = 42
      Width = 380
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object rbFileParser: TRadioButton
      Left = 32
      Top = 70
      Width = 113
      Height = 17
      Caption = 'IFileParser'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbToolPlugin: TRadioButton
      Left = 168
      Top = 70
      Width = 113
      Height = 17
      Caption = 'IToolPlugin'
      TabOrder = 2
    end
    object edTitle: TEdit
      Left = 16
      Top = 112
      Width = 380
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edTransIntfPath: TEdit
      Left = 16
      Top = 154
      Width = 380
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object btnBrowse: TButton
      Left = 402
      Top = 154
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 5
      OnClick = btnBrowseClick
    end
  end
  object odTransIntf: TOpenDialog
    DefaultExt = 'pas'
    Filter = 
      'TransIntf file|TransIntf.pas|Source files (*.pas)|*.pas|All file' +
      's (*.*)|*.*'
    InitialDir = '.'
    Left = 182
    Top = 28
  end
end
