unit PokeAPI.EvolutionChain;

interface

uses
  PokeAPI.EvolutionChain.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TEvolutionDetails = class(TInterfacedObject, IEvolutionDetails)
  private
    FitemInt: INamedAPIResource;
    Fitem: TNamedAPIResource;
    FtriggerInt: INamedAPIResource;
    Ftrigger: TNamedAPIResource;
    Fgender: Integer;
    Fheld_itemInt: INamedAPIResource;
    Fheld_item: TNamedAPIResource;
    Fknown_moveInt: INamedAPIResource;
    Fknown_move: TNamedAPIResource;
    Fknown_move_typeInt: INamedAPIResource;
    Fknown_move_type: TNamedAPIResource;
    FlocationInt: INamedAPIResource;
    Flocation: TNamedAPIResource;
    Fmin_level: Integer;
    Fmin_happiness: Integer;
    Fmin_beauty: Integer;
    Fmin_affection: Integer;
    Fneeds_overworld_rain: Boolean;
    Fparty_speciesInt: INamedAPIResource;
    Fparty_species: TNamedAPIResource;
    Fparty_typeInt: INamedAPIResource;
    Fparty_type: TNamedAPIResource;
    Frelative_physical_stats: Integer;
    Ftime_of_day: string;
    Ftrade_speciesInt: INamedAPIResource;
    Ftrade_species: TNamedAPIResource;
    Fturn_upside_down: Boolean;
    function Getitem: INamedAPIResource;
    function Gettrigger: INamedAPIResource;
    function Getgender: Integer;
    function Getheld_item: INamedAPIResource;
    function Getknown_move: INamedAPIResource;
    function Getknown_move_type: INamedAPIResource;
    function Getlocation: INamedAPIResource;
    function Getmin_level: Integer;
    function Getmin_happiness: Integer;
    function Getmin_beauty: Integer;
    function Getmin_affection: Integer;
    function Getneeds_overworld_rain: Boolean;
    function Getparty_species: INamedAPIResource;
    function Getparty_type: INamedAPIResource;
    function Getrelative_physical_stats: Integer;
    function Gettime_of_day: string;
    function Gettrade_species: INamedAPIResource;
    function Getturn_upside_down: Boolean;
  public
    function New: IEvolutionDetails;
  published
    property item: TNamedAPIResource read Fitem;
    property trigger: TNamedAPIResource read Ftrigger;
    property gender: Integer read Getgender;
    property held_item: TNamedAPIResource read Fheld_item;
    property known_move: TNamedAPIResource read Fknown_move;
    property known_move_type: TNamedAPIResource read Fknown_move_type;
    property location: TNamedAPIResource read Flocation;
    property min_level: Integer read Getmin_level;
    property min_happiness: Integer read Getmin_happiness;
    property min_beauty: Integer read Getmin_beauty;
    property min_affection: Integer read Getmin_affection;
    property needs_overworld_rain: Boolean read Getneeds_overworld_rain;
    property party_species: TNamedAPIResource read Fparty_species;
    property party_type: TNamedAPIResource read Fparty_type;
    property relative_physical_stats: Integer read Getrelative_physical_stats;
    property time_of_day: string read Gettime_of_day;
    property trade_species: TNamedAPIResource read Ftrade_species;
    property turn_upside_down: Boolean read Getturn_upside_down;
  end;

  TChainLink = class;

  TArrayChainLink = array of TChainLink;

  TChainLink = class(TInterfacedObject, IChainLink)
  private
    Fis_baby: Boolean;
    FspeciesInt: INamedAPIResource;
    Fspecies: TNamedAPIResource;
    Fevolution_detailsInt: IEvolutionDetails;
    Fevolution_details: TEvolutionDetails;
    Fevolves_toInt: IChainLinkList;
    Fevolves_to: TArrayChainLink;
    function Getis_baby: Boolean;
    function Getspecies: INamedAPIResource;
    function Getevolution_details: IEvolutionDetails;
    function Getevolves_to: IChainLinkList;
  public
    function New: IChainLink;
  published
    property is_baby: Boolean read Getis_baby;
    property species: TNamedAPIResource read Fspecies;
    property evolution_details: TEvolutionDetails read Fevolution_details;
    property evolves_to: TArrayChainLink read Fevolves_to;
  end;

  TChainkLinkList = class(TInterfacedObject, IChainLinkList)
  private
    FArr: TArrayIChainLink;
  public
    constructor Create(const Arr: TArrayChainLink); overload;
    constructor Create(const Arr: TArrayIChainLink); overload;
    function New: IChainLinkList;
    function Count: Integer;
    function Item(const Index: Integer): IChainLink;
  end;

  TEvolutionChain = class(TInterfacedObject, IEvolutionChain)
  private
    Fid: Integer;
    Fbaby_trigger_itemInt: INamedAPIResource;
    Fbaby_trigger_item: TNamedAPIResource;
    FchainInt: IChainLink;
    Fchain: TChainLink;
    function Getid: Integer;
    function Getbaby_trigger_item: INamedAPIResource;
    function Getchain: IChainLink;
  public
    function New: IEvolutionChain;
  published
    property id: Integer read Getid;
    property baby_trigger_item: TNamedAPIResource read Fbaby_trigger_item;
    property chain: TChainLink read Fchain;
  end;

implementation

