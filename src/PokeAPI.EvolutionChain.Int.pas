unit PokeAPI.EvolutionChain.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IChainLink = interface;

  IChainLinkList = interface;

  IEvolutionDetails = interface
  ['{AA85BBD4-3A71-44FC-B236-46D8549156BB}']
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
    property item: INamedAPIResource read Getitem;
    property trigger: INamedAPIResource read Gettrigger;
    property gender: Integer read Getgender;
    property held_item: INamedAPIResource read Getheld_item;
    property known_move: INamedAPIResource read Getknown_move;
    property known_move_type: INamedAPIResource read Getknown_move_type;
    property location: INamedAPIResource read Getlocation;
    property min_level: Integer read Getmin_level;
    property min_happiness: Integer read Getmin_happiness;
    property min_beauty: Integer read Getmin_beauty;
    property min_affection: Integer read Getmin_affection;
    property needs_overworld_rain: Boolean read Getneeds_overworld_rain;
    property party_species: INamedAPIResource read Getparty_species;
    property party_type: INamedAPIResource read Getparty_type;
    property relative_physical_stats: Integer read Getrelative_physical_stats;
    property time_of_day: string read Gettime_of_day;
    property trade_species: INamedAPIResource read Gettrade_species;
    property turn_upside_down: Boolean read Getturn_upside_down;
  end;

  IChainLink = interface
  ['{844AC415-71C2-4D7B-9EDD-6A27D847E163}']
    function Getis_baby: Boolean;
    function Getspecies: INamedAPIResource;
    function Getevolution_details: IEvolutionDetails;
    function Getevolves_to: IChainLinkList;
    property is_baby: Boolean read Getis_baby;
    property species: INamedAPIResource read Getspecies;
    property evolution_details: IEvolutionDetails read Getevolution_details;
    property evolves_to: IChainLinkList read Getevolves_to;
  end;

  TArrayIChainLink = array of IChainLink;

  IChainLinkList = interface
  ['{F087A434-CD6E-4DE8-9624-9E82CC473B74}']
    function Count: Integer;
    function Item(const Index: Integer): IChainLink;
  end;

  IEvolutionChain = interface
  ['{8026C4EE-96D3-41A0-BC34-AF6B50B26C2C}']
    function Getid: Integer;
    function Getbaby_trigger_item: INamedAPIResource;
    function Getchain: IChainLink;
    property id: Integer read Getid;
    property baby_trigger_item: INamedAPIResource read Getbaby_trigger_item;
    property chain: IChainLink read Getchain;
  end;

implementation

end.

