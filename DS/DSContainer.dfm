object DSContainer: TDSContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 254
  Width = 307
  object DSServer: TDSServer
    OnConnect = DSServerConnect
    AutoStart = True
    HideDSAdmin = False
    OnTrace = DSServerTrace
    Left = 96
    Top = 19
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 21112
    PoolSize = 0
    Server = DSServer
    BufferKBSize = 32
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    Left = 96
    Top = 73
  end
  object DSHTTPService1: TDSHTTPService
    DSContext = 'datasnap/'
    RESTContext = 'rest/'
    CacheContext = 'cache/'
    Trace = DSHTTPService1Trace
    Server = DSServer
    DSHostname = '127.0.0.1'
    DSPort = 211
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    CredentialsPassThrough = False
    SessionTimeout = 1200000
    HttpPort = 4048
    Active = False
    Left = 96
    Top = 135
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    OnUserAuthorize = DSAuthenticationManager1UserAuthorize
    Roles = <>
    Left = 96
    Top = 197
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    LifeCycle = 'Session'
    Left = 200
    Top = 11
  end
end
