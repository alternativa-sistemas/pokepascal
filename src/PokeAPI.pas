unit PokeAPI;

interface

uses
  System.Generics.Collections,
  PokeAPI.Berry,
  REST.Client,
  PokeAPI.Base;

type
  IPokeAPI = interface
  ['{05357B51-A62A-4C56-9816-D33CEB371B3A}']
    function GetBerries(const Limit: Integer = -1;
      const Offset: Integer = -1): IBerriesGETResponse; overload;
    function GetBerries(const URL: string): IBerriesGETResponse; overload;
    function GetBerry(const Id: Integer): INameAndUrl;
  end;

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
      const Offset: Integer = -1): IBerriesGETResponse; overload;
    function GetBerries(const URL: string): IBerriesGETResponse; overload;
    function GetBerry(const Id: Integer): INameAndUrl;
  end;

implementation

uses
  REST.Types, REST.Json, SysUtils;

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

function TPokeAPI.GetBerries(const Limit, Offset: Integer): IBerriesGETResponse;
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

  Result := TJson.JsonToObject<TBerriesListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerries(const URL: string): IBerriesGETResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TBerriesListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetBerry(const Id: Integer): INameAndUrl;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'berry/' + IntToStr(Id);
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TNameAndUrl>(Response.JSONText).New;
end;

function TPokeAPI.New: IPokeAPI;
begin
  Result := Self;
end;

end.
