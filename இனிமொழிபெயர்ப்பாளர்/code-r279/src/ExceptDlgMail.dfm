inherited ExceptionDialogMail: TExceptionDialogMail
  Caption = 'ExceptionDialogMail'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TTntPanel
    TabOrder = 0
    inherited Label2: TTntLabel
      Caption = 
        'An error has occurred in the program. If the problem persists, s' +
        'ave your work and restart the program. Click the "Send Report" b' +
        'utton to e-mail a bugreport to the development team.'
    end
  end
  inherited OkBtn: TTntButton
    TabOrder = 2
  end
  inherited DetailsMemo: TTntRichEdit
    Height = 145
    TabOrder = 5
  end
  inherited DetailsBtn: TTntButton
    Caption = '&Details >>'
    TabOrder = 4
  end
  inherited TextLabel: TTntRichEdit
    TabOrder = 1
  end
  object SendBtn: TTntButton
    Left = 88
    Top = 180
    Width = 85
    Height = 25
    Hint = 'Send bug report using default mail client'
    Caption = '&Send Report'
    TabOrder = 3
    OnClick = SendBtnClick
  end
end
