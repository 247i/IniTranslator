library FoxitParser;

uses
  SysUtils,
  Classes,
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport},
  DualImportFrm in '..\PluginCommon\DualImportFrm.pas' {frmDualImport},
  TransIntf in '..\TransIntf.pas',
  FoxitParserImpl in 'FoxitParserImpl.pas',
  CommonUtils in '..\CommonUtils.pas';

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TFoxitParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.

