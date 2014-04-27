unit untHttpKlijent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBXDataSnap, DBXCommon, DSHTTPLayer, DB, SqlExpr,
      untParametarskaDatoteka;

type
  TFrmHttpKlijent = class(TForm)
    btnServer: TButton;
    btnClose: TButton;
    btnLog: TButton;
    lblPorukaServer: TLabel;
    edtTekst: TEdit;
    Connection: TSQLConnection;
    OpenDialog: TOpenDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnServerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Parametri: TParameterFile;
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
begin
  OpenDialog.DefaultExt := '*.log';
  OpenDialog.InitialDir := GetCurrentDir();
  OpenDialog.Execute();
  ShellExecute(handle,'open',PChar(Parametri.TekstReader), PChar(OpenDialog.FileName),'',SW_SHOWNORMAL);
end;

procedure TFrmHttpKlijent.btnServerClick(Sender: TObject);
var
  Server: TDSMethodsClient;
begin
  Connection.Connected := True;
  Server := TDSMethodsClient.Create(Connection.DBXConnection);
  try
    lblPorukaServer.Caption := Server.ReverseString(edtTekst.Text);
  finally
    FreeAndNil(Server);
  end;

end;

procedure TFrmHttpKlijent.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Parametri);
end;

procedure TFrmHttpKlijent.FormShow(Sender: TObject);
begin
  Parametri := TParameterFile.Create();
end;

end.
