unit PokeAPI.EncounterConditionValue;

interface

uses
  PokeAPI.EncounterConditionValue.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TEncounterConditionValue = class(TInterfacedObject, IEncounterConditionValue)
  private
    Fid: Integer;
    Fname: string;
    FconditionInt: IName;
    Fcondition: TName;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    function Getname: string;
    function Getcondition: IName;
    function Getnames: INameList;
  public
    function New: IEncounterConditionValue;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property condition: IName read Getcondition;
    property names: INameList read Getnames;
  end;

implementation

{ TEncounterConditionValue }

function TEncounterConditionValue.Getid: Integer;
begin
  Result := Fid;
end;

function TEncounterConditionValue.Getname: string;
begin
  Result := Fname;
end;

function TEncounterConditionValue.Getcondition: IName;
begin
  if FconditionInt = nil then
  begin
    FconditionInt := Fcondition.New;
  end;
  Result := FconditionInt;
end;

function TEncounterConditionValue.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TEncounterConditionValue.New: IEncounterConditionValue;
begin
  Result := Self;
end;

end.
