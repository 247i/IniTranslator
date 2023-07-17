object frmComments: TfrmComments
  Left = 661
  Top = 216
  Width = 321
  Height = 271
  BorderStyle = bsSizeToolWin
  Caption = 'Comments'
  Color = clBtnFace
  Constraints.MinHeight = 215
  Constraints.MinWidth = 260
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Scaled = False
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBack: TTntPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 225
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object pnlTrans: TTntPanel
      Left = 1
      Top = 98
      Width = 311
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 0
      object lblTrans: TLabel
        Left = 8
        Top = 5
        Width = 57
        Height = 13
        Caption = '&Translation:'
        FocusControl = reTranslation
      end
    end
    object reTranslation: TTntRichEdit
      Left = 1
      Top = 121
      Width = 311
      Height = 103
      Hint = 'Comments in the translation file'
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      PlainText = True
      PopupMenu = popComments
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = reTranslationChange
    end
    object pnlOrig: TTntPanel
      Left = 1
      Top = 1
      Width = 311
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        311
        24)
      object lblOrig: TTntLabel
        Left = 8
        Top = 4
        Width = 40
        Height = 13
        Caption = '&Original:'
        FocusControl = reOriginal
        Layout = tlCenter
      end
      object spLocked: TTntSpeedButton
        Left = 287
        Top = 2
        Width = 19
        Height = 19
        AllowAllUp = True
        Anchors = [akTop, akRight]
        GroupIndex = 1
        Down = True
        Glyph.Data = {
          7E010000424D7E010000000000007600000028000000300000000B0000000100
          0400000000000801000094120000941200001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0DDDDDDDDDDD8DDDDDDDDDD
          D0DDDDDD0DDDDDDDDDDDDDDDD00DDD00DDDDD88DDD88DDDDD00DDD00D000000D
          DDDDDDDDD0700070DDDDD8788878DDDDD0700070D0077000DDDDDDDDD0807070
          DDDDD8887878DDDDD0807070D07777000DDDD00000888780D88888888788D000
          00888780D07F80000DDDDDDDD08FF780DDDDD88FF788DDDDD08FF780D0F80777
          00DDDDDDD0F000F0DDDDD8F888F8DDDDD0F000F0D08F08F770DDDDDDD00DDD00
          DDDDD88DDD88DDDDD00DDD00DD080F8F70DDDDDDD0DDDDDDDDDDD8DDDDDDDDDD
          D0DDDDDDDDD008F870DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000
          0DDD}
        Margin = 1
        NumGlyphs = 4
      end
    end
    object reOriginal: TTntRichEdit
      Left = 1
      Top = 25
      Width = 311
      Height = 73
      Hint = 'Comments in the original file'
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      PlainText = True
      PopupMenu = popComments
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WantReturns = False
      WordWrap = False
    end
  end
  object StatusBar1: TTntStatusBar
    Left = 0
    Top = 225
    Width = 313
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object alComments: TTntActionList
    Left = 144
    Top = 42
    object EditCut1: TTntEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TTntEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TTntEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll1: TTntEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndo1: TTntEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object acClose: TTntAction
      Caption = 'Close'
      ShortCut = 16461
      OnExecute = acCloseExecute
    end
  end
  object popComments: TSpTBXPopupMenu
    Left = 84
    Top = 42
    object Undo1: TSpTBXItem
      Action = EditUndo1
      CaptionW = '&Undo'
      HintW = 'Undo|Reverts the last action'
    end
    object N1: TSpTBXItem
      CaptionW = '-'
    end
    object Cut1: TSpTBXItem
      Action = EditCut1
      CaptionW = 'Cu&t'
      HintW = 'Cut|Cuts the selection and puts it on the Clipboard'
    end
    object Copy1: TSpTBXItem
      Action = EditCopy1
      CaptionW = '&Copy'
      HintW = 'Copy|Copies the selection and puts it on the Clipboard'
    end
    object Paste1: TSpTBXItem
      Action = EditPaste1
      CaptionW = '&Paste'
      HintW = 'Paste|Inserts Clipboard contents'
    end
    object N2: TSpTBXItem
      CaptionW = '-'
    end
    object SelectAll1: TSpTBXItem
      Action = EditSelectAll1
      CaptionW = 'Select &All'
      HintW = 'Select All|Selects the entire document'
    end
  end
end
