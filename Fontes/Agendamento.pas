unit Agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.StdCtrls;

type
  TFormAgendamento = class(TForm)
    plAgendamento: TPanel;
    plAgendamentoBotoes: TPanel;
    sbBuscar: TSpeedButton;
    sbSair: TSpeedButton;
    sbCancelar: TSpeedButton;
    leAgendamentoCodigo: TLabeledEdit;
    leAgendamentoDescricao: TLabeledEdit;
    leAgendamentoCodigoCliente: TLabeledEdit;
    leAgendamentoClienteNome: TLabeledEdit;
    leAgendamentoCodigoAtendente: TLabeledEdit;
    leAgendamentoAtendenteNome: TLabeledEdit;
    memoObservacao: TMemo;
    lbObservacao: TLabel;
    meDataAgendamento: TMaskEdit;
    lbDataAgendamento: TLabel;
    sbGravar: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgendamento: TFormAgendamento;

implementation

uses _Agendamento;

{$R *.dfm}

procedure TFormAgendamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var codigo: Integer;
agendamento:TAgendamento;
begin
if Key = VK_RETURN then begin
    Key:=0;

    if Trim(leAgendamentoCodigo.Text) = '' then  begin
      meDataAgendamento.Text:= DateToStr(now);

      Exit;
    end;
    if not TryStrToInt( leAgendamentoCodigo.Text, codigo ) then begin
      ShowMessage('Código inválido.');
      Exit;
    end;

    agendamento := TAgendamento.Create;

    try
      //agendamento := agendamento.BuscarPorId(codigo);

      if Assigned(agendamento) then begin
        leAgendamentoDescricao.Text := 'TESTE';
        leAgendamentoClienteNome.Text:='TESTE';
      end
      else begin
        ShowMessage('Cliente não encontrado.');
        //Biblioteca(false);
        leAgendamentoCodigo.SetFocus;
      end;
    finally
      agendamento.Free;
    end;
  end;
end;

procedure TFormAgendamento.sbGravarClick(Sender: TObject);
var agendamento: TAgendamento;
codigo:Integer;
begin

  if not TryStrToInt( leAgendamentoCodigo.Text, codigo ) then
    codigo:=0;

  agendamento := TAgendamento.Create;

  agendamento.Cadastrar(
    codigo,
    StrToInt( leAgendamentoCodigoCliente.Text  ),
    StrToInt( leAgendamentoCodigoAtendente.Text ),
    Date,
    memoObservacao.Text
  );


end;

end.
