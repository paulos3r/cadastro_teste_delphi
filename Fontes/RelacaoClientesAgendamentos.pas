unit RelacaoClientesAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids;

type
  TformRelacaoClientesAgendamentos = class(TForm)
    plPrincipalRelacaoClienteAgendamento: TPanel;
    plLateralRelacaoClienteAgendamento: TPanel;
    sbProcessar: TSpeedButton;
    sbFechar: TSpeedButton;
    tsPainelPrincipal: TPageControl;
    tsFiltros: TTabSheet;
    tsResultado: TTabSheet;
    gbPeriodo: TGroupBox;
    lbAte: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StringGrid1: TStringGrid;
    plOpcaoRelatorio: TPanel;
    btGerarPDF: TButton;
    btGerarXML: TButton;
    btGerarExcel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelacaoClientesAgendamentos: TformRelacaoClientesAgendamentos;

implementation

{$R *.dfm}

end.
