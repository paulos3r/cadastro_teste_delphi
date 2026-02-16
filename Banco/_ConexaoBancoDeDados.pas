unit _ConexaoBancoDeDados;

interface

uses
  System.SysUtils, System.Classes,vcl.Forms, ZAbstractConnection, ZConnection;

type
  TdmConexaoOracle = class(TDataModule)
  zConexao: TZConnection;
  procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Conectar;
  end;

var
  dmConexaoOracle: TdmConexaoOracle;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TdmConexaoOracle.DataModuleCreate(Sender: TObject);
var caminho_path_oci,senha, usuario, base, host:string;
begin
  caminho_path_oci:= IncludeTrailingPathDelimiter( ExtractFilePath( Application.ExeName ) ) +'lib\old\oci.dll';

  if not FileExists(caminho_path_oci) then
    raise Exception.Create('Oci.dll não foi encontrada no local: ' + caminho_path_oci);

  senha := GetEnvironmentVariable('DB_PASSWORD');
  if senha ='' then
    raise Exception.Create('Não foi definido nas variaveis de ambiente a senha');
  usuario :=  GetEnvironmentVariable('DB_USER');
  if usuario='' then
    raise Exception.Create('Não foi definido nas variaveis de ambiente o usuario');
  base :=  GetEnvironmentVariable('DB_DATABASE');
  if base='' then
    raise Exception.Create('Não foi definido nas variaveis de ambiente database');
  host := GetEnvironmentVariable('DB_HOST');
  if host='' then
    raise Exception.Create('Não foi definido nas variaveis de ambiente host');

  with dmConexaoOracle.zConexao do begin
    Connected:=false;
    LoginPrompt:=false;


    Protocol := 'oracle';
    Port:=1521;
    LibraryLocation:= caminho_path_oci;
    Database:= base;
    HostName:= host;
    User:= usuario;
    Password:= senha;
  end;

end;

procedure TdmConexaoOracle.Conectar;
begin
  if not zConexao.Connected  then
    zConexao.Connected:=true;

end;

end.
