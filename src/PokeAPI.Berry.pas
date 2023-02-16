unit PokeAPI.Berry;

interface

uses
  PokeAPI.Base;

type
  IFlavor = interface
  ['{0A0310E8-941A-40AC-AB83-3CE8BE4316EE}']
    function Getpotency: Integer;
    procedure Setpotency(const Value: Integer);
    function Getflavor: INameAndUrl;
    procedure Setflavor(const Value: INameAndUrl);
    property potency: Integer read Getpotency write Setpotency;
    property flavor: INameAndUrl read Getflavor write Setflavor;
  end;

  IFlavorList = interface
  ['{138B5402-99CD-4FA0-BC71-CA6965EA7F99}']
  end;

  IBerry = interface
  ['{98261020-4030-41F7-B938-64B2335B6054}']
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
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property growth_time: Integer read Getgrowth_time write Setgrowth_time;
    property max_harvest: Integer read Getmax_harvest write Setmax_harvest;
    property natural_gift_power: Integer read Getnatural_gift_power write Setnatural_gift_power;
    property size: Integer read Getsize write Setsize;
    property smoothness: Integer read Getsmoothness write Setsmoothness;
    property soil_dryness: Integer read Getsoil_dryness write Setsoil_dryness;
    property firmness: INameAndUrl read Getfirmness write Setfirmness;
    property flavors: IFlavorList read Getflavors write Setflavors;
    property item: INameAndUrl read Getitem write Setitem;
    property natural_gift_type: INameAndUrl read Getnatural_gift_type write Setnatural_gift_type;
  end;

  IBerriesGETResponse = interface(IListResponse)
    ['{9BD5481D-DFAE-45DE-B7E9-D00C80968433}']
    function Getresults: INameAndUrlList;
    procedure Setresults(const Value: INameAndUrlList);
    property results: INameAndUrlList read Getresults write Setresults;
  end;

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

end.

