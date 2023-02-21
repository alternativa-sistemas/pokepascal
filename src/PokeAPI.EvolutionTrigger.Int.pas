unit PokeAPI.EvolutionTrigger.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IEvolutionTrigger = interface
  ['{6A98C629-30D2-4A29-9D05-9728C5EF8F52}']
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
    function Getpokemon_species: INamedAPIResourceList;
    property id: Integer read Getid;
    property name: string read Getname;
    property names: INameList read Getnames;
    property pokemon_species: INamedAPIResourceList read Getpokemon_species;
  end;

implementation

end.
