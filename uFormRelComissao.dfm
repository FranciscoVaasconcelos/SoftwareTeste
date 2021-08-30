inherited frmRelComissao: TfrmRelComissao
  Caption = 'frmRelComissao'
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
    Width = 85
    Height = 25
    Caption = 'Consultar'
    TabOrder = 0
    OnClick = btnConsultarClick
  end
  object btnSair: TButton
    Left = 358
    Top = 275
    Width = 85
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object btnImprimir: TButton
    Left = 265
    Top = 275
    Width = 85
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object DBGrid: TJvDBGrid
    Left = 24
    Top = 60
    Width = 548
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
    Width = 104
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
    Left = 568
    Top = 8
  end
  object qr: TFDQuery
    AfterOpen = qrAfterOpen
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'x.IdFrentista,'
      #9'x.NomeFrentista,'
      #9'SUM(x.Total) AS Total,'
      #9'CAST(SUM(x.VrComissao) AS FLOAT)AS TotalComissao'
      'FROM(SELECT'
      #9'v.DataHora,'
      #9'v.IdFrentista,'
      #9'f.NomeFrentista,'
      #9'v.Total,'
      #9'COALESCE(v.PercComissao, 0) AS PercComissao,'
      #9'COALESCE(v.VrComissao, 0) AS VrComissao'
      'FROM Vendas AS v'
      'INNER JOIN Frentistas AS f ON f.Id = v.IdFrentista'
      'WHERE'
      #9'--v.DataHora BETWEEN '#39'2021-08-20'#39' AND '#39'2021-08-25'#39
      #9'v.DataHora BETWEEN :DataInicial AND :DataFinal'
      ')AS x'
      'GROUP BY'
      #9'x.IdFrentista, x.NomeFrentista')
    Left = 568
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
