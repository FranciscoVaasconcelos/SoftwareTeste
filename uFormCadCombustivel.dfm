inherited frmCadCombustivel: TfrmCadCombustivel
  Caption = 'frmCadCombustivel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet2: TTabSheet
      object Label1: TLabel [0]
        Left = 0
        Top = -1
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel [1]
        Left = 71
        Top = -1
        Width = 88
        Height = 13
        Caption = 'Nome Combust'#237'vel'
      end
      object Label3: TLabel [2]
        Left = 331
        Top = -1
        Width = 70
        Height = 13
        Caption = 'Pre'#231'o por Litro'
      end
      object DBEdit1: TDBEdit
        Left = 0
        Top = 15
        Width = 65
        Height = 21
        DataField = 'Id'
        DataSource = ds
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 71
        Top = 15
        Width = 254
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomeCombustivel'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 331
        Top = 15
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PrecoPorLitro'
        DataSource = ds
        TabOrder = 4
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEIS')
    object qrId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrNomeCombustivel: TStringField
      FieldName = 'NomeCombustivel'
      Origin = 'NomeCombustivel'
      Required = True
      Size = 50
    end
    object qrPrecoPorLitro: TBCDField
      DefaultExpression = '0'
      FieldName = 'PrecoPorLitro'
      Origin = 'PrecoPorLitro'
      DisplayFormat = '0.000'
      Precision = 18
      Size = 3
    end
  end
end
