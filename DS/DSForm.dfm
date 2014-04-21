object FrmDS: TFrmDS
  Left = 0
  Top = 0
  Caption = 'DS - Forma Data Snap servera'
  ClientHeight = 300
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 300
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object btnPing: TButton
    Left = 641
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Ping'
    TabOrder = 1
    OnClick = btnPingClick
  end
end
