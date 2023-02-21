unit PokeAPI.Pokedex;

interface

uses
  PokeAPI.Pokedex.Int,
  PokeAPI.Base.Int,
  PokeAPI.Base;

type
  TPokemonEntry = class(TInterfacedObject, IPokemonEntry)
  private
    Fentry_number: Integer;
    Fpokemon_species: TNamedAPIResource;
    Fpokemon_speciesInt: INamedAPIResource;
    function Getentry_number: Integer;
    function Getpokemon_species: INamedAPIResource;
  public
    function New: IPokemonEntry;
  published
    property entry_number: Integer read Getentry_number;
    property pokemon_species: INamedAPIResource read Getpokemon_species;
  end;

  TArrayPokemonEntry = array of TPokemonEntry;

  TPokemonEntryList = class(TInterfacedObject, IPokemonEntryList)
  private
    FArr: TArrayIPokemonEntry;
  public
    constructor Create(const Arr: TArrayPokemonEntry); overload;
    constructor Create(const Arr: TArrayIPokemonEntry); overload;
    function New: IPokemonEntryList;
    function Count: Integer;
    function Item(const Index: Integer): IPokemonEntry;
  end;

  TPokedex = class(TInterfacedObject, IPokedex)
  private
    Fid: Integer;
    Fname: string;
    Fis_main_series: Boolean;
    FdescriptionsInt: IDescriptionList;
    Fdescriptions: TArrayDescription;
    FnamesInt: INameList;
    Fnames: TArrayName;
    Fpokemon_entriesInt: IPokemonEntryList;
    Fpokemon_entries: TArrayPokemonEntry;
    FregionInt: INamedAPIResource;
    Fregion: TNamedAPIResource;
    Fversion_groupsInt: INamedAPIResourceList;
    Fversion_groups: TArrayNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getis_main_series: Boolean;
    function Getdescriptions: IDescriptionList;
    function Getnames: INameList;
    function Getpokemon_entries: IPokemonEntryList;
    function Getregion: INamedAPIResource;
    function Getversion_groups: INamedAPIResourceList;
  public
    function New: IPokedex;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property is_main_series: Boolean read Getis_main_series;
    property descriptions: TArrayDescription read Fdescriptions;
    property names: TArrayName read Fnames;
    property pokemon_entries: TArrayPokemonEntry read Fpokemon_entries;
    property region: TNamedAPIResource read Fregion;
    property version_groups: TArrayNamedAPIResource read Fversion_groups;
  end;

implementation

{ TPokemonEntry }

function TPokemonEntry.Getentry_number: Integer;
begin
  Result := Fentry_number;
end;

function TPokemonEntry.Getpokemon_species: INamedAPIResource;
begin
  if Fpokemon_speciesInt = nil then
  begin
    Fpokemon_speciesInt := Fpokemon_species.New;
  end;
  Result := Fpokemon_speciesInt;
end;

function TPokemonEntry.New: IPokemonEntry;
begin
  Result := Self;
end;

{ TPokemonEntryList }

constructor TPokemonEntryList.Create(const Arr: TArrayPokemonEntry);
var
  ArrInt: TArrayIPokemonEntry;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TPokemonEntryList.Create(const Arr: TArrayIPokemonEntry);
begin
  FArr := Arr;
end;

function TPokemonEntryList.New: IPokemonEntryList;
begin
  Result := Self;
end;

function TPokemonEntryList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TPokemonEntryList.Item(const Index: Integer): IPokemonEntry;
begin
  Result := FArr[Index];
end;

{ TPokedex }

function TPokedex.Getid: Integer;
begin
  Result := Fid;
end;

function TPokedex.Getname: string;
begin
  Result := Fname;
end;

function TPokedex.Getis_main_series: Boolean;
begin
  Result := Fis_main_series;
end;

function TPokedex.Getdescriptions: IDescriptionList;
begin
  if FdescriptionsInt = nil then
  begin
    FdescriptionsInt := TDescriptionList.Create(Fdescriptions).New;
  end;
  Result := FdescriptionsInt;
end;

function TPokedex.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TPokedex.Getpokemon_entries: IPokemonEntryList;
begin
  if Fpokemon_entriesInt = nil then
  begin
    Fpokemon_entriesInt := TPokemonEntryList.Create(Fpokemon_entries).New;
  end;
  Result := Fpokemon_entriesInt;
end;

function TPokedex.Getregion: INamedAPIResource;
begin
  if FregionInt = nil then
  begin
    FregionInt := Fregion.New;
  end;
  Result := FregionInt;
end;

function TPokedex.Getversion_groups: INamedAPIResourceList;
begin
  if Fversion_groupsInt = nil then
  begin
    Fversion_groupsInt := TNamedAPIResourceList.Create(Fversion_groups);
  end;
  Result := Fversion_groupsInt;
end;

function TPokedex.New: IPokedex;
begin
  Result := Self;
end;

end.
