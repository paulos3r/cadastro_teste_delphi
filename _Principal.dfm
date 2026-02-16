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
      object PRODUTOS1: TMenuItem
        Caption = 'PRODUTOS'
      end
    end
  end
end
