object FrmHttpKlijent: TFrmHttpKlijent
  Left = 0
  Top = 0
  Caption = 'Http klijent data snap servera'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPorukaServer: TLabel
    Left = 337
    Top = 37
    Width = 94
    Height = 13
    Caption = 'Rezultat sa servera'
  end
  object btnServer: TButton
    Left = 32
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Server'
    TabOrder = 0
    OnClick = btnServerClick
  end
  object btnClose: TButton
    Left = 528
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Zatvori'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnLog: TButton
    Left = 447
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Pogledaj Log'
    TabOrder = 2
    OnClick = btnLogClick
  end
  object edtTekst: TEdit
    Left = 113
    Top = 34
    Width = 176
    Height = 21
    TabOrder = 3
    Text = 'Unesi tekst za poslati na server'
  end
  object Connection: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=4048'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'User_Name=HttpKlijent'
      'DSAuthenticationPassword=Klijent'
      'DSAuthenticationUser=Http')
    Left = 96
    Top = 80
    UniqueId = '{063DBF86-3B1E-4696-A4E4-99530342AC56}'
  end
  object OpenDialog: TOpenDialog
    Left = 144
    Top = 80
  end
end
