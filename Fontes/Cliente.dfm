object FormCliente: TFormCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Cliente'
  ClientHeight = 509
  ClientWidth = 706
  Color = clBtnFace
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object plBotoesDeAcao: TPanel
    Left = 0
    Top = 0
    Width = 139
    Height = 509
    Align = alLeft
    Anchors = [akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      139
      509)
    object sbSalvar: TSpeedButton
      Left = 1
      Top = 1
      Width = 137
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
      Width = 137
      Height = 22
      Align = alTop
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = sbCancelarClick
      ExplicitLeft = 56
      ExplicitTop = 184
      ExplicitWidth = 23
    end
    object sbExcluir: TSpeedButton
      Left = 1
      Top = 45
      Width = 137
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
      Top = 201
      Width = 138
      Height = 25
      Anchors = [akLeft, akRight]
      Caption = 'Pesquisar'
      ExplicitTop = 232
      ExplicitWidth = 128
    end
    object sbFechar: TSpeedButton
      Left = 1
      Top = 486
      Width = 137
      Height = 22
      Align = alBottom
      Caption = 'Fechar'
      OnClick = sbFecharClick
      ExplicitLeft = 56
      ExplicitTop = 280
      ExplicitWidth = 23
    end
  end
  object plPrincipal: TPanel
    Left = 139
    Top = 0
    Width = 567
    Height = 509
    Align = alClient
    TabOrder = 1
    DesignSize = (
      567
      509)
    object pcCliente: TPageControl
      Left = 6
      Top = 102
      Width = 565
      Height = 406
      ActivePage = tsEndereco
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        object leTelefone: TLabeledEdit
          Left = 11
          Top = 23
          Width = 97
          Height = 23
          EditLabel.Width = 44
          EditLabel.Height = 15
          EditLabel.Caption = 'Telefone'
          EditMask = '!\(99\)0000-0000;1;_'
          MaxLength = 13
          NumbersOnly = True
          TabOrder = 0
          Text = '(  )    -    '
        end
        object leEmail: TLabeledEdit
          Left = 134
          Top = 23
          Width = 319
          Height = 23
          EditLabel.Width = 34
          EditLabel.Height = 15
          EditLabel.Caption = 'E-mail'
          TabOrder = 1
          Text = ''
        end
        object leLimiteCredito: TLabeledEdit
          Left = 11
          Top = 73
          Width = 101
          Height = 23
          EditLabel.Width = 91
          EditLabel.Height = 15
          EditLabel.Caption = 'Limite de Cr'#233'dito'
          NumbersOnly = True
          TabOrder = 2
          Text = ''
        end
        object leFormaPagamentoPadrao: TLabeledEdit
          Left = 134
          Top = 73
          Width = 187
          Height = 23
          EditLabel.Width = 154
          EditLabel.Height = 15
          EditLabel.Caption = 'Forma de pagamento Padr'#227'o'
          TabOrder = 3
          Text = ''
        end
      end
      object tsEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 1
        object leEndereco: TLabeledEdit
          Left = 3
          Top = 24
          Width = 518
          Height = 23
          EditLabel.Width = 49
          EditLabel.Height = 15
          EditLabel.Caption = 'Endere'#231'o'
          TabOrder = 0
          Text = ''
        end
        object leBairro: TLabeledEdit
          Left = 3
          Top = 73
          Width = 182
          Height = 23
          EditLabel.Width = 31
          EditLabel.Height = 15
          EditLabel.Caption = 'Bairro'
          TabOrder = 1
          Text = ''
        end
        object leCidade: TLabeledEdit
          Left = 201
          Top = 73
          Width = 165
          Height = 23
          EditLabel.Width = 37
          EditLabel.Height = 15
          EditLabel.Caption = 'Cidade'
          TabOrder = 2
          Text = ''
        end
        object leUf: TLabeledEdit
          Left = 381
          Top = 73
          Width = 52
          Height = 23
          EditLabel.Width = 14
          EditLabel.Height = 15
          EditLabel.Caption = 'UF'
          TabOrder = 3
          Text = ''
        end
        object leCep: TLabeledEdit
          Left = 450
          Top = 73
          Width = 71
          Height = 23
          EditLabel.Width = 21
          EditLabel.Height = 15
          EditLabel.Caption = 'CEP'
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          TabOrder = 4
          Text = '     -   '
        end
      end
    end
    object leCodigo: TLabeledEdit
      Left = 6
      Top = 25
      Width = 76
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 1
      Text = ''
      OnKeyDown = leCodigoKeyDown
    end
    object leNome: TLabeledEdit
      Left = 92
      Top = 27
      Width = 390
      Height = 23
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      TabOrder = 2
      Text = ''
    end
    object cbAtivo: TCheckBox
      Left = 496
      Top = 26
      Width = 61
      Height = 23
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object leDataCadastro: TLabeledEdit
      Left = 461
      Top = 73
      Width = 94
      Height = 23
      EditLabel.Width = 90
      EditLabel.Height = 15
      EditLabel.Caption = 'Data de Cadastro'
      Enabled = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
    end
    object leCPF: TLabeledEdit
      Left = 6
      Top = 73
      Width = 120
      Height = 23
      EditLabel.Width = 21
      EditLabel.Height = 15
      EditLabel.Caption = 'CPF'
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 5
      Text = '   .   .   -  '
    end
    object leDataNascimento: TLabeledEdit
      Left = 144
      Top = 73
      Width = 113
      Height = 23
      EditLabel.Width = 107
      EditLabel.Height = 15
      EditLabel.Caption = 'Data de Nascimento'
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
    end
  end
end
