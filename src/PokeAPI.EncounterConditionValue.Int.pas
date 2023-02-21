unit PokeAPI.EncounterConditionValue.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IEncounterConditionValue = interface
  ['{09C33F74-70C4-4D7E-B7B8-38C825507071}']
    function Getid: Integer;
    function Getname: string;
    function Getcondition: IName;
    function Getnames: INameList;
    property id: Integer read Getid;
    property name: string read Getname;
    property condition: IName read Getcondition;
    property names: INameList read Getnames;
  end;

implementation

end.
