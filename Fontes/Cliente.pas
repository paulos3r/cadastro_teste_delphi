unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.MaskUtils,
  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  System.Win.TaskbarCore, Vcl.Taskbar, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls;

type
  TFormCliente = class(TForm)
    plBotoesDeAcao: TPanel;
    plPrincipal: TPanel;
    sbSalvar: TSpeedButton;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Biblioteca( Value: Boolean);
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

uses _Cliente;

{$R *.dfm}

{$REGION '___EVENTOS___'}

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

    if Trim(leCodigo.Text) = '' then  begin
      leDataCadastro.Text:= DateToStr(now);
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
        cbAtivo.Checked := cliente.status = 'ATIVO';
        // MASCARA PARA O CNPJ E CPF
        if Length(cliente.cpf_cnpj)=11 then begin
          mascara_cpf_cnpj:='000.000.000-00;0;_';
          leCPF.EditLabel.Caption:='CPF';
        end
        else if Length(cliente.cpf_cnpj)=14 then begin
          mascara_cpf_cnpj:='00.000.000/0000-00;0;_';
          leCPF.EditLabel.Caption:='CNPJ';
        end
        else
          mascara_cpf_cnpj:='';
        leCPF.EditMask := mascara_cpf_cnpj;
        leCPF.Text := cliente.cpf_cnpj;

        leDataNascimento.Text := DateToStr(cliente.data_nascimento);
        leDataCadastro.Text := DateToStr(cliente.data_cadastro);
            // MASCARA PARA O TELEFONE
        if Length(cliente.telefone) = 11 then
          mascara_telefone := '(00)00000-0000;0;_'
        else if  Length(cliente.telefone) = 10 then
          mascara_telefone := '(00)0000-0000;0;_'
        else
          mascara_telefone:='';
        leTelefone.EditMask := mascara_telefone;
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
      else
        ShowMessage('Cliente não encontrado.');
    finally
      cliente.Free;
    end;

  end;
end;

{$ENDREGION}


{$REGION '___Procedures___'}


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
{$ENDREGION}


{$REGION '___Botões___'}


procedure TFormCliente.sbCancelarClick(Sender: TObject);
begin
  Biblioteca(false);
end;

procedure TFormCliente.sbExcluirClick(Sender: TObject);
var cliente:TCliente;
  id:Integer;
begin
  try
    id:= StrToInt( leCodigo.Text );
  except on E:Exception do
    MessageDlg('Ocorreu um erro ao excluir esse Cliente favor verificar se possui um Identificador',
                TMsgDlgType.mtError ,[mbOk],0);
  end;


  if id>0 then begin
    if MessageDlg( 'Deseja excluir esse registro?',TMsgDlgType.mtConfirmation,mbYesNo,0) = mrYes then begin
      cliente := TCliente.Create;
      cliente.Excluir;
      ShowMessage('Registro foi deletado');
      Biblioteca(false);
    end
    else
      ShowMessage('Exclusão cancelada');
  end;

end;

procedure TFormCliente.sbFecharClick(Sender: TObject);
begin
  Close;
end;

{$ENDREGION}

end.
