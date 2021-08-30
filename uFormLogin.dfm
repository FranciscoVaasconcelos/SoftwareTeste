inherited frmLogin: TfrmLogin
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 202
  ClientWidth = 354
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 360
  ExplicitHeight = 231
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 44
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object edtSenha: TLabeledEdit
    Left = 120
    Top = 108
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    PasswordChar = '*'
    TabOrder = 0
  end
  object btnEntrar: TButton
    Left = 80
    Top = 156
    Width = 95
    Height = 33
    Caption = 'Entrar'
    TabOrder = 1
    OnClick = btnEntrarClick
  end
  object btnCancelar: TButton
    Left = 181
    Top = 156
    Width = 95
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object cmbUsuario: TComboBox
    Left = 64
    Top = 60
    Width = 233
    Height = 21
    Style = csDropDownList
    TabOrder = 3
  end
  object qr: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM USUARIOS WHERE ID =:ID AND UsuarioSenha =:Senha')
    Left = 164
    Top = 12
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
end
