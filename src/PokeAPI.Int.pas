unit PokeAPI.Int;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Berry.Int;

type
  IPokeAPI = interface
  ['{05357B51-A62A-4C56-9816-D33CEB371B3A}']
    function GetBerries(const Limit: Integer = -1;
      const Offset: Integer = -1): IBerriesGETResponse; overload;
    function GetBerries(const URL: string): IBerriesGETResponse; overload;
    function GetBerry(const Id: Integer): IBerry;
  end;

implementation

end.
