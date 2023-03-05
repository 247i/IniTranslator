unit ApplicationServices;

interface
uses
  Classes, SysUtils, TransIntf, MainFrm;

type
  TApplicationServices = class(TInterfacedObject, IInterface, IApplicationServices)
  private
    FForm:TfrmMain;
  public
    constructor Create(AForm:TfrmMain);
    function BeginUpdate:Integer; safecall;
    function EndUpdate:Integer; safecall;
    function GetAppHandle:Cardinal;
    function GetMainFormHandle:Cardinal;
    function GetAppOption(const Section:WideString; const Name:WideString; const Default:WideString):WideString; safecall;
    function GetSelectedItem:ITranslationItem;
    procedure SetSelectedItem(const Value:ITranslationItem);

    function GetDictionaryItems:IDictionaryItems;
    function GetFooter:WideString;
    function GetHeader:WideString;
    function GetItems:ITranslationItems;
    function GetOrphans:ITranslationItems;
    procedure RegisterNotify(const ANotify:INotify); safecall;
    procedure SetAppOption(const Section:WideString;
      const Name:WideString; const Value:WideString); safecall;
    procedure SetFooter(const Value:WideString);
    procedure SetHeader(const Value:WideString);
    function Translate(const Section, Name, Value:WideString):WideString; safecall;
    procedure UnRegisterNotify(const ANotify:INotify); safecall;


  end;

implementation

{ TApplicationServices }

function TApplicationServices.BeginUpdate:Integer;
begin

end;

constructor TApplicationServices.Create(AForm:TfrmMain);
begin
  inherited Create;
  FForm := AForm;
end;

function TApplicationServices.EndUpdate:Integer;
begin
  Result := FForm.EndUpdate;
end;

function TApplicationServices.GetAppHandle:Cardinal;
begin
  Result := FForm.GetAppHandle;
end;

function TApplicationServices.GetMainFormHandle:Cardinal;
begin
  Result := FForm.GetMainFormHandle;
end;

function TApplicationServices.GetAppOption(const Section, Name,
  Default:WideString):WideString;
begin
  Result := FForm.GetAppOption(Section, Name, Default);
end;

function TApplicationServices.GetDictionaryItems:IDictionaryItems;
begin
  Result := FForm.GetDictionaryItems;
end;

function TApplicationServices.GetFooter:WideString;
begin
  Result := FForm.GetFooter;
end;

function TApplicationServices.GetHeader:WideString;
begin
  Result := FForm.GetHeader;
end;

function TApplicationServices.GetItems:ITranslationItems;
begin
  Result := FForm.GetItems;
end;


function TApplicationServices.GetOrphans:ITranslationItems;
begin
  Result := FForm.GetOrphans;
end;

function TApplicationServices.GetSelectedItem:ITranslationItem;
begin
  Result := FForm.SelectedItem;
end;

procedure TApplicationServices.RegisterNotify(const ANotify:INotify);
begin
  FForm.RegisterNotify(ANotify);
end;

procedure TApplicationServices.SetAppOption(const Section, Name,
  Value:WideString);
begin
  FForm.SetAppOption(Section, Name, Value);
end;

procedure TApplicationServices.SetFooter(const Value:WideString);
begin
  FForm.SetFooter(Value);
end;

procedure TApplicationServices.SetHeader(const Value:WideString);
begin
  FForm.SetHeader(Value);
end;

procedure TApplicationServices.SetSelectedItem(const Value:ITranslationItem);
begin
  FForm.SelectedItem := Value;
end;

function TApplicationServices.Translate(const Section, Name, Value:WideString):WideString; safecall;
begin
  Result := FForm.Translate(Section, Name, Value);
end;

procedure TApplicationServices.UnRegisterNotify(const ANotify:INotify);
begin
  FForm.UnRegisterNotify(ANotify);
end;


end.
