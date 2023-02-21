unit PokeAPI.Generation;

interface

uses
  PokeAPI.Generation.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TGeneration = class(TInterfacedObject, IGeneration)
  private
    Fid: Integer;
    Fname: string;
    FabilitiesInt: INamedAPIResourceList;
    Fabilities: TArrayNamedAPIResource;
    FnamesInt: INameList;
    Fnames: TArrayName;
    Fmain_regionInt: INamedAPIResource;
    Fmain_region: TNamedAPIResource;
    FmovesInt: INamedAPIResourceList;
    Fmoves: TArrayNamedAPIResource;
    Fpokemon_speciesInt: INamedAPIResourceList;
    Fpokemon_species: TArrayNamedAPIResource;
    FtypesInt: INamedAPIResourceList;
    Ftypes: TArrayNamedAPIResource;
    Fversion_groupsInt: INamedAPIResourceList;
    Fversion_groups: TArrayNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getabilities: INamedAPIResourceList;
    function Getnames: INameList;
    function Getmain_region: INamedAPIResource;
    function Getmoves: INamedAPIResourceList;
    function Getpokemon_species: INamedAPIResourceList;
    function Gettypes: INamedAPIResourceList;
    function Getversion_groups: INamedAPIResourceList;
  public
    function New: IGeneration;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property abilities: TArrayNamedAPIResource read Fabilities;
    property names: TArrayName read Fnames;
    property main_region: TNamedAPIResource read Fmain_region;
    property moves: TArrayNamedAPIResource read Fmoves;
    property pokemon_species: TArrayNamedAPIResource read Fpokemon_species;
    property types: TArrayNamedAPIResource read Ftypes;
    property version_groups: TArrayNamedAPIResource read Fversion_groups;
  end;

implementation

{ TGeneration }

function TGeneration.Getid: Integer;
begin
  Result := Fid;
end;

function TGeneration.Getname: string;
begin
  Result := Fname;
end;

function TGeneration.Getabilities: INamedAPIResourceList;
begin
  if FabilitiesInt = nil then
  begin
    FabilitiesInt := TNamedAPIResourceList.Create(Fabilities).New;
  end;
  Result := FabilitiesInt;
end;

function TGeneration.Getnames: INameList;
begin
  if FnamesInt = nil then
  begin
    FnamesInt := TNameList.Create(Fnames).New;
  end;
  Result := FnamesInt;
end;

function TGeneration.Getmain_region: INamedAPIResource;
begin
  if Fmain_regionInt = nil then
  begin
    Fmain_regionInt := Fmain_region.New;
  end;
  Result := Fmain_regionInt;
end;

function TGeneration.Getmoves: INamedAPIResourceList;
begin
  if FmovesInt = nil then
  begin
    FmovesInt := TNamedAPIResourceList.Create(Fmoves).New;
  end;
  Result := FmovesInt;
end;

function TGeneration.Getpokemon_species: INamedAPIResourceList;
begin
  if Fpokemon_speciesInt = nil then
  begin
    Fpokemon_speciesInt := TNamedAPIResourceList.Create(Fpokemon_species).New;
  end;
  Result := Fpokemon_speciesInt;
end;

function TGeneration.Gettypes: INamedAPIResourceList;
begin
  if FtypesInt = nil then
  begin
    FtypesInt := TNamedAPIResourceList.Create(Ftypes).New;
  end;
  Result := FtypesInt;
end;

function TGeneration.Getversion_groups: INamedAPIResourceList;
begin
  if Fversion_groupsInt = nil then
  begin
    Fversion_groupsInt := TNamedAPIResourceList.Create(Fversion_groups);
  end;
  Result := Fversion_groupsInt;
end;

function TGeneration.New: IGeneration;
begin
  Result := Self;
end;

end.
