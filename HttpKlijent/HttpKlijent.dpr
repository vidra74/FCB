program HttpKlijent;

uses
  Forms,
  untHttpKlijent in 'untHttpKlijent.pas' {FrmHttpKlijent},
  untHttpMetode in 'untHttpMetode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHttpKlijent, FrmHttpKlijent);
  Application.Run;
end.
