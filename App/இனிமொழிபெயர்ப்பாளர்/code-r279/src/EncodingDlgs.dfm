object frmEncoding: TfrmEncoding
  Left = 521
  Top = 304
  BorderStyle = bsNone
  Caption = 'Open Dialog Extension'
  ClientHeight = 54
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  DesignSize = (
    364
    54)
  PixelsPerInch = 96
  TextHeight = 13
  object lblEncoding: TTntLabel
    Left = 27
    Top = 6
    Width = 47
    Height = 13
    Caption = '&Encoding:'
    FocusControl = cbEncodings
  end
  object bvlTopLine: TBevel
    Left = 0
    Top = 0
    Width = 550
    Height = 3
    Shape = bsTopLine
    Visible = False
  end
  object cbEncodings: TTntComboBox
    Left = 105
    Top = 2
    Width = 246
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object chkHeader: TTntCheckBox
    Left = 41
    Top = 25
    Width = 162
    Height = 17
    Anchors = [akTop, akRight]
    Caption = '&Header'
    TabOrder = 1
  end
  object chkFooter: TTntCheckBox
    Left = 215
    Top = 25
    Width = 169
    Height = 17
    Anchors = [akTop, akRight]
    Caption = '&Footer'
    TabOrder = 2
  end
end
