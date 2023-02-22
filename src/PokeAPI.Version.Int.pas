unit PokeAPI.Version.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IVersion = interface
  ['{63A38EDF-78C2-4E47-8DD6-E7F28C83469C}']
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
    function Getversion_group: INamedAPIResource;
    property id: Integer read Getid;
    property name: string read Getname;
    property names: INameList read Getnames;
    property version_group: INamedAPIResource read Getversion_group;
  end;

implementation

end.
