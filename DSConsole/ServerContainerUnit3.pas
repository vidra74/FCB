unit ServerContainerUnit3;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSAuth; 

type
  TServerContainer3 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

implementation

uses Windows, ServerMethodsUnit3;

{$R *.dfm}

procedure TServerContainer3.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit3.TServerMethods3;
end;

procedure TServerContainer3.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
                                                 
                                                                                       
  valid := True;
end;

procedure RunDSServer;
var
  LModule: TServerContainer3;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
begin
  Writeln(Format('Starting %s', [TServerContainer3.ClassName]));
  LModule := TServerContainer3.Create(nil);
  try
    LModule.DSServer1.Start;
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
      LModule.DSServer1.Stop;
    end;
  finally
    LModule.Free;
  end;
end;

end.

