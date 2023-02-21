unit PokeAPI;

interface

uses
  System.Generics.Collections,
  PokeAPI.Berry.Int,
  REST.Client,
  PokeAPI.Base, PokeAPI.Int, PokeAPI.Base.Int;

type
  TPokeAPI = class(TInterfacedObject, IPokeAPI)
  private
    BaseURL: string;
    Client: TRESTClient;
    Request: TRESTRequest;
    Response: TRESTResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function New: IPokeAPI;
    function GetBerries(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerries(const URL: string): IListResponse; overload;
    function GetBerry(const Id: Integer): IBerry; overload;
    function GetBerry(const Name: string): IBerry; overload;
    function GetBerriesFirmness(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerriesFirmness(const URL: string): IListResponse; overload;
    function GetBerryFirmness(const Id: Integer): IBerryFirmness; overload;
    function GetBerryFirmness(const Name: string): IBerryFirmness; overload;
    function GetBerriesFlavor(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerriesFlavor(const URL: string): IListResponse; overload;
    function GetBerryFlavor(const Id: Integer): IBerryFlavor; overload;
    function GetBerryFlavor(const Name: string): IBerryFlavor; overload;
  end;

implementation

uses
  REST.Types, REST.Json, SysUtils, PokeAPI.Berry;

{ TPokeAPI }

constructor TPokeAPI.Create;
begin
  inherited;
  BaseURL := 'https://pokeapi.co/api/v2/';
  Client := TRESTClient.Create(BaseURL);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  Request.Client := Client;
  Request.Response := Response;
  Request.Accept := 'application/json';
end;

destructor TPokeAPI.Destroy;
begin
  Client.Free;
  Request.Free;
  Response.Free;
end;

function TPokeAPI.GetBerries(const Limit, Offset: Integer): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry';
  if Limit > -1 then
  begin
    Request.AddParameter('limit', IntToStr(Limit), TRESTRequestParameterKind.pkQUERY);
  end;
  if Offset > -1 then
  begin
    Request.AddParameter('offset', IntToStr(Offset), TRESTRequestParameterKind.pkQUERY);
  end;
  Request.Execute;

  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerries(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerriesFirmness(const Limit,
  Offset: Integer): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry-firmness';
  Client.BaseURL := BaseURL;
  if Limit > -1 then
  begin
    Request.AddParameter('limit', IntToStr(Limit), TRESTRequestParameterKind.pkQUERY);
  end;
  if Offset > -1 then
  begin
    Request.AddParameter('offset', IntToStr(Offset), TRESTRequestParameterKind.pkQUERY);
  end;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerriesFirmness(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerry(const Name: string): IBerry;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TBerry>(Response.JSONText).New;
end;

function TPokeAPI.GetBerryFirmness(const Id: Integer): IBerryFirmness;
begin
  Result := GetBerryFirmness(IntToStr(Id));
end;

function TPokeAPI.GetBerryFirmness(const Name: string): IBerryFirmness;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry-firmness/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TBerryFirmness>(Response.JSONText).New;
end;

function TPokeAPI.GetBerriesFlavor(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry-flavor';
  Client.BaseURL := BaseURL;
  if Limit > -1 then
  begin
    Request.AddParameter('limit', IntToStr(Limit), TRESTRequestParameterKind.pkQUERY);
  end;
  if Offset > -1 then
  begin
    Request.AddParameter('offset', IntToStr(Offset), TRESTRequestParameterKind.pkQUERY);
  end;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerriesFlavor(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerryFlavor(const Id: Integer): IBerryFlavor;
begin
  Result := GetBerryFlavor(IntToStr(Id));
end;

function TPokeAPI.GetBerryFlavor(const Name: string): IBerryFlavor;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry-flavor/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TBerryFlavor>(Response.JSONText).New;
end;

function TPokeAPI.GetBerry(const Id: Integer): IBerry;
begin
  Result := GetBerry(IntToStr(Id));
end;

function TPokeAPI.New: IPokeAPI;
begin
  Result := Self;
end;

end.
