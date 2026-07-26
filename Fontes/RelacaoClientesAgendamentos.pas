unit RelacaoClientesAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TformRelacaoClientesAgendamentos = class(TForm)
    rlClientesAgendados: TRLReport;
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
