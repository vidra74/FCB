program klijent;

uses
  Forms,
  untPingMachine in 'untPingMachine.pas' {FrmPingMachine};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPingMachine, FrmPingMachine);
  Application.Run;
end.
