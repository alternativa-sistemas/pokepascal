unit PokeAPI.EvolutionTrigger;

interface

uses
  PokeAPI.EvolutionTrigger.Int,
  PokeAPI.Base.Int,
  PokeAPI.Base;

type
  TEvolutionTrigger = class(TInterfacedObject, IEvolutionTrigger)
  private
    Fid: Integer;
    Fname: string;
    FnamesInt: INameList;
    Fnames: TArrayName;
    Fpokemon_speciesInt: INamedAPIResourceList;
    Fpokemon_species: TArrayNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
    function Getpokemon_species: INamedAPIResourceList;
  public
    function New: IEvolutionTrigger;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property names: TArrayName read Fnames;
    property pokemon_species: TArrayNamedAPIResource read Fpokemon_species;
  end;

implementation

{ TEvolutionTrigger }

function TEvolutionTrigger.Getid: Integer;
begin
  Result := Fid;
end;

function TEvolutionTrigger.Getname: string;
begin
  Result := Fname;
end;

function TEvolutionTrigger.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TEvolutionTrigger.Getpokemon_species: INamedAPIResourceList;
begin
  if Fpokemon_speciesInt = nil then
  begin
    Fpokemon_speciesInt := TNamedAPIResourceList.Create(Fpokemon_species).New;
  end;
  Result := Fpokemon_speciesInt;
end;

function TEvolutionTrigger.New: IEvolutionTrigger;
begin
  Result := Self;
end;

end.
