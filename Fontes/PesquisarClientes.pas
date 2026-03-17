unit PesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Grids, Data.DB, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormPesquisarClientes = class(TForm)
    plTop: TPanel;
    plfooter: TPanel;
    leBuscar: TLabeledEdit;
    cbBuscarPor: TComboBox;
    lbBuscarPor: TLabel;
    grdPesquisarCliente: TDBGrid;
    DataSourcePesquisarClientes: TDataSource;
    procedure leBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure leBuscarEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisarClientes: TFormPesquisarClientes;

implementation

uses _Cliente, _ConexaoBancoDeDados;

{$R *.dfm}

procedure TFormPesquisarClientes.leBuscarEnter(Sender: TObject);
begin
  if cbBuscarPor.Text = 'ID' then
    leBuscar.NumbersOnly:=true
  else
    leBuscar.NumbersOnly:=false;
end;

procedure TFormPesquisarClientes.leBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cliente:TCliente;
  i:Integer;
begin
  if Key = VK_RETURN then begin
    Key :=0;

    cliente := TCliente.Create;

    if (cbBuscarPor.ItemIndex = 1) and ( not TryStrToInt(leBuscar.Text,i)) then begin
      ShowMessage('ID esse campo aceita somente numeros!');
      Exit;
    end
    else if cbBuscarPor.ItemIndex = 1 then
      cliente.codigo:= StrToInt( leBuscar.Text )
    else
      cliente.nome:= leBuscar.Text;

    try
      DataSourcePesquisarClientes.DataSet := cliente.Buscar;
      grdPesquisarCliente.DataSource := DataSourcePesquisarClientes;
      grdPesquisarCliente.Refresh;
    except on e:Exception do
      ShowMessage('Erro ao buscar o cliente: ' + e.Message)
    end;
  end;
end;

end.
