library OlegParser;

uses
  SysUtils,
  Classes,
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport},
  SingleImportFrm in '..\PluginCommon\SingleImportFrm.pas' {frmSingleImport},
  TransIntf in '..\TransIntf.pas',
  OlegParserImpl in 'OlegParserImpl.pas',
  CommonUtils in '..\CommonUtils.pas';

{$R *.res}

function InstallPlugin(out Parser:IFileParser):HResult;stdcall;
begin
  Parser := TOlegParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.
