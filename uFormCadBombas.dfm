inherited frmCadBombas: TfrmCadBombas
  Caption = 'frmCadBombas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 72
      ExplicitTop = 128
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
        Width = 77
        Height = 13
        Caption = 'Nome da Bomba'
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
        DataField = 'NomeBomba'
        DataSource = ds
        TabOrder = 3
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM BOMBAS')
  end
end
