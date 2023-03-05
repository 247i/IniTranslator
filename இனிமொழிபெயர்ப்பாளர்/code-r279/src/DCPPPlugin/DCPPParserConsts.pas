unit DCPPParserConsts;

interface
uses
  TransIntf;
const
  cSectionName = 'DC++';
  cImportTitle = 'Import from DC++ language file';
  cExportTitle = 'Export to DC++ language file';
  cDCPPFilter = 'DC++ language files (*.xml)|*.xml|All files (*.*)|*.*';

var
  GlobalAppServices:IApplicationServices = nil;

function Translate(const Value:WideString):WideString;

implementation

function Translate(const Value:WideString):WideString;
begin
  if GlobalAppServices <> nil then
    Result := GlobalAppServices.Translate(cSectionName, Value, Value)
  else
    Result := Value;
end;

end.
