unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
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
  private
    { Private declarations }
    procedure Biblioteca( Value: Boolean);
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

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
procedure TFormCliente.leCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     Biblioteca(true);
     Key:=0;
  end;
  leDataCadastro.Enabled:=false;
  leDataCadastro.Text:= DateToStr(now);
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
        Clear;
        Enabled:= Value;
      end;
    end
    else if componente is TEdit then begin
      with TEdit(componente) do begin
        Clear;
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

procedure TFormCliente.sbFecharClick(Sender: TObject);
begin
  Close;
end;

{$ENDREGION}

end.
