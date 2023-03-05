program MsTermBuild;



uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain};

{$R 'manifest.res' 'manifest.rc'}
{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MS Terminology Translations Builder';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

