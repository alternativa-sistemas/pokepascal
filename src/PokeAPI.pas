unit PokeAPI;

interface

uses
  PokeAPI.Berry.Int,
  REST.Client,
  PokeAPI.Base,
  PokeAPI.Int,
  PokeAPI.Base.Int,
  PokeAPI.BerryFirmness.Int,
  PokeAPI.BerryFlavor.Int,
  PokeAPI.ContestType.Int,
  PokeAPI.ContestEffect.Int,
  PokeAPI.SuperContestEffect.Int,
  PokeAPI.EncounterMethod.Int,
  PokeAPI.EncounterCondition.Int, PokeAPI.EncounterConditionValue.Int, PokeAPI.EvolutionChain.Int, PokeAPI.EvolutionTrigger.Int,
  PokeAPI.Generation.Int, PokeAPI.Pokedex.Int, PokeAPI.Version.Int, PokeAPI.VersionGroup.Int;

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
    function GetContestsType(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetContestsType(const URL: string): IListResponse; overload;
    function GetContestType(const Id: Integer): IContestType; overload;
    function GetContestType(const Name: string): IContestType; overload;
    function GetContestEffects(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetContestEffects(const URL: string): IListResponse; overload;
    function GetContestEffect(const Id: Integer): IContestEffect;
    function GetSuperContestEffects(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetSuperContestEffects(const URL: string): IListResponse; overload;
    function GetSuperContestEffect(const Id: Integer): ISuperContestEffect;
    function GetEncounterMethods(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetEncounterMethods(const URL: string): IListResponse; overload;
    function GetEncounterMethod(const Id: Integer): IEncounterMethod; overload;
    function GetEncounterMethod(const Name: string): IEncounterMethod; overload;
    function GetEncounterConditions(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetEncounterConditions(const URL: string): IListResponse; overload;
    function GetEncounterCondition(const Id: Integer): IEncounterCondition; overload;
    function GetEncounterCondition(const Name: string): IEncounterCondition; overload;
    function GetEncounterConditionValues(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetEncounterConditionValues(const URL: string): IListResponse; overload;
    function GetEncounterConditionValue(const Id: Integer): IEncounterConditionValue; overload;
    function GetEncounterConditionValue(const Name: string): IEncounterConditionValue; overload;
    function GetEvolutionChains(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetEvolutionChains(const URL: string): IListResponse; overload;
    function GetEvolutionChain(const Id: Integer): IEvolutionChain; overload;
    function GetEvolutionTriggers(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetEvolutionTriggers(const URL: string): IListResponse; overload;
    function GetEvolutionTrigger(const Id: Integer): IEvolutionTrigger; overload;
    function GetEvolutionTrigger(const Name: string): IEvolutionTrigger; overload;
    function GetGenerations(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetGenerations(const URL: string): IListResponse; overload;
    function GetGeneration(const Id: Integer): IGeneration; overload;
    function GetGeneration(const Name: string): IGeneration; overload;
    function GetPokedexes(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetPokedexes(const URL: string): IListResponse; overload;
    function GetPokedex(const Id: Integer): IPokedex; overload;
    function GetPokedex(const Name: string): IPokedex; overload;
    function GetVersions(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetVersions(const URL: string): IListResponse; overload;
    function GetVersion(const Id: Integer): IVersion; overload;
    function GetVersion(const Name: string): IVersion; overload;
    function GetVersionGroups(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetVersionGroups(const URL: string): IListResponse; overload;
    function GetVersionGroup(const Id: Integer): IVersionGroup; overload;
    function GetVersionGroup(const Name: string): IVersionGroup; overload;
  end;

implementation

uses
  REST.Types,
  REST.Json,
  SysUtils,
  PokeAPI.Berry,
  PokeAPI.BerryFirmness,
  PokeAPI.BerryFlavor,
  PokeAPI.ContestType,
  PokeAPI.ContestEffect,
  PokeAPI.SuperContestEffect,
  PokeAPI.EncounterMethod,
  PokeAPI.EncounterCondition, PokeAPI.EncounterConditionValue, PokeAPI.EvolutionChain, PokeAPI.EvolutionTrigger, PokeAPI.Generation,
  PokeAPI.Pokedex, PokeAPI.Version, PokeAPI.VersionGroup;

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

function TPokeAPI.GetContestsType(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'contest-type';
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

function TPokeAPI.GetContestsType(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetContestType(const Id: Integer): IContestType;
begin
  Result := GetContestType(IntToStr(Id));
end;

function TPokeAPI.GetContestType(const Name: string): IContestType;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'contest-type/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TContestType>(Response.JSONText).New;
end;

function TPokeAPI.GetContestEffects(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'contest-effect';
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

function TPokeAPI.GetContestEffects(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetContestEffect(const Id: Integer): IContestEffect;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'contest-effect/' + IntToStr(Id);
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TContestEffect>(Response.JSONText).New;
end;

function TPokeAPI.GetSuperContestEffects(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'contest-effect';
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

function TPokeAPI.GetSuperContestEffects(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetSuperContestEffect(const Id: Integer): ISuperContestEffect;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'super-contest-effect/' + IntToStr(Id);
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TSuperContestEffect>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterMethods(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-method';
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

function TPokeAPI.GetEncounterMethods(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterMethod(const Id: Integer): IEncounterMethod;
begin
  Result := GetEncounterMethod(IntToStr(Id));
end;

function TPokeAPI.GetEncounterMethod(const Name: string): IEncounterMethod;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-method/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TEncounterMethod>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterConditions(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-condition';
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

function TPokeAPI.GetEncounterConditions(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterCondition(const Id: Integer): IEncounterCondition;
begin
  Result := GetEncounterCondition(IntToStr(Id));
end;

function TPokeAPI.GetEncounterCondition(const Name: string): IEncounterCondition;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-condition/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TEncounterCondition>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterConditionValues(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-condition-value';
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

function TPokeAPI.GetEncounterConditionValues(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetEncounterConditionValue(const Id: Integer): IEncounterConditionValue;
begin
  Result := GetEncounterConditionValue(IntToStr(Id));
end;

function TPokeAPI.GetEncounterConditionValue(const Name: string): IEncounterConditionValue;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'encounter-condition-value/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TEncounterConditionValue>(Response.JSONText).New;
end;

function TPokeAPI.GetEvolutionChains(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'evolution-chain';
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

function TPokeAPI.GetEvolutionChains(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetEvolutionChain(const Id: Integer): IEvolutionChain;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'evolution-chain/' + IntToStr(Id);
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TEvolutionChain>(Response.JSONText).New;
end;

function TPokeAPI.GetEvolutionTriggers(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'evolution-trigger';
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

function TPokeAPI.GetEvolutionTriggers(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetEvolutionTrigger(const Id: Integer): IEvolutionTrigger;
begin
  Result := GetEvolutionTrigger(IntToStr(Id));
end;

function TPokeAPI.GetEvolutionTrigger(const Name: string): IEvolutionTrigger;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'evolution-trigger/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TEvolutionTrigger>(Response.JSONText).New;
end;

function TPokeAPI.GetGenerations(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'generation';
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

function TPokeAPI.GetGenerations(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetGeneration(const Id: Integer): IGeneration;
begin
  Result := GetGeneration(IntToStr(Id));
end;

function TPokeAPI.GetGeneration(const Name: string): IGeneration;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'generation/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TGeneration>(Response.JSONText).New;
end;

function TPokeAPI.GetPokedexes(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'pokedex';
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

function TPokeAPI.GetPokedexes(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetPokedex(const Id: Integer): IPokedex;
begin
  Result := GetPokedex(IntToStr(Id));
end;

function TPokeAPI.GetPokedex(const Name: string): IPokedex;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'pokedex/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TPokedex>(Response.JSONText).New;
end;

function TPokeAPI.GetVersions(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'version';
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

function TPokeAPI.GetVersions(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetVersion(const Id: Integer): IVersion;
begin
  Result := GetVersion(IntToStr(Id));
end;

function TPokeAPI.GetVersion(const Name: string): IVersion;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'version/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TVersion>(Response.JSONText).New;
end;

function TPokeAPI.GetVersionGroups(const Limit: Integer = -1;
  const Offset: Integer = -1): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'version-group';
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

function TPokeAPI.GetVersionGroups(const URL: string): IListResponse;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := '';
  Client.BaseURL := URL;
  Request.Execute;
  Result := TJson.JsonToObject<TListResponse>(Response.JSONText).New;
end;

function TPokeAPI.GetVersionGroup(const Id: Integer): IVersionGroup;
begin
  Result := GetVersionGroup(IntToStr(Id));
end;

function TPokeAPI.GetVersionGroup(const Name: string): IVersionGroup;
begin
  Request.Method := TRESTRequestMethod.rmGET;
  Request.Resource := 'version-group/' + Name;
  Client.BaseURL := BaseURL;
  Request.Execute;
  Result := TJson.JsonToObject<TVersionGroup>(Response.JSONText).New;
end;

function TPokeAPI.New: IPokeAPI;
begin
  Result := Self;
end;

end.
