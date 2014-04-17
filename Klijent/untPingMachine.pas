unit untPingMachine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, MConnect, SConnect;

type
  TFrmPingMachine = class(TForm)
    btnServer: TButton;
    lblTekst: TLabel;
    sckVeza: TSocketConnection;
    procedure btnServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPingMachine: TFrmPingMachine;

implementation

{$R *.dfm}

procedure TFrmPingMachine.btnServerClick(Sender: TObject);
var
  Val : Integer;
begin
  ShowMessage('Pozivam server');
  Val := sckVeza.AppServer.PingServer('frano', 1, 'Pozivam server');
  lblTekst.Caption := 'Poruka sa servera: ' + IntToStr(Val);
end;

end.
