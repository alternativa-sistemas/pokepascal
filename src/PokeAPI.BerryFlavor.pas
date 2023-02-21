unit PokeAPI.BerryFlavor;

interface

uses
  PokeAPI.BerryFlavor.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TBerryPotency = class (TInterfacedObject, IBerryPotency)
  private
    Fpotency: Integer;
    FberryInt: INameAndUrl;
    Fberry: TNameAndUrl;
    function Getpotency: Integer;
    procedure Setpotency(const Value: Integer);
    function Getberry: INameAndUrl;
    procedure Setberry(const Value: INameAndUrl);
  public
    function New: IBerryPotency;
  published
    property potency: Integer read Getpotency write Setpotency;
    property berry: TNameAndUrl read Fberry write Fberry;
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
    Fcontest_typeInt: INameAndUrl;
    Fcontest_type: TNameAndUrl;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getberries: IBerryPotencyList;
    procedure Setberries(const Value: IBerryPotencyList);
    function Getcontest_type: INameAndUrl;
    procedure Setcontest_type(const Value: INameAndUrl);
    function Getnames: INameList;
    procedure Setnames(const Value: INameList);
  public
    function New: IBerryFlavor;
  published
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property berries: TArrayBerryPotency read Fberries write Fberries;
    property contest_type: TNameAndUrl read Fcontest_type write Fcontest_type;
    property names: TArrayName read Fnames write Fnames;
  end;

implementation

{ TBerryPotency }

function TBerryPotency.Getpotency: Integer;
begin
  Result := Fpotency;
end;

procedure TBerryPotency.Setpotency(const Value: Integer);
begin
  Fpotency := Value;
end;

function TBerryPotency.Getberry: INameAndUrl;
begin
  if FberryInt = nil then
  begin
    FberryInt := Fberry.New;
  end;
  Result := FberryInt;
end;

procedure TBerryPotency.Setberry(const Value: INameAndUrl);
begin
  FberryInt := Value;
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

procedure TBerryFlavor.Setid(const Value: Integer);
begin
  Fid := Value;
end;

function TBerryFlavor.Getname: string;
begin
  Result := Fname;
end;

procedure TBerryFlavor.Setname(const Value: string);
begin
  Fname := Value;
end;

function TBerryFlavor.Getberries: IBerryPotencyList;
begin
  if FberriesInt = nil then
  begin
    FberriesInt := TBerryPotencyList.Create(Fberries).New;
  end;
  Result := FberriesInt;
end;

procedure TBerryFlavor.Setberries(const Value: IBerryPotencyList);
begin
  FberriesInt := Value;
end;

function TBerryFlavor.Getcontest_type: INameAndUrl;
begin
  if Fcontest_typeInt = nil then
  begin
    Fcontest_typeInt := Fcontest_type.New;
  end;
  Result := Fcontest_typeInt;
end;

procedure TBerryFlavor.Setcontest_type(const Value: INameAndUrl);
begin
  Fcontest_typeInt := Value;
end;

function TBerryFlavor.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

procedure TBerryFlavor.Setnames(const Value: INameList);
begin
  FnamesInt := Value;
end;

function TBerryFlavor.New: IBerryFlavor;
begin
  Result := Self;
end;

end.
