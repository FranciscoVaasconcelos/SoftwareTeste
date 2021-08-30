inherited frmCadTanques: TfrmCadTanques
  Caption = 'frmCadTanques'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel [0]
        Left = 4
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel [1]
        Left = 75
        Top = 3
        Width = 81
        Height = 13
        Caption = 'Nome do Tanque'
      end
      object Label3: TLabel [2]
        Left = 335
        Top = 3
        Width = 110
        Height = 13
        Caption = 'Capacidade do Tanque'
      end
      object Label4: TLabel [3]
        Left = 5
        Top = 49
        Width = 58
        Height = 13
        Caption = 'Combust'#237'vel'
      end
      object DBEdit1: TDBEdit
        Left = 4
        Top = 19
        Width = 65
        Height = 21
        DataField = 'Id'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 75
        Top = 19
        Width = 254
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomeTanque'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 335
        Top = 19
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Capacidade'
        DataSource = ds
        TabOrder = 4
      end
      object cmbBomba: TJvDBLookupCombo
        Left = 3
        Top = 66
        Width = 190
        Height = 21
        DataField = 'IdCombustivel'
        DataSource = ds
        LookupField = 'Id'
        LookupDisplay = 'NomeCombustivel'
        LookupSource = ds1
        TabOrder = 5
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM TANQUESCOMBUSTIVEL')
    object qrId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrIdCombustivel: TIntegerField
      FieldName = 'IdCombustivel'
      Origin = 'IdCombustivel'
      Required = True
    end
    object qrNomeTanque: TStringField
      FieldName = 'NomeTanque'
      Origin = 'NomeTanque'
      Required = True
      Size = 50
    end
    object qrCapacidade: TBCDField
      FieldName = 'Capacidade'
      Origin = 'Capacidade'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 3
    end
  end
  object qrCombustivel: TFDQuery
    AfterOpen = qrAfterOpen
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEIS')
    Left = 520
    Top = 180
  end
  object ds1: TDataSource
    DataSet = qrCombustivel
    Left = 520
    Top = 130
  end
end
