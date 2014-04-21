object FrmPingMachine: TFrmPingMachine
  Left = 0
  Top = 0
  Caption = 'Ping Machine'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTekst: TLabel
    Left = 144
    Top = 29
    Width = 26
    Height = 13
    Caption = 'Tekst'
  end
  object btnServer: TButton
    Left = 40
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Server'
    TabOrder = 0
    OnClick = btnServerClick
  end
  object TcpConnection: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=21112'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'User_Name=Klijent')
    Connected = True
    Left = 232
    Top = 24
    UniqueId = '{9778A128-2C32-456D-9240-D3F87696FE9C}'
  end
end
