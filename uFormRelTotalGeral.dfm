inherited frmRelTotalGeral: TfrmRelTotalGeral
  Caption = 'frmRelTotalGeral'
  ClientHeight = 307
  ClientWidth = 598
  ExplicitWidth = 604
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 159
    Top = 12
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 307
    Top = 12
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object btnConsultar: TButton
    Left = 172
    Top = 275
    Width = 86
    Height = 25
    Caption = 'Consultar'
    TabOrder = 0
    OnClick = btnConsultarClick
  end
  object btnSair: TButton
    Left = 358
    Top = 275
    Width = 86
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object btnImprimir: TButton
    Left = 265
    Top = 275
    Width = 86
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object DBGrid: TJvDBGrid
    Left = 24
    Top = 60
    Width = 549
    Height = 209
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object dtInicial: TJvDateEdit
    Left = 158
    Top = 28
    Width = 105
    Height = 19
    DefaultToday = True
    Flat = True
    ParentFlat = False
    ShowNullDate = False
    TabOrder = 4
  end
  object dtFinal: TJvDateEdit
    Left = 306
    Top = 28
    Width = 95
    Height = 19
    DefaultToday = True
    Flat = True
    ParentFlat = False
    ShowNullDate = False
    TabOrder = 5
  end
  object ds: TDataSource
    DataSet = qr
    Left = 560
    Top = 8
  end
  object qr: TFDQuery
    AfterOpen = qrAfterOpen
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'x.NomeTanque, '
      #9'CAST(AVG(x.PrecoPorLitro) AS DECIMAL(18,2)) AS PrecoPorLitro, '
      #9'SUM(x.Custo) AS CustoMedio,'
      #9'CAST(SUM(x.Quantidade)AS FLOAT)AS Quant,'
      #9'CAST(SUM(x.Total) AS FLOAT) AS Total'
      'FROM (SELECT '
      #9'v.Id,'
      #9'v.DataHora,'
      #9'v.PrecoPorLitro,'
      #9'v.Quantidade,'
      #9'v.Total,'
      #9'COALESCE(v.CustoPorLitro, 0)AS Custo,'
      #9'v.IdTanque,'
      #9't.NomeTanque, '
      #9'f.NomeFrentista, '
      #9'f.PercComissao AS PercCom, '
      #9'v.VrComissao,'
      #9'c.NomeCombustivel'#9
      'FROM Vendas AS v'
      'INNER JOIN Frentistas AS f ON f.Id = v.IdFrentista'
      'INNER JOIN Combustiveis AS c ON c.Id = v.IdCombustivel'
      
        'INNER JOIN TanquesCombustivel AS t ON t.Id = v.IdTanque -- AND t' +
        '.IdCombustivel = c.Id'
      'WHERE'
      #9'--v.DataHora BETWEEN '#39'2021-08-20'#39' AND '#39'2021-08-25'#39
      #9'v.DataHora BETWEEN :DataInicial AND :DataFinal'
      ') AS X'
      'GROUP BY x.NomeTanque')
    Left = 560
    Top = 56
    ParamData = <
      item
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        Name = 'DATAFINAL'
        ParamType = ptInput
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 208
    object CloseDataSet1: TMenuItem
      Caption = 'Close DataSet'
      OnClick = CloseDataSet1Click
    end
  end
end
