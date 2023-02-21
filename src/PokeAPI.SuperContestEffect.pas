unit PokeAPI.SuperContestEffect;

interface

uses
  PokeAPI.SuperContestEffect.Int, PokeAPI.Base, PokeAPI.Base.Int;

type
  TSuperContestEffect = class(TInterfacedObject, ISuperContestEffect)
  private
    Fid: Integer;
    Fappeal: Integer;
    Fflavor_text_entriesInt: IFlavorTextEntryList;
    Fflavor_text_entries: TArrayFlavorTextEntry;
    FmovesInt: INameAndUrlList;
    Fmoves: TArrayNameAndUrl;
    function Getid: Integer;
    function Getappeal: Integer;
    function Getflavor_text_entries: IFlavorTextEntryList;
    function Getmoves: INameAndUrlList;
  public
    function New: ISuperContestEffect;
  published
    property id: Integer read Getid;
    property appeal: Integer read Getappeal;
    property flavor_text_entries: IFlavorTextEntryList read Getflavor_text_entries;
    property moves: INameAndUrlList read Getmoves;
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

function TSuperContestEffect.Getflavor_text_entries: IFlavorTextEntryList;
begin
  if Fflavor_text_entriesInt = nil then
  begin
    Fflavor_text_entriesInt := TFlavorTextEntryList.Create(Fflavor_text_entries).New;
  end;
  Result := Fflavor_text_entriesInt;
end;

function TSuperContestEffect.Getmoves: INameAndUrlList;
begin
  if FmovesInt = nil then
  begin
    FmovesInt := TNameAndUrlList.Create(Fmoves).New;
  end;
  Result := FmovesInt;
end;

function TSuperContestEffect.New: ISuperContestEffect;
begin
  Result := Self;
end;

end.
