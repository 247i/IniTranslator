object XilisoftCfgForm: TXilisoftCfgForm
  Left = 241
  Top = 254
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Configuration'
  ClientHeight = 65
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TCB1: TTntCheckBox
    Left = 8
    Top = 9
    Width = 193
    Height = 17
    Caption = 'Do not export empty translations'
    TabOrder = 0
  end
  object TntButton1: TTntButton
    Left = 64
    Top = 32
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = TntButton1Click
  end
end
