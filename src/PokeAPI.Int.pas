unit PokeAPI.Int;

interface

uses
  PokeAPI.Base.Int, PokeAPI.Berry.Int, PokeAPI.BerryFirmness.Int,
  PokeAPI.BerryFlavor.Int;

type
  IPokeAPI = interface
  ['{05357B51-A62A-4C56-9816-D33CEB371B3A}']
    function GetBerries(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerries(const URL: string): IListResponse; overload;
    function GetBerry(const Id: Integer): IBerry; overload;
    function GetBerry(const Name: string): IBerry; overload;
    function GetBerriesFirmness(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerriesFirmness(const URL: string): IListResponse; overload;
    function GetBerryFirmness(const Id: Integer): IBerryFirmness; overload;
    function GetBerryFirmness(const Name: string): IBerryFirmness; overload;
    function GetBerriesFlavor(const Limit: Integer = -1;
      const Offset: Integer = -1): IListResponse; overload;
    function GetBerriesFlavor(const URL: string): IListResponse; overload;
    function GetBerryFlavor(const Id: Integer): IBerryFlavor; overload;
    function GetBerryFlavor(const Name: string): IBerryFlavor; overload;
  end;

implementation

end.
