unit PokeAPI.BerryFirmness.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IBerryFirmness = interface
  ['{EC156C9E-66C5-4D1B-992F-F1C1F4B71D73}']
    function Getberries: INamedAPIResourceList;
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
    property berries: INamedAPIResourceList read Getberries;
    property id: Integer read Getid;
    property name: string read Getname;
    property names: INameList read Getnames;
  end;

implementation

end.
