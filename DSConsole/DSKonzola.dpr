program DSKonzola;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  DSContainer in '..\DS\DSContainer.pas',
  untLogger in '..\DS\untLogger.pas',
  DSMethods in '..\DS\DSMethods.pas';

procedure RunDSServer;
var
  LModule: TDSContainer;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
  LLogger: TLogger;
begin
  Writeln(Format('Starting %s', [TDSContainer.ClassName]));
  LModule := TDSContainer.Create(nil);
  LLogger := Tlogger.Create('DSKonzola.log');
  LModule.LogMessage := LLogger;
  try
    LModule.DSServer.Start;
    try
      Writeln('Press ESC to stop the server');
      LHandle := GetStdHandle(STD_INPUT_HANDLE);
      while True do
      begin
        Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
        if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
          break;
      end;
    finally
      LModule.DSServer.Stop;
    end;
  finally
    LModule.Free;
    LLogger.Free;
  end;
end;

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.

