unit PokeAPI.Base.Int;

interface

type
  INamedAPIResource = interface
  ['{CF82ED1A-18A7-4CF0-90FC-FB5197AA4505}']
    function Getname: string;
    function Geturl: string;
    property url: string read Geturl;
    property name: string read Getname;
  end;

  TArrayINamedAPIResource = array of INamedAPIResource;

  INamedAPIResourceList = interface
  ['{64DDC5D3-30F9-45BC-82B5-F4593F69F15C}']
    function Count: Integer;
    function Item(const Index: Integer): INamedAPIResource;
  end;

  IWithLanguage = interface
    function Getlanguage: INamedAPIResource;
    property language: INamedAPIResource read Getlanguage;
  end;

  IName = interface(IWithLanguage)
  ['{1A3ADD37-3600-4986-83E5-DA2D58DDE8D0}']
    function Getname: string;
    function Getcolor: string;
    property name: string read Getname;
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
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    function Getresults: INamedAPIResourceList;
    property count: Integer read Getcount;
    property next: string read Getnext;
    property previous: string read Getprevious;
    property results: INamedAPIResourceList read Getresults;
  end;

  IEffect = interface(IWithLanguage)
  ['{8918223D-1717-47A0-838D-5D2CCE365DE1}']
    function Geteffect: string;
    property effect: string read Geteffect;
  end;

  TArrayIEffect = array of IEffect;

  IEffectList = interface
  ['{5912BC0F-2A4E-4200-8DCD-19D5B2EE5FF5}']
    function Count: Integer;
    function Item(const Index: Integer): IEffect;
  end;

  IFlavorText = interface(IWithLanguage)
  ['{4A93F7F3-6847-4311-AD33-C842CDCA4042}']
    function Getflavor_text: string;
    function Getversion: INamedAPIResource;
    property flavor_text: string read Getflavor_text;
    property version: INamedAPIResource read Getversion;
  end;

  TArrayIFlavorText = array of IFlavorText;

  IFlavorTextList = interface
  ['{56F0F738-BF47-4396-A372-E09D149292E3}']
    function Count: Integer;
    function Item(const Index: Integer): IFlavorText;
  end;

  IDescription = interface(IWithLanguage)
  ['{497DB5E2-B77A-4599-A66B-B8E6A4F3BD3B}']
    function Getdescription: string;
    property description: string read Getdescription;
  end;

  TArrayIDescription = array of IDescription;

  IDescriptionList = interface
  ['{4A89E0F9-520A-4A04-8C13-90C2B60DF4AA}']
    function Count: Integer;
    function Item(const Index: Integer): IDescription;
  end;

implementation

end.



