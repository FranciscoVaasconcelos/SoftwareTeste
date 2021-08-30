object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  Caption = 'frmRelatorios'
  ClientHeight = 386
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 805
    Height = 386
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object RLReport1: TRLReport
        Left = 0
        Top = 3
        Width = 794
        Height = 1123
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        object RLBand1: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 75
          BandType = btHeader
          object RLLabel1: TRLLabel
            Left = 3
            Top = 3
            Width = 255
            Height = 21
            Caption = 'Relat'#243'rio Total Geral por per'#237'odo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPeriodo1: TRLLabel
            Left = 4
            Top = 28
            Width = 129
            Height = 17
            Caption = 'Per'#237'odo do relat'#243'rio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 444
            Top = 54
            Width = 83
            Height = 17
            Caption = 'Custo M'#233'dio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel3: TRLLabel
            Left = 538
            Top = 54
            Width = 80
            Height = 17
            Caption = 'Pre'#231'o M'#233'dio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 635
            Top = 54
            Width = 34
            Height = 17
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 3
            Top = 54
            Width = 128
            Height = 17
            Caption = 'Tanque Combust'#237'vel'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 71
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
          object RLLabel7: TRLLabel
            Left = 360
            Top = 54
            Width = 75
            Height = 17
            Caption = 'Quantidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 38
          Top = 113
          Width = 718
          Height = 21
          object RLDBText1: TRLDBText
            Left = 3
            Top = 0
            Width = 86
            Height = 17
            DataField = 'NomeTanque'
            DataSource = ds1
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 444
            Top = 0
            Width = 77
            Height = 17
            Alignment = taRightJustify
            DataField = 'CustoMedio'
            DataSource = ds1
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 538
            Top = 0
            Width = 86
            Height = 17
            Alignment = taRightJustify
            DataField = 'PrecoPorLitro'
            DataSource = ds1
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 635
            Top = 0
            Width = 74
            Height = 17
            Alignment = taRightJustify
            DataField = 'Total'
            DataSource = ds1
            DisplayMask = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDraw1: TRLDraw
            Left = 0
            Top = 17
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
          object RLDBText5: TRLDBText
            Left = 393
            Top = 0
            Width = 42
            Height = 17
            Alignment = taRightJustify
            DataField = 'Quant'
            DataSource = ds1
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
        end
        object RLBand3: TRLBand
          Left = 38
          Top = 134
          Width = 718
          Height = 24
          BandType = btColumnFooter
          object RLDBResult1: TRLDBResult
            Left = 634
            Top = 3
            Width = 77
            Height = 17
            Alignment = taRightJustify
            DataField = 'Total'
            DataSource = ds1
            DisplayMask = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLLabel6: TRLLabel
            Left = 544
            Top = 3
            Width = 69
            Height = 17
            Caption = 'Total Geral'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object RLReport2: TRLReport
        Left = 0
        Top = 0
        Width = 794
        Height = 1123
        DataSource = ds2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        object RLBand4: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 74
          BandType = btHeader
          object lbPeriodo2: TRLLabel
            Left = 4
            Top = 28
            Width = 129
            Height = 17
            Caption = 'Per'#237'odo do relat'#243'rio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 3
            Top = 3
            Width = 257
            Height = 21
            Caption = 'Relat'#243'rio Total Lucro por per'#237'odo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel10: TRLLabel
            Left = 3
            Top = 53
            Width = 128
            Height = 17
            Caption = 'Tanque Combust'#237'vel'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel13: TRLLabel
            Left = 534
            Top = 53
            Width = 88
            Height = 17
            Caption = 'Pre'#231'o M'#233'dio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel12: TRLLabel
            Left = 432
            Top = 53
            Width = 83
            Height = 17
            Caption = 'Custo M'#233'dio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel14: TRLLabel
            Left = 633
            Top = 53
            Width = 37
            Height = 17
            Caption = 'Lucro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw4: TRLDraw
            Left = 0
            Top = 70
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
        end
        object RLBand5: TRLBand
          Left = 38
          Top = 112
          Width = 718
          Height = 21
          object RLDBText6: TRLDBText
            Left = 2
            Top = 0
            Width = 86
            Height = 17
            DataField = 'NomeTanque'
            DataSource = ds2
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 435
            Top = 0
            Width = 80
            Height = 17
            Alignment = taRightJustify
            DataField = 'Custo'
            DataSource = ds2
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 534
            Top = 0
            Width = 88
            Height = 17
            Alignment = taRightJustify
            DataField = 'Total'
            DataSource = ds2
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 634
            Top = 0
            Width = 75
            Height = 17
            Alignment = taRightJustify
            DataField = 'Lucro'
            DataSource = ds2
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 17
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
        end
        object RLBand6: TRLBand
          Left = 38
          Top = 133
          Width = 718
          Height = 24
          BandType = btColumnFooter
          object RLLabel8: TRLLabel
            Left = 544
            Top = 3
            Width = 69
            Height = 17
            Caption = 'Total Geral'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult2: TRLDBResult
            Left = 632
            Top = 3
            Width = 79
            Height = 17
            Alignment = taRightJustify
            DataField = 'Lucro'
            DataSource = ds2
            DisplayMask = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object RLReport3: TRLReport
        Left = 0
        Top = 0
        Width = 794
        Height = 1123
        DataSource = ds3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        object RLBand7: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 74
          BandType = btHeader
          object lbPeriodo3: TRLLabel
            Left = 4
            Top = 28
            Width = 129
            Height = 17
            Caption = 'Per'#237'odo do relat'#243'rio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel15: TRLLabel
            Left = 3
            Top = 3
            Width = 346
            Height = 21
            Caption = 'Relat'#243'rio Total Geral Comiss'#227'o dos Frentistas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel16: TRLLabel
            Left = 3
            Top = 53
            Width = 98
            Height = 17
            Caption = 'Nome Frentista'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel17: TRLLabel
            Left = 609
            Top = 53
            Width = 96
            Height = 17
            Caption = 'Total Comiss'#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel18: TRLLabel
            Left = 504
            Top = 53
            Width = 88
            Height = 17
            Caption = 'Total Vendido'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw5: TRLDraw
            Left = 0
            Top = 70
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
        end
        object RLBand8: TRLBand
          Left = 38
          Top = 112
          Width = 718
          Height = 21
          object RLDBText10: TRLDBText
            Left = 2
            Top = 0
            Width = 94
            Height = 17
            DataField = 'NomeFrentista'
            DataSource = ds3
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText11: TRLDBText
            Left = 504
            Top = 0
            Width = 88
            Height = 17
            Alignment = taRightJustify
            DataField = 'Total'
            DataSource = ds3
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText12: TRLDBText
            Left = 613
            Top = 0
            Width = 92
            Height = 17
            Alignment = taRightJustify
            DataField = 'TotalComissao'
            DataSource = ds3
            DisplayMask = '0.000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDraw6: TRLDraw
            Left = 0
            Top = 17
            Width = 718
            Height = 4
            Align = faBottom
            DrawKind = dkLine
          end
        end
        object RLBand9: TRLBand
          Left = 38
          Top = 133
          Width = 718
          Height = 24
          BandType = btColumnFooter
          object RLLabel20: TRLLabel
            Left = 544
            Top = 3
            Width = 69
            Height = 17
            Caption = 'Total Geral'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult3: TRLDBResult
            Left = 575
            Top = 3
            Width = 136
            Height = 17
            Alignment = taRightJustify
            DataField = 'TotalComissao'
            DataSource = ds3
            DisplayMask = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
        end
      end
    end
  end
  object ds1: TDataSource
    DataSet = frmRelTotalGeral.qr
    Left = 12
    Top = 59
  end
  object ds2: TDataSource
    DataSet = frmRelLucroPeriodo.qr
    Left = 12
    Top = 108
  end
  object ds3: TDataSource
    DataSet = frmRelComissao.qr
    Left = 4
    Top = 156
  end
end
