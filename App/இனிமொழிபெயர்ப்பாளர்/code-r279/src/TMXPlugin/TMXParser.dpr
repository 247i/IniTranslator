library TMXParser;

uses
  SysUtils,
  Classes,
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport},
  TransIntf in '..\TransIntf.pas',
  TMXParserImpl in 'TMXParserImpl.pas',
  TMXImportFrm in 'TMXImportFrm.pas' {frmTMXImport},
  CommonUtils in '..\CommonUtils.pas';

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TTMXParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.

