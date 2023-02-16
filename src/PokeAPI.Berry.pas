unit PokeAPI.Berry;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Base, PokeAPI.Berry.Int;

type
  TBerriesListResponse = class(TListResponse, IBerriesGETResponse)
  private
    FresultsInt: INameAndUrlList;
    Fresults: TArrayNameAndUrl;
    function Getresults: INameAndUrlList;
    procedure Setresults(const Value: INameAndUrlList);
  public
    function New: IBerriesGETResponse;
  published
    property results: TArrayNameAndUrl read Fresults write Fresults;
  end;

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

implementation

{ TBerriesListResponse }

function TBerriesListResponse.Getresults: INameAndUrlList;
begin
  if FresultsInt = nil then
  begin
    FresultsInt := TNameAndUrlList.Create(Fresults).New;
  end;
  Result := FresultsInt;
end;

function TBerriesListResponse.New: IBerriesGETResponse;
begin
  Result := Self;
end;

procedure TBerriesListResponse.Setresults(const Value: INameAndUrlList);
begin
  FresultsInt := Value;
end;

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

end.
