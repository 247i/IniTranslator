unit ToolListEditImpl;

interface
uses
  TransIntf;

type
  TToolListViewPlugins = class(TInterfacedObject, IUnknown, IToolItems)
  public
    function Count:Integer; safecall;
    function ToolItem(Index:Integer; out ToolItem:IToolItem):HRESULT; safecall;
  end;

  TToolListViewPlugin = class(TInterfacedObject, IUnknown, IToolItem)
  private
    FOldAppHandle:Cardinal;
  public
    function About:WideString; safecall;
    function DisplayName:WideString; safecall;
    function Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT; safecall;
    function Icon:Cardinal; safecall;
    procedure Init(const ApplicationServices:IApplicationServices); safecall;
    function Status(const Items, Orphans:ITranslationItems; const SelectedItem:ITranslationItem):Integer; safecall;
    destructor Destroy; override;
  end;


implementation
uses
  Forms, ToolListEditFrm;

{ TToolListViewPlugins }

function TToolListViewPlugins.Count:Integer;
begin
  Result := 1;
end;

function TToolListViewPlugins.ToolItem(Index:Integer;
  out ToolItem:IToolItem):HRESULT;
begin
  Result := S_FALSE;
  if Index = 0 then
  begin
    ToolItem := TToolListViewPlugin.Create;
    Result := S_OK;
  end;
end;

{ TToolListViewPlugin }

function TToolListViewPlugin.About:WideString;
begin
  Result := 'Alternate editor in a list';
end;

destructor TToolListViewPlugin.Destroy;
begin
  Application.Handle := FOldAppHandle;
  inherited;
end;

function TToolListViewPlugin.DisplayName:WideString;
begin
  Result := '&Alternate list editor...';
end;

function TToolListViewPlugin.Execute(const Items, Orphans:ITranslationItems; var SelectedItem:ITranslationItem):HRESULT;
begin
  Result := S_OK;
  TfrmToolListEdit.Edit(Items);
end;

function TToolListViewPlugin.Icon:Cardinal;
begin
  Result := 0;
end;

procedure TToolListViewPlugin.Init(const ApplicationServices:IApplicationServices);
begin
  FOldAppHandle := Application.Handle;
  Application.Handle := ApplicationServices.AppHandle;
end;

function TToolListViewPlugin.Status(const Items,
  Orphans:ITranslationItems;
  const SelectedItem:ITranslationItem):Integer;
begin
  Result := TOOL_VISIBLE;
  if Items.Count > 0 then
    Result := Result or TOOL_ENABLED;
end;

end.
