program Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Vivace.CLibs in '..\..\Sources\Library\Vivace.CLibs.pas',
  Vivace.Allegro in '..\..\Sources\Library\Vivace.Allegro.pas',
  Vivace.MemoryModule in '..\..\Sources\Library\Vivace.MemoryModule.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    al_init;
    writeln('time: ', al_get_time);


    writeln;
    write('Press ENTER to continue...');
    readln;

    writeln('time: ', al_get_time);
    al_uninstall_system;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
