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
    ServerGUID = '{D4980FB3-9756-4306-902E-1C0BC9C327F8}'
    Address = '127.0.0.1'
    Left = 48
    Top = 80
  end
end
