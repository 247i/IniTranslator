object frmOptions: TfrmOptions
  Left = 316
  Top = 175
  ActiveControl = chkShowQuotes
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 449
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  DesignSize = (
    482
    449)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 4
    Top = 399
    Width = 473
    Height = 3
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnOK: TTntButton
    Left = 303
    Top = 413
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TTntButton
    Left = 387
    Top = 413
    Width = 80
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object btnColors: TTntButton
    Left = 20
    Top = 413
    Width = 80
    Height = 23
    Hint = 'Select a new font for the list and edit fields'
    Anchors = [akLeft, akBottom]
    Caption = 'Color&s...'
    TabOrder = 0
    OnClick = btnColorsClick
  end
  object pcSettings: TTntPageControl
    Left = 2
    Top = 2
    Width = 477
    Height = 387
    ActivePage = tsGeneral
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object tsGeneral: TTntTabSheet
      Caption = 'General'
      DesignSize = (
        469
        359)
      object Label1: TTntLabel
        Left = 16
        Top = 239
        Width = 51
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        Caption = '&Language:'
        FocusControl = edLanguage
      end
      object Label2: TTntLabel
        Left = 16
        Top = 287
        Width = 25
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        Caption = '&Help:'
        FocusControl = edHelp
      end
      object Bevel1: TBevel
        Left = 1
        Top = 148
        Width = 466
        Height = 3
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel5: TBevel
        Left = 1
        Top = 219
        Width = 466
        Height = 3
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object TntLabel4: TTntLabel
        Left = 16
        Top = 161
        Width = 26
        Height = 13
        Caption = '&Font:'
        FocusControl = cbFonts
      end
      object TntLabel5: TTntLabel
        Left = 161
        Top = 161
        Width = 23
        Height = 13
        Caption = 'Si&ze:'
        FocusControl = cbFontSizes
      end
      object TntLabel6: TTntLabel
        Left = 245
        Top = 161
        Width = 42
        Height = 13
        Caption = 'Preview:'
      end
      object chkShowQuotes: TTntCheckBox
        Left = 16
        Top = 16
        Width = 202
        Height = 17
        Hint = 'Enclose strings in quote characters when editing them'
        Caption = 'Show &quotes'
        TabOrder = 0
      end
      object chkShowDetails: TTntCheckBox
        Left = 16
        Top = 34
        Width = 202
        Height = 17
        Hint = 'Show the details panel in the main window'
        Caption = 'Sho&w details'
        TabOrder = 1
      end
      object chkShowToolTips: TTntCheckBox
        Left = 16
        Top = 53
        Width = 202
        Height = 17
        Hint = 'Show tooltips windows'
        Caption = 'Show &tooltips:'
        TabOrder = 2
        OnClick = chkShowToolTipsClick
      end
      object chkShowShortCuts: TTntCheckBox
        Left = 32
        Top = 74
        Width = 186
        Height = 17
        Hint = 'Show shortcuts in tooltips windows'
        Caption = 'Show short&cuts in tooltips'
        Enabled = False
        TabOrder = 3
      end
      object chkReturnToSave: TTntCheckBox
        Left = 214
        Top = 16
        Width = 223
        Height = 17
        Hint = 'Save the current edits when pressing RETURN'
        Caption = 'Press &RETURN to confirm translation:'
        TabOrder = 6
        OnClick = chkReturnToSaveClick
      end
      object chkMoveToNext: TTntCheckBox
        Left = 230
        Top = 34
        Width = 207
        Height = 17
        Hint = 
          'Move to the next item when pressing RETURN (press Shift+RETURN t' +
          'o move to the previous item)'
        Caption = 'A&utomatically move to next/previous'
        Enabled = False
        TabOrder = 7
      end
      object edLanguage: TTntEdit
        Left = 16
        Top = 258
        Width = 393
        Height = 21
        Hint = 'Select a language file for the program'
        Anchors = [akLeft, akRight, akBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        TabOrder = 13
      end
      object btnLanguage: TTntButton
        Left = 412
        Top = 260
        Width = 19
        Height = 19
        Anchors = [akRight, akBottom]
        Caption = '...'
        TabOrder = 14
        OnClick = btnLanguageClick
      end
      object edHelp: TTntEdit
        Left = 16
        Top = 306
        Width = 393
        Height = 21
        Hint = 'Select a file that is to be openend when F1 is pressed'
        Anchors = [akLeft, akRight, akBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        TabOrder = 15
      end
      object btnHelp: TTntButton
        Left = 412
        Top = 308
        Width = 19
        Height = 19
        Anchors = [akRight, akBottom]
        Caption = '...'
        TabOrder = 16
        OnClick = btnHelpClick
      end
      object pnlFontPreview: TTntPanel
        Left = 243
        Top = 178
        Width = 202
        Height = 21
        Hint = 
          'Click to edit, click again to save.  To restore default preview,' +
          ' clear the text.'
        Anchors = [akLeft, akRight, akBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 12
        OnClick = pnlFontPreviewClick
        object edPreview: TTntEdit
          Left = 0
          Top = 0
          Width = 198
          Height = 17
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          Visible = False
          OnClick = edPreviewClick
          OnExit = edPreviewExit
        end
      end
      object chkUseTranslationEverywhere: TTntCheckBox
        Left = 214
        Top = 53
        Width = 225
        Height = 17
        Hint = 
          'When a translation is made, copies the translation to all other ' +
          'matching items automatically'
        Caption = 'Use translation ever&ywhere'
        TabOrder = 8
      end
      object chkAutoFocusTranslation: TTntCheckBox
        Left = 214
        Top = 74
        Width = 195
        Height = 17
        Hint = 
          'When activated, typing in the listview will automatically move f' +
          'ocus to the translation edit field.'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Autofo&cus translation when typing'
        TabOrder = 9
      end
      object chkSavePosition: TTntCheckBox
        Left = 16
        Top = 95
        Width = 188
        Height = 17
        Hint = 'Remember location of main window'
        Caption = 'Remember form &position:'
        TabOrder = 4
        OnClick = chkSavePositionClick
      end
      object chkSaveMinMax: TTntCheckBox
        Left = 32
        Top = 114
        Width = 179
        Height = 17
        Hint = 'Remember whether main window was minimized /maximized'
        Caption = 'Remember form min/ma&x state'
        TabOrder = 5
      end
      object cbFonts: TTntComboBox
        Left = 16
        Top = 177
        Width = 134
        Height = 21
        ItemHeight = 13
        Sorted = True
        TabOrder = 10
        OnChange = cbFontsChange
      end
      object cbFontSizes: TTntComboBox
        Left = 161
        Top = 177
        Width = 64
        Height = 21
        ItemHeight = 13
        TabOrder = 11
        OnChange = cbFontSizesChange
      end
    end
    object tsAdvanced: TTntTabSheet
      Caption = 'Advanced'
      DesignSize = (
        469
        359)
      object TntLabel1: TTntLabel
        Left = 247
        Top = 16
        Width = 109
        Height = 13
        Caption = '&Encoding for new files:'
        FocusControl = cbDefaultTransEncoding
      end
      object TntLabel2: TTntLabel
        Left = 7
        Top = 208
        Width = 39
        Height = 13
        Caption = '&Header:'
        FocusControl = reHeader
      end
      object TntLabel3: TTntLabel
        Left = 238
        Top = 208
        Width = 36
        Height = 13
        Caption = '&Footer:'
        FocusControl = reFooter
      end
      object Bevel3: TBevel
        Left = 1
        Top = 191
        Width = 466
        Height = 3
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel4: TBevel
        Left = 1
        Top = 95
        Width = 466
        Height = 3
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object cbDefaultTransEncoding: TTntComboBox
        Left = 247
        Top = 32
        Width = 190
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'ANSI'
        Items.Strings = (
          'ANSI'
          'UTF-8'
          'Unicode')
      end
      object chkGlobalPath: TTntCheckBox
        Left = 16
        Top = 16
        Width = 202
        Height = 17
        Hint = 
          'When a file is opened, set the new folder as the start folder fo' +
          'r all file open and save dialogs'
        Caption = 'Use sa&me start folder for all files'
        TabOrder = 0
      end
      object chkShowFullNames: TTntCheckBox
        Left = 16
        Top = 34
        Width = 225
        Height = 17
        Hint = 
          'Enable to show the full path and filename of the loaded files in' +
          ' the listview'#39's columns header'
        Caption = 'Sh&ow full filename in list columns'
        TabOrder = 1
      end
      object chkMonitorFiles: TTntCheckBox
        Left = 16
        Top = 54
        Width = 223
        Height = 17
        Hint = 
          'Continually check whether the currently loaded files are being m' +
          'odified outside the program'
        Caption = 'Monitor external file &changes'
        TabOrder = 2
        OnClick = chkSavePositionClick
      end
      object chkInvertDictionary: TTntCheckBox
        Left = 16
        Top = 115
        Width = 202
        Height = 17
        Hint = 'Switch order of the items in the dictionary'
        Caption = 'In&vert dictionary'
        TabOrder = 4
      end
      object chkDictIgnoreSpeedKey: TTntCheckBox
        Left = 16
        Top = 136
        Width = 202
        Height = 17
        Hint = 
          'When translating with the dictionary, strip out any &'#39's in the o' +
          'riginal text before comparing'
        Caption = 'I&gnore &&'#39's in dictionaries'
        TabOrder = 5
        OnClick = chkSavePositionClick
      end
      object chkDictIgnoreNonEmpty: TTntCheckBox
        Left = 16
        Top = 157
        Width = 257
        Height = 17
        Hint = 'Skip already translated items when using dictionary'
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Ignore translated items when using dictionary'
        TabOrder = 6
      end
      object reHeader: TTntRichEdit
        Left = 7
        Top = 224
        Width = 218
        Height = 125
        BevelKind = bkFlat
        BorderStyle = bsNone
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 7
        WantTabs = True
        WordWrap = False
      end
      object reFooter: TTntRichEdit
        Left = 238
        Top = 224
        Width = 218
        Height = 125
        BevelKind = bkFlat
        BorderStyle = bsNone
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 8
        WantTabs = True
        WordWrap = False
      end
    end
  end
end