{ TEvolutionDetails }

function TEvolutionDetails.Getitem: INamedAPIResource;
begin
  if FitemInt = nil then
  begin
    FitemInt := Fitem.New;
  end;
  Result := FitemInt;
end;

function TEvolutionDetails.Gettrigger: INamedAPIResource;
begin
  if FtriggerInt = nil then
  begin
    FtriggerInt := Ftrigger.New;
  end;
  Result := FtriggerInt;
end;

function TEvolutionDetails.Getgender: Integer;
begin
  Result := Fgender;
end;

function TEvolutionDetails.Getheld_item: INamedAPIResource;
begin
  if Fheld_itemInt = nil then
  begin
    Fheld_itemInt := Fheld_item.New;
  end;
  Result := Fheld_itemInt;
end;

function TEvolutionDetails.Getknown_move: INamedAPIResource;
begin
  if Fknown_moveInt = nil then
  begin
    Fknown_moveInt := Fknown_move.New;
  end;
  Result := Fknown_moveInt;
end;

function TEvolutionDetails.Getknown_move_type: INamedAPIResource;
begin
  if Fknown_move_typeInt = nil then
  begin
    Fknown_move_typeInt := Fknown_move_type.New;
  end;
  Result := Fknown_move_typeInt;
end;

function TEvolutionDetails.Getlocation: INamedAPIResource;
begin
  if FlocationInt = nil then
  begin
    FlocationInt := Flocation.New;
  end;
  Result := FlocationInt;
end;

function TEvolutionDetails.Getmin_level: Integer;
begin
  Result := Fmin_level;
end;

function TEvolutionDetails.Getmin_happiness: Integer;
begin
  Result := Fmin_happiness;
end;

function TEvolutionDetails.Getmin_beauty: Integer;
begin
  Result := Fmin_beauty;
end;

function TEvolutionDetails.Getmin_affection: Integer;
begin
  Result := Fmin_affection;
end;

function TEvolutionDetails.Getneeds_overworld_rain: Boolean;
begin
  Result := Fneeds_overworld_rain;
end;

function TEvolutionDetails.Getparty_species: INamedAPIResource;
begin
  if Fparty_typeInt = nil then
  begin
    Fparty_typeInt := Fparty_type.New;
  end;
  Result := Fparty_typeInt;
end;

function TEvolutionDetails.Getparty_type: INamedAPIResource;
begin
  if Fparty_typeInt = nil then
  begin
    Fparty_typeInt := Fparty_type.New;
  end;
  Result := Fparty_typeInt;
end;

function TEvolutionDetails.Getrelative_physical_stats: Integer;
begin
  Result := Frelative_physical_stats;
end;

function TEvolutionDetails.Gettime_of_day: string;
begin
  Result := Ftime_of_day;
end;

function TEvolutionDetails.Gettrade_species: INamedAPIResource;
begin
  if Ftrade_speciesInt = nil then
  begin
    Ftrade_speciesInt := Ftrade_species.New;
  end;
  Result := Ftrade_speciesInt;
end;

function TEvolutionDetails.Getturn_upside_down: Boolean;
begin
  Result := Fturn_upside_down;
end;

function TEvolutionDetails.New: IEvolutionDetails;
begin
  Result := Self;
end;

{ TChainLink }

function TChainLink.Getis_baby: Boolean;
begin
  Result := Fis_baby;
end;

function TChainLink.Getspecies: INamedAPIResource;
begin
  if FspeciesInt = nil then
  begin
    FspeciesInt := Fspecies.New;
  end;
  Result := FspeciesInt;
end;

function TChainLink.Getevolution_details: IEvolutionDetails;
begin
  if Fevolution_detailsInt = nil then
  begin
    Fevolution_detailsInt := Fevolution_details.New;
  end;
  Result := Fevolution_detailsInt;
end;

function TChainLink.Getevolves_to: IChainLinkList;
begin
  if Fevolves_toInt = nil then
  begin
    Fevolves_toInt := TChainkLinkList.Create(Fevolves_to).New;
  end;
  Result := Fevolves_toInt;
end;

function TChainLink.New: IChainLink;
begin
  Result := Self;
end;

{ TChainkLinkList }

constructor TChainkLinkList.Create(const Arr: TArrayChainLink);
var
  ArrInt: TArrayIChainLink;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TChainkLinkList.Create(const Arr: TArrayIChainLink);
begin
  FArr := Arr;
end;

function TChainkLinkList.New: IChainLinkList;
begin
  Result := Self;
end;

function TChainkLinkList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TChainkLinkList.Item(const Index: Integer): IChainLink;
begin
  Result := FArr[Index];
end;

{ TEvolutionChain }

function TEvolutionChain.Getid: Integer;
begin
  Result := Fid;
end;

function TEvolutionChain.Getbaby_trigger_item: INamedAPIResource;
begin
  if Fbaby_trigger_itemInt = nil then
  begin
    Fbaby_trigger_itemInt := Fbaby_trigger_item.New;
  end;
  Result := Fbaby_trigger_itemInt;
end;

function TEvolutionChain.Getchain: IChainLink;
begin
  if FchainInt = nil then
  begin
    FchainInt := Fchain.New;
  end;
  Result := FchainInt;
end;

function TEvolutionChain.New: IEvolutionChain;
begin
  Result := Self;
end;

end.
