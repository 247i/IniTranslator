unit ToolKeyCheckConsts;

interface
uses
  TransIntf;

const
  SSectionName = 'ToolKeyCheck';
  SDisplayName = '&Check accelerator and access keys...';
  SAbout = 'Key Check plugin for IniTranslator';

  SMainFormCaption = 'Accelerator and access key checker';
  SIgnoreEmpty = '&Ignore items without keys';
  SUpdate = '&Update';
  SEdit = 'Edit';
  SClose = 'Close';
  SSync = 'Show in main list';
  SOriginal = 'Original';
  STranslation = 'Translation';
  SAccelKey = 'Accelerator key';
  SAccessKey = 'Access key';

  SEditFormCaption = 'Edit translation';
  SOriginalLabel = '&Original:';
  STranslationLabel = '&Translation:';
  SOK = 'OK';
  SCancel = 'Cancel';

var
  GlobalAppServices:IApplicationServices = nil;

function Translate(const Value:WideString):WideString;

implementation

function Translate(const Value:WideString):WideString;
begin
  if GlobalAppServices <> nil then
    Result := GlobalAppServices.Translate(SSectionName, Value, Value)
  else
    Result := Value;
end;

end.
