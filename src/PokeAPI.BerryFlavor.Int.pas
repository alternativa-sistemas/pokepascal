unit PokeAPI.BerryFlavor.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IBerryPotency = interface
  ['{2CB2EAB6-D1DE-4CD5-9591-1B960EAEC02A}']
    function Getpotency: Integer;
    procedure Setpotency(const Value: Integer);
    function Getberry: INameAndUrl;
    procedure Setberry(const Value: INameAndUrl);
    property potency: Integer read Getpotency write Setpotency;
    property berry: INameAndUrl read Getberry write Setberry;
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
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getberries: IBerryPotencyList;
    procedure Setberries(const Value: IBerryPotencyList);
    function Getcontest_type: INameAndUrl;
    procedure Setcontest_type(const Value: INameAndUrl);
    function Getnames: INameList;
    procedure Setnames(const Value: INameList);
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property berries: IBerryPotencyList read Getberries write Setberries;
    property contest_type: INameAndUrl read Getcontest_type write Setcontest_type;
    property names: INameList read Getnames write Setnames;
  end;

implementation

end.
