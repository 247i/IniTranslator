object frmMain: TfrmMain
  Left = 282
  Top = 167
  Caption = 'MS Dictionary Builder'
  ClientHeight = 383
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    524
    383)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 80
    Width = 54
    Height = 13
    Caption = 'Input Files:'
  end
  object Label3: TTntLabel
    Left = 8
    Top = 252
    Width = 121
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Save converted items to:'
  end
  object Label4: TTntLabel
    Left = 8
    Top = 341
    Width = 409
    Height = 13
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 
      'Get the MS dictionaries from ftp://ftp.microsoft.com/developr/ms' +
      'dn/newup/Glossary/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label4Click
  end
  object reInputFiles: TTntRichEdit
    Left = 8
    Top = 96
    Width = 506
    Height = 117
    Anchors = [akLeft, akTop, akRight, akBottom]
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Panel1: TTntPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 65
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWindow
    TabOrder = 1
    DesignSize = (
      524
      65)
    object Label2: TTntLabel
      Left = 8
      Top = 8
      Width = 462
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'This utility converts one or several MS language files into the ' +
        'format used by Ini Translator dictionary files. Add one filespec' +
        ' per row to the box below, select a file to save to and specify ' +
        'whether you want to create a new file or append to an existing.'
      WordWrap = True
    end
    object Image1: TImage
      Left = 479
      Top = 11
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002001010100000000000280100002600000020201000
        00000000E80200004E0100002800000010000000200000000100040000000000
        8000000000000000000000001000000010000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000007888888
        8888800007FFFFFFFFFF800007FFFFF000FF800007FF0004430F800007FFFF04
        440F800007FF0008440F800007FFFFF000FF800007FF000000FF800007FFFFFF
        FFFF800007FF000F00FF800007FFFFFFFFFF800007FFFFFFFFFF800007F0F0F0
        F0F0F000000F7F7F7F7F00000000000000000000C00700008003000080030000
        8003000080030000800300008003000080030000800300008003000080030000
        800300008003000080030000C0070000EAAF0000280000002000000040000000
        0100040000000000000200000000000000000000100000001000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
        00000000000000000000000000078888888888888888888880800000007FFFFF
        FFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000
        000FFFFF00000FFFF8080000007FFFFFFFFFFFF0C22240FFF8080000007FF000
        000FFF0CCC22240FF8080000007FFFFFFFFFFF4CCCC2220FF8080000007FFFFF
        FFFFFF4ACCCC220FF8080000007FF00000000042ACC2220FF8080000007FFFFF
        FFFFFF4A27CC220FF8080000007FF000000000B4ACCC208FF8080000007FFFFF
        FFFFFFFB444400FFF8080000007FF000000000000000000FF8080000007FFFFF
        FFFFFFFFFFFFFFFFF8080000007FF000000000000000000FF8080000007FFFFF
        FFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000
        000FFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FFFFF
        FFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000
        000FFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000
        000FFFFFFF0F000FF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FFFFF
        FFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007F0FF0
        FF0FF0FF0FF0FF0FF7080000007F0FF0FF0FF0FF0FF0FF0FF70800000007F77F
        77F77F77F77F77F77F70000000000000000000000000000000000000F000001F
        E000000FC0000007C0000007C0000007C0000007C0000007C0000007C0000007
        C0000007C0000007C0000007C0000007C0000007C0000007C0000007C0000007
        C0000007C0000007C0000007C0000007C0000007C0000007C0000007C0000007
        C0000007C0000007C0000007C0000007C0000007E000000FF24924BF}
      Transparent = True
    end
  end
  object edDictFile: TTntEdit
    Left = 8
    Top = 268
    Width = 418
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
  object btnOutBrowse: TTntButton
    Left = 433
    Top = 268
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Browse...'
    TabOrder = 3
    OnClick = btnOutBrowseClick
  end
  object rbAppend: TTntRadioButton
    Left = 16
    Top = 300
    Width = 113
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Append'
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object rbOverwrite: TTntRadioButton
    Left = 144
    Top = 300
    Width = 113
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Overwrite'
    TabOrder = 5
  end
  object btnConvert: TTntButton
    Left = 433
    Top = 336
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Convert'
    Default = True
    TabOrder = 6
    OnClick = btnConvertClick
  end
  object btnSelect: TTntButton
    Left = 433
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Select...'
    TabOrder = 7
    OnClick = btnSelectClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 364
    Width = 524
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object odInFiles: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'CSV Files (*.csv)|*.csv|All files (*.*)|*.*'
    InitialDir = '.'
    Options = [ofNoValidate, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 32
    Top = 112
  end
  object sdOutFile: TSaveDialog
    DefaultExt = 'dct'
    FileName = 'Dictionary files (*.dct)|*.dct|All files (*.*)|*.*'
    InitialDir = '.'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofEnableSizing]
    Left = 64
    Top = 112
  end
end
