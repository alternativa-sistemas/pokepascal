unit PokeAPI.ContestEffect;

interface

uses
  PokeAPI.ContestEffect.Int, PokeAPI.Base.Int, PokeAPI.Base;

type
  TContestEffect = class(TInterfacedObject, IContestEffect)
  private
    Fid: Integer;
    Fappeal: Integer;
    Fjam: Integer;
    Feffect_entriesInt: IEffectList;
    Feffect_entries: TArrayEffectEntry;
    Fflavor_text_entriesInt: IFlavorTextList;
    Fflavor_text_entries: TArrayFlavorTextEntry;
    function Getid: Integer;
    function Getappeal: Integer;
    function Getjam: Integer;
    function Geteffect_entries: IEffectList;
    function Getflavor_text_entries: IFlavorTextList;
  public
    function New: IContestEffect;
  published
    property id: Integer read Getid;
    property appeal: Integer read Getappeal;
    property jam: Integer read Getjam;
    property effect_entries: IEffectList read Geteffect_entries;
    property flavor_text_entries: IFlavorTextList read Getflavor_text_entries;
  end;

implementation

{ TContestEffect }

function TContestEffect.Getid: Integer;
begin
  Result := Fid;
end;

function TContestEffect.Getappeal: Integer;
begin
  Result := Fappeal;
end;

function TContestEffect.Getjam: Integer;
begin
  Result := Fjam;
end;

function TContestEffect.Geteffect_entries: IEffectList;
begin
  if Feffect_entriesInt = nil then
  begin
    Feffect_entriesInt := TEffectList.Create(Feffect_entries).New;
  end;
  Result := Feffect_entriesInt;
end;

function TContestEffect.Getflavor_text_entries: IFlavorTextList;
begin
  if Fflavor_text_entriesInt = nil then
  begin
    Fflavor_text_entriesInt := TFlavorTextList.Create(Fflavor_text_entries).New;
  end;
  Result := Fflavor_text_entriesInt;
end;

function TContestEffect.New: IContestEffect;
begin
  Result := Self;
end;

end.
