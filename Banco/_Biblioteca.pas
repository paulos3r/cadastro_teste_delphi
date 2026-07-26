unit _Biblioteca;

interface

uses System.Classes,Vcl.ExtCtrls,vcl.StdCtrls,Vcl.Buttons;

type
  TBiblioteca = class

  public
    procedure controleTelas(habilitar:Boolean; componente: TComponent);
  end;

implementation

{ TBiblioteca }

procedure TBiblioteca.controleTelas(habilitar:Boolean; componente: TComponent);
begin

  if componente is TLabeledEdit then begin
    with TLabeledEdit(componente) do begin
      if habilitar<>true then Clear;
      Enabled:= habilitar;
    end;
  end
  else if componente is TEdit then begin
    with TEdit(componente) do begin
      if habilitar<>true then Clear;
      Enabled:=habilitar
    end;
  end
  else if componente is TRadioButton then begin
    with TRadioGroup(componente) do
      Enabled:=habilitar;
  end
  else if componente is TSpeedButton then begin
    with TSpeedButton(componente) do
      Enabled:=habilitar;
  end
  else if componente is TCheckBox then
    TCheckBox(componente).Enabled:=habilitar
  else if componente is TPage then
    TPage(componente).ComponentIndex:=0;
end;

end.
