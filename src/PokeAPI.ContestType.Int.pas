unit PokeAPI.ContestType.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IContestType = interface
  ['{F2778D43-AD03-4B82-848D-8696CF57CB4F}']
    function Getid: Integer;
    function Getname: string;
    function Getberry_flavor: INamedAPIResource;
    function Getnames: INameList;
    property id: Integer read Getid;
    property name: string read Getname;
    property berry_flavor: INamedAPIResource read Getberry_flavor;
    property names: INameList read Getnames;
  end;

implementation

end.
