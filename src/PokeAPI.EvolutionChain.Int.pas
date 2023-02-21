unit PokeAPI.EvolutionChain.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IChainLink = interface;

  IChainLinkList = interface;

  IEvolutionDetails = interface
//  ['{AA85BBD4-3A71-44FC-B236-46D8549156BB}']
//    property item: ": null,
//    property trigger": {
//      "name": "level-up",
//      "url": "https://pokeapi.co/api/v2/evolution-trigger/1/"
//    },
//    property gender": null,
//    property held_item": null,
//    property known_move": null,
//    property known_move_type": null,
//    property location": null,
//    property min_level": 20,
//    property min_happiness": null,
//    property min_beauty": null,
//    property min_affection": null,
//    property needs_overworld_rain": false,
//    property party_species": null,
//    property party_type": null,
//    property relative_physical_stats": null,
//    property time_of_day": "",
//    property trade_species": null,
//    property turn_upside_down: Boolean;
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

  IChainLinkList = interface
  ['{F087A434-CD6E-4DE8-9624-9E82CC473B74}']
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

