unit DSServiceContainer;

interface

uses
  SysUtils, Classes, 
  SvcMgr, 
  DSTCPServerTransport,
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer, DSAuth; 

type
  TDSServiceContainer = class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSHTTPService1: TDSHTTPService;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  ServiceContainerDS: TDSServiceContainer;

implementation

uses Windows, DSMethods;

{$R *.dfm}

procedure TDSServiceContainer.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := DSMethods.TDSMethods;
end;

procedure TDSServiceContainer.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
                                                 
                                                                                       
  valid := True;
end;

procedure TDSServiceContainer.DSAuthenticationManager1UserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
                                                
                                                                                             
                                                                            
                                    
  valid := True;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServiceContainerDS.Controller(CtrlCode);
end;

function TDSServiceContainer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TDSServiceContainer.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TDSServiceContainer.DoInterrogate;
begin
  inherited;
end;

function TDSServiceContainer.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TDSServiceContainer.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TDSServiceContainer.ServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;
end.

