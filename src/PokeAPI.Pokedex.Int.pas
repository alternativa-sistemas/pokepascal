unit PokeAPI.Pokedex.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IPokemonEntry = interface
  ['{9B7C9315-E900-4177-9E03-505058F1E6A9}']
    function Getentry_number: Integer;
    function Getpokemon_species: INamedAPIResource;
    property entry_number: Integer read Getentry_number;
    property pokemon_species: INamedAPIResource read Getpokemon_species;
  end;

  TArrayIPokemonEntry = array of IPokemonEntry;

  IPokemonEntryList = interface
  ['{A3A59711-A9E3-4DBB-ADA1-E10D70A606F5}']
    function Count: Integer;
    function Item(const Index: Integer): IPokemonEntry;
  end;

  IPokedex = interface
  ['{EC938DB2-E997-4EBB-B560-FD407D4B9B68}']
    function Getid: Integer;
    function Getname: string;
    function Getis_main_series: Boolean;
    function Getdescriptions: IDescriptionList;
    function Getnames: INameList;
    function Getpokemon_entries: IPokemonEntryList;
    function Getregion: INamedAPIResource;
    function Getversion_groups: INamedAPIResourceList;
    property id: Integer read Getid;
    property name: string read Getname;
    property is_main_series: Boolean read Getis_main_series;
    property descriptions: IDescriptionList read Getdescriptions;
    property names: INameList read Getnames;
    property pokemon_entries: IPokemonEntryList read Getpokemon_entries;
    property region: INamedAPIResource read Getregion;
    property version_groups: INamedAPIResourceList read Getversion_groups;
  end;

implementation

end.
