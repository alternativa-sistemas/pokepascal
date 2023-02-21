unit PokeAPI.EncounterCondition;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Base, PokeAPI.EncounterCondition.Int;

type
  TEncounterCondition = class(TInterfacedObject, IEncounterCondition)
  private
    Fid: Integer;
    Fname: string;
    FvaluesInt: INameAndUrlList;
    Fvalues: TArrayNameAndUrl;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    function Getname: string;
    function Getvalues: INameAndUrlList;
    function Getnames: INameList;
  public
    function New: IEncounterCondition;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property values: INameAndUrlList read Getvalues;
    property names: INameList read Getnames;
  end;

implementation

{ TEncounterCondition }

function TEncounterCondition.Getid: Integer;
begin
  Result := Fid;
end;

function TEncounterCondition.Getname: string;
begin
  Result := Fname;
end;

function TEncounterCondition.Getvalues: INameAndUrlList;
begin
  if FvaluesInt = nil then
  begin
    FvaluesInt := TNameAndUrlList.Create(Fvalues).New;
  end;
  Result := FvaluesInt;
end;

function TEncounterCondition.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TEncounterCondition.New: IEncounterCondition;
begin
  Result := Self;
end;

end.
