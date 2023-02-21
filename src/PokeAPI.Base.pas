unit PokeAPI.Base;

interface

uses
  PokeAPI.Base.Int;

type
  TNamedAPIResource = class(TInterfacedObject, INamedAPIResource)
  private
    Fname: string;
    Furl: string;
    function Getname: string;
    function Geturl: string;
  public
    function New: INamedAPIResource;
  published
    property name: string read Getname;
    property url: string read Geturl;
  end;

  TArrayNameAndUrl = array of TNamedAPIResource;

  TNamedAPIResourceList = class(TInterfacedObject, INamedAPIResourceList)
  private
    FArr: TArrayINamedAPIResource;
  public
    constructor Create(const Arr: TArrayNameAndUrl); overload;
    constructor Create(const Arr: TArrayINamedAPIResource); overload;
    function New: INamedAPIResourceList;
    function Count: Integer;
    function Item(const Index: Integer): INamedAPIResource;
  end;

  TWithLanguage = class(TInterfacedObject, IWithLanguage)
  private
    FlanguageInt: INamedAPIResource;
    Flanguage: TNamedAPIResource;
    function Getlanguage: INamedAPIResource;
  published
    property language: TNamedAPIResource read Flanguage write Flanguage;
  end;

  TName = class(TInterfacedObject, IName)
  private
    FlanguageInt: INamedAPIResource;
    Flanguage: TNamedAPIResource;
    Fname: string;
    Fcolor: string;
    function Getlanguage: INamedAPIResource;
    function Getname: string;
    function Getcolor: string;
  public
    function New: IName;
  published
    property language: TNamedAPIResource read Flanguage write Flanguage;
    property name: string read Getname;
    property color: string read Getcolor;
  end;

  TArrayName = array of TName;

  TNameList = class(TInterfacedObject, INameList)
  private
    FArr: TArrayIName;
  public
    constructor Create(const Arr: TArrayName); overload;
    constructor Create(const Arr: TArrayIName); overload;
    function New: INameList;
    function Count: Integer;
    function Item(const Index: Integer): IName;
  end;

  TFlavorText = class(TWithLanguage, IFlavorText)
  private
    Fflavor_text: string;
    Fversion: TNamedAPIResource;
    FversionInt: INamedAPIResource;
    function Getflavor_text: string;
    function Getversion: INamedAPIResource;
  public
    function New: IFlavorText;
  published
    property flavor_text: string read Getflavor_text;
    property version: TNamedAPIResource read Fversion;
  end;

  TArrayFlavorTextEntry = array of TFlavorText;

  TFlavorTextList = class(TInterfacedObject, IFlavorTextList)
  private
    FArr: TArrayIFlavorText;
  public
    constructor Create(const Arr: TArrayFlavorTextEntry); overload;
    constructor Create(const Arr: TArrayIFlavorText); overload;
    function New: IFlavorTextList;
    function Count: Integer;
    function Item(const Index: Integer): IFlavorText;
  end;

  TEffect = class(TWithLanguage, IEffect)
  private
    Feffect: string;
    function Geteffect: string;
  public
    function New: IEffect;
  published
    property effect: string read Geteffect;
  end;

  TArrayEffectEntry = array of TEffect;

  TEffectList = class(TInterfacedObject, IEffectList)
  private
    FArr: TArrayIEffect;
  public
    constructor Create(const Arr: TArrayEffectEntry); overload;
    constructor Create(const Arr: TArrayIEffect); overload;
    function New: IEffectList;
    function Count: Integer;
    function Item(const Index: Integer): IEffect;
  end;

  TListResponse = class(TInterfacedObject, IListResponse)
  private
    Fcount: Integer;
    Fnext: string;
    Fprevious: string;
    FresultsInt: INamedAPIResourceList;
    Fresults: TArrayNameAndUrl;
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    function Getresults: INamedAPIResourceList;
  public
    function New: IListResponse;
  published
    property count: Integer read Getcount;
    property next: string read Getnext;
    property previous: string read Getprevious;
    property results: TArrayNameAndUrl read Fresults write Fresults;
  end;

