inherited frmEntradas: TfrmEntradas
  ClientHeight = 323
  ClientWidth = 718
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 724
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 288
    Width = 718
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      718
      35)
    object btnFechar: TButton
      Left = 638
      Top = 3
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnExcluir: TButton
      Left = 557
      Top = 3
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = 'Excluir'
      TabOrder = 1
    end
    object btnAlterar: TButton
      Left = 476
      Top = 3
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
    end
    object btnIncluir: TButton
      Left = 395
      Top = 3
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
  end
  object DBGrid: TJvDBGrid
    Left = 0
    Top = 0
    Width = 718
    Height = 288
    Align = alClient
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
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
  object ds: TDataSource
    DataSet = qr
    Left = 468
    Top = 12
  end
  object qr: TFDQuery
    BeforeOpen = qrBeforeOpen
    AfterOpen = qrAfterOpen
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      
        #9'e.Id, c.NomeCombustivel, e.Quantidade, e.PrecoCustoTotal, e.Dat' +
        'aEntrada'
      'FROM Entradas AS e'
      'INNER JOIN Combustiveis AS c ON c.Id = e.IdCombustivel')
    Left = 468
    Top = 60
  end
end
