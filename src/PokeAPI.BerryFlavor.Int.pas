unit PokeAPI.BerryFlavor.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IBerryPotency = interface
  ['{2CB2EAB6-D1DE-4CD5-9591-1B960EAEC02A}']
    function Getpotency: Integer;
    function Getberry: INameAndUrl;
    property potency: Integer read Getpotency;
    property berry: INameAndUrl read Getberry;
  end;

  TArrayIBerryPotency = array of IBerryPotency;

  IBerryPotencyList = interface
  ['{2ACA4191-0F36-47E2-9B60-9F54F3E59500}']
    function Count: Integer;
    function Item(const Index: Integer): IBerryPotency;
  end;

  IBerryFlavor = interface
  ['{99987DC6-96F8-4B0A-B02C-E12A0509E611}']
    function Getid: Integer;
    function Getname: string;
    function Getberries: IBerryPotencyList;
    function Getcontest_type: INameAndUrl;
    function Getnames: INameList;
    property id: Integer read Getid;
    property name: string read Getname;
    property berries: IBerryPotencyList read Getberries;
    property contest_type: INameAndUrl read Getcontest_type;
    property names: INameList read Getnames;
  end;

implementation

end.
