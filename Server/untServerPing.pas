unit untServerPing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFrmServerPing = class(TForm)
    StringGrid1: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    function UpisiPing(Tko: WideString; Id: Integer; Poruka: WideString): Boolean;
  end;

var
  FrmServerPing: TFrmServerPing;

implementation

{$R *.dfm}

uses DateUtils;

{ TFrmApServer }

function TFrmServerPing.UpisiPing(Tko: WideString; Id: Integer;
  Poruka: WideString): Boolean;
begin
  StringGrid1.RowCount := StringGrid1.RowCount + 1;

  StringGrid1.Cells[1, StringGrid1.RowCount] := Tko;
  StringGrid1.Cells[2, StringGrid1.RowCount] := IntToStr(Id);
  StringGrid1.Cells[3, StringGrid1.RowCount] := Poruka;
  StringGrid1.Cells[4, StringGrid1.RowCount] := DateToStr(Now);


  Result := true;
end;

end.

