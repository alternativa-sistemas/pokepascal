unit PokeAPI.Int;

interface

uses
  PokeAPI.Base.Int,
  PokeAPI.Berry.Int,
  PokeAPI.BerryFirmness.Int,
  PokeAPI.BerryFlavor.Int,
  PokeAPI.ContestType.Int,
  PokeAPI.ContestEffect.Int, PokeAPI.SuperContestEffect.Int, PokeAPI.EncounterMethod.Int, PokeAPI.EncounterCondition.Int, PokeAPI.EncounterConditionValue.Int,
  PokeAPI.EvolutionChain.Int, PokeAPI.EvolutionTrigger.Int, PokeAPI.Generation.Int, PokeAPI.Pokedex.Int, PokeAPI.Version.Int,
  PokeAPI.VersionGroup.Int;

type
  IPokeAPI = interface
  ['{05357B51-A62A-4C56-9816-D33CEB371B3A}']
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

end.
