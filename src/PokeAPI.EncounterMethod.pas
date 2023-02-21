unit PokeAPI.EncounterMethod;

interface

uses
  PokeAPI.Base.Int,
  PokeAPI.EncounterMethod.Int,
  PokeAPI.Base;

type
  TEncounterMethod = class(TInterfacedObject, IEncounterMethod)
  private
    Fid: Integer;
    Fname: string;
    Forder: Integer;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getid: Integer;
    function Getname: string;
    function Getorder: Integer;
    function Getnames: INameList;
  public
    function New: IEncounterMethod;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property order: Integer read Getorder;
    property names: TArrayName read Fnames;
  end;

implementation

{ TEncounterMethod }

function TEncounterMethod.Getid: Integer;
begin
  Result := Fid;
end;

function TEncounterMethod.Getname: string;
begin
  Result := Fname;
end;

function TEncounterMethod.Getorder: Integer;
begin
  Result := Forder;
end;

function TEncounterMethod.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames);
  end;
  Result := FnamesInt;
end;

function TEncounterMethod.New: IEncounterMethod;
begin
  Result := Self;
end;

end.
