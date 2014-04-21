unit DSMethods;

interface

uses
  SysUtils, Classes, DSServer, Forms,
  untLogger;

type
  TDSMethods = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LogMessage : TLogger;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{$R *.dfm}

uses StrUtils;

procedure TDSMethods.DSServerModuleCreate(Sender: TObject);
begin
  // LogMessage.Create(ChangeFileExt(Application.Exename, '.dat'));
end;

procedure TDSMethods.DSServerModuleDestroy(Sender: TObject);
begin
  // FreeAndNil(LogMessage);
end;

function TDSMethods.EchoString(Value: string): string;
begin
  Result := Value;
  // LogMessage.Text := 'Echo String ' + Value;
end;

function TDSMethods.ReverseString(Value: string): string;
begin
  Result := StrUtils.ReverseString(Value);
  // LogMessage.Text := 'ReverseString ' + Value;
end;

end.

