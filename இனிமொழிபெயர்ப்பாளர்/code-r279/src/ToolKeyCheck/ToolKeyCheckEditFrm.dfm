object frmToolKeyCheckEdit: TfrmToolKeyCheckEdit
  Left = 484
  Top = 359
  ActiveControl = reTranslation
  BorderStyle = bsDialog
  Caption = 'Edit translation'
  ClientHeight = 183
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  DesignSize = (
    478
    183)
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 7
    Top = 7
    Width = 40
    Height = 13
    Caption = '&Original:'
    FocusControl = reOriginal
  end
  object TntLabel2: TTntLabel
    Left = 7
    Top = 77
    Width = 57
    Height = 13
    Caption = '&Translation:'
    FocusControl = reTranslation
  end
  object reOriginal: TTntRichEdit
    Left = 7
    Top = 22
    Width = 463
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object reTranslation: TTntRichEdit
    Left = 7
    Top = 92
    Width = 463
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 1
    WantReturns = False
    WordWrap = False
    OnEnter = reTranslationEnter
    OnKeyDown = reTranslationKeyDown
    OnKeyUp = reTranslationKeyUp
  end
  object btnOK: TTntButton
    Left = 301
    Top = 147
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TTntButton
    Left = 385
    Top = 147
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
