unit Test.PokeAPI;

interface

uses
  TestFramework
, PokeAPI
, PokeAPI.Base
, PokeAPI.Int
;

type
  TestTPokeAPI = class(TTestCase)
  strict private
    FPokeAPI: TPokeAPI;
    PokeAPI: IPokeAPI;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBerriesGET1;
    procedure TestBerriesGET2;
    procedure TestBerryGETId1;
    procedure TestBerryGETName1;
    procedure TestBerriesFirmnessGET1;
    procedure TestBerriesFirmnessGET2;
    procedure TestBerryFirmnessGETId1;
    procedure TestBerryFirmnessGETName1;
    procedure TestBerriesFlavorGET1;
    procedure TestBerriesFlavorGET2;
    procedure TestBerryFlavorGETId1;
    procedure TestBerryFlavorGETName1;
    procedure TestContestsTypeGET1;
    procedure TestContestsTypeGET2;
    procedure TestContestTypeGETId1;
    procedure TestContestTypeGETName1;
    procedure TestContestsEffectGET1;
    procedure TestContestsEffectGET2;
    procedure TestContestEffectGETId1;
    procedure TestSuperContestsEffectGET1;
    procedure TestSuperContestsEffectGET2;
    procedure TestSuperContestEffectGETId1;
    procedure TestEncounterMethodsGET1;
    procedure TestEncounterMethodsGET2;
    procedure TestEncounterMethodGETId1;
    procedure TestEncounterMethodGETName1;
    procedure TestEncounterConditionsGET1;
    procedure TestEncounterConditionsGET2;
    procedure TestEncounterConditionGETId1;
    procedure TestEncounterConditionGETName1;
    procedure TestEncounterConditionValuesGET1;
    procedure TestEncounterConditionValuesGET2;
    procedure TestEncounterConditionValueGETId1;
    procedure TestEncounterConditionValueGETName1;
    procedure TestEvolutionChainsGET1;
    procedure TestEvolutionChainsGET2;
    procedure TestEvolutionChainGETId1;
    procedure TestEvolutionTriggersGET1;
    procedure TestEvolutionTriggersGET2;
    procedure TestEvolutionTriggerGETId1;
    procedure TestEvolutionTriggerGETName1;
    procedure TestGenerationsGET1;
    procedure TestGenerationsGET2;
    procedure TestGenerationGETId1;
    procedure TestGenerationGETName1;
    procedure TestPokedexesGET1;
    procedure TestPokedexesGET2;
    procedure TestPokedexGETId1;
    procedure TestPokedexGETName1;
    procedure TestVersionsGET1;
    procedure TestVersionsGET2;
    procedure TestVersionGETId1;
    procedure TestVersionGETName1;
    procedure TestVersionGroupsGET1;
    procedure TestVersionGroupsGET2;
    procedure TestVersionGroupGETId1;
    procedure TestVersionGroupGETName1;
    procedure TestNew;
  end;

implementation

uses
  PokeAPI.Berry,
  PokeAPI.Berry.Int,
  PokeAPI.Base.Int,
  PokeAPI.BerryFirmness.Int,
  PokeAPI.BerryFlavor.Int,
  PokeAPI.ContestType,
  PokeAPI.ContestType.Int,
  PokeAPI.ContestEffect.Int,
  PokeAPI.SuperContestEffect.Int,
  PokeAPI.EncounterMethod.Int,
  PokeAPI.EncounterCondition.Int,
  PokeAPI.EncounterConditionValue.Int,
  PokeAPI.EvolutionChain.Int,
  PokeAPI.EvolutionTrigger.Int, PokeAPI.Generation.Int, PokeAPI.Pokedex.Int, PokeAPI.Version.Int, PokeAPI.VersionGroup.Int;

{ TestTPokeAPI }

procedure TestTPokeAPI.SetUp;
begin
  FPokeAPI := TPokeAPI.Create;
  PokeAPI := FPokeAPI.New;
end;

procedure TestTPokeAPI.TearDown;
begin
  PokeAPI := nil;
