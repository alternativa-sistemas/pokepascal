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
  PokeAPI.Int in '..\src\PokeAPI.Int.pas';

{$R *.RES}

var
  I: string;
begin
  DUnitTestRunner.RunRegisteredTests;
  Readln(I);
end.

