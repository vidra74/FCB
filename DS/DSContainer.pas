unit DSContainer;

interface

uses
  SysUtils, Classes,
  DSTCPServerTransport,
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer, DSAuth,
  untLogger,
  DBCommonTypes, DBXCommon;

type
  TDSContainer = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSHTTPService1: TDSHTTPService;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DSServerConnect(DSConnectEventObject: TDSConnectEventObject);
    function DSServerTrace(TraceInfo: TDBXTraceInfo): CBRType;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DSHTTPService1Trace(Sender: TObject; AContext: TDSHTTPContext;
      ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
  private
    { Private declarations }
  public
    LogMessage : TLogger;
  end;

var
  DSServerContainer: TDSContainer;

implementation

uses Windows, DSMethods, Dialogs;

{$R *.dfm}

procedure TDSContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := DSMethods.TDSMethods;
end;

procedure TDSContainer.DSServerConnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  LogMessage.Text := ('Connect ' + DSConnectEventObject.ChannelInfo.Info);
end;

function TDSContainer.DSServerTrace(TraceInfo: TDBXTraceInfo): CBRType;
begin
  LogMessage.Text := ('Trace ' + TraceInfo.CustomCategory + ': ' + TraceInfo.Message);
  Result := cbrUSEDEF;
end;

procedure TDSContainer.DataModuleCreate(Sender: TObject);
begin
  // FrmDS.LogInfo := ('Data Module Created');
  DSHTTPService1.Active := true;
end;

procedure TDSContainer.DataModuleDestroy(Sender: TObject);
begin
  LogMessage.Text := ('Data Module Destroy');
end;

procedure TDSContainer.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin

  LogMessage.Text := ('DSAuthenticationManager1UserAuthenticate ' + User);
  valid := True;
end;

procedure TDSContainer.DSAuthenticationManager1UserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin

  LogMessage.Text := ('DSAuthenticationManager1UserAuthorize ' + EventObject.UserName);
  valid := True;
end;

procedure TDSContainer.DSHTTPService1Trace(Sender: TObject;
  AContext: TDSHTTPContext; ARequest: TDSHTTPRequest;
  AResponse: TDSHTTPResponse);
begin
  LogMessage.Text := ('HTTP ' + AContext.ToString + ' ' + ARequest.Document);
  LogMessage.Text := ('HTTP ' + AResponse.ResponseText);
end;

end.

