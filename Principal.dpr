program Principal;

uses
  Vcl.Forms,
  _Principal in '_Principal.pas' {FormPrincipal},
  _ConexaoBancoDeDados in 'Banco\_ConexaoBancoDeDados.pas' {dmConexaoOracle: TDataModule},
  _Cliente in 'Banco\_Cliente.pas',
  Cliente in 'Fontes\Cliente.pas' {FormCliente},
  PesquisarClientes in 'Fontes\PesquisarClientes.pas' {FormPesquisarClientes},
  Agendamento in 'Fontes\Agendamento.pas' {FormAgendamento},
  RelacaoClientesAgendamentos in 'Fontes\RelacaoClientesAgendamentos.pas' {formRelacaoClientesAgendamentos},
  _Agendamento in 'Banco\_Agendamento.pas',
  _Biblioteca in 'Banco\_Biblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TdmConexaoOracle, dmConexaoOracle);
  Application.CreateForm(TFormPesquisarClientes, FormPesquisarClientes);
  Application.CreateForm(TFormAgendamento, FormAgendamento);
  Application.CreateForm(TformRelacaoClientesAgendamentos, formRelacaoClientesAgendamentos);
  dmConexaoOracle.Conectar;

  Application.Run;
end.
