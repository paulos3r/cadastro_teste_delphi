unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.MaskUtils,
  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  System.Win.TaskbarCore, Vcl.Taskbar, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls,System.RegularExpressions, Winapi.ShlObj, StrUtils ;

type
  TFormCliente = class(TForm)
    plBotoesDeAcao: TPanel;
    plPrincipal: TPanel;
    sbGravar: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbPesquisar: TSpeedButton;
    sbFechar: TSpeedButton;
    tsPrincipal: TTabSheet;
    pcCliente: TPageControl;
    tsEndereco: TTabSheet;
    leCodigo: TLabeledEdit;
    leNome: TLabeledEdit;
    cbAtivo: TCheckBox;
    leDataCadastro: TLabeledEdit;
    leTelefone: TLabeledEdit;
    leEmail: TLabeledEdit;
    leLimiteCredito: TLabeledEdit;
    leFormaPagamentoPadrao: TLabeledEdit;
    leCPF: TLabeledEdit;
    leDataNascimento: TLabeledEdit;
    leEndereco: TLabeledEdit;
    leBairro: TLabeledEdit;
    leCidade: TLabeledEdit;
    leUf: TLabeledEdit;
    leCep: TLabeledEdit;
    rgTipoCliente: TRadioGroup;
    rbFisica: TRadioButton;
    rbJuridica: TRadioButton;
    plBuscarPagamentoPadrao: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure rbFisicaClick(Sender: TObject);
    procedure rbJuridicaClick(Sender: TObject);
    procedure leDataNascimentoExit(Sender: TObject);
    procedure leEmailExit(Sender: TObject);
    procedure sbPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Biblioteca( Value: Boolean);
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

uses _Cliente,PesquisarClientes;

{$R *.dfm}

procedure TFormCliente.FormCreate(Sender: TObject);
begin
  Biblioteca(false);
end;

procedure TFormCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormCliente.FormShow(Sender: TObject);
begin
  if leCodigo.CanFocus then
    leCodigo.SetFocus;
end;

procedure TFormCliente.leCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var cliente: TCliente;
codigo:Integer;
mascara_telefone,mascara_cpf_cnpj:string;
begin

  if Key = VK_RETURN then begin
    Key:=0;
    Biblioteca(true);
    leDataCadastro.Enabled:=false;
    leNome.SetFocus;

    if Trim(leCodigo.Text) = '' then  begin
      leDataCadastro.Text:= DateToStr(now);
      leCPF.EditMask:='000.000.000-00;0;_';
      leTelefone.EditMask:='(00)00000-0000;0;_';
      leCep.EditMask:= '00000-000;1;_';

      sbExcluir.Enabled:=false;
      Exit;
    end;
    if not TryStrToInt( leCodigo.Text, codigo ) then begin
      ShowMessage('Código inválido.');
      Exit;
    end;
    cliente := TCliente.Create;

    try
      cliente := cliente.BuscarPorId(codigo);

      if Assigned(Cliente) then begin
        leNome.Text := cliente.nome;
        cbAtivo.Checked := cliente.status='ATIVO';

        rbFisica.Checked :=Length(cliente.cpf_cnpj)=14;

        rbJuridica.Checked := Length(cliente.cpf_cnpj)=18;

        leDataNascimento.Text := DateToStr(cliente.data_nascimento);
        leDataCadastro.Text := DateToStr(cliente.data_cadastro);

        leTelefone.Text := cliente.telefone;
        leEmail.Text:=cliente.email;
        leLimiteCredito.Text:= FloatToStr(cliente.limite);
        leFormaPagamentoPadrao.Text:= 'PADRÃO - IMPLEMENTAR';

        leEndereco.Text := cliente.endereco;
        leBairro.Text:= cliente.bairro;
        leCidade.Text:= cliente.cidade;
        leUf.Text:= cliente.uf;
        leCep.Text:= cliente.cep
      end
      else begin
        ShowMessage('Cliente não encontrado.');
        Biblioteca(false);
        leCodigo.SetFocus;
      end;
    finally
      cliente.Free;
    end;
  end;
end;

procedure TFormCliente.leDataNascimentoExit(Sender: TObject);
var data:TDateTime;
begin
  if not TryStrToDate(leDataNascimento.Text,data) then begin
    ShowMessage('Data Inválida');
  end;
end;

procedure TFormCliente.leEmailExit(Sender: TObject);
const emailregex = '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$';
begin
  if not TRegEx.IsMatch(leEmail.Text,emailregex,[roIgnoreCase]) then begin
    ShowMessage('Email invalido.');

    if leEmail.CanFocus then
    leEmail.SetFocus;
  end;
