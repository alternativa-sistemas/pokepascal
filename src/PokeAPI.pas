unit PokeAPI;

interface

uses
  System.Generics.Collections,
  PokeAPI.Berry;

type
  IPokeAPI = interface
  ['{05357B51-A62A-4C56-9816-D33CEB371B3A}']
    function GetBerries: IBerriesGETResponse;
  end;

  TPokeAPI = class(TInterfacedObject, IPokeAPI)
  public
    function New: IPokeAPI;
    function GetBerries: IBerriesGETResponse;
  end;

implementation

uses
  REST.Client, REST.Types, REST.Json;

{ TPokeAPI }

function TPokeAPI.GetBerries: IBerriesGETResponse;
var
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  BerriesListResponse: TBerriesListResponse;
begin
  Client := TRESTClient.Create('https://pokeapi.co/api/v2/');
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    Request.Client := Client;
    Request.Response := Response;
    Request.Accept := 'application/json';
    Request.Method := TRESTRequestMethod.rmGET;
    Request.Resource := 'berry';
    Request.Execute;

    BerriesListResponse := TJson.JsonToObject<TBerriesListResponse>(Response.JSONText);

    Result := BerriesListResponse.New;
  finally
    Client.Free;
    Request.Free;
    Response.Free;
  end;
end;

function TPokeAPI.New: IPokeAPI;
begin
  Result := Self;
end;

end.
