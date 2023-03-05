object frmPOExport: TfrmPOExport
  Left = 439
  Top = 283
  Width = 400
  Height = 300
  Caption = 'PO Export Settings'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  Icon.Data = {
    000001000200101010000000000028010000260000002020100000000000E802
    00004E0100002800000010000000200000000100040000000000800000000000
    0000000000001000000010000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF000000000000000000078888888888800007FF
    FFFFFFFF800007FFFFF000FF800007FF0004430F800007FFFF04440F800007FF
    0008440F800007FFFFF000FF800007FF000000FF800007FFFFFFFFFF800007FF
    000F00FF800007FFFFFFFFFF800007FFFFFFFFFF800007F0F0F0F0F0F000000F
    7F7F7F7F00000000000000000000C00700008003000080030000800300008003
    0000800300008003000080030000800300008003000080030000800300008003
    000080030000C0070000EAAF0000280000002000000040000000010004000000
    0000000200000000000000000000100000001000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    00000000000000078888888888888888888880800000007FFFFFFFFFFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000000FFFFF0000
    0FFFF8080000007FFFFFFFFFFFF0C22240FFF8080000007FF000000FFF0CCC22
    240FF8080000007FFFFFFFFFFF4CCCC2220FF8080000007FFFFFFFFFFF4ACCCC
    220FF8080000007FF00000000042ACC2220FF8080000007FFFFFFFFFFF4A27CC
    220FF8080000007FF000000000B4ACCC208FF8080000007FFFFFFFFFFFFB4444
    00FFF8080000007FF000000000000000000FF8080000007FFFFFFFFFFFFFFFFF
    FFFFF8080000007FF000000000000000000FF8080000007FFFFFFFFFFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000000FFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000000FFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FF000000FFFFFFF0F
    000FF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007FFFFFFFFFFFFFFFFF
    FFFFF8080000007FFFFFFFFFFFFFFFFFFFFFF8080000007F0FF0FF0FF0FF0FF0
    FF0FF7080000007F0FF0FF0FF0FF0FF0FF0FF70800000007F77F77F77F77F77F
    77F77F70000000000000000000000000000000000000F000001FE000000FC000
    0007C0000007C0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007E000000FF24924BF}
  OldCreateOrder = False
  ShowHint = True
  DesignSize = (
    392
    268)
  PixelsPerInch = 96
  TextHeight = 13
  object lblFilename: TTntLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = '&Filename:'
    FocusControl = edFilename
  end
  object lblPreview: TTntLabel
    Left = 8
    Top = 54
    Width = 91
    Height = 13
    Caption = '&Preview (editable):'
  end
  object rePreview: TTntRichEdit
    Left = 8
    Top = 70
    Width = 374
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
  object edFilename: TTntEdit
    Left = 8
    Top = 24
    Width = 346
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object btnBrowse: TTntButton
    Left = 358
    Top = 24
    Width = 21
    Height = 21
    Action = acSaveFile
    Anchors = [akTop, akRight]
    TabOrder = 1
  end
  object btnOK: TTntButton
    Left = 221
    Top = 238
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 5
  end
  object btnCancel: TTntButton
    Left = 301
    Top = 238
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object chkCompileMO: TTntCheckBox
    Left = 8
    Top = 187
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Compile to &MO:'
    TabOrder = 3
    OnClick = chkCompileMOClick
  end
  object edMOCmdLine: TTntEdit
    Left = 16
    Top = 209
    Width = 363
    Height = 21
    Hint = 
      'Command-line to invoke the MO compiler (msgfmt.exe by default).'#13 +
      #10'Use "%i" to insert the filename in "Filename" as the file to co' +
      'mpile and use "%o" to change the input file extension to .mo.'
    Anchors = [akLeft, akRight, akBottom]
    Enabled = False
    TabOrder = 4
    Text = 'msgfmt "%i" -o "%o"'
  end
  object alPOExport: TTntActionList
    OnUpdate = alPOExportUpdate
    Left = 72
    Top = 88
    object acSaveFile: TTntAction
      Caption = '...'
      OnExecute = acSaveFileExecute
    end
  end
  object SaveDialog1: TTntSaveDialog
    DefaultExt = 'po'
    Filter = 'PO Files|*.po|All files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 136
    Top = 88
  end
end
