object FormCliente: TFormCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormCliente'
  ClientHeight = 657
  ClientWidth = 917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object plBotoesDeAcao: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 657
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      129
      657)
    object sbSalvar: TSpeedButton
      Left = 1
      Top = 1
      Width = 127
      Height = 22
      Align = alTop
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 23
    end
    object sbCancelar: TSpeedButton
      Left = 1
      Top = 23
      Width = 127
      Height = 22
      Align = alTop
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 56
      ExplicitTop = 184
      ExplicitWidth = 23
    end
    object sbExcluir: TSpeedButton
      Left = 1
      Top = 45
      Width = 127
      Height = 22
      Align = alTop
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 80
      ExplicitTop = 176
      ExplicitWidth = 23
    end
    object sbPesquisar: TSpeedButton
      Left = 1
      Top = 263
      Width = 128
      Height = 25
      Anchors = [akLeft, akRight]
      Caption = 'Pesquisar'
      ExplicitTop = 232
    end
    object sbFechar: TSpeedButton
      Left = 1
      Top = 634
      Width = 127
      Height = 22
      Align = alBottom
      Caption = 'Fechar'
      ExplicitLeft = 56
      ExplicitTop = 280
      ExplicitWidth = 23
    end
  end
  object plPrincipal: TPanel
    Left = 129
    Top = 0
    Width = 788
    Height = 657
    Align = alClient
    TabOrder = 1
    DesignSize = (
      788
      657)
    object lbDataNascimento: TLabel
      Left = 120
      Top = 56
      Width = 107
      Height = 15
      Caption = 'Data de Nascimento'
    end
    object lbCpfCnpj: TLabel
      Left = 8
      Top = 56
      Width = 19
      Height = 15
      Caption = 'Cpf'
    end
    object pcCliente: TPageControl
      Left = 5
      Top = 102
      Width = 786
      Height = 554
      ActivePage = tsPrincipal
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
      end
      object tsEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 1
      end
    end
    object leCodigo: TLabeledEdit
      Left = 6
      Top = 23
      Width = 66
      Height = 23
      Anchors = [akLeft, akRight]
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 1
      Text = ''
    end
    object LabeledEdit2: TLabeledEdit
      Left = 88
      Top = 23
      Width = 385
      Height = 23
      Anchors = [akLeft, akRight]
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      TabOrder = 2
      Text = ''
    end
    object cbAtivo: TCheckBox
      Left = 488
      Top = 26
      Width = 57
      Height = 17
      Anchors = [akLeft, akRight]
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object MaskEdit1: TMaskEdit
      Left = 6
      Top = 73
      Width = 99
      Height = 23
      Anchors = [akLeft, akRight]
      EditMask = '000.000.000-00;0;_'
      MaxLength = 14
      TabOrder = 4
      Text = ''
    end
    object DateTimePicker1: TDateTimePicker
      Left = 120
      Top = 73
      Width = 107
      Height = 23
      Anchors = [akLeft, akRight]
      Date = 46068.000000000000000000
      Time = 0.939575821757898700
      TabOrder = 5
    end
    object leDataCadastro: TLabeledEdit
      Left = 680
      Top = 73
      Width = 97
      Height = 23
      Anchors = [akRight]
      EditLabel.Width = 90
      EditLabel.Height = 15
      EditLabel.Caption = 'Data de Cadastro'
      Enabled = False
      TabOrder = 6
      Text = ''
    end
  end
end
