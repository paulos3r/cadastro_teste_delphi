unit PesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Grids;

type
  TFormPesquisarClientes = class(TForm)
    plTop: TPanel;
    plfooter: TPanel;
    leBuscar: TLabeledEdit;
    cbBuscarPor: TComboBox;
    lbBuscarPor: TLabel;
    sgBuscarPor: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure leBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbBuscarPorSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisarClientes: TFormPesquisarClientes;

implementation

uses _Cliente;

{$R *.dfm}

procedure TFormPesquisarClientes.cbBuscarPorSelect(Sender: TObject);
begin
  if cbBuscarPor.ItemIndex = 1 then
    leBuscar.NumbersOnly:=true
  else
    leBuscar.NumbersOnly:=false;
end;

procedure TFormPesquisarClientes.FormCreate(Sender: TObject);
begin
  sgBuscarPor.Cells[0,0] := 'Código';
  sgBuscarPor.Cells[1,0] := 'Nome';
  sgBuscarPor.Cells[2,0] := 'Ativo';
  sgBuscarPor.Cells[3,0] := 'CGC';
end;

procedure TFormPesquisarClientes.leBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cliente:TCliente;
begin
  if Key = VK_RETURN then begin
    Key :=0;

    cliente := TCliente.Create;
    if cbBuscarPor.ItemIndex = 1 then
      cliente.codigo:= StrToInt( leBuscar.Text )
    else if cbBuscarPor.ItemIndex = 2 then
      cliente.nome:= leBuscar.Text;
    try
      cliente.Buscar;
    except on e:Exception do
      ShowMessage('Erro ao buscar o cliente: ' + e.Message)
    end;
  end;
end;

end.
