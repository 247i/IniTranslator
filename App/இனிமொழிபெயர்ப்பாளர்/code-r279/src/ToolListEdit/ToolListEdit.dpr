library ToolListEdit;


uses
  SysUtils,
  Classes,
  ToolListEditImpl in 'ToolListEditImpl.pas',
  TransIntf in '..\TransIntf.pas',
  ToolListEditFrm in 'ToolListEditFrm.pas' {frmToolListEdit: TTntForm},
  ToolItemEditFrm in 'ToolItemEditFrm.pas' {frmEditItem: TTntForm};

{$R *.res}
function InstallPlugin(out ToolItems: IToolItems): HResult; stdcall;
begin
  ToolItems := TToolListViewPlugins.Create;
  Result := S_OK;
end;

exports InstallPlugin name cRegisterTransToolItemsFuncName;
begin
end.
