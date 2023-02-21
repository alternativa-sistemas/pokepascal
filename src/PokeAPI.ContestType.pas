unit PokeAPI.ContestType;

interface

uses
  PokeAPI.ContestType.Int, PokeAPI.Base, PokeAPI.Base.Int;

type
  TContestType = class(TInterfacedObject, IContestType)
  private
    Fid: Integer;
    Fname: string;
    Fberry_flavorInt: INamedAPIResource;
    Fberry_flavor: TNamedAPIResource;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    function Getname: string;
    function Getberry_flavor: INamedAPIResource;
    function Getnames: INameList;
  public
    function New: IContestType;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property berry_flavor: INamedAPIResource read Getberry_flavor;
    property names: INameList read Getnames;
  end;

implementation

{ TContestType }

function TContestType.Getid: Integer;
begin
  Result := Fid;
end;

function TContestType.Getname: string;
begin
  Result := Fname;
end;

function TContestType.Getberry_flavor: INamedAPIResource;
begin
  if Fberry_flavorInt = nil then
  begin
    Fberry_flavorInt := Fberry_flavor.New;
  end;
  Result := Fberry_flavorInt;
end;

function TContestType.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TContestType.New: IContestType;
begin
  Result := Self;
end;

end.
