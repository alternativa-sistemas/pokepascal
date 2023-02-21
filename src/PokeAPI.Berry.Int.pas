unit PokeAPI.Berry.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IFlavor = interface
  ['{0A0310E8-941A-40AC-AB83-3CE8BE4316EE}']
    function Getpotency: Integer;
    function Getflavor: INamedAPIResource;
    property potency: Integer read Getpotency;
    property flavor: INamedAPIResource read Getflavor;
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
    property id: Integer read Getid;
    property name: string read Getname;
    property growth_time: Integer read Getgrowth_time;
    property max_harvest: Integer read Getmax_harvest;
    property natural_gift_power: Integer read Getnatural_gift_power;
    property size: Integer read Getsize;
    property smoothness: Integer read Getsmoothness;
    property soil_dryness: Integer read Getsoil_dryness;
    property firmness: INamedAPIResource read Getfirmness;
    property flavors: IFlavorList read Getflavors;
    property item: INamedAPIResource read Getitem;
    property natural_gift_type: INamedAPIResource read Getnatural_gift_type;
  end;

implementation

end.
