unit PokeAPI.BerryFirmness;

interface

uses
  PokeAPI.BerryFirmness.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TBerryFirmness = class(TInterfacedObject, IBerryFirmness)
  private
    FberriesInt: INameAndUrlList;
    Fberries: TArrayNameAndUrl;
    Fid: Integer;
    Fname: string;
    FnamesInt: INameList;
    Fnames: TArrayName;
    function Getberries: INameAndUrlList;
    procedure Setberries(const Value: INameAndUrlList);
    function Getid: Integer;
    procedure Setid(const Value: Integer);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getnames: INameList;
    procedure Setnames(const Value: INameList);
  public
    function New: IBerryFirmness;
  published
    property berries: TArrayNameAndUrl read Fberries write Fberries;
    property id: Integer read Getid write Setid;
    property name: string read Getname write Setname;
    property names: TArrayName read Fnames write Fnames;
  end;

implementation

{ TBerryFirmness }

function TBerryFirmness.Getberries: INameAndUrlList;
begin
  if FberriesInt = nil then
  begin
    FberriesInt := TNameAndUrlList.Create(Fberries).New;
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

procedure TBerryFirmness.Setberries(const Value: INameAndUrlList);
begin
  FberriesInt := Value;
end;

procedure TBerryFirmness.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBerryFirmness.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TBerryFirmness.Setnames(const Value: INameList);
begin
  FnamesInt := Value;
end;

end.
