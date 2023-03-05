object ExceptionDialog: TExceptionDialog
  Left = 360
  Top = 150
  Width = 497
  Height = 444
  ActiveControl = OkBtn
  BorderIcons = [biSystemMenu]
  Caption = 'ExceptionDialog'
  Color = clBtnFace
  Constraints.MinHeight = 235
  Constraints.MinWidth = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    489
    410)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 211
    Width = 468
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object Label3: TTntLabel
    Left = 56
    Top = 72
    Width = 85
    Height = 13
    Caption = 'Error message:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 4
    Top = 171
    Width = 468
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object pnlTop: TTntPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 64
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 3
    DesignSize = (
      489
      64)
    object Label1: TTntLabel
      Left = 8
      Top = 7
      Width = 94
      Height = 13
      Caption = 'Application Error'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Shell Dlg 2'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TTntLabel
      Left = 16
      Top = 22
      Width = 451
      Height = 27
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'An error has occurred in the program. If the problem persists, s' +
        'ave your work and restart the program.'
      WordWrap = True
    end
  end
  object OkBtn: TTntButton
    Left = 8
    Top = 180
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object DetailsMemo: TTntRichEdit
    Left = 4
    Top = 217
    Width = 464
    Height = 190
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
    WantReturns = False
    WordWrap = False
  end
  object DetailsBtn: TTntButton
    Left = 376
    Top = 180
    Width = 75
    Height = 25
    Hint = 'Show or hide additional information|'
    Anchors = [akTop, akRight]
    Caption = '&Details'
    Enabled = False
    TabOrder = 1
    OnClick = DetailsBtnClick
  end
  object TextLabel: TTntRichEdit
    Left = 56
    Top = 88
    Width = 406
    Height = 75
    Hint = 'Shows the error message'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    BorderWidth = 1
    ParentColor = True
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
    WantReturns = False
  end
end
