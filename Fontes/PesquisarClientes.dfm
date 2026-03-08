object FormPesquisarClientes: TFormPesquisarClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FormPesquisarClientes'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object plTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 113
    Align = alTop
    TabOrder = 0
    object lbBuscarPor: TLabel
      Left = 19
      Top = 29
      Width = 56
      Height = 15
      Caption = 'Buscar Por'
    end
    object leBuscar: TLabeledEdit
      Left = 186
      Top = 46
      Width = 415
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Buscar'
      TabOrder = 0
      Text = ''
      OnKeyDown = leBuscarKeyDown
    end
    object cbBuscarPor: TComboBox
      Left = 19
      Top = 46
      Width = 152
      Height = 23
      TabOrder = 1
      TextHint = 'SELECIONE'
      OnSelect = cbBuscarPorSelect
      Items.Strings = (
        'Nome'
        'ID')
    end
  end
  object plfooter: TPanel
    Left = 0
    Top = 113
    Width = 624
    Height = 328
    Align = alClient
    TabOrder = 1
    object sgBuscarPor: TStringGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 326
      Align = alClient
      FixedCols = 2
      RowCount = 2
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 6
    end
  end
end
