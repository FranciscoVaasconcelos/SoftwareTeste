inherited frmSimpleCrud: TfrmSimpleCrud
  Caption = 'frmSimpleCrud'
  ClientHeight = 335
  ClientWidth = 558
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 564
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 558
    Height = 335
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel1: TPanel
        Left = 0
        Top = 272
        Width = 550
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          550
          35)
        object btnFechar: TButton
          Left = 470
          Top = 3
          Width = 75
          Height = 28
          Anchors = [akRight, akBottom]
          Caption = 'Fechar'
          TabOrder = 0
          OnClick = btnFecharClick
        end
        object btnExcluir: TButton
          Left = 389
          Top = 3
          Width = 75
          Height = 28
          Anchors = [akRight, akBottom]
          Caption = 'Excluir'
          TabOrder = 1
          OnClick = btnExcluirClick
        end
        object btnAlterar: TButton
          Left = 308
          Top = 3
          Width = 75
          Height = 28
          Anchors = [akRight, akBottom]
          Caption = 'Alterar'
          TabOrder = 2
          OnClick = btnAlterarClick
        end
        object btnIncluir: TButton
          Left = 227
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
        Width = 550
        Height = 272
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGridDblClick
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        CanDelete = False
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      DesignSize = (
        550
        307)
      object btnCancelar: TButton
        Left = 472
        Top = 277
        Width = 75
        Height = 28
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnSalvar: TButton
        Left = 391
        Top = 277
        Width = 75
        Height = 28
        Anchors = [akRight, akBottom]
        Caption = '&Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
    end
  end
  object ds: TDataSource
    DataSet = qr
    Left = 524
    Top = 22
  end
  object qr: TFDQuery
    AfterOpen = qrAfterOpen
    Connection = DM.Conexao
    Left = 524
    Top = 72
  end
end
