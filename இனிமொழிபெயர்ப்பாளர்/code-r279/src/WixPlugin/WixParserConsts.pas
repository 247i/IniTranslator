unit WixParserConsts;

interface
uses
  TransIntf;
const
  cSectionName = 'Wix';
  cImportTitle = 'Import from Wix localization file';
  cExportTitle = 'Export to Wix localization file';
  cWixFilter = 'Wix localization files (*.wxl)|*.wxl|XML files (*.xml)|*.xml|All files (*.*)|*.*';

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
