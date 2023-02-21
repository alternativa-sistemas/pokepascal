unit PokeAPI.BerryFirmness;

interface

uses
  PokeAPI.BerryFirmness.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TBerryFirmness = class(TInterfacedObject, IBerryFirmness)
  private
    FberriesInt: INamedAPIResourceList;
    Fberries: TArrayNameAndUrl;
    Fid: Integer;
    Fname: string;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getberries: INamedAPIResourceList;
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
  public
    function New: IBerryFirmness;
  published
    property berries: TArrayNameAndUrl read Fberries write Fberries;
    property id: Integer read Getid;
    property name: string read Getname;
    property names: TArrayName read Fnames;
  end;

implementation

{ TBerryFirmness }

function TBerryFirmness.Getberries: INamedAPIResourceList;
begin
  if FberriesInt = nil then
  begin
    FberriesInt := TNamedAPIResourceList.Create(Fberries).New;
  end;
  Result := FberriesInt;
end;

function TBerryFirmness.Getid: Integer;
begin
  Result := Fid;
end;

function TBerryFirmness.Getname: string;
begin
  Result := Fname;
end;

function TBerryFirmness.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TBerryFirmness.New: IBerryFirmness;
begin
  Result := Self;
end;

end.
