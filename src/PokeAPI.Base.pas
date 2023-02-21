unit PokeAPI.Base;

interface

uses
  PokeAPI.Base.Int;

type
  TNameAndUrl = class(TInterfacedObject, INameAndUrl)
  private
    Fname: string;
    Furl: string;
    function Getname: string;
    function Geturl: string;
  public
    function New: INameAndUrl;
  published
    property name: string read Getname;
    property url: string read Geturl;
  end;

  TArrayNameAndUrl = array of TNameAndUrl;

  TNameAndUrlList = class(TInterfacedObject, INameAndUrlList)
  private
    FArr: TArrayINameAndUrl;
  public
    constructor Create(const Arr: TArrayNameAndUrl); overload;
    constructor Create(const Arr: TArrayINameAndUrl); overload;
    function New: INameAndUrlList;
    function Count: Integer;
    function Item(const Index: Integer): INameAndUrl;
  end;

  TWithLanguage = class(TInterfacedObject, IWithLanguage)
  private
    FlanguageInt: INameAndUrl;
    Flanguage: TNameAndUrl;
    function Getlanguage: INameAndUrl;
  published
    property language: TNameAndUrl read Flanguage write Flanguage;
  end;

  TName = class(TInterfacedObject, IName)
  private
    FlanguageInt: INameAndUrl;
    Flanguage: TNameAndUrl;
    Fname: string;
    Fcolor: string;
    function Getlanguage: INameAndUrl;
    function Getname: string;
    function Getcolor: string;
  public
    function New: IName;
  published
    property language: TNameAndUrl read Flanguage write Flanguage;
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

  TFlavorTextEntry = class(TWithLanguage, IFlavorTextEntry)
  private
    Fflavor_text: string;
    function Getflavor_text: string;
  public
    function New: IFlavorTextEntry;
  published
    property flavor_text: string read Getflavor_text;
  end;

  TArrayFlavorTextEntry = array of TFlavorTextEntry;

  TFlavorTextEntryList = class(TInterfacedObject, IFlavorTextEntryList)
  private
    FArr: TArrayIFlavorTextEntry;
  public
    constructor Create(const Arr: TArrayFlavorTextEntry); overload;
    constructor Create(const Arr: TArrayIFlavorTextEntry); overload;
    function New: IFlavorTextEntryList;
    function Count: Integer;
    function Item(const Index: Integer): IFlavorTextEntry;
  end;

  TEffectEntry = class(TWithLanguage, IEffectEntry)
  private
    Feffect: string;
    function Geteffect: string;
  public
    function New: IEffectEntry;
  published
    property effect: string read Geteffect;
  end;

  TArrayEffectEntry = array of TEffectEntry;

  TEffectEntryList = class(TInterfacedObject, IEffectEntryList)
  private
    FArr: TArrayIEffectEntry;
  public
    constructor Create(const Arr: TArrayEffectEntry); overload;
    constructor Create(const Arr: TArrayIEffectEntry); overload;
    function New: IEffectEntryList;
    function Count: Integer;
    function Item(const Index: Integer): IEffectEntry;
  end;

  TListResponse = class(TInterfacedObject, IListResponse)
  private
    Fcount: Integer;
    Fnext: string;
    Fprevious: string;
    FresultsInt: INameAndUrlList;
    Fresults: TArrayNameAndUrl;
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    function Getresults: INameAndUrlList;
  public
    function New: IListResponse;
  published
    property count: Integer read Getcount;
    property next: string read Getnext;
    property previous: string read Getprevious;
    property results: TArrayNameAndUrl read Fresults write Fresults;
  end;

implementation

{ TNameAndUrl }

function TNameAndUrl.Getname: string;
begin
  Result := Fname;
end;

function TNameAndUrl.Geturl: string;
begin
  Result := Furl;
end;

function TNameAndUrl.New: INameAndUrl;
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

function TListResponse.Getresults: INameAndUrlList;
begin
  if FresultsInt = nil then
  begin
    FresultsInt := TNameAndUrlList.Create(Fresults).New;
  end;
  Result := FresultsInt;
end;

function TListResponse.New: IListResponse;
begin
  Result := Self;
end;

{ TNameAndUrlList }

function TNameAndUrlList.Count: Integer;
begin
  Result := Length(FArr);
end;

constructor TNameAndUrlList.Create(const Arr: TArrayNameAndUrl);
var
  ArrInt: TArrayINameAndUrl;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TNameAndUrlList.Create(const Arr: TArrayINameAndUrl);
begin
  FArr := Arr;
end;

function TNameAndUrlList.Item(const Index: Integer): INameAndUrl;
begin
  Result := FArr[Index];
end;

function TNameAndUrlList.New: INameAndUrlList;
begin
  Result := Self;
end;

{ TWithLanguage }

function TWithLanguage.Getlanguage: INameAndUrl;
begin
  if FlanguageInt = nil then
  begin
    FlanguageInt := Flanguage.New;
  end;
  Result := FlanguageInt;
end;

{ TName }

function TName.Getlanguage: INameAndUrl;
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

{ TFlavorTextEntry }

function TFlavorTextEntry.Getflavor_text: string;
begin
  Result := Fflavor_text;
end;

function TFlavorTextEntry.New: IFlavorTextEntry;
begin
  Result := Self;
end;

{ TFlavorTextEntryList }

constructor TFlavorTextEntryList.Create(const Arr: TArrayFlavorTextEntry);
var
  ArrInt: TArrayIFlavorTextEntry;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TFlavorTextEntryList.Create(const Arr: TArrayIFlavorTextEntry);
begin
  FArr := Arr;
end;

function TFlavorTextEntryList.New: IFlavorTextEntryList;
begin
  Result := Self;
end;

function TFlavorTextEntryList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TFlavorTextEntryList.Item(const Index: Integer): IFlavorTextEntry;
begin
  Result := FArr[Index];
end;

{ TEffectEntry }

function TEffectEntry.Geteffect: string;
begin
  Result := Feffect;
end;

function TEffectEntry.New: IEffectEntry;
begin
  Result := Self;
end;

{ TEffectEntryList }

constructor TEffectEntryList.Create(const Arr: TArrayEffectEntry);
var
  ArrInt: TArrayIEffectEntry;
  I: Integer;
begin
  SetLength(ArrInt, Length(Arr));
  for I := 0 to High(Arr) do
  begin
    ArrInt[I] := Arr[I].New;
  end;
  Create(ArrInt);
end;

constructor TEffectEntryList.Create(const Arr: TArrayIEffectEntry);
begin
  FArr := Arr;
end;

function TEffectEntryList.New: IEffectEntryList;
begin
  Result := Self;
end;

function TEffectEntryList.Count: Integer;
begin
  Result := Length(FArr);
end;

function TEffectEntryList.Item(const Index: Integer): IEffectEntry;
begin
  Result := FArr[Index];
end;

end.
