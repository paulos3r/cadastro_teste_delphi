unit _Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    mPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    CLIENTES1: TMenuItem;
    N1: TMenuItem;
    PRODUTOS1: TMenuItem;
    procedure CLIENTES1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses Cliente;

{$R *.dfm}

procedure TFormPrincipal.CLIENTES1Click(Sender: TObject);
var TelaCliente:TFormCliente;
begin
  TelaCliente:=TFormCliente.create(nil);
  TelaCliente.show;
end;

end.
