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

  IWithLanguage = interface
    function Getlanguage: INameAndUrl;
    procedure Setlanguage(const Value: INameAndUrl);
    property language: INameAndUrl read Getlanguage write Setlanguage;
  end;

  IName = interface(IWithLanguage)
  ['{1A3ADD37-3600-4986-83E5-DA2D58DDE8D0}']
    function Getname: string;
    procedure Setname(const Value: string);
    function Getcolor: string;
    property name: string read Getname write Setname;
    property color: string read Getcolor;
  end;

  TArrayIName = array of IName;

  INameList = interface
  ['{561318A3-66A7-4B9F-B132-7A1E0600DC37}']
    function Count: Integer;
    function Item(const Index: Integer): IName;
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

  IEffectEntry = interface(IWithLanguage)
  ['{8918223D-1717-47A0-838D-5D2CCE365DE1}']
    function Geteffect: string;
    property effect: string read Geteffect;
  end;

  TArrayIEffectEntry = array of IEffectEntry;

  IEffectEntryList = interface
  ['{5912BC0F-2A4E-4200-8DCD-19D5B2EE5FF5}']
    function Count: Integer;
    function Item(const Index: Integer): IEffectEntry;
  end;

  IFlavorTextEntry = interface(IWithLanguage)
  ['{4A93F7F3-6847-4311-AD33-C842CDCA4042}']
    function Getflavor_text: string;
    property flavor_text: string read Getflavor_text;
  end;

  TArrayIFlavorTextEntry = array of IFlavorTextEntry;

  IFlavorTextEntryList = interface
  ['{56F0F738-BF47-4396-A372-E09D149292E3}']
    function Count: Integer;
    function Item(const Index: Integer): IFlavorTextEntry;
  end;

implementation

end.
