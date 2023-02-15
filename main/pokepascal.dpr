program pokepascal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  PokeAPI in '..\src\PokeAPI.pas',
  PokeAPI.Berry in '..\src\PokeAPI.Berry.pas',
  PokeAPI.Base in '..\src\PokeAPI.Base.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
