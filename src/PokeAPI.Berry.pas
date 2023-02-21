unit PokeAPI.Berry;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Base, PokeAPI.Berry.Int, PokeAPI.BerryFirmness.Int;

type
  TFlavor = class(TInterfacedObject, IFlavor)
  private
    Fpotency: Integer;
    FflavorInt: INamedAPIResource;
    Fflavor: TNamedAPIResource;
    function Getpotency: Integer;
    function Getflavor: INamedAPIResource;
  public
    function New: IFlavor;
  published
    property potency: Integer read Getpotency;
    property flavor: TNamedAPIResource read Fflavor write Fflavor;
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
    FfirmnessInt: INamedAPIResource;
    Ffirmness: TNamedAPIResource;
    FflavorsInt: IFlavorList;
    Fflavors: TArrayFlavor;
    FitemInt: INamedAPIResource;
    Fitem: TNamedAPIResource;
    Fnatural_gift_typeInt: INamedAPIResource;
    Fnatural_gift_type: TNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getgrowth_time: Integer;
    function Getmax_harvest: Integer;
    function Getnatural_gift_power: Integer;
    function Getsize: Integer;
    function Getsmoothness: Integer;
    function Getsoil_dryness: Integer;
    function Getfirmness: INamedAPIResource;
    function Getflavors: IFlavorList;
    function Getitem: INamedAPIResource;
    function Getnatural_gift_type: INamedAPIResource;
  public
    function New: IBerry;
  published
    property id: Integer read Fid write Fid;
    property name: string read Fname write Fname;
    property growth_time: Integer read Fgrowth_time write Fgrowth_time;
    property max_harvest: Integer read Fmax_harvest write Fmax_harvest;
    property natural_gift_power: Integer read Fnatural_gift_power write Fnatural_gift_power;
    property size: Integer read Fsize write Fsize;
    property smoothness: Integer read Fsmoothness write Fsmoothness;
    property soil_dryness: Integer read Fsoil_dryness write Fsoil_dryness;
    property firmness: TNamedAPIResource read Ffirmness write Ffirmness;
    property flavors: TArrayFlavor read Fflavors write Fflavors;
    property item: TNamedAPIResource read Fitem write Fitem;
    property natural_gift_type: TNamedAPIResource read Fnatural_gift_type write Fnatural_gift_type;
  end;

implementation

{ TBerry }

function TBerry.Getfirmness: INamedAPIResource;
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

function TBerry.Getitem: INamedAPIResource;
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

function TBerry.Getnatural_gift_type: INamedAPIResource;
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

{ TFlavor }

function TFlavor.Getflavor: INamedAPIResource;
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

end.

