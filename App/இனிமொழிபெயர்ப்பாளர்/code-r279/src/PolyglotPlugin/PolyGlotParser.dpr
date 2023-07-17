library PolyGlotParser;

uses
  SysUtils,
  Classes,
  PreviewExportFrm in '..\PluginCommon\PreviewExportFrm.pas' {frmExport},
  TransIntf in '..\TransIntf.pas',
  PolyGlotParserImpl in 'PolyGlotParserImpl.pas',
  DualImportFrm in '..\PluginCommon\DualImportFrm.pas' {frmDualImport},
  CommonUtils in '..\CommonUtils.pas';

{$R *.res}

function InstallPlugin(out Parser: IFileParser): HResult; stdcall;
begin
  Parser := TPolyGlotParser.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransFileParserFuncName;
begin

end.

