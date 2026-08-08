object formRelacaoClientesAgendamentos: TformRelacaoClientesAgendamentos
  Left = 0
  Top = 0
  Caption = 'Rela'#231#227'o de Clientes Agendados'
  ClientHeight = 564
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object plPrincipalRelacaoClienteAgendamento: TPanel
    Left = 185
    Top = 0
    Width = 604
    Height = 564
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 191
    object tsPainelPrincipal: TPageControl
      Left = 0
      Top = 1
      Width = 604
      Height = 562
      ActivePage = tsFiltros
      TabOrder = 0
      object tsFiltros: TTabSheet
        Caption = 'Filtros'
        object gbPeriodo: TGroupBox
          Left = 336
          Top = 3
          Width = 225
          Height = 86
          Caption = 'Periodo'
          TabOrder = 0
          object lbAte: TLabel
            Left = 106
            Top = 43
            Width = 17
            Height = 18
            Caption = 'at'#233
          end
          object DateTimePicker2: TDateTimePicker
            Left = 129
            Top = 38
            Width = 89
            Height = 23
            Date = 46242.000000000000000000
            Time = 0.810992939812422300
            TabOrder = 0
          end
        end
        object DateTimePicker1: TDateTimePicker
          Left = 346
          Top = 41
          Width = 87
          Height = 23
          Date = 46242.000000000000000000
          Time = 0.810992939812422300
          TabOrder = 1
        end
      end
      object tsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object StringGrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 596
          Height = 504
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 1
          ExplicitTop = 2
        end
        object plOpcaoRelatorio: TPanel
          Left = 0
          Top = 504
          Width = 596
          Height = 28
          Align = alBottom
          TabOrder = 1
          object btGerarPDF: TButton
            Left = 1
            Top = 1
            Width = 75
            Height = 26
            Align = alLeft
            Caption = 'PDF'
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 38
            ExplicitHeight = 25
          end
          object btGerarXML: TButton
            Left = 236
            Top = 1
            Width = 75
            Height = 26
            Align = alCustom
            Caption = 'XML'
            TabOrder = 1
          end
          object btGerarExcel: TButton
            Left = 520
            Top = 1
            Width = 75
            Height = 26
            Align = alRight
            Caption = 'Excel'
            TabOrder = 2
            ExplicitLeft = 496
            ExplicitTop = 38
            ExplicitHeight = 25
          end
        end
      end
    end
  end
  object plLateralRelacaoClienteAgendamento: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 564
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = -6
    object sbProcessar: TSpeedButton
      Left = 1
      Top = 1
      Width = 183
      Height = 22
      Align = alTop
      Caption = 'Processar'
      ExplicitLeft = 144
      ExplicitTop = 296
      ExplicitWidth = 23
    end
    object sbFechar: TSpeedButton
      Left = 1
      Top = 541
      Width = 183
      Height = 22
      Align = alBottom
      Caption = 'Fechar'
      ExplicitLeft = 120
      ExplicitTop = 320
      ExplicitWidth = 23
    end
  end
end
