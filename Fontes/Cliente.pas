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
    LabeledEdit2: TLabeledEdit;
    cbAtivo: TCheckBox;
    MaskEdit1: TMaskEdit;
    DateTimePicker1: TDateTimePicker;
    lbDataNascimento: TLabel;
    lbCpfCnpj: TLabel;
    leDataCadastro: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

procedure TFormCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