end;

procedure TFormCliente.rbFisicaClick(Sender: TObject);
begin
  leCPF.EditMask:='000.000.000-00;0;_';
end;

procedure TFormCliente.rbJuridicaClick(Sender: TObject);
begin
  leCPF.EditMask:='00.000.000/0000-00;0;_';
end;

procedure TFormCliente.Biblioteca(Value:Boolean);
var componente: TComponent;
i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    componente := Components[i];

    if componente is TLabeledEdit then begin
      with TLabeledEdit(componente) do begin
        if Value<>true then Clear;
        Enabled:= Value;
      end;
    end
    else if componente is TEdit then begin
      with TEdit(componente) do begin
        if Value<>true then Clear;
        Enabled:=Value
      end;
    end
    else if componente is TRadioButton then begin
      with TRadioGroup(componente) do
        Enabled:=Value;
    end
    else if componente is TSpeedButton then begin
      with TSpeedButton(componente) do
        Enabled:=Value;
    end
    else if componente is TCheckBox then
      TCheckBox(componente).Enabled:=Value;
  end;

  pcCliente.ActivePageIndex:=0;

  leCodigo.Enabled:=not Value;
  sbPesquisar.Enabled:=not Value;
  sbFechar.Enabled:=not Value;
end;

procedure TFormCliente.sbCancelarClick(Sender: TObject);
begin
  Biblioteca(false);
end;

procedure TFormCliente.sbExcluirClick(Sender: TObject);
var cliente:TCliente;
  id:Integer;
begin
  id:=0;
  if not TryStrToInt(leCodigo.Text, id) then begin
    MessageDlg('Erro ao excluir o Cliente: ' + id.ToString,
                TMsgDlgType.mtError, [mbOk], 0);
    exit;
  end;

  if id>0 then begin
    if MessageDlg('Deseja excluir esse registro?', TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes then begin
      cliente := TCliente.Create;
      cliente.codigo:= id;
      cliente.Excluir;
      ShowMessage('Registro foi deletado');
      Biblioteca(false);
    end
    else
      ShowMessage('Exclusão cancelada');
      exit;
  end;

end;

procedure TFormCliente.sbFecharClick(Sender: TObject);
begin
  Close;
end;
procedure TFormCliente.sbPesquisarClick(Sender: TObject);
var pesquisar:TFormPesquisarClientes;
begin
  pesquisar := TFormPesquisarClientes.Create(nil);
  try
    pesquisar.ShowModal;
  finally
    pesquisar.Release;
  end;

end;


procedure TFormCliente.sbGravarClick(Sender: TObject);
var cliente: TCliente;
codigo:Integer;
existe:Boolean;

begin

  leDataCadastro.Enabled:=false;

  if not TryStrToInt( leCodigo.Text, codigo ) then
    codigo:=0;


  cliente := TCliente.Create;
  try
      cliente.codigo := codigo;
      cliente.nome := leNome.Text;
      cliente.data_nascimento := StrToDate(leDataNascimento.Text);
      cliente.status := ifthen( cbAtivo.Checked=true, 'ATIVO', 'INATIVO');
      cliente.cpf_cnpj := leCPF.Text;

      cliente.telefone := leTelefone.Text;
      cliente.email := leEmail.Text;
      cliente.data_cadastro := StrToDate(leDataCadastro.Text);
      cliente.limite := StrToFloat(leLimiteCredito.Text);
      cliente.forma_pagamento := leFormaPagamentoPadrao.Text;

      cliente.endereco := leEndereco.Text;
      cliente.bairro := leBairro.Text;
      cliente.cidade := leCidade.Text;
      cliente.uf := leUf.Text;
      cliente.cep := leCep.Text;

    if codigo>0 then begin
      try
        cliente.Atualizar(codigo);
        ShowMessage('Salvo com sucesso!')
      except
        on E: Exception do begin
          MessageDlg('Erro ao gravar a informações' + sLineBreak +
          'Detalhe: ' + E.Message, TMsgDlgType.mtError, [mbOk], 0);
        end;
      end;
    end
    else begin
      try
        cliente.Cadastrar;
        ShowMessage('Salvo com sucesso!')
      except
        on E: Exception do begin
          MessageDlg('Erro ao gravar a informações' + sLineBreak +
          'Detalhe: ' + E.Message, TMsgDlgType.mtError, [mbOk], 0);
        end;
      end;
    end;
  finally
    cliente.Free;
    Biblioteca(false);
  end;
end;
end.
