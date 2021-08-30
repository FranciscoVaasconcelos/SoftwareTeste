object frmInicial: TfrmInicial
  Left = 0
  Top = 0
  ClientHeight = 340
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 321
    Width = 742
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 321
    Align = alClient
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Left = 12
    Top = 4
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
      object Bicosdebombas1: TMenuItem
        Caption = 'Bicos de bombas'
        OnClick = Bicosdebombas1Click
      end
      object Frentistas1: TMenuItem
        Caption = 'Frentistas'
        OnClick = Frentistas1Click
      end
      object Combustveis1: TMenuItem
        Caption = 'Combust'#237'veis'
        OnClick = Combustveis1Click
      end
      object anquesdeCombustveis1: TMenuItem
        Caption = 'Tanques de Combust'#237'veis'
        OnClick = anquesdeCombustveis1Click
      end
    end
    object Venda1: TMenuItem
      Caption = 'Controles'
      object Venda2: TMenuItem
        Caption = 'Venda'
        OnClick = Venda2Click
      end
      object Compra1: TMenuItem
        Caption = 'Compra'
        OnClick = Compra1Click
      end
    end
    object Login1: TMenuItem
      Caption = 'Login'
      object rocardeusurio1: TMenuItem
        Caption = 'Trocar de usu'#225'rio...'
        OnClick = rocardeusurio1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object otalGeral1: TMenuItem
        Caption = 'Total Geral'
        OnClick = otalGeral1Click
      end
      object Lucroporperodo1: TMenuItem
        Caption = 'Lucro por per'#237'odo'
        OnClick = Lucroporperodo1Click
      end
      object Comissesporfrentista1: TMenuItem
        Caption = 'Comiss'#245'es por frentista'
        OnClick = Comissesporfrentista1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
