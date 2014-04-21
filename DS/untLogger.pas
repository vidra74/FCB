unit untLogger;

interface

uses SysUtils;

type TLogger = class(TObject)
  private
    Logging: Boolean;
    LogName: String;

  public
    constructor Create(FileName:String);
    destructor Free;
    function CreateLogfile(FileName: String): Boolean;
    procedure WriteToLog(aLogMessage:String);

    property Text:String read LogName write WriteToLog;
end;

implementation

uses Dialogs;

{ TLogger }

constructor TLogger.Create(FileName:String);
begin
  inherited Create;
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  LogName := FileName;
  Logging := CreateLogfile(LogName);
end;

function TLogger.CreateLogfile(FileName: String): Boolean;
var
  Loger:TextFile;
begin
  try
    AssignFile(Loger, FileName);

    Rewrite(Loger);

    Append(Loger);

    WriteLn(Loger, 'Logfile created on ' + DateTimeToStr(Now));
    WriteLn(Loger, '');

    CloseFile(Loger);
    Result := true;
  except
    On E:Exception do begin
      Result := false;
      MessageDlg('LogFile: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

destructor TLogger.Free;
begin

  WriteToLog('Closing Logger');
end;

procedure TLogger.WriteToLog(aLogMessage: String);
var
  Loger : TextFile;
begin
  if not Logging then Exit;

  try

    // Assigns Filename to variable F
    AssignFile(Loger, LogName);
    // start appending text
    Append(Loger);
    //Write a new line with current date and message to the file
    WriteLn(Loger, DateTimeToStr(Now) + ': ' + aLogMessage);
    // Close file
    CloseFile(Loger)
  except
    On E:Exception do
      ;
  end;
end;


end.
