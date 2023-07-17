object frmPromptArgs: TfrmPromptArgs
  Left = 496
  Top = 260
  ActiveControl = edArguments
  BorderStyle = bsDialog
  Caption = 'Title'
  ClientHeight = 165
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  DesignSize = (
    449
    165)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 14
    Width = 53
    Height = 13
    Caption = 'Arguments:'
  end
  object Label2: TTntLabel
    Left = 8
    Top = 64
    Width = 73
    Height = 13
    Caption = 'Command Line:'
  end
  object edArguments: TTntEdit
    Left = 8
    Top = 27
    Width = 409
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    HideSelection = False
    TabOrder = 0
    OnChange = edArgumentsChange
  end
  object btnArguments: TTntBitBtn
    Left = 423
    Top = 29
    Width = 19
    Height = 19
    Anchors = [akTop, akRight]
    TabOrder = 1
    OnClick = btnArgumentsClick
    Glyph.Data = {
      76040000424D7604000000000000360400002800000006000000080000000100
      0800000000004000000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
      2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
      CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
      00000033330000336600003399000033CC000033FF0000660000006633000066
      6600006699000066CC000066FF00009900000099330000996600009999000099
      CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
      660000FF990000FFCC00330000003300330033006600330099003300CC003300
      FF00333300003333330033336600333399003333CC003333FF00336600003366
      330033666600336699003366CC003366FF003399000033993300339966003399
      99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
      FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
      6600660099006600CC006600FF00663300006633330066336600663399006633
      CC006633FF00666600006666330066666600666699006666CC00669900006699
      330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
      CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
      000099339900990099009900CC009900000099333300990066009933CC009900
      FF00996600009966330099336600996699009966CC009933FF00999933009999
      6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
      CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
      000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
      9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
      FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
      3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
      9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
      6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
      CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
      0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
      9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
      A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
      DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FD0AFDFDFDFD
      0000FD0A0AFDFDFD0000FD0A0A0AFDFD0000FD0A0A0A0AFD0000FD0A0A0AFDFD
      0000FD0A0AFDFDFD0000FD0AFDFDFDFD0000FDFDFDFDFDFD0000}
    Layout = blGlyphBottom
  end
  object reCommandLine: TTntRichEdit
    Left = 8
    Top = 81
    Width = 433
    Height = 37
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    ParentColor = True
    ScrollBars = ssBoth
    TabOrder = 2
    WantReturns = False
  end
  object btnCancel: TTntButton
    Left = 352
    Top = 134
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object btnOK: TTntButton
    Left = 264
    Top = 134
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object popArguments: TSpTBXPopupMenu
    Left = 368
    Top = 48
    object OriginalLine1: TSpTBXItem
      OnClick = ArgumentsClick
      CaptionW = 'Original Line'
    end
    object OriginalText1: TSpTBXItem
      Tag = 1
      OnClick = ArgumentsClick
      CaptionW = 'Original Text'
    end
    object OriginalPath1: TSpTBXItem
      Tag = 2
      OnClick = ArgumentsClick
      CaptionW = 'Original Path'
    end
    object OriginalDirectory1: TSpTBXItem
      Tag = 3
      OnClick = ArgumentsClick
      CaptionW = 'Original Directory'
    end
    object OriginalName1: TSpTBXItem
      Tag = 4
      OnClick = ArgumentsClick
      CaptionW = 'Original Name'
    end
    object OriginalExtension1: TSpTBXItem
      Tag = 5
      OnClick = ArgumentsClick
      CaptionW = 'Original Extension'
    end
    object N1: TSpTBXSeparatorItem
    end
    object ranslationLine1: TSpTBXItem
      Tag = 6
      OnClick = ArgumentsClick
      CaptionW = 'Translation Line'
    end
    object ranslationText1: TSpTBXItem
      Tag = 7
      OnClick = ArgumentsClick
      CaptionW = 'Translation Text'
    end
    object ranslationPath1: TSpTBXItem
      Tag = 8
      OnClick = ArgumentsClick
      CaptionW = 'Translation Path'
    end
    object ranslationDirectory1: TSpTBXItem
      Tag = 9
      OnClick = ArgumentsClick
      CaptionW = 'Translation Directory'
    end
    object ranslationName1: TSpTBXItem
      Tag = 10
      OnClick = ArgumentsClick
      CaptionW = 'Translation Name'
    end
    object ranslationExtension1: TSpTBXItem
      Tag = 11
      OnClick = ArgumentsClick
      CaptionW = 'Translation Extension'
    end
    object N2: TSpTBXSeparatorItem
    end
    object DictionaryPath1: TSpTBXItem
      Tag = 12
      OnClick = ArgumentsClick
      CaptionW = 'Dictionary Path'
    end
    object DictionaryDirectory1: TSpTBXItem
      Tag = 13
      OnClick = ArgumentsClick
      CaptionW = 'Dictionary Directory'
    end
    object DictionaryName1: TSpTBXItem
      Tag = 14
      OnClick = ArgumentsClick
      CaptionW = 'Dictionary Name'
    end
    object DictionaryExtension1: TSpTBXItem
      Tag = 15
      OnClick = ArgumentsClick
      CaptionW = 'Dictionary Extension'
    end
    object TBXSeparatorItem1: TSpTBXSeparatorItem
    end
    object TBItem1: TTBItem
      Caption = 'Application Directory'
      OnClick = ArgumentsClick
    end
    object TBXItem2: TSpTBXItem
      Tag = 16
      OnClick = ArgumentsClick
      CaptionW = 'Windows Directory'
    end
    object TBXItem1: TSpTBXItem
      Tag = 17
      OnClick = ArgumentsClick
      CaptionW = 'System Directory'
    end
  end
end
