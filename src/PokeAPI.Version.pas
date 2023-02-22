unit PokeAPI.Version;

interface

uses
  PokeAPI.Version.Int, PokeAPI.Base, PokeAPI.Base.Int;

type
  TVersion = class(TInterfacedObject, IVersion)
  private
    Fid: Integer;
    Fname: string;
    FnamesInt: INameList;
    Fnames: TArrayName;
    Fversion_groupInt: INamedAPIResource;
    Fversion_group: TNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getnames: INameList;
    function Getversion_group: INamedAPIResource;
  public
    function New: IVersion;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property names: TArrayName read Fnames;
    property version_group: TNamedAPIResource read Fversion_group;
  end;

implementation

function TVersion.Getid: Integer;
begin
  Result := Fid;
end;

function TVersion.Getname: string;
begin
  Result := Fname;
end;

function TVersion.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TVersion.Getversion_group: INamedAPIResource;
begin
  if Fversion_groupInt = nil then
  begin
    Fversion_groupInt := Fversion_group.New;
  end;
  Result := Fversion_groupInt;
end;

function TVersion.New: IVersion;
begin
  Result := Self;
end;

end.