implementation

{ TNamedAPIResource }

function TNamedAPIResource.Getname: string;
begin
  Result := Fname;
end;

function TNamedAPIResource.Geturl: string;
begin
  Result := Furl;
end;

function TNamedAPIResource.New: INamedAPIResource;
begin
  Result := Self;
end;

{ TListResponse }

function TListResponse.Getcount: Integer;
begin
  Result := Fcount;
end;

function TListResponse.Getnext: string;
begin
  Result := Fnext;
end;

function TListResponse.Getprevious: string;
begin
  Result := Fprevious;
end;

function TListResponse.Getresults: INamedAPIResourceList;
begin
  if FresultsInt = nil then
  begin
    FresultsInt := TNamedAPIResourceList.Create(Fresults).New;
  end;
  Result := FresultsInt;
end;

function TListResponse.New: IListResponse;
begin
  Result := Self;
end;

{ TNamedAPIResourceList }

function TNamedAPIResourceList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TNamedAPIResourceList.Create(const Arr: TArrayNameAndUrl);
var
  ArrInt: TArrayINamedAPIResource;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TNamedAPIResourceList.Create(const Arr: TArrayINamedAPIResource);
begin
  FArr := Arr;
end;

function TNamedAPIResourceList.Item(const Index: Integer): INamedAPIResource;
begin
  Result := FArr[Index];
end;

function TNamedAPIResourceList.New: INamedAPIResourceList;
begin
  Result := Self;
end;

{ TWithLanguage }

function TWithLanguage.Getlanguage: INamedAPIResource;
begin
  if FlanguageInt = nil then
  begin
    FlanguageInt := Flanguage.New;
  end;
  Result := FlanguageInt;
end;

{ TName }

function TName.Getlanguage: INamedAPIResource;
begin
  if FlanguageInt = nil then
  begin
    FlanguageInt := Flanguage.New;
  end;
  Result := FlanguageInt;
end;

function TName.Getname: string;
begin
  Result := Fname;
end;

function TName.New: IName;
begin
  Result := Self;
end;

function TName.Getcolor: string;
begin
  Result := Fname;
end;

{ TNameList }

function TNameList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TNameList.Create(const Arr: TArrayIName);
begin
  FArr := Arr;
end;

constructor TNameList.Create(const Arr: TArrayName);
var
  ArrInt: TArrayIName;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

function TNameList.Item(const Index: Integer): IName;
begin
  Result := FArr[Index];
end;

function TNameList.New: INameList;
begin
  Result := Self;
end;

{ TFlavorText }

function TFlavorText.Getflavor_text: string;
begin
  Result := Fflavor_text;
end;

function TFlavorText.Getversion: INamedAPIResource;
begin
  if FversionInt = nil then
  begin
    FversionInt := Fversion.New;
  end;
  Result := FversionInt;
end;

function TFlavorText.New: IFlavorText;
begin
  Result := Self;
end;

{ TFlavorTextList }

constructor TFlavorTextList.Create(const Arr: TArrayFlavorTextEntry);
var
  ArrInt: TArrayIFlavorText;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TFlavorTextList.Create(const Arr: TArrayIFlavorText);
begin
  FArr := Arr;
end;

function TFlavorTextList.New: IFlavorTextList;
begin
  Result := Self;
end;

function TFlavorTextList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TFlavorTextList.Item(const Index: Integer): IFlavorText;
begin
  Result := FArr[Index];
end;

{ TEffect }

function TEffect.Geteffect: string;
begin
  Result := Feffect;
end;

function TEffect.New: IEffect;
begin
  Result := Self;
end;

{ TEffectList }

constructor TEffectList.Create(const Arr: TArrayEffectEntry);
var
  ArrInt: TArrayIEffect;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TEffectList.Create(const Arr: TArrayIEffect);
begin
  FArr := Arr;
end;

function TEffectList.New: IEffectList;
begin
  Result := Self;
end;

function TEffectList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TEffectList.Item(const Index: Integer): IEffect;
begin
  Result := FArr[Index];
end;

end.


