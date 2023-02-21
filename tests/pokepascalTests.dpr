program pokepascalTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  Test.PokeAPI in 'Test.PokeAPI.pas',
  PokeAPI.Base in '..\src\PokeAPI.Base.pas',
  PokeAPI.Berry in '..\src\PokeAPI.Berry.pas',
  PokeAPI in '..\src\PokeAPI.pas',
  PokeAPI.Base.Int in '..\src\PokeAPI.Base.Int.pas',
  PokeAPI.Berry.Int in '..\src\PokeAPI.Berry.Int.pas',
  PokeAPI.Int in '..\src\PokeAPI.Int.pas',
  PokeAPI.BerryFirmness.Int in '..\src\PokeAPI.BerryFirmness.Int.pas',
  PokeAPI.BerryFirmness in '..\src\PokeAPI.BerryFirmness.pas',
  PokeAPI.BerryFlavor in '..\src\PokeAPI.BerryFlavor.pas',
  PokeAPI.BerryFlavor.Int in '..\src\PokeAPI.BerryFlavor.Int.pas',
  PokeAPI.ContestType.Int in '..\src\PokeAPI.ContestType.Int.pas',
  PokeAPI.ContestType in '..\src\PokeAPI.ContestType.pas',
  PokeAPI.ContestEffect.Int in '..\src\PokeAPI.ContestEffect.Int.pas',
  PokeAPI.ContestEffect in '..\src\PokeAPI.ContestEffect.pas';

{$R *.RES}

var
  I: string;
begin
  DUnitTestRunner.RunRegisteredTests;
  Readln(I);
end.

