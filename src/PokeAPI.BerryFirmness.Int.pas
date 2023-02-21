unit PokeAPI.BerryFirmness.Int;

interface

uses
  PokeAPI.Base.Int;

type
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
