unit PokeAPI.EncounterCondition.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IEncounterCondition = interface
  ['{F644DDBF-78EC-47C2-A8E3-8DD5CBD1B929}']
    function Getid: Integer;
    function Getname: string;
    function Getvalues: INamedAPIResourceList;
    function Getnames: INameList;
    property id: Integer read Getid;
    property name: string read Getname;
    property values: INamedAPIResourceList read Getvalues;
    property names: INameList read Getnames;
  end;

implementation

end.
