object frmEditItem: TfrmEditItem
  Left = 670
  Top = 413
  ActiveControl = reTranslation
  BorderStyle = bsToolWindow
  Caption = 'Edit Item'
  ClientHeight = 118
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = TntFormKeyDown
  OnKeyUp = TntFormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object reOriginal: TTntRichEdit
    Left = 0
    Top = 0
    Width = 398
    Height = 57
    Align = alTop
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    OnKeyDown = reTranslationKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 398
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object reTranslation: TTntRichEdit
    Left = 0
    Top = 62
    Width = 398
    Height = 56
    Align = alClient
    BevelKind = bkFlat
    BorderStyle = bsNone
    ScrollBars = ssBoth
    TabOrder = 2
    WantReturns = False
    OnKeyDown = reTranslationKeyDown
  end
end
