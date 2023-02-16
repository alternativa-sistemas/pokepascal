unit Test.PokeAPI;

interface

uses
  TestFramework
, PokeAPI
, PokeAPI.Base
;

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
    procedure TestNew;
  end;

implementation

uses
  PokeAPI.Berry;

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

procedure TestTPokeAPI.TestBerriesGET1;
var
  Berries: IBerriesGETResponse;
begin
  Berries := PokeAPI.GetBerries;
  CheckEquals(Berries.results.Count, 20, 'results.Count incorreto');
  CheckEquals(Berries.results.Item(0).name, 'cheri', 'Primeiro cherry incorreto');
end;

procedure TestTPokeAPI.TestBerriesGET2;
var
  Berries: IBerriesGETResponse;
begin
  Berries := PokeAPI.GetBerries;
  while Berries.next <> '' do
  begin
    Berries := PokeAPI.GetBerries(Berries.next);
  end;
end;

procedure TestTPokeAPI.TestBerryGETIdOrName1;
var
  Berry: INameAndUrl;
begin
  Berry := PokeAPI.GetBerry(1);
end;

procedure TestTPokeAPI.TestNew;
begin
  CheckNotNull(PokeAPI, 'New null');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPokeAPI.Suite);

end.

