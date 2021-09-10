inherited frmCadEntrada: TfrmCadEntrada
  Caption = 'frmCadEntrada'
  ClientHeight = 276
  ClientWidth = 371
  OnCreate = FormCreate
  ExplicitWidth = 377
  ExplicitHeight = 305
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 366
    Top = 28
    Width = 64
    Height = 13
    Caption = 'Data Entrada'
    Visible = False
  end
  object dtEntrada: TDateEdit
    Left = 367
    Top = 43
    Width = 95
    Height = 21
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 157
    Hint = 'Campos em cor azul n'#227'o s'#227'o edit'#225'veis, s'#227'o apenas demonstrativos.'
    Caption = 'Tanque que ser'#225' abastecido'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object Label5: TLabel
      Left = 10
      Top = 113
      Width = 83
      Height = 13
      Caption = 'Quantidade atual'
    end
    object Label9: TLabel
      Left = 116
      Top = 113
      Width = 83
      Height = 13
      Caption = 'Capacidade Total'
    end
    object Label10: TLabel
      Left = 222
      Top = 113
      Width = 46
      Height = 13
      Caption = 'Diferen'#231'a'
    end
    object Label4: TLabel
      Left = 10
      Top = 20
      Width = 161
      Height = 13
      Caption = 'Indique o tanque correspondente'
    end
    object Label1: TLabel
      Left = 10
      Top = 68
      Width = 140
      Height = 13
      Caption = 'Indique o tipo de combust'#237'vel'
    end
    object Label6: TLabel
      Left = 182
      Top = 68
      Width = 102
      Height = 13
      Caption = 'Pre'#231'o de venda atual'
    end
    object edtQntAtualTanque: TcxCurrencyEdit
      Left = 9
      Top = 128
      Hint = 'Informa'#231#227'o ilustrativa'
      TabStop = False
      ParentShowHint = False
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      Properties.ReadOnly = True
      ShowHint = True
      Style.Color = clSkyBlue
      TabOrder = 3
      Width = 100
    end
    object edtCapacidade: TcxCurrencyEdit
      Left = 115
      Top = 128
      Hint = 'Informa'#231#227'o ilustrativa'
      TabStop = False
      ParentShowHint = False
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      Properties.ReadOnly = True
      ShowHint = True
      Style.Color = clSkyBlue
      TabOrder = 4
      Width = 100
    end
    object edtDiferenca: TcxCurrencyEdit
      Left = 221
      Top = 128
      Hint = 'Informa'#231#227'o ilustrativa'
      TabStop = False
      ParentShowHint = False
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      Properties.ReadOnly = True
      ShowHint = True
      Style.Color = clSkyBlue
      TabOrder = 5
      Width = 100
    end
    object cmbTanque: TComboBox
      Left = 8
      Top = 36
      Width = 163
      Height = 21
      TabOrder = 0
      OnCloseUp = cmbTanqueCloseUp
      OnExit = cmbTanqueExit
    end
    object cmbTipoComb: TComboBox
      Left = 8
      Top = 83
      Width = 163
      Height = 21
      TabOrder = 1
      OnCloseUp = cmbTipoCombCloseUp
      OnExit = cmbTipoCombExit
    end
    object edtPrecoVendaAtual: TcxCurrencyEdit
      Left = 181
      Top = 83
      Hint = 'Informa'#231#227'o ilustrativa'
      TabStop = False
      ParentShowHint = False
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
      Properties.ReadOnly = True
      ShowHint = True
      Style.Color = clSkyBlue
      TabOrder = 2
      Width = 100
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 171
    Width = 353
    Height = 69
    Caption = 'Entrada de dados'
    TabOrder = 2
    object Label2: TLabel
      Left = 11
      Top = 25
      Width = 116
      Height = 13
      Caption = 'Pre'#231'o de Custo por Litro'
    end
    object Label3: TLabel
      Left = 143
      Top = 25
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label7: TLabel
      Left = 251
      Top = 25
      Width = 82
      Height = 13
      Caption = 'Valor Total Custo'
    end
    object edtPrecoCustoLitro: TcxCurrencyEdit
      Left = 10
      Top = 40
      EditValue = 0.000000000000000000
      Properties.OnChange = edtPrecoCustoLitroPropertiesChange
      TabOrder = 0
      Width = 89
    end
    object edtQuantEntrada: TcxCurrencyEdit
      Left = 142
      Top = 40
      EditValue = 1.000000000000000000
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      Properties.OnChange = edtQuantEntradaPropertiesChange
      TabOrder = 1
      OnExit = edtQuantEntradaExit
      Width = 89
    end
    object edtVrTotalCusto: TcxCurrencyEdit
      Left = 250
      Top = 40
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Style.Color = clSkyBlue
      TabOrder = 2
      Width = 89
    end
  end
  object btnCancelar: TButton
    Left = 185
    Top = 244
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
    ExplicitLeft = 183
  end
  object btnSalvar: TButton
    Left = 104
    Top = 244
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
    ExplicitLeft = 102
  end
end
