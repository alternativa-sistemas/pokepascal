unit PokeAPI.Berry;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Base, PokeAPI.Berry.Int;

type
  TFlavor = class(TInterfacedObject, IFlavor)
  private
    Fpotency: Integer;
    FflavorInt: INameAndUrl;
    Fflavor: TNameAndUrl;
    function Getpotency: Integer;
    procedure Setpotency(const Value: Integer);
    function Getflavor: INameAndUrl;
    procedure Setflavor(const Value: INameAndUrl);
  public
    function New: IFlavor;
  published
    property potency: Integer read Getpotency write Setpotency;
    property flavor: TNameAndUrl read Fflavor write Fflavor;
  end;

  TArrayFlavor = array of TFlavor;

  TFlavorList = class(TInterfacedObject, IFlavorList)
  private
    FArr: TArrayIFlavor;
  public
    constructor Create(const Arr: TArrayFlavor); overload;
    constructor Create(const Arr: TArrayIFlavor); overload;
    function New: IFlavorList;
    function Count: Integer;
    function Item(const Index: Integer): IFlavor;
  end;

  TBerry = class(TInterfacedObject, IBerry)
  private
    Fid: Integer;
    Fname: string;
    Fgrowth_time: Integer;
    Fmax_harvest: Integer;
    Fnatural_gift_power: Integer;
    Fsize: Integer;
    Fsmoothness: Integer;
    Fsoil_dryness: Integer;
    FfirmnessInt: INameAndUrl;
    Ffirmness: TNameAndUrl;
    FflavorsInt: IFlavorList;
    Fflavors: TArrayFlavor;
    FitemInt: INameAndUrl;
    Fitem: TNameAndUrl;
    Fnatural_gift_typeInt: INameAndUrl;
    Fnatural_gift_type: TNameAndUrl;
  public
    function New: IBerry;
    function Getid: Integer;
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getgrowth_time: Integer;
    procedure Setgrowth_time(const Value: Integer);
    function Getmax_harvest: Integer;
    procedure Setmax_harvest(const Value: Integer);
    function Getnatural_gift_power: Integer;
    procedure Setnatural_gift_power(const Value: Integer);
    function Getsize: Integer;
    procedure Setsize(const Value: Integer);
    function Getsmoothness: Integer;
    procedure Setsmoothness(const Value: Integer);
    function Getsoil_dryness: Integer;
    procedure Setsoil_dryness(const Value: Integer);
    function Getfirmness: INameAndUrl;
    procedure Setfirmness(const Value: INameAndUrl);
    function Getflavors: IFlavorList;
    procedure Setflavors(const Value: IFlavorList);
    function Getitem: INameAndUrl;
    procedure Setitem(const Value: INameAndUrl);
    function Getnatural_gift_type: INameAndUrl;
    procedure Setnatural_gift_type(const Value: INameAndUrl);
  published
    property id: Integer read Fid write Fid;
    property name: string read Fname write Fname;
    property growth_time: Integer read Fgrowth_time write Fgrowth_time;
    property max_harvest: Integer read Fmax_harvest write Fmax_harvest;
    property natural_gift_power: Integer read Fnatural_gift_power write Fnatural_gift_power;
    property size: Integer read Fsize write Fsize;
    property smoothness: Integer read Fsmoothness write Fsmoothness;
    property soil_dryness: Integer read Fsoil_dryness write Fsoil_dryness;
    property firmness: TNameAndUrl read Ffirmness write Ffirmness;
    property flavors: TArrayFlavor read Fflavors write Fflavors;
    property item: TNameAndUrl read Fitem write Fitem;
    property natural_gift_type: TNameAndUrl read Fnatural_gift_type write Fnatural_gift_type;
  end;

  TName = class(TInterfacedObject, IName)
  private
    FlanguageInt: INameAndUrl;
    Flanguage: TNameAndUrl;
    Fname: string;
    function Getlanguage: INameAndUrl;
    procedure Setlanguage(const Value: INameAndUrl);
    function Getname: string;
    procedure Setname(const Value: string);
  public
    function New: IName;
  published
    property language: TNameAndUrl read Flanguage write Flanguage;
    property name: string read Getname write Setname;
  end;

  TArrayName = array of TName;

  TNameList = class(TInterfacedObject, INameList)
  private
    FArr: TArrayIName;
  public
    constructor Create(const Arr: TArrayName); overload;
    constructor Create(const Arr: TArrayIName); overload;
    function New: INameList;
    function Count: Integer;
    function Item(const Index: Integer): IName;
  end;

  TBerryFirmness = class(TInterfacedObject, IBerryFirmness)
  private
    FberriesInt: INameAndUrlList;
    Fberries: TArrayNameAndUrl;
    Fid: Integer;
    Fname: string;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getberries: INameAndUrlList;
    procedure Setberries(const Value: INameAndUrlList);
    function Getid: Integer;
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getnames: INameList;
    procedure Setnames(const Value: INameList);
  public
    function New: IBerryFirmness;
  published
    property berries: TArrayNameAndUrl read Fberries write Fberries;
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property names: TArrayName read Fnames write Fnames;
  end;

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

{ TBerry }

function TBerry.Getfirmness: INameAndUrl;
begin
  if FfirmnessInt = nil then
  begin
    FfirmnessInt := Ffirmness.New;
  end;
  Result := FfirmnessInt;
end;

