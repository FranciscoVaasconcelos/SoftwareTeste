object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 246
  Width = 416
  object MSSQLDriver: TFDPhysMSSQLDriverLink
    Left = 80
    Top = 12
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=posto'
      'User_Name=sa'
      'Password=123456'
      'Server=DESKTOP-PKFC5M5\SQL_MGV6'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    AfterConnect = ConexaoAfterConnect
    Left = 16
    Top = 12
  end
  object xWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 148
    Top = 12
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'SelectDadosBicoComb'
        SQL.Strings = (
          'SELECT  '
          #9'b.ID AS IDBicoBomba,'
          #9'c.NomeCombustivel,'
          #9'c.PrecoPorLitro,'
          #9't.NomeTanque'
          'FROM Bicos AS b'
          'JOIN TanquesCombustivel AS t ON t.Id = b.IdTanque'
          'JOIN Combustiveis AS c ON c.Id = t.IdCombustivel'
          'WHERE b.Id = 1')
      end
      item
        Name = 'SelectQuantidadeAtualTanque'
        SQL.Strings = (
          'SELECT '
          
            #9'(SELECT Capacidade FROM TanquesCombustivel WHERE Id = :IDTanque' +
            ') AS Capacidade, '
          
            #9'(SELECT Capacidade FROM TanquesCombustivel WHERE Id = :IDTanque' +
            ') * 0.02 AS QntMinima,'
          
            #9'COALESCE((SELECT SUM(Quantidade) FROM Entradas WHERE IdCombusti' +
            'vel = :IDComb), 0) - COALESCE((SUM(x.Quantidade)), 0) AS QtdAtua' +
            'l'
          'FROM(SELECT'
          #9'v.*'
          'FROM Vendas AS v'
          'JOIN Combustiveis AS c ON c.Id = v.IdCombustivel'
          'JOIN TanquesCombustivel AS t ON t.Id = v.IdTanque'
          'WHERE'
          #9't.Id = :IDTanque) AS x'
          #9'--:IDTanque')
      end
      item
        Name = 'SelectDadosCombustivelParaVenda'
        SQL.Strings = (
          'SELECT'
          #9'b.ID AS IDBicoBomba,'
          #9'c.NomeCombustivel,'
          #9'c.PrecoPorLitro,'
          #9't.ID AS IdTanque,'
          #9't.NomeTanque,'
          '        t.Capacidade,'
          #9'c.Id AS IDComb,'
          
            #9'(SELECT COALESCE(AVG(x.PrecoCustoLitro), 0) AS CustoMedio FROM(' +
            'SELECT * FROM Entradas WHERE IdTanque = :ID )AS x)AS CustoMedio'
          'FROM Bicos AS b'
          'JOIN TanquesCombustivel AS t ON t.Id = b.IdTanque'
          'JOIN Combustiveis AS c ON c.Id = t.IdCombustivel'
          'WHERE '
          #9'b.ID = :ID')
      end
      item
        Name = 'SelectQuantidadeAtualNoTanque'
        SQL.Strings = (
          'SELECT'
          #9'* '
          'FROM(SELECT'
          
            #9#9'(x.QuantidadeComprada - x.QuantidadeTotalVendida) AS QuantAtua' +
            'lNoTanque,'
          '        Capacidade'
          #9'FROM(SELECT'
          
            #9#9'(SELECT Capacidade FROM TanquesCombustivel WHERE Id = :ID) AS ' +
            'Capacidade, '
          #9#9'(SUM(v.Quantidade)) AS QuantidadeTotalVendida, '
          
            #9#9'(SELECT(SUM(Entradas.Quantidade))FROM Entradas WHERE IdTanque ' +
            '= :ID)AS QuantidadeComprada'
          #9'FROM Vendas AS v'
          #9'INNER JOIN TanquesCombustivel AS t ON t.Id = v.IdTanque'
          #9'WHERE'
          #9#9't.Id = :ID'
          #9#9')AS x'
          #9') AS xx')
      end>
    Connection = Conexao
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 32
    Top = 128
  end
  object SQL_Relatorios: TFDScript
    SQLScripts = <>
    Connection = Conexao
    Params = <>
    Macros = <>
    Left = 36
    Top = 76
  end
end
