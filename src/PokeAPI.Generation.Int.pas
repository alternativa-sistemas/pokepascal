unit PokeAPI.Generation.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IGeneration = interface
  ['{832D0216-DEDA-4EF8-BA6F-E33D08BB6605}']
    function Getid: Integer;
    function Getname: string;
    function Getabilities: INamedAPIResourceList;
    function Getnames: INameList;
    function Getmain_region: INamedAPIResource;
    function Getmoves: INamedAPIResourceList;
    function Getpokemon_species: INamedAPIResourceList;
    function Gettypes: INamedAPIResourceList;
    function Getversion_groups: INamedAPIResourceList;
    property id: Integer read Getid;
    property name: string read Getname;
    property abilities: INamedAPIResourceList read Getabilities;
    property names: INameList read Getnames;
    property main_region: INamedAPIResource read Getmain_region;
    property moves: INamedAPIResourceList read Getmoves;
    property pokemon_species: INamedAPIResourceList read Getpokemon_species;
    property types: INamedAPIResourceList read Gettypes;
    property version_groups: INamedAPIResourceList read Getversion_groups;
  end;

implementation

end.
