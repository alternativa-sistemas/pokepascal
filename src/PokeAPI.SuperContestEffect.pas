unit PokeAPI.SuperContestEffect;

interface

uses
  PokeAPI.SuperContestEffect.Int, PokeAPI.Base, PokeAPI.Base.Int;

type
  TSuperContestEffect = class(TInterfacedObject, ISuperContestEffect)
  private
    Fid: Integer;
    Fappeal: Integer;
    Fflavor_text_entriesInt: IFlavorTextList;
    Fflavor_text_entries: TArrayFlavorTextEntry;
    FmovesInt: INamedAPIResourceList;
    Fmoves: TArrayNamedAPIResource;
    function Getid: Integer;
    function Getappeal: Integer;
    function Getflavor_text_entries: IFlavorTextList;
    function Getmoves: INamedAPIResourceList;
  public
    function New: ISuperContestEffect;
  published
    property id: Integer read Getid;
    property appeal: Integer read Getappeal;
    property flavor_text_entries: IFlavorTextList read Getflavor_text_entries;
    property moves: INamedAPIResourceList read Getmoves;
  end;

implementation


{ TSuperContestEffect }

function TSuperContestEffect.Getid: Integer;
begin
  Result := Fid;
end;

function TSuperContestEffect.Getappeal: Integer;
begin
  Result := Fappeal;
end;

function TSuperContestEffect.Getflavor_text_entries: IFlavorTextList;
begin
  if Fflavor_text_entriesInt = nil then
  begin
    Fflavor_text_entriesInt := TFlavorTextList.Create(Fflavor_text_entries).New;
  end;
  Result := Fflavor_text_entriesInt;
end;

function TSuperContestEffect.Getmoves: INamedAPIResourceList;
begin
  if FmovesInt = nil then
  begin
    FmovesInt := TNamedAPIResourceList.Create(Fmoves).New;
  end;
  Result := FmovesInt;
end;

function TSuperContestEffect.New: ISuperContestEffect;
begin
  Result := Self;
end;

end.
