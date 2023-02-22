unit PokeAPI.VersionGroup;

interface

uses
  PokeAPI.VersionGroup.Int, PokeAPI.Base, PokeAPI.Base.Int;

type
  TVersionGroup = class(TInterfacedObject, IVersionGroup)
  private
    Fid: Integer;
    Fname: string;
    Forder: Integer;
    Fgeneration: TNamedAPIResource;
    FgenerationInt: INamedAPIResource;
    Fmove_learn_methodsInt: INamedAPIResourceList;
    Fmove_learn_methods: TArrayNamedAPIResource;
    FpokedexesInt: INamedAPIResourceList;
    Fpokedexes: TArrayNamedAPIResource;
    FregionsInt: INamedAPIResourceList;
    Fregions: TArrayNamedAPIResource;
    FversionsInt: INamedAPIResourceList;
    Fversions: TArrayNamedAPIResource;
    function Getid: Integer;
    function Getname: string;
    function Getorder: Integer;
    function Getgeneration: INamedAPIResource;
    function Getmove_learn_methods: INamedAPIResourceList;
    function Getpokedexes: INamedAPIResourceList;
    function Getregions: INamedAPIResourceList;
    function Getversions: INamedAPIResourceList;
  public
    function New: IVersionGroup;
  published
    property id: Integer read Getid;
    property name: string read Getname;
    property order: Integer read Getorder;
    property generation: INamedAPIResource read Getgeneration;
    property move_learn_methods: INamedAPIResourceList read Getmove_learn_methods;
    property pokedexes: INamedAPIResourceList read Getpokedexes;
    property regions: INamedAPIResourceList read Getregions;
    property versions: INamedAPIResourceList read Getversions;
  end;

implementation

{ TVersionGroup }

function TVersionGroup.Getid: Integer;
begin
  Result := Fid;
end;

function TVersionGroup.Getname: string;
begin
  Result := Fname;
end;

function TVersionGroup.Getorder: Integer;
begin
  Result := Forder;
end;

function TVersionGroup.Getgeneration: INamedAPIResource;
begin
  if FgenerationInt = nil then
  begin
    FgenerationInt := Fgeneration.New;
  end;
  Result := FgenerationInt;
end;

function TVersionGroup.Getmove_learn_methods: INamedAPIResourceList;
begin
  if Fmove_learn_methodsInt = nil then
  begin
    Fmove_learn_methodsInt := TNamedAPIResourceList.Create(Fmove_learn_methods).New;
  end;
  Result := Fmove_learn_methodsInt;
end;

function TVersionGroup.Getpokedexes: INamedAPIResourceList;
begin
  if FpokedexesInt = nil then
  begin
    FpokedexesInt := TNamedAPIResourceList.Create(Fpokedexes).New;
  end;
  Result := FpokedexesInt;
end;

function TVersionGroup.Getregions: INamedAPIResourceList;
begin
  if FregionsInt = nil then
  begin
    FregionsInt := TNamedAPIResourceList.Create(Fregions).New;
  end;
  Result := FregionsInt;
end;

function TVersionGroup.Getversions: INamedAPIResourceList;
begin
  if FversionsInt = nil then
  begin
    FversionsInt := TNamedAPIResourceList.Create(Fversions).New;
  end;
  Result := FversionsInt;
end;

function TVersionGroup.New: IVersionGroup;
begin
  Result := Self;
end;

end.
