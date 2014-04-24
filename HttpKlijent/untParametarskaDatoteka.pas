unit untParametarskaDatoteka;

interface

uses Classes, Windows, SysUtils, Registry, StrUtils, DBTables, INIFiles;

type

  TParameterFile = class(TPersistent)
  private
    m_strFileName:  String;
    m_fileMenuMat:  TextFile;
    m_iniMenuMat: TIniFile;
    m_strTekstReader: String;
    procedure ReadTxt;
    procedure OpenTxt;
    procedure NewTxt;
    procedure SetTekstReader(strTekstReader:String);
    function GetTekstReader():String;
  public
    constructor Create(strFileName:String = 'Parameter.txt');
    destructor Destroy;
    property TekstReader:String read GetTekstReader write SetTekstReader;
  end;


implementation

uses Dialogs;



// TMenuMatFile methods

constructor TParameterFile.Create(strFileName:String = 'Parameter.txt');
begin
  inherited Create;
  m_strFileName           := strFileName;
  m_iniMenuMat            := TIniFile.Create('D:\' + m_strFileName);

  if not FileExists('D:\' + m_strFileName) then
    NewTxt
  else
    ReadTxt;
end;

destructor TParameterFile.Destroy;
begin
  inherited Destroy;
  m_iniMenuMat.Free;
end;

procedure TParameterFile.NewTxt;
begin

  try
    if FileExists('C:\iti\' + m_strFileName) then
      DeleteFile('C:\iti\' + m_strFileName);
  finally
    try
      m_iniMenuMat.WriteString('Log Datoteka', 'Program za èitanje', m_strTekstReader);
    except
      On E:Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

procedure TParameterFile.OpenTxt;
begin
  try
    m_iniMenuMat.WriteString('Log Datoteka', 'Program za èitanje', m_strTekstReader);

  except
    On E:Exception do
      ShowMessage(E.Message);

  end;

end;

procedure TParameterFile.ReadTxt;
var
  strText:String;
begin
  strText := '';
  if m_iniMenuMat.SectionExists('Log Datoteka') then begin

    m_strTekstReader         := m_iniMenuMat.ReadString('Log Datoteka', 'Program za èitanje', '');

    if not m_iniMenuMat.ValueExists('Log Datoteka', 'Program za èitanje') then
      m_iniMenuMat.WriteString('Log Datoteka', 'Program za èitanje', m_strTekstReader);

  end;
end;

procedure TParameterFile.SetTekstReader(strTekstReader: String);
begin
  m_strTekstReader := strTekstReader;
  OpenTxt;
end;

function TParameterFile.GetTekstReader: String;
begin
  Result := m_strTekstReader;
end;


end.
