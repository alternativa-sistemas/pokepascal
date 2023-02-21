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
    procedure Setname(const Value: string);
    procedure Seturl(const Value: string);
  public
    function New: INameAndUrl;
  published
    property name: string read Getname write Setname;
    property url: string read Geturl write Seturl;
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

  TName = class(TInterfacedObject, IName)
  private
    FlanguageInt: INameAndUrl;
    Flanguage: TNameAndUrl;
    Fname: string;
    Fcolor: string;
    function Getlanguage: INameAndUrl;
    procedure Setlanguage(const Value: INameAndUrl);
    function Getname: string;
    procedure Setname(const Value: string);
    function Getcolor: string;
  public
    function New: IName;
  published
    property language: TNameAndUrl read Flanguage write Flanguage;
    property name: string read Getname write Setname;
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

  TListResponse = class(TInterfacedObject, IListResponse)
  private
    Fcount: Integer;
    Fnext: string;
    Fprevious: string;
    FresultsInt: INameAndUrlList;
    Fresults: TArrayNameAndUrl;
    procedure Setcount(const Value: Integer);
    procedure Setnext(const Value: string);
    procedure Setprevious(const Value: string);
    procedure Setresults(const Value: INameAndUrlList);
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    function Getresults: INameAndUrlList;
  public
    function New: IListResponse;
  published
    property count: Integer read Getcount write Setcount;
    property next: string read Getnext write Setnext;
    property previous: string read Getprevious write Setprevious;
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

procedure TNameAndUrl.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TNameAndUrl.Seturl(const Value: string);
begin
  Furl := Value;
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

procedure TListResponse.Setcount(const Value: Integer);
begin
  Fcount := Value;
end;

procedure TListResponse.Setnext(const Value: string);
begin
  Fnext := Value;
end;

procedure TListResponse.Setprevious(const Value: string);
begin
  Fprevious := Value;
end;

procedure TListResponse.Setresults(const Value: INameAndUrlList);
begin
  FresultsInt := Value;
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

procedure TName.Setlanguage(const Value: INameAndUrl);
begin
  FlanguageInt := Value;
end;

procedure TName.Setname(const Value: string);
begin
  Fname := Value;
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

end.
