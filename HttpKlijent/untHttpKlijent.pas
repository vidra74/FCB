unit untHttpKlijent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBXDataSnap, DBXCommon, DSHTTPLayer, DB, SqlExpr;

type
  TFrmHttpKlijent = class(TForm)
    btnServer: TButton;
    btnClose: TButton;
    btnLog: TButton;
    lblPorukaServer: TLabel;
    edtTekst: TEdit;
    Connection: TSQLConnection;
    procedure btnCloseClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHttpKlijent: TFrmHttpKlijent;

implementation

{$R *.dfm}

uses ShellApi,
      untHttpMetode;

procedure TFrmHttpKlijent.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHttpKlijent.btnLogClick(Sender: TObject);
var
  filename, parameters: String;
begin
  filename := 'D:\Program Files (x86)\Notepad++\Notepad++.exe';
  parameters := 'D:\Delphi_XE_Projekti\DataSnap_TcpIp\DS\Debug\Win32\DSForma.log';
  ShellExecute(handle,'open',PChar(filename), PChar(parameters),'',SW_SHOWNORMAL);
end;

procedure TFrmHttpKlijent.btnServerClick(Sender: TObject);
var
  Server: TDSMethodsClient;
begin

  Server := TDSMethodsClient.Create(Connection.DBXConnection);
  try
    lblPorukaServer.Caption := Server.ReverseString(edtTekst.Text);
  finally
    FreeAndNil(Server);
  end;

end;

end.
