program DSForma;

uses
  Forms,
  SysUtils,
  DSForm in 'DSForm.pas' {FrmDS},
  DSMethods in 'DSMethods.pas' {ServerMethods2: TDSServerModule},
  DSContainer in 'DSContainer.pas' {ServerContainer2: TDataModule},
  untLogger in 'untLogger.pas';

{$R *.res}

var
  Logger: TLogger;

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Logger := TLogger.Create(ChangeFileExt(Application.Exename, '.log'));
  Application.CreateForm(TFrmDS, FrmDS);
  FrmDS.LogMessage := Logger;
  Application.CreateForm(TDSContainer, DSServerContainer);
  DSServerContainer.LogMessage := Logger;
  Application.Run;
end.

