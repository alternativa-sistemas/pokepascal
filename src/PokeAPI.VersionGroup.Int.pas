unit PokeAPI.VersionGroup.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IVersionGroup = interface
  ['{1C9093AD-E680-4400-B6EF-613B7BE44F1F}']
    function Getid: Integer;
    function Getname: string;
    function Getorder: Integer;
    function Getgeneration: INamedAPIResource;
    function Getmove_learn_methods: INamedAPIResourceList;
    function Getpokedexes: INamedAPIResourceList;
    function Getregions: INamedAPIResourceList;
    function Getversions: INamedAPIResourceList;
    property id: Integer read Getid;
    property name: string read Getname;
    property order: Integer read Getorder;
    property generation: INamedAPIResource read Getgeneration;
    property move_learn_methods: INamedAPIResourceList read Getmove_learn_methods;
    property pokedexes: INamedAPIResourceList read Getpokedexes;
    property regions: INamedAPIResourceList read Getregions;
    property versions: INamedAPIResourceList read Getversions;
  end;

implementation

end.