function TBerry.Getflavors: IFlavorList;
begin
  if FflavorsInt = nil then
  begin
    FflavorsInt := TFlavorList.Create(Fflavors).New;
  end;
  Result := FflavorsInt;
end;

function TBerry.Getgrowth_time: Integer;
begin
  Result := Fgrowth_time;
end;

function TBerry.Getid: Integer;
begin
  Result := Fid;
end;

function TBerry.Getitem: INameAndUrl;
begin
  Result := FitemInt;
end;

function TBerry.Getmax_harvest: Integer;
begin
  Result := Fmax_harvest;
end;

function TBerry.Getname: string;
begin
  Result := Fname;
end;

function TBerry.Getnatural_gift_power: Integer;
begin
  Result := Fnatural_gift_power;
end;

function TBerry.Getnatural_gift_type: INameAndUrl;
begin
  if Fnatural_gift_typeInt = nil then
  begin
    Fnatural_gift_typeInt := Fnatural_gift_type.New;
  end;
  Result := Fnatural_gift_typeInt;
end;

function TBerry.Getsize: Integer;
begin
  Result := Fsize;
end;

function TBerry.Getsmoothness: Integer;
begin
  Result := Fsmoothness;
end;

function TBerry.Getsoil_dryness: Integer;
begin
  Result := Fsoil_dryness;
end;

function TBerry.New: IBerry;
begin
  Result := Self;
end;

procedure TBerry.Setfirmness(const Value: INameAndUrl);
begin
  FfirmnessInt := Value;
end;

procedure TBerry.Setflavors(const Value: IFlavorList);
begin
  FflavorsInt := Value;
end;

procedure TBerry.Setgrowth_time(const Value: Integer);
begin
  Fgrowth_time := Value;
end;

procedure TBerry.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBerry.Setitem(const Value: INameAndUrl);
begin
  FitemInt := Value;
end;

procedure TBerry.Setmax_harvest(const Value: Integer);
begin
  Fmax_harvest := Value;
end;

procedure TBerry.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TBerry.Setnatural_gift_power(const Value: Integer);
begin
  Fnatural_gift_power := Value;
end;

procedure TBerry.Setnatural_gift_type(const Value: INameAndUrl);
begin
  Fnatural_gift_typeInt := Value;
end;

procedure TBerry.Setsize(const Value: Integer);
begin
  Fsize := Value;
end;

procedure TBerry.Setsmoothness(const Value: Integer);
begin
  Fsmoothness := Value;
end;

procedure TBerry.Setsoil_dryness(const Value: Integer);
begin
  Fsoil_dryness := Value;
end;

{ TFlavor }

function TFlavor.Getflavor: INameAndUrl;
begin
  if FflavorInt = nil then
  begin
    FflavorInt := Fflavor.New;
  end;
  Result := FflavorInt;
end;

function TFlavor.Getpotency: Integer;
begin
  Result := Fpotency;
end;

function TFlavor.New: IFlavor;
begin
  Result := Self;
end;

procedure TFlavor.Setflavor(const Value: INameAndUrl);
begin
  FflavorInt := Value;
end;

procedure TFlavor.Setpotency(const Value: Integer);
begin
  Fpotency := Value;
end;

{ TFlavorList }

function TFlavorList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TFlavorList.Create(const Arr: TArrayFlavor);
var
  ArrInt: TArrayIFlavor;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TFlavorList.Create(const Arr: TArrayIFlavor);
begin
  FArr := Arr;
end;

function TFlavorList.Item(const Index: Integer): IFlavor;
begin
  Result := FArr[Index];
end;

function TFlavorList.New: IFlavorList;
begin
  Result := Self;
end;

{ TName }

function TName.Getlanguage: INameAndUrl;
begin
  if FlanguageInt = nil then
  begin
    FlanguageInt := Flanguage.New;
  end;
  Result := FlanguageInt;
end;

function TName.Getname: string;
begin
  Result := Fname;
end;

function TName.New: IName;
begin
  Result := Self;
end;

procedure TName.Setlanguage(const Value: INameAndUrl);
begin
  FlanguageInt := Value;
end;

procedure TName.Setname(const Value: string);
begin
  Fname := Value;
end;

{ TNameList }

function TNameList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TNameList.Create(const Arr: TArrayIName);
begin
  FArr := Arr;
end;

constructor TNameList.Create(const Arr: TArrayName);
var
  ArrInt: TArrayIName;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

function TNameList.Item(const Index: Integer): IName;
begin
  Result := FArr[Index];
end;

function TNameList.New: INameList;
begin
  Result := Self;
end;

{ TBerryFirmness }

function TBerryFirmness.Getberries: INameAndUrlList;
begin
  if FberriesInt = nil then
  begin
    FberriesInt := TNameAndUrlList.Create(Fberries).New;
  end;
  Result := FberriesInt;
end;

function TBerryFirmness.Getid: Integer;
begin
  Result := Fid;
end;

function TBerryFirmness.Getname: string;
begin
  Result := Fname;
end;

function TBerryFirmness.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TBerryFirmness.New: IBerryFirmness;
begin
  Result := Self;
end;

procedure TBerryFirmness.Setberries(const Value: INameAndUrlList);
begin
  FberriesInt := Value;
end;

procedure TBerryFirmness.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBerryFirmness.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TBerryFirmness.Setnames(const Value: INameList);
begin
  FnamesInt := Value;
end;

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

