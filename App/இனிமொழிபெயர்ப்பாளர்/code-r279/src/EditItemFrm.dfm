inherited frmEditItem: TfrmEditItem
  Left = 434
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Edit Item'
  ClientHeight = 453
  ClientWidth = 446
  Constraints.MinHeight = 480
  Constraints.MinWidth = 450
  OnCreate = TntFormCreate
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 8
    Width = 39
    Height = 13
    Caption = '&Section:'
    FocusControl = cbSections
  end
  object Label2: TTntLabel
    Left = 8
    Top = 96
    Width = 40
    Height = 13
    Caption = '&Original:'
    FocusControl = edOriginal
  end
  object Label3: TTntLabel
    Left = 8
    Top = 176
    Width = 57
    Height = 13
    Caption = '&Translation:'
    FocusControl = edTranslation
  end
  object Label6: TTntLabel
    Left = 8
    Top = 53
    Width = 31
    Height = 13
    Caption = '&Name:'
    FocusControl = edName
  end
  object btnOK: TTntButton
    Left = 263
    Top = 418
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TTntButton
    Left = 351
    Top = 418
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object cbSections: TTntComboBox
    Left = 8
    Top = 24
    Width = 430
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvRaised
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
  end
  object edOriginal: TTntRichEdit
    Left = 8
    Top = 112
    Width = 430
    Height = 60
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 2
    WantReturns = False
    WordWrap = False
    OnKeyDown = DoKeyDown
  end
  object edTranslation: TTntRichEdit
    Left = 8
    Top = 192
    Width = 430
    Height = 60
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 3
    WantReturns = False
    WordWrap = False
    OnKeyDown = DoKeyDown
  end
  object edName: TTntEdit
    Left = 8
    Top = 69
    Width = 430
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    TabOrder = 1
  end
  object pcComments: TTntPageControl
    Left = 8
    Top = 264
    Width = 430
    Height = 133
    ActivePage = tabOriginal
    Anchors = [akLeft, akRight, akBottom]
    Style = tsFlatButtons
    TabOrder = 6
    object tabOriginal: TTntTabSheet
      BorderWidth = 2
      Caption = 'Ori&ginal Comment'
      object edOrigComments: TTntRichEdit
        Left = 0
        Top = 0
        Width = 418
        Height = 98
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object tabTranslation: TTntTabSheet
      BorderWidth = 2
      Caption = 'T&ranslation Comment'
      ImageIndex = 1
      object edTransComment: TTntRichEdit
        Left = 0
        Top = 0
        Width = 418
        Height = 98
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        BorderWidth = 2
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
end
