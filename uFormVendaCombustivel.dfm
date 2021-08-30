inherited frmVendaCombustivel: TfrmVendaCombustivel
  ClientHeight = 257
  ClientWidth = 378
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 384
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 86
    Height = 13
    Caption = 'Indicar o frentista'
  end
  object Label2: TLabel
    Left = 8
    Top = 102
    Width = 138
    Height = 13
    Caption = 'Indicar o bico de combust'#237'vel'
  end
  object Label3: TLabel
    Left = 129
    Top = 167
    Width = 8
    Height = 14
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 220
    Top = 167
    Width = 10
    Height = 14
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 57
    Width = 68
    Height = 13
    Caption = 'Indicar bomba'
  end
  object Label6: TLabel
    Left = 30
    Top = 147
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label7: TLabel
    Left = 143
    Top = 147
    Width = 70
    Height = 13
    Caption = 'Pre'#231'o Por Litro'
  end
  object Label8: TLabel
    Left = 236
    Top = 147
    Width = 64
    Height = 13
    Caption = 'Total '#224' pagar'
  end
  object cmbFrentista: TComboBox
    Left = 8
    Top = 28
    Width = 169
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cmbFrentistaChange
    OnCloseUp = cmbFrentistaCloseUp
  end
  object cmbBicoCombustivel: TComboBox
    Left = 8
    Top = 120
    Width = 170
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnCloseUp = cmbBicoCombustivelCloseUp
    OnExit = cmbBicoCombustivelExit
  end
  object Button1: TButton
    Left = 83
    Top = 201
    Width = 95
    Height = 33
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 201
    Width = 95
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = Button2Click
  end
  object UpDown1: TUpDown
    Left = 105
    Top = 163
    Width = 16
    Height = 21
    Associate = edtQuant
    TabOrder = 3
  end
  object cmbBomba: TComboBox
    Left = 8
    Top = 74
    Width = 169
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnCloseUp = cmbBombaCloseUp
    OnExit = cmbBombaExit
  end
  object edtQuant: TcxCurrencyEdit
    Left = 30
    Top = 163
    EditValue = 0.000000000000000000
    Properties.DecimalPlaces = 3
    Properties.DisplayFormat = ' ,0.000;- ,0.000'
    Properties.OnChange = edtQuantPropertiesChange
    TabOrder = 4
    Width = 75
  end
  object edtPreco: TcxCurrencyEdit
    Left = 143
    Top = 163
    Properties.DecimalPlaces = 3
    Properties.DisplayFormat = ' ,0.00;- ,0.00'
    Properties.OnChange = edtPrecoPropertiesChange
    TabOrder = 5
    Width = 71
  end
  object edtTotal: TcxCurrencyEdit
    Left = 236
    Top = 163
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    TabOrder = 6
    Width = 81
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 238
    Width = 378
    Height = 19
    Panels = <
      item
        Width = 100
      end>
    ExplicitLeft = 316
    ExplicitTop = 188
    ExplicitWidth = 0
  end
  object qrDadosTanque: TFDQuery
    AfterOpen = qrDadosTanqueAfterOpen
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'* '
      'FROM(SELECT'
      
        #9#9'(x.QuantidadeComprada) - (x.QuantidadeTotalVendida) AS QuantAt' +
        'ualNoTanque,'
      #9#9'x.Capacidade,'
      #9#9'(x.Capacidade * 0.02) AS QuantMinima,'
      '         x.CustoMedio'
      #9'FROM(SELECT'
      
        #9#9'(SELECT Capacidade FROM TanquesCombustivel WHERE Id = :IDTanqu' +
        'e) AS Capacidade, '
      #9#9'COALESCE(SUM(v.Quantidade),0) AS QuantidadeTotalVendida, '
      
        #9#9'(SELECT(SUM(Entradas.Quantidade)) FROM Entradas WHERE IdTanque' +
        ' = :IDTanque)AS QuantidadeComprada,'
      
        '        (SELECT COALESCE(AVG(x.PrecoCustoLitro), 0) AS CustoMedi' +
        'o FROM(SELECT * FROM Entradas WHERE IdTanque = :IDTanque )AS x)A' +
        'S CustoMedio'
      #9'FROM Vendas AS v'
      #9'INNER JOIN TanquesCombustivel AS t ON t.Id = v.IdTanque'
      #9'WHERE'
      #9#9't.Id = :IDTanque'
      #9#9')AS x'
      #9') AS xx')
    Left = 340
    Top = 8
    ParamData = <
      item
        Name = 'IDTANQUE'
        ParamType = ptInput
      end>
  end
  object qrDadosComb: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'b.ID AS IDBicoBomba,'
      #9'c.NomeCombustivel,'
      #9'c.PrecoPorLitro,'
      #9't.ID AS IdTanque,'
      #9't.NomeTanque,'
      '        t.Capacidade,'
      #9'c.Id AS IDComb'
      'FROM Bicos AS b'
      'JOIN TanquesCombustivel AS t ON t.Id = b.IdTanque'
      'JOIN Combustiveis AS c ON c.Id = t.IdCombustivel'
      'WHERE '
      #9'b.ID = :ID')
    Left = 264
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
