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
  object sckVeza: TSocketConnection
    ServerGUID = '{9BFFC120-AC42-4069-8A16-21BA0DA5B59F}'
    Address = '127.0.0.1'
    Left = 48
    Top = 80
  end
end
