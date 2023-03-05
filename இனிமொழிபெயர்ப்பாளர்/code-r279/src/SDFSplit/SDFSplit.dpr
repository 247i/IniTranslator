program SDFSplit;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  CommonUtils in '..\CommonUtils.pas';

{$R 'manifest.res' 'manifest.rc'}
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
