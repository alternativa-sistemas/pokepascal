unit Test.PokeAPI;

interface

uses
  TestFramework
, PokeAPI
, PokeAPI.Base
, PokeAPI.Int;

type
  TestTPokeAPI = class(TTestCase)
  strict private
    FPokeAPI: TPokeAPI;
    PokeAPI: IPokeAPI;
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBerriesGET1;
    procedure TestBerriesGET2;
    procedure TestBerryGETIdOrName1;
    procedure TestBerryGETIdOrName2;
    procedure TestBerriesFirmnessGET1;
    procedure TestBerriesFirmnessGET2;
    procedure TestBerryFirmnessGETIdOrName1;
    procedure TestBerryFirmnessGETIdOrName2;
    procedure TestBerriesFlavorGET1;
    procedure TestBerriesFlavorGET2;
    procedure TestBerryFlavorGETIdOrName1;
    procedure TestBerryFlavorGETIdOrName2;
    procedure TestNew;
  end;

implementation

uses
  PokeAPI.Berry, PokeAPI.Berry.Int, PokeAPI.Base.Int;

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

procedure TestTPokeAPI.TestBerryFirmnessGETIdOrName1;
var
  Berry: IBerryFirmness;
begin
  Berry := PokeAPI.GetBerryFirmness(1);
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('very-soft', Berry.name, 'incorrect name for id 1');
  CheckEquals(8, Berry.berries.Count, 'incorrect berries.Count for id 1');
end;

procedure TestTPokeAPI.TestBerryFirmnessGETIdOrName2;
var
  Berry: IBerryFirmness;
begin
  Berry := PokeAPI.GetBerryFirmness('very-soft');
  CheckEquals(1, Berry.id, 'incorrect id for id 1');
  CheckEquals('very-soft', Berry.name, 'incorrect name for id 1');
  CheckEquals(8, Berry.berries.Count, 'incorrect berries.Count for id 1');
end;

procedure TestTPokeAPI.TestBerryGETIdOrName1;
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

procedure TestTPokeAPI.TestBerryGETIdOrName2;
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
    BerryFlavors := PokeAPI.GetBerries(BerryFlavors.next);
  end;
end;

procedure TestTPokeAPI.TestBerryFlavorGETIdOrName1;
var
  Berry: IBerryFlavor;
begin
  Berry := PokeAPI.GetBerryFlavor(1);
  CheckEquals(1, Berry.id, 'wrong id for id 1');
  CheckEquals('spicy', Berry.name, 'wrong name for id 1');
  CheckEquals(10, Berry.berries.Item(0).potency, 'wrong berries.Item(0).potency for id 1');
  CheckEquals('cool', Berry.contest_type.name, 'wrong contest_type.name for id 1');
end;

procedure TestTPokeAPI.TestBerryFlavorGETIdOrName2;
var
  Berry: IBerryFlavor;
begin
  Berry := PokeAPI.GetBerryFlavor('spicy');
  CheckEquals(1, Berry.id, 'wrong id for spicy');
  CheckEquals('spicy', Berry.name, 'wrong name for spicy');
  CheckEquals(10, Berry.berries.Item(0).potency, 'wrong berries.Item(0).potency for spicy');
  CheckEquals('cool', Berry.contest_type.name, 'wrong contest_type.name for spicy');
end;

procedure TestTPokeAPI.TestNew;
begin
  CheckNotNull(PokeAPI, 'New null');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPokeAPI.Suite);

end.

