unit PokeAPI.Int;

interface

uses
  PokeAPI.Base.Int,
  PokeAPI.Berry.Int,
  PokeAPI.BerryFirmness.Int,
  PokeAPI.BerryFlavor.Int,
  PokeAPI.ContestType.Int,
  PokeAPI.ContestEffect.Int, PokeAPI.SuperContestEffect.Int, PokeAPI.EncounterMethod.Int, PokeAPI.EncounterCondition.Int;

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
  end;

implementation

end.
