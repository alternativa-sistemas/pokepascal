unit PokeAPI.SuperContestEffect.Int;

interface

uses
  PokeAPI.Base.Int;

type
  ISuperContestEffect = interface
  ['{16230D86-5E57-4A70-9423-B6C4E93C5E21}']
    function Getid: Integer;
    function Getappeal: Integer;
    function Getflavor_text_entries: IFlavorTextList;
    function Getmoves: INamedAPIResourceList;
    property id: Integer read Getid;
    property appeal: Integer read Getappeal;
    property flavor_text_entries: IFlavorTextList read Getflavor_text_entries;
    property moves: INamedAPIResourceList read Getmoves;
  end;

implementation

end.
