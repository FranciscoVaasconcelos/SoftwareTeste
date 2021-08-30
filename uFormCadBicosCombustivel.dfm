inherited frmCadBicosCombustivel: TfrmCadBicosCombustivel
  Caption = 'frmCadBicosCombustivel'
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
        Width = 49
        Height = 13
        Caption = 'Nome Bico'
      end
      object Label3: TLabel [2]
        Left = 5
        Top = 93
        Width = 95
        Height = 13
        Caption = 'Tanque combust'#237'vel'
      end
      object Label4: TLabel [3]
        Left = 5
        Top = 49
        Width = 32
        Height = 13
        Caption = 'Bomba'
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
        DataField = 'NomeBico'
        DataSource = ds
        TabOrder = 3
      end
      object cmbTanque: TJvDBLookupCombo
        Left = 4
        Top = 108
        Width = 190
        Height = 21
        DataField = 'IdTanque'
        DataSource = ds
        LookupField = 'Id'
        LookupDisplay = 'NomeTanque'
        LookupSource = ds1
        TabOrder = 4
      end
      object cmbBomba: TJvDBLookupCombo
        Left = 3
        Top = 66
        Width = 190
        Height = 21
        DataField = 'IdBomba'
        DataSource = ds
        ListStyle = lsDelimited
        LookupField = 'Id'
        LookupDisplay = 'NomeBomba'
        LookupSource = ds2
        TabOrder = 5
        UseRecordCount = True
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM BICOS')
  end
  object qrTanques: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TANQUESCOMBUSTIVEL')
    Left = 524
    Top = 124
  end
  object ds1: TDataSource
    DataSet = qrTanques
    Left = 524
    Top = 172
  end
  object ds2: TDataSource
    DataSet = qrBomba
    Left = 468
    Top = 176
  end
  object qrBomba: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM Bombas')
    Left = 468
    Top = 128
  end
end
