unit PokeAPI.Base;

interface

type
  IListResponse = interface
    procedure Setcount(const Value: Integer);
    procedure Setnext(const Value: string);
    procedure Setprevious(const Value: string);
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
    property count: Integer read Getcount write Setcount;
    property next: string read Getnext write Setnext;
    property previous: string read Getprevious write Setprevious;
  end;

  TListResponse = class(TInterfacedObject, IListResponse)
  private
    Fcount: Integer;
    Fnext: string;
    Fprevious: string;
    procedure Setcount(const Value: Integer);
    procedure Setnext(const Value: string);
    procedure Setprevious(const Value: string);
    function Getcount: Integer;
    function Getnext: string;
    function Getprevious: string;
  public
    property count: Integer read Getcount write Setcount;
    property next: string read Getnext write Setnext;
    property previous: string read Getprevious write Setprevious;
  end;

implementation

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

end.
