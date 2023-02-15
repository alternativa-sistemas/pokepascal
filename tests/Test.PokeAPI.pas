unit Test.PokeAPI;

interface

uses
  TestFramework
, PokeAPI
;

type
  TestTPokeAPI = class(TTestCase)
  strict private
    FPokeAPI: TPokeAPI;
    Aux: IPokeAPI;
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBerriesGET;
    procedure TestNew;
  end;

implementation

uses
  PokeAPI.Berry;

{ TestTPokeAPI }

procedure TestTPokeAPI.SetUp;
begin
  FPokeAPI := TPokeAPI.Create;
  Aux := FPokeAPI.New;
end;

procedure TestTPokeAPI.TearDown;
begin
  Aux := nil;
end;

procedure TestTPokeAPI.TestBerriesGET;
var
  Berries: IBerriesGETResponse;
begin
  Berries := Aux.GetBerries;
  CheckEquals(Berries.results.Count, 20, 'results.Count incorreto');
  CheckEquals(Berries.results.Item(0).name, 'cheri', 'Primeiro cherry incorreto');

end;

procedure TestTPokeAPI.TestNew;
begin
  CheckNotNull(Aux, 'New null');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPokeAPI.Suite);

end.

