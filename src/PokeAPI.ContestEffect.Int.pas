unit PokeAPI.ContestEffect.Int;

interface

uses
  PokeAPI.Base.Int;

type
  IContestEffect = interface
  ['{FF2133A0-8FD7-49DD-A797-ECEC4894C0C2}']
    function Getid: Integer;
    function Getappeal: Integer;
    function Getjam: Integer;
    function Geteffect_entries: IEffectEntryList;
    function Getflavor_text_entries: IFlavorTextEntryList;
    property id: Integer read Getid;
    property appeal: Integer read Getappeal;
    property jam: Integer read Getjam;
    property effect_entries: IEffectEntryList read Geteffect_entries;
    property flavor_text_entries: IFlavorTextEntryList read Getflavor_text_entries;
  end;

implementation

end.