end;

procedure TestTPokeAPI.TestBerriesFirmnessGET1;
var
  BerryFirmness: IListResponse;
begin
  BerryFirmness := PokeAPI.GetBerriesFirmness;
  CheckEquals(5, BerryFirmness.count, 'incorrect count');
  CheckEquals('very-soft', BerryFirmness.results.Item(0).name, 'results.Item(0).name incorrect');
end;

procedure TestTPokeAPI.TestBerriesFirmnessGET2;
var
  Berries: IListResponse;
begin
  Berries := PokeAPI.GetBerriesFirmness;
  while Berries.next <> '' do
  begin
    Berries := PokeAPI.GetBerries(Berries.next);
  end;
end;

procedure TestTPokeAPI.TestBerriesGET1;
var
  Berries: IListResponse;
begin
  Berries := PokeAPI.GetBerries;
  CheckEquals(20, Berries.results.Count, 'results.Count incorreto');
  CheckEquals('cheri', Berries.results.Item(0).name, 'Primeiro cherry incorreto');
end;

procedure TestTPokeAPI.TestBerriesGET2;
var
  Berries: IListResponse;
begin
  Berries := PokeAPI.GetBerries;
  while Berries.next <> '' do
  begin
    Berries := PokeAPI.GetBerries(Berries.next);
  end;
end;

procedure TestTPokeAPI.TestBerryFirmnessGETId1;
var
  Berry: IBerryFirmness;
begin
  Berry := PokeAPI.GetBerryFirmness(1);
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('very-soft', Berry.name, 'incorrect name for id 1');
  CheckEquals(8, Berry.berries.Count, 'incorrect berries.Count for id 1');
end;

procedure TestTPokeAPI.TestBerryFirmnessGETName1;
var
  Berry: IBerryFirmness;
begin
  Berry := PokeAPI.GetBerryFirmness('very-soft');
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('very-soft', Berry.name, 'incorrect name for id 1');
  CheckEquals(8, Berry.berries.Count, 'incorrect berries.Count for id 1');
end;

procedure TestTPokeAPI.TestBerryGETId1;
var
  Berry: IBerry;
begin
  Berry := PokeAPI.GetBerry(1);
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('cheri', Berry.name, 'incorrect name for id 1');
  CheckEquals('soft', Berry.firmness.name, 'incorrect firmness.name for id 1');
  CheckEquals('spicy', Berry.flavors.Item(0).flavor.name, 'incorrect flavors.Item(0).flavor.name for id 1');
  CheckEquals(5, Berry.flavors.Count, 'incorrect flavors.Count for id 1');
end;

procedure TestTPokeAPI.TestBerryGETName1;
var
  Berry: IBerry;
begin
  Berry := PokeAPI.GetBerry('cheri');
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('cheri', Berry.name, 'incorrect name for id 1');
  CheckEquals('soft', Berry.firmness.name, 'incorrect firmness.name for id 1');
  CheckEquals('spicy', Berry.flavors.Item(0).flavor.name, 'incorrect flavors.Item(0).flavor.name for id 1');
  CheckEquals(5, Berry.flavors.Count, 'incorrect flavors.Count for id 1');
end;

procedure TestTPokeAPI.TestBerriesFlavorGET1;
var
  BerryFlavors: IListResponse;
begin
  BerryFlavors := PokeAPI.GetBerriesFlavor;
  CheckEquals(5, BerryFlavors.results.Count, 'results.Count incorreto');
  CheckEquals('spicy', BerryFlavors.results.Item(0).name, 'Primeiro cherry incorreto');
end;

procedure TestTPokeAPI.TestBerriesFlavorGET2;
var
  BerryFlavors: IListResponse;
begin
  BerryFlavors := PokeAPI.GetBerriesFlavor;
  while BerryFlavors.next <> '' do
  begin
    BerryFlavors := PokeAPI.GetBerriesFlavor(BerryFlavors.next);
  end;
end;

