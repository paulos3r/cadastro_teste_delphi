program Principal;

uses
  Vcl.Forms,
  _Principal in '_Principal.pas' {FormPrincipal},
  _ConexaoBancoDeDados in 'Banco\_ConexaoBancoDeDados.pas' {dmConexaoOracle: TDataModule},
  _Cliente in 'Banco\_Cliente.pas',
  Cliente in 'Fontes\Cliente.pas' {FormCliente},
  PesquisarClientes in 'Fontes\PesquisarClientes.pas' {FormPesquisarClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TdmConexaoOracle, dmConexaoOracle);
  Application.CreateForm(TFormPesquisarClientes, FormPesquisarClientes);
  dmConexaoOracle.Conectar;

  Application.Run;
end.
