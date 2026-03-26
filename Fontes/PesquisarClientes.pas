unit PesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, system.Generics.Collections, System.Variants, System.Classes, Vcl.Graphics,
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
    DataSourcePesquisarClientes: TDataSource;
    sgPesquisarClientes: TStringGrid;
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
var
  lista: TObjectList<TCliente>;
  i: Integer;
begin
  if Key = VK_RETURN then begin
    Key :=0;
    lista:=nil;
    try
      lista := TCliente.BuscarClientes(leBuscar.Text);

      sgPesquisarClientes.RowCount := lista.count+1;

      sgPesquisarClientes.Cells[0,0] := 'ID';
      sgPesquisarClientes.Cells[1,0] := 'Nome';
      sgPesquisarClientes.Cells[2,0] := 'CGC';

      for i := 0 to lista.Count-1 do begin
        sgPesquisarClientes.Cells[0,i+1] := IntToStr(lista[i].codigo);
        sgPesquisarClientes.Cells[1,i+1] := lista[i].nome;
        sgPesquisarClientes.Cells[2,i+1] := lista[i].cpf_cnpj;
      end;

    finally
      lista.Free;
    end;

  end;

end;


end.
