object FormAgendamento: TFormAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento de chamado'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object plAgendamento: TPanel
    Left = 113
    Top = 0
    Width = 511
    Height = 441
    Align = alClient
    TabOrder = 0
    object lbObservacao: TLabel
      Left = 16
      Top = 195
      Width = 62
      Height = 15
      Caption = 'Observa'#231#227'o'
    end
    object lbDataAgendamento: TLabel
      Left = 288
      Top = 179
      Width = 103
      Height = 15
      Caption = 'Data Agendamento'
    end
    object leAgendamentoCodigo: TLabeledEdit
      Left = 16
      Top = 31
      Width = 70
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 0
      Text = ''
    end
    object leAgendamentoDescricao: TLabeledEdit
      Left = 92
      Top = 31
      Width = 395
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o'
      TabOrder = 1
      Text = ''
    end
    object leAgendamentoCodigoCliente: TLabeledEdit
      Left = 16
      Top = 80
      Width = 70
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cliente'
      TabOrder = 2
      Text = ''
    end
    object leAgendamentoClienteNome: TLabeledEdit
      Left = 92
      Top = 80
      Width = 395
      Height = 23
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      TabOrder = 3
      Text = ''
    end
    object leAgendamentoCodigoAtendente: TLabeledEdit
      Left = 16
      Top = 128
      Width = 70
      Height = 23
      EditLabel.Width = 55
      EditLabel.Height = 15
      EditLabel.Caption = 'Atendente'
      TabOrder = 4
      Text = ''
    end
    object leAgendamentoAtendenteNome: TLabeledEdit
      Left = 94
      Top = 128
      Width = 395
      Height = 23
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      TabOrder = 5
      Text = ''
    end
    object memoObservacao: TMemo
      Left = 16
      Top = 216
      Width = 473
      Height = 209
      TabOrder = 6
    end
    object meDataAgendamento: TMaskEdit
      Left = 405
      Top = 176
      Width = 83
      Height = 23
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 7
      Text = '  /  /    '
    end
  end
  object plAgendamentoBotoes: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 441
    Align = alLeft
    TabOrder = 1
    object sbBuscar: TSpeedButton
      Left = 1
      Top = 23
      Width = 111
      Height = 22
      Align = alTop
      Caption = 'Buscar'
      ExplicitLeft = 56
      ExplicitTop = 208
      ExplicitWidth = 23
    end
    object sbSair: TSpeedButton
      Left = 1
      Top = 418
      Width = 111
      Height = 22
      Align = alBottom
      Caption = 'Sair'
      ExplicitLeft = 56
      ExplicitTop = 280
      ExplicitWidth = 23
    end
    object sbCancelar: TSpeedButton
      Left = 1
      Top = 45
      Width = 111
      Height = 373
      Align = alClient
      Caption = 'Cancelar'
      ExplicitLeft = -4
      ExplicitTop = 179
      ExplicitHeight = 22
    end
    object sbGravar: TSpeedButton
      Left = 1
      Top = 1
      Width = 111
      Height = 22
      Align = alTop
      Caption = 'Gravar'
      OnClick = sbGravarClick
      ExplicitLeft = 56
      ExplicitTop = 208
      ExplicitWidth = 23
    end
  end
end
