unit untPingMachine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, MConnect, SConnect, DBXDataSnap, DBXCommon,
  SqlExpr, FMTBcd;

type
  TFrmPingMachine = class(TForm)
    btnServer: TButton;
    lblTekst: TLabel;
    TcpConnection: TSQLConnection;
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

uses untServerMethodsClient;

procedure TFrmPingMachine.btnServerClick(Sender: TObject);
var
  Val : Integer;
  Server: TDSMethodsClient;
begin
  // Val := sckVeza.AppServer.PingServer('frano', 1, 'Pozivam server');
  // TcpConnection.Connected := True;
  Server := TDSMethodsClient.Create(TcpConnection.DBXConnection);
  try

    lblTekst.Caption := 'Server vrijeme : ' + Server.ReverseString('Server vrijeme : ');
  finally
    // TcpConnection.Connected := False;
    Server.Free;
  end;
end;

end.
