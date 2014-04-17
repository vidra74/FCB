program Server;

uses
  Forms,
  untServerPing in 'untServerPing.pas' {FrmServerPing},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDataModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  Server_TLB in 'Server_TLB.pas',
  untRDMGlavni in 'untRDMGlavni.pas' {Apsy: TRemoteDataModule} {Apsy: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmServerPing, FrmServerPing);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

