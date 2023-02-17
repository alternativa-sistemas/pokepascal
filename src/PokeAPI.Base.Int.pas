unit PokeAPI.Base.Int;

interface

type
  INameAndUrl = interface
  ['{CF82ED1A-18A7-4CF0-90FC-FB5197AA4505}']
    function Getname: string;
    function Geturl: string;
    procedure Setname(const Value: string);
    procedure Seturl(const Value: string);
    property name: string read Getname write Setname;
    property url: string read Geturl write Seturl;
  end;

  TArrayINameAndUrl = array of INameAndUrl;

  INameAndUrlList = interface
  ['{64DDC5D3-30F9-45BC-82B5-F4593F69F15C}']
    function Count: Integer;
    function Item(const Index: Integer): INameAndUrl;
  end;

  IListResponse = interface
    ['{9BD5481D-DFAE-45DE-B7E9-D00C80968433}']
    procedure Setcount(const Value: Integer);
    procedure Setnext(const Value: string);
    procedure Setprevious(const Value: string);
    procedure Setresults(const Value: INameAndUrlList);
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    function Getresults: INameAndUrlList;
    property count: Integer read Getcount write Setcount;
    property next: string read Getnext write Setnext;
    property previous: string read Getprevious write Setprevious;
    property results: INameAndUrlList read Getresults write Setresults;
  end;

implementation

end.
