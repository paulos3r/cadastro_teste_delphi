object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 584
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mPrincipal
  TextHeight = 15
  object mPrincipal: TMainMenu
    Left = 280
    Top = 104
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTES1: TMenuItem
        Caption = 'CLIENTES'
        OnClick = CLIENTES1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object AGENDAMENTO1: TMenuItem
        Caption = 'AGENDAMENTO'
        OnClick = AGENDAMENTO1Click
      end
    end
    object AGENDAMENTO2: TMenuItem
      Caption = 'RELAT'#211'RIO'
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object AGENDAMENTO3: TMenuItem
        Caption = 'AGENDAMENTO'
      end
    end
  end
end
