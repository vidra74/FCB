program klijent;

uses
  Forms,
  untPingMachine in 'untPingMachine.pas' {FrmPingMachine},
  untServerMethodsClient in 'untServerMethodsClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPingMachine, FrmPingMachine);
  Application.Run;
end.
