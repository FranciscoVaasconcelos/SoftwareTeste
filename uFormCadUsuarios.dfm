inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = 'frmCadUsuarios'
  ExplicitWidth = 320
  ExplicitHeight = 240
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
        Width = 80
        Height = 13
        Caption = 'Nome do usu'#225'rio'
      end
      object Label3: TLabel [2]
        Left = 339
        Top = 7
        Width = 30
        Height = 13
        Caption = 'Senha'
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
        DataField = 'UsuarioNome'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 339
        Top = 23
        Width = 126
        Height = 21
        DataField = 'UsuarioSenha'
        DataSource = ds
        PasswordChar = '*'
        TabOrder = 4
      end
    end
  end
  inherited qr: TFDQuery
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
  end
end
