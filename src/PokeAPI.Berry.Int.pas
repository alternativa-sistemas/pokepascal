unit PokeAPI.Berry.Int;

interface

uses
  PokeAPI.Base.Int;

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

  TArrayIFlavor = array of IFlavor;

  IFlavorList = interface
  ['{138B5402-99CD-4FA0-BC71-CA6965EA7F99}']
    function Count: Integer;
    function Item(const Index: Integer): IFlavor;
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

  IName = interface
  ['{1A3ADD37-3600-4986-83E5-DA2D58DDE8D0}']
    function Getlanguage: INameAndUrl;
    procedure Setlanguage(const Value: INameAndUrl);
    function Getname: string;
    procedure Setname(const Value: string);
    property language: INameAndUrl read Getlanguage write Setlanguage;
    property name: string read Getname write Setname;
  end;

  TArrayIName = array of IName;

  INameList = interface
  ['{561318A3-66A7-4B9F-B132-7A1E0600DC37}']
    function Count: Integer;
    function Item(const Index: Integer): IName;
  end;

  IBerryFirmness = interface
  ['{EC156C9E-66C5-4D1B-992F-F1C1F4B71D73}']
    function Getberries: INameAndUrlList;
    procedure Setberries(const Value: INameAndUrlList);
    function Getid: Integer;
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getnames: INameList;
    procedure Setnames(const Value: INameList);
    property berries: INameAndUrlList read Getberries write Setberries;
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property names: INameList read Getnames write Setnames;
  end;

implementation

end.
