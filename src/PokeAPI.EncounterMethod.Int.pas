unit PokeAPI.EncounterMethod.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IEncounterMethod = interface
  ['{6C187928-2D3B-4582-8E07-F98DF341A414}']
    function Getid: Integer;
    function Getname: string;
    function Getorder: Integer;
    function Getnames: INameList;
    property id: Integer read Getid;
    property name: string read Getname;
    property order: Integer read Getorder;
    property names: INameList read Getnames;
  end;

implementation

end.
