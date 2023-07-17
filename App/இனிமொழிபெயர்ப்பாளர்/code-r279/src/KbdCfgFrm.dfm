object frmConfigKbd: TfrmConfigKbd
  Left = 438
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Configure Keyboard'
  ClientHeight = 403
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline FrmKbdCfg1: TFrmKbdCfg
    Left = 0
    Top = 0
    Width = 389
    Height = 403
    Align = alClient
    TabOrder = 0
    inherited lblAssignedTo: TTntLabel
      Width = 3
    end
  end
end
