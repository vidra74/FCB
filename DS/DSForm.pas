unit DSForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls,
  untLogger;

type
  TFrmDS = class(TForm)
    StringGrid1: TStringGrid;
    btnPing: TButton;
    procedure btnPingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Logging: Boolean;
    LogName: String;
  public
    { Public declarations }
    LogMessage: TLogger;
    function UpisiPing(Tko: WideString; Id: Integer; Poruka: WideString): Boolean;
  end;

var
  FrmDS: TFrmDS;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFrmDS.btnPingClick(Sender: TObject);
begin
  UpisiPing('FrmDS', 1, 'Button Ping Clicked');
end;


procedure TFrmDS.FormShow(Sender: TObject);
begin
  StringGrid1.RowCount := 1;

  StringGrid1.Cells[1, 0] := 'Caller';
  StringGrid1.Cells[2, 0] := 'ID';
  StringGrid1.Cells[3, 0] := 'Poruka';
  StringGrid1.Cells[4, 0] := 'Vrijeme';

  StringGrid1.ColWidths[0] := 75;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 50;
  StringGrid1.ColWidths[3] := 200;
  StringGrid1.ColWidths[4] := 150;


end;

function TFrmDS.UpisiPing(Tko: WideString; Id: Integer;
  Poruka: WideString): Boolean;
begin
  StringGrid1.RowCount := StringGrid1.RowCount + 1;

  StringGrid1.Cells[1, StringGrid1.RowCount - 1] := Tko;
  StringGrid1.Cells[2, StringGrid1.RowCount - 1] := IntToStr(Id);
  StringGrid1.Cells[3, StringGrid1.RowCount - 1] := Poruka;
  StringGrid1.Cells[4, StringGrid1.RowCount - 1] := DateTimeToStr(Now);

  LogMessage.Text := (Tko + ': ' + Poruka);
  Result := true;
end;

end.

