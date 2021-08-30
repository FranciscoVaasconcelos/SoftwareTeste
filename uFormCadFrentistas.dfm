inherited frmCadFrentistas: TfrmCadFrentistas
  Caption = 'frmCadFrentistas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    inherited TabSheet2: TTabSheet
      object Label1: TLabel [0]
        Left = 8
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel [1]
        Left = 79
        Top = 7
        Width = 88
        Height = 13
        Caption = 'Nome do Frentista'
      end
      object Label3: TLabel [2]
        Left = 339
        Top = 7
        Width = 99
        Height = 13
        Caption = 'Percentual Comiss'#227'o'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 23
        Width = 65
        Height = 21
        DataField = 'Id'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 79
        Top = 23
        Width = 254
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomeFrentista'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 339
        Top = 23
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PercComissao'
        DataSource = ds
        TabOrder = 4
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM FRENTISTAS')
    object qrId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrNomeFrentista: TStringField
      FieldName = 'NomeFrentista'
      Origin = 'NomeFrentista'
      Required = True
      Size = 50
    end
    object qrPercComissao: TBCDField
      FieldName = 'PercComissao'
      Origin = 'PercComissao'
      DisplayFormat = '0.00%'
      EditFormat = '0.00'
      Precision = 4
      Size = 2
    end
  end
end