procedure TestTPokeAPI.TestBerryFlavorGETId1;
var
  Berry: IBerryFlavor;
begin
  Berry := PokeAPI.GetBerryFlavor(1);
  CheckEquals(1, Berry.id, 'wrong id for id 1');
  CheckEquals('spicy', Berry.name, 'wrong name for id 1');
  CheckEquals(10, Berry.berries.Item(0).potency, 'wrong berries.Item(0).potency for id 1');
  CheckEquals('cool', Berry.contest_type.name, 'wrong contest_type.name for id 1');
end;

procedure TestTPokeAPI.TestBerryFlavorGETName1;
var
  Berry: IBerryFlavor;
begin
  Berry := PokeAPI.GetBerryFlavor('spicy');
  CheckEquals(1, Berry.id, 'wrong id for spicy');
  CheckEquals('spicy', Berry.name, 'wrong name for spicy');
  CheckEquals(10, Berry.berries.Item(0).potency, 'wrong berries.Item(0).potency for spicy');
  CheckEquals('cool', Berry.contest_type.name, 'wrong contest_type.name for spicy');
end;

procedure TestTPokeAPI.TestContestsTypeGET1;
var
  ContestType: IListResponse;
begin
  ContestType := PokeAPI.GetContestsType;
  CheckEquals(5, ContestType.results.Count, 'results.Count incorreto');
  CheckEquals('cool', ContestType.results.Item(0).name, 'Primeiro cherry incorreto');
end;

procedure TestTPokeAPI.TestContestsTypeGET2;
var
  ContestType: IListResponse;
begin
  ContestType := PokeAPI.GetContestsType;
  while ContestType.next <> '' do
  begin
    ContestType := PokeAPI.GetContestsType(ContestType.next);
  end;
end;

procedure TestTPokeAPI.TestContestTypeGETId1;
var
  ContestType: IContestType;
begin
  ContestType := PokeAPI.GetContestType(1);
  CheckEquals(1, ContestType.id, 'wrong id for id 1');
  CheckEquals('cool', ContestType.name, 'wrong name for id 1');
  CheckEquals('spicy', ContestType.berry_flavor.name, 'wrong berry_flavor.name for id 1');
  CheckEquals('Sang-froid', ContestType.names.Item(0).name, 'wrong names.Item(0).name for id 1');
end;

procedure TestTPokeAPI.TestContestTypeGETName1;
var
  ContestType: IContestType;
begin
  ContestType := PokeAPI.GetContestType('cool');
  CheckEquals(1, ContestType.id, 'wrong id for cool');
  CheckEquals('cool', ContestType.name, 'wrong name for cool');
  CheckEquals('spicy', ContestType.berry_flavor.name, 'wrong berry_flavor.name for cool');
  CheckEquals('Sang-froid', ContestType.names.Item(0).name, 'wrong names.Item(0).name for cool');
end;

procedure TestTPokeAPI.TestContestsEffectGET1;
var
  ContestEffects: IListResponse;
