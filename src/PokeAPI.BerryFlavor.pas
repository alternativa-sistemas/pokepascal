unit PokeAPI.BerryFlavor;

interface

uses
  PokeAPI.BerryFlavor.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TBerryPotency = class (TInterfacedObject, IBerryPotency)
  private
    Fpotency: Integer;
    FberryInt: INamedAPIResource;
    Fberry: TNamedAPIResource;
    function Getpotency: Integer;
    function Getberry: INamedAPIResource;
  public
    function New: IBerryPotency;
  published
    property potency: Integer read Getpotency;
    property berry: TNamedAPIResource read Fberry write Fberry;
  end;

  TArrayBerryPotency = array of TBerryPotency;

  TBerryPotencyList = class(TInterfacedObject, IBerryPotencyList)
  private
    FArr: TArrayIBerryPotency;
  public
    constructor Create(const Arr: TArrayIBerryPotency); overload;
    constructor Create(const Arr: TArrayBerryPotency); overload;
    function New: IBerryPotencyList;
    function Count: Integer;
    function Item(const Index: Integer): IBerryPotency;
  end;

  TBerryFlavor = class(TInterfacedObject, IBerryFlavor)
  private
    Fid: Integer;
    Fname: string;
    FberriesInt: IBerryPotencyList;
    Fberries: TArrayBerryPotency;
    Fcontest_typeInt: INamedAPIResource;
    Fcontest_type: TNamedAPIResource;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    function Getname: string;
    function Getberries: IBerryPotencyList;
    function Getcontest_type: INamedAPIResource;
    function Getnames: INameList;
  public
    function New: IBerryFlavor;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property berries: TArrayBerryPotency read Fberries write Fberries;
    property contest_type: TNamedAPIResource read Fcontest_type write Fcontest_type;
    property names: TArrayName read Fnames write Fnames;
  end;

implementation

{ TBerryPotency }

function TBerryPotency.Getpotency: Integer;
begin
  Result := Fpotency;
end;

function TBerryPotency.Getberry: INamedAPIResource;
begin
  if FberryInt = nil then
  begin
    FberryInt := Fberry.New;
  end;
  Result := FberryInt;
end;

function TBerryPotency.New: IBerryPotency;
begin
  Result := Self;
end;

{ TBerryPotencyList }

constructor TBerryPotencyList.Create(const Arr: TArrayIBerryPotency);
begin
  FArr := Arr;
end;

constructor TBerryPotencyList.Create(const Arr: TArrayBerryPotency);
var
  ArrInt: TArrayIBerryPotency;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I];
  end;
  Create(ArrInt);
end;

function TBerryPotencyList.New: IBerryPotencyList;
begin
  Result := Self;
end;

function TBerryPotencyList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TBerryPotencyList.Item(const Index: Integer): IBerryPotency;
begin
  Result := FArr[Index];
end;

{ TBerryFlavor }

function TBerryFlavor.Getid: Integer;
begin
  Result := Fid;
end;

function TBerryFlavor.Getname: string;
begin
  Result := Fname;
end;

function TBerryFlavor.Getberries: IBerryPotencyList;
begin
  if FberriesInt = nil then
  begin
    FberriesInt := TBerryPotencyList.Create(Fberries).New;
  end;
  Result := FberriesInt;
end;

function TBerryFlavor.Getcontest_type: INamedAPIResource;
begin
  if Fcontest_typeInt = nil then
  begin
    Fcontest_typeInt := Fcontest_type.New;
  end;
  Result := Fcontest_typeInt;
end;

function TBerryFlavor.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TBerryFlavor.New: IBerryFlavor;
begin
  Result := Self;
end;

end.
