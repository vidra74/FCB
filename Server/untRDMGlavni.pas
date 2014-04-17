unit untRDMGlavni;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Server_TLB, StdVcl;

type
  TApsy = class(TRemoteDataModule, IApsy)
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function PingServer(const vTko: WideString; vId: Integer; var vPoruka: WideString): Integer;
          safecall;
  public
    { Public declarations }
  end;

implementation

uses untServerPing;

{$R *.DFM}

class procedure TApsy.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TApsy.PingServer(const vTko: WideString; vId: Integer; var vPoruka: WideString): Integer;
begin

  if FrmServerPing.UpisiPing(vTko, vId, vPoruka) then
    vPoruka := 'Primljena poruka'
  else
    vPoruka := 'Imamo problem';
end;

initialization
  TComponentFactory.Create(ComServer, TApsy,
    Class_Apsy, ciMultiInstance, tmApartment);
end.