begin
  ContestEffects := PokeAPI.GetContestEffects;
  CheckEquals(20, ContestEffects.results.Count, 'incorrect results.Count');
  CheckEquals('', ContestEffects.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestContestsEffectGET2;
var
  ContestEffects: IListResponse;
begin
  ContestEffects := PokeAPI.GetContestEffects;
  while ContestEffects.next <> '' do
  begin
    ContestEffects := PokeAPI.GetContestEffects(ContestEffects.next);
  end;
end;

procedure TestTPokeAPI.TestContestEffectGETId1;
var
  ContestEffect: IContestEffect;
begin
  ContestEffect := PokeAPI.GetContestEffect(1);
  CheckEquals(1, ContestEffect.id, 'wrong id for id 1');
  CheckEquals(4, ContestEffect.appeal, 'wrong appeal for id 1');
  CheckEquals('Gives a high number of appeal points wth no other effects.', ContestEffect.effect_entries.Item(0).effect, 'wrong effect_entries.Items(0).effect for id 1');
  CheckEquals('A highly appealing move.', ContestEffect.flavor_text_entries.Item(0).flavor_text, 'wrong flavor_text_entries.Items(0).flavor_text for id 1');
end;

procedure TestTPokeAPI.TestSuperContestsEffectGET1;
var
  SuperContestEffects: IListResponse;
begin
  SuperContestEffects := PokeAPI.GetSuperContestEffects;
  CheckEquals(20, SuperContestEffects.results.Count, 'incorrect results.Count');
  CheckEquals('', SuperContestEffects.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestSuperContestsEffectGET2;
var
  SuperContestEffects: IListResponse;
begin
  SuperContestEffects := PokeAPI.GetSuperContestEffects;
  while SuperContestEffects.next <> '' do
  begin
    SuperContestEffects := PokeAPI.GetSuperContestEffects(SuperContestEffects.next);
  end;
end;

procedure TestTPokeAPI.TestSuperContestEffectGETId1;
var
  SuperContestEffect: ISuperContestEffect;
begin
  SuperContestEffect := PokeAPI.GetSuperContestEffect(1);
  CheckEquals(1, SuperContestEffect.id, 'wrong id for id 1');
  CheckEquals(2, SuperContestEffect.appeal, 'wrong appeal for id 1');
  CheckEquals('agility', SuperContestEffect.moves.Item(0).name, 'wrong effect_entries.Items(0).effect for id 1');
  CheckEquals('Enables the user to perform first in the next turn.', SuperContestEffect.flavor_text_entries.Item(0).flavor_text, 'wrong flavor_text_entries.Items(0).flavor_text for id 1');
end;

procedure TestTPokeAPI.TestEncounterMethodsGET1;
var
  EncounterMethods: IListResponse;
begin
  EncounterMethods := PokeAPI.GetEncounterMethods;
  CheckEquals(20, EncounterMethods.results.Count, 'incorrect results.Count');
  CheckEquals('walk', EncounterMethods.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestEncounterMethodsGET2;
var
  EncounterMethods: IListResponse;
begin
  EncounterMethods := PokeAPI.GetEncounterMethods;
  while EncounterMethods.next <> '' do
  begin
    EncounterMethods := PokeAPI.GetEncounterMethods(EncounterMethods.next);
  end;
end;

procedure TestTPokeAPI.TestEncounterMethodGETId1;
var
  EncounterMethod: IEncounterMethod;
begin
  EncounterMethod := PokeAPI.GetEncounterMethod(1);
  CheckEquals(1, EncounterMethod.id, 'wrong id for id 1');
  CheckEquals('walk', EncounterMethod.name, 'wrong name for id 1');
  CheckEquals('Walking in tall grass or a cave', EncounterMethod.names.Item(1).name, 'wrong names.Item(1).name for id 1');
end;

procedure TestTPokeAPI.TestEncounterMethodGETName1;
var
  EncounterMethod: IEncounterMethod;
begin
  EncounterMethod := PokeAPI.GetEncounterMethod('walk');
  CheckEquals(1, EncounterMethod.id, 'wrong id for id 1');
  CheckEquals('walk', EncounterMethod.name, 'wrong name for id 1');
  CheckEquals('Walking in tall grass or a cave', EncounterMethod.names.Item(1).name, 'wrong names.Item(1).name for id 1');
end;

procedure TestTPokeAPI.TestEncounterConditionsGET1;
var
  EncounterConditions: IListResponse;
begin
  EncounterConditions := PokeAPI.GetEncounterConditions;
  CheckEquals(13, EncounterConditions.results.Count, 'incorrect results.Count');
  CheckEquals('swarm', EncounterConditions.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestEncounterConditionsGET2;
var
  EncounterConditions: IListResponse;
begin
  EncounterConditions := PokeAPI.GetEncounterConditions;
  while EncounterConditions.next <> '' do
  begin
    EncounterConditions := PokeAPI.GetEncounterConditions(EncounterConditions.next);
  end;
end;

procedure TestTPokeAPI.TestEncounterConditionGETId1;
var
  EncounterCondition: IEncounterCondition;
begin
  EncounterCondition := PokeAPI.GetEncounterCondition(1);
  CheckEquals(1, EncounterCondition.id, 'wrong id for id 1');
  CheckEquals('swarm', EncounterCondition.name, 'wrong name for id 1');
  CheckEquals('swarm-yes', EncounterCondition.values.Item(0).name, 'wrong values.Item(0).name for id 1');
end;

procedure TestTPokeAPI.TestEncounterConditionGETName1;
var
  EncounterCondition: IEncounterCondition;
begin
  EncounterCondition := PokeAPI.GetEncounterCondition('swarm');
  CheckEquals(1, EncounterCondition.id, 'wrong id for swarm');
  CheckEquals('swarm', EncounterCondition.name, 'wrong name for swarm');
  CheckEquals('swarm-yes', EncounterCondition.values.Item(0).name, 'wrong values.Item(0).name for swarm');
end;

procedure TestTPokeAPI.TestEncounterConditionValuesGET1;
var
  EncounterConditionValues: IListResponse;
begin
  EncounterConditionValues := PokeAPI.GetEncounterConditionValues;
  CheckEquals(20, EncounterConditionValues.results.Count, 'incorrect results.Count');
  CheckEquals('swarm-yes', EncounterConditionValues.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestEncounterConditionValuesGET2;
var
  EncounterConditionValues: IListResponse;
begin
  EncounterConditionValues := PokeAPI.GetEncounterConditionValues;
  while EncounterConditionValues.next <> '' do
  begin
    EncounterConditionValues := PokeAPI.GetEncounterConditionValues(EncounterConditionValues.next);
  end;
end;

procedure TestTPokeAPI.TestEncounterConditionValueGETId1;
var
  EncounterConditionValue: IEncounterConditionValue;
begin
  EncounterConditionValue := PokeAPI.GetEncounterConditionValue(1);
  CheckEquals(1, EncounterConditionValue.id, 'wrong id for id 1');
  CheckEquals('swarm-yes', EncounterConditionValue.name, 'wrong name for id 1');
  CheckEquals('Während eines Schwarms', EncounterConditionValue.names.Item(0).name, 'wrong names.Item(0).name for id 1');
end;

procedure TestTPokeAPI.TestEncounterConditionValueGETName1;
var
  EncounterConditionValue: IEncounterConditionValue;
begin
  EncounterConditionValue := PokeAPI.GetEncounterConditionValue('swarm-yes');
  CheckEquals(1, EncounterConditionValue.id, 'wrong id for swarm-yes');
  CheckEquals('swarm-yes', EncounterConditionValue.name, 'wrong name for swarm-yes');
  CheckEquals('Während eines Schwarms', EncounterConditionValue.names.Item(0).name, 'wrong names.Item(0).name swarm-yes');
end;

procedure TestTPokeAPI.TestEvolutionChainsGET1;
begin
end;

procedure TestTPokeAPI.TestEvolutionChainsGET2;
begin
end;

procedure TestTPokeAPI.TestEvolutionChainGETId1;
var
  EvolutionChain: IEvolutionChain;
begin
  EvolutionChain := PokeAPI.GetEvolutionChain(1);
  CheckEquals(1, EvolutionChain.id, 'wrong id for id 1');
  CheckEquals('raticate', EvolutionChain.chain.species.name, 'wrong chain.species.name for id 1');
end;

procedure TestTPokeAPI.TestEvolutionTriggersGET1;
var
  EvolutionTriggers: IListResponse;
begin
  EvolutionTriggers := PokeAPI.GetEvolutionTriggers;
  CheckEquals(13, EvolutionTriggers.results.Count, 'incorrect results.Count');
  CheckEquals('level-up', EvolutionTriggers.results.Item(0).name, 'first contest effect incorrect');
end;

procedure TestTPokeAPI.TestEvolutionTriggersGET2;
var
  EvolutionTriggers: IListResponse;
begin
  EvolutionTriggers := PokeAPI.GetEvolutionTriggers;
  while EvolutionTriggers.next <> '' do
  begin
    EvolutionTriggers := PokeAPI.GetEvolutionTriggers(EvolutionTriggers.next);
  end;
end;

procedure TestTPokeAPI.TestEvolutionTriggerGETId1;
var
  EvolutionTrigger: IEvolutionTrigger;
begin
  EvolutionTrigger := PokeAPI.GetEvolutionTrigger(1);
  CheckEquals(1, EvolutionTrigger.id, 'wrong id for id 1');
  CheckEquals('level-up', EvolutionTrigger.name, 'wrong name for id 1');
  CheckEquals('Level up', EvolutionTrigger.names.Item(2).name, 'wrong names.Item(0).name for id 1');
  CheckEquals('ivysaur', EvolutionTrigger.pokemon_species.Item(0).name, 'wrong pokemon_species.Item(0).name for id 1');
end;

procedure TestTPokeAPI.TestEvolutionTriggerGETName1;
var
  EvolutionTrigger: IEvolutionTrigger;
begin
  EvolutionTrigger := PokeAPI.GetEvolutionTrigger('level-up');
  CheckEquals(1, EvolutionTrigger.id, 'wrong id for level-up');
  CheckEquals('level-up', EvolutionTrigger.name, 'wrong name for level-up');
  CheckEquals('Level up', EvolutionTrigger.names.Item(2).name, 'wrong names.Item(0).name for level-up');
  CheckEquals('ivysaur', EvolutionTrigger.pokemon_species.Item(0).name, 'wrong pokemon_species.Item(0).name for level-up');
end;

procedure TestTPokeAPI.TestGenerationsGET1;
var
  Generations: IListResponse;
begin
  Generations := PokeAPI.GetGenerations;
  CheckEquals(9, Generations.results.Count, 'incorrect results.Count');
  CheckEquals('generation-i', Generations.results.Item(0).name, 'first result incorrect');
end;

procedure TestTPokeAPI.TestGenerationsGET2;
var
  Generations: IListResponse;
begin
  Generations := PokeAPI.GetGenerations;
  while Generations.next <> '' do
  begin
    Generations := PokeAPI.GetGenerations(Generations.next);
  end;
end;

procedure TestTPokeAPI.TestGenerationGETId1;
var
  Generation: IGeneration;
begin
  Generation := PokeAPI.GetGeneration(1);
  CheckEquals(1, Generation.id, 'wrong id for id 1');
  CheckEquals('generation-i', Generation.name, 'wrong name for id 1');
  CheckEquals('kanto', Generation.main_region.name, 'wrong main_region.name for id 1');
  CheckEquals('pound', Generation.moves.Item(0).name, 'wrong moves.Item(0).name for id 1');
end;

procedure TestTPokeAPI.TestGenerationGETName1;
var
  Generation: IGeneration;
begin
  Generation := PokeAPI.GetGeneration('generation-i');
  CheckEquals(1, Generation.id, 'wrong id for generation-i');
  CheckEquals('generation-i', Generation.name, 'wrong name for generation-i');
  CheckEquals('kanto', Generation.main_region.name, 'wrong main_region.name for generation-i');
  CheckEquals('pound', Generation.moves.Item(0).name, 'wrong moves.Item(0).name for generation-i');
end;

procedure TestTPokeAPI.TestPokedexesGET1;
var
  Pokedexes: IListResponse;
begin
  Pokedexes := PokeAPI.GetPokedexes;
  CheckEquals(20, Pokedexes.results.Count, 'incorrect results.Count');
  CheckEquals('national', Pokedexes.results.Item(0).name, 'first result incorrect');
end;

procedure TestTPokeAPI.TestPokedexesGET2;
var
  Pokedexes: IListResponse;
begin
  Pokedexes := PokeAPI.GetPokedexes;
  while Pokedexes.next <> '' do
  begin
    Pokedexes := PokeAPI.GetPokedexes(Pokedexes.next);
  end;
end;

procedure TestTPokeAPI.TestPokedexGETId1;
var
  Pokedex: IPokedex;
begin
  Pokedex := PokeAPI.GetPokedex(1);
  CheckEquals(1, Pokedex.id, 'wrong id for id 1');
  CheckEquals('national', Pokedex.name, 'wrong name for id 1');
  CheckEquals('Pokédex National complet', Pokedex.descriptions.Item(0).description, 'wrong main_region.name for id 1');
end;

procedure TestTPokeAPI.TestPokedexGETName1;
var
  Pokedex: IPokedex;
begin
  Pokedex := PokeAPI.GetPokedex('national');
  CheckEquals(1, Pokedex.id, 'wrong id for national');
  CheckEquals('national', Pokedex.name, 'wrong name for national');
  CheckEquals('Pokédex National complet', Pokedex.descriptions.Item(0).description, 'wrong main_region.name for national');
end;

procedure TestTPokeAPI.TestVersionsGET1;
var
  Versions: IListResponse;
begin
  Versions := PokeAPI.GetVersions;
  CheckEquals(20, Versions.results.Count, 'incorrect results.Count');
  CheckEquals('red', Versions.results.Item(0).name, 'first result incorrect');
end;

procedure TestTPokeAPI.TestVersionsGET2;
var
  Versions: IListResponse;
begin
  Versions := PokeAPI.GetVersions;
  while Versions.next <> '' do
  begin
    Versions := PokeAPI.GetVersions(Versions.next);
  end;
end;

procedure TestTPokeAPI.TestVersionGETId1;
var
  Version: IVersion;
begin
  Version := PokeAPI.GetVersion(1);
  CheckEquals(1, Version.id, 'wrong id for id 1');
  CheckEquals('red', Version.name, 'wrong name for id 1');
  CheckEquals('red-blue', Version.version_group.name, 'wrong version_group.name for id 1');
end;

procedure TestTPokeAPI.TestVersionGETName1;
var
  Version: IVersion;
begin
  Version := PokeAPI.GetVersion('red');
  CheckEquals(1, Version.id, 'wrong id for red');
  CheckEquals('red', Version.name, 'wrong name for red');
  CheckEquals('red-blue', Version.version_group.name, 'wrong version_group.name for red');
end;

procedure TestTPokeAPI.TestVersionGroupsGET1;
var
  VersionGroups: IListResponse;
begin
  VersionGroups := PokeAPI.GetVersionGroups;
  CheckEquals(20, VersionGroups.results.Count, 'incorrect results.Count');
  CheckEquals('red', VersionGroups.results.Item(0).name, 'first result incorrect');
end;

procedure TestTPokeAPI.TestVersionGroupsGET2;
var
  VersionGroups: IListResponse;
begin
  VersionGroups := PokeAPI.GetVersionGroups;
  while VersionGroups.next <> '' do
  begin
    VersionGroups := PokeAPI.GetVersionGroups(VersionGroups.next);
  end;
end;

procedure TestTPokeAPI.TestVersionGroupGETId1;
var
  VersionGroup: IVersionGroup;
begin
  VersionGroup := PokeAPI.GetVersionGroup(1);
  CheckEquals(1, VersionGroup.id, 'wrong id for id 1');
  CheckEquals('red', VersionGroup.name, 'wrong name for id 1');
  CheckEquals('red-blue', VersionGroup.version_group.name, 'wrong version_group.name for id 1');
end;

procedure TestTPokeAPI.TestVersionGroupGETName1;
var
  VersionGroup: IVersionGroup;
begin
  VersionGroup := PokeAPI.GetVersionGroup('red');
  CheckEquals(1, VersionGroup.id, 'wrong id for red');
  CheckEquals('red', VersionGroup.name, 'wrong name for red');
  CheckEquals('red-blue', VersionGroup.version_group.name, 'wrong version_group.name for red');
end;

procedure TestTPokeAPI.TestNew;
begin
  CheckNotNull(PokeAPI, 'New null');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPokeAPI.Suite);

end.

