unit KeePassParserLang;

interface
uses
  TransIntf;

const
  cSectionName = 'KeePass';
  cKeePassFilter = 'KeePass Language Files (*.lng)|*.lng|All files (*.*)|*.*';
  cKeePassImportTitle = 'Import from KeePass language file';
  cKeePassExportTitle = 'Export to KeePass language file';

var
  GlobalAppServices:IApplicationServices = nil;
function Translate(Value:WideString):WideString;

implementation

function Translate(Value:WideString):WideString;
begin
  if GlobalAppServices <> nil then
    Result := GlobalAppServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

end.
