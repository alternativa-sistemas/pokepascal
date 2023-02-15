unit PokeAPI.Berry;

interface

uses
  PokeAPI.Base;

type
  IBerry = interface
  ['{CF82ED1A-18A7-4CF0-90FC-FB5197AA4505}']
    function Getname: string;
    function Geturl: string;
    procedure Setname(const Value: string);
    procedure Seturl(const Value: string);
    property name: string read Getname write Setname;
    property url: string read Geturl write Seturl;
  end;

  IBerryList = interface
  ['{64DDC5D3-30F9-45BC-82B5-F4593F69F15C}']
    function Count: Integer;
    function Item(const Index: Integer): IBerry;
  end;

  TArrayIBerry = array of IBerry;

  TBerry = class(TInterfacedObject, IBerry)
  private
    Fname: string;
    Furl: string;
    function Getname: string;
    function Geturl: string;
    procedure Setname(const Value: string);
    procedure Seturl(const Value: string);
  public
    function New: IBerry;
  published
    property name: string read Getname write Setname;
    property url: string read Geturl write Seturl;
  end;

  TArrayBerry = array of TBerry;

  TBerryList = class(TInterfacedObject, IBerryList)
  private
    FArr: TArrayIBerry;
  public
    constructor Create(const Arr: TArrayBerry); overload;
    constructor Create(const Arr: TArrayIBerry); overload;
    function New: IBerryList;
    function Count: Integer;
    function Item(const Index: Integer): IBerry;
  end;

  IBerriesGETResponse = interface(IListResponse)
    ['{9BD5481D-DFAE-45DE-B7E9-D00C80968433}']
    function Getresults: IBerryList;
    procedure Setresults(const Value: IBerryList);
    property results: IBerryList read Getresults write Setresults;
  end;

  TBerriesListResponse = class(TListResponse, IBerriesGETResponse)
  private
    FresultsInt: IBerryList;
    Fresults: TArrayBerry;
    function Getresults: IBerryList;
    procedure Setresults(const Value: IBerryList);
  public
    function New: IBerriesGETResponse;
  published
    property results: TArrayBerry read Fresults write Fresults;
  end;

implementation

{ TBerry }

function TBerry.Getname: string;
begin
  Result := Fname;
end;

function TBerry.Geturl: string;
begin
  Result := Furl;
end;

function TBerry.New: IBerry;
begin
  Result := Self;
end;

procedure TBerry.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TBerry.Seturl(const Value: string);
begin
  Furl := Value;
end;

{ TBerriesListResponse }

function TBerriesListResponse.Getresults: IBerryList;
begin
  if FresultsInt = nil then
  begin
    FresultsInt := TBerryList.Create(Fresults).New;
  end;
  Result := FresultsInt;
end;

function TBerriesListResponse.New: IBerriesGETResponse;
begin
  Result := Self;
end;

procedure TBerriesListResponse.Setresults(const Value: IBerryList);
begin
  FresultsInt := Value;
end;

{ TBerryList }

function TBerryList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TBerryList.Create(const Arr: TArrayBerry);
var
  ArrInt: TArrayIBerry;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TBerryList.Create(const Arr: TArrayIBerry);
begin
  FArr := Arr;
end;

function TBerryList.Item(const Index: Integer): IBerry;
begin
  Result := FArr[Index];
end;

function TBerryList.New: IBerryList;
begin
  Result := Self;
end;

end.

