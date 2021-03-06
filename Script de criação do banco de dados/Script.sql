USE [posto]
GO
/****** Object:  Table [dbo].[Bicos]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bicos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeBico] [varchar](50) NOT NULL,
	[IdBomba] [int] NOT NULL,
	[IdTanque] [int] NOT NULL,
	[IdCombustivel] [int] NULL,
 CONSTRAINT [PK_Bicos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bombas]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bombas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeBomba] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bombas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Combustiveis]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Combustiveis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeCombustivel] [varchar](50) NOT NULL,
	[PrecoPorLitro] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Combustiveis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entradas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataEntrada] [date] NOT NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[IdCombustivel] [int] NOT NULL,
	[IdTanque] [int] NOT NULL,
	[PrecoCustoLitro] [decimal](18, 3) NOT NULL,
	[PrecoCustoTotal] [decimal](18, 2) NOT NULL,
	[Quantidade] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_Entradas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Frentistas]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Frentistas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeFrentista] [varchar](50) NOT NULL,
	[PercComissao] [decimal](4, 2) NOT NULL CONSTRAINT [DF_Frentistas_PercComissao]  DEFAULT ((0)),
 CONSTRAINT [PK_Frentistas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TanquesCombustivel]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TanquesCombustivel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCombustivel] [int] NOT NULL,
	[NomeTanque] [varchar](50) NOT NULL,
	[Capacidade] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_TanquesCombustivel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioNome] [varchar](50) NOT NULL,
	[UsuarioSenha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendas]    Script Date: 27/08/2021 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBico] [int] NOT NULL,
	[IdFrentista] [int] NOT NULL,
	[IdTanque] [int] NOT NULL,
	[IdCombustivel] [int] NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[CustoPorLitro] [decimal](18, 3) NULL,
	[Quantidade] [decimal](18, 3) NOT NULL,
	[PrecoPorLitro] [decimal](18, 3) NOT NULL,
	[Total] [float] NOT NULL,
	[PercComissao] [decimal](4, 2) NULL,
	[VrComissao] [decimal](18, 2) NULL CONSTRAINT [DF_Vendas_VrComissao]  DEFAULT ((0)),
 CONSTRAINT [PK_vendas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bicos]  WITH CHECK ADD  CONSTRAINT [FK_Bicos_Bombas] FOREIGN KEY([IdBomba])
REFERENCES [dbo].[Bombas] ([Id])
GO
ALTER TABLE [dbo].[Bicos] CHECK CONSTRAINT [FK_Bicos_Bombas]
GO
ALTER TABLE [dbo].[Bicos]  WITH CHECK ADD  CONSTRAINT [FK_Bicos_Combustiveis] FOREIGN KEY([IdCombustivel])
REFERENCES [dbo].[Combustiveis] ([Id])
GO
ALTER TABLE [dbo].[Bicos] CHECK CONSTRAINT [FK_Bicos_Combustiveis]
GO
ALTER TABLE [dbo].[Bicos]  WITH CHECK ADD  CONSTRAINT [FK_Bicos_TanquesCombustivel] FOREIGN KEY([IdTanque])
REFERENCES [dbo].[TanquesCombustivel] ([Id])
GO
ALTER TABLE [dbo].[Bicos] CHECK CONSTRAINT [FK_Bicos_TanquesCombustivel]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Combustiveis] FOREIGN KEY([IdCombustivel])
REFERENCES [dbo].[Combustiveis] ([Id])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_Combustiveis]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_TanquesCombustivel] FOREIGN KEY([IdTanque])
REFERENCES [dbo].[TanquesCombustivel] ([Id])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_TanquesCombustivel]
GO
ALTER TABLE [dbo].[TanquesCombustivel]  WITH CHECK ADD  CONSTRAINT [FK_TanquesCombustivel_Combustiveis] FOREIGN KEY([IdCombustivel])
REFERENCES [dbo].[Combustiveis] ([Id])
GO
ALTER TABLE [dbo].[TanquesCombustivel] CHECK CONSTRAINT [FK_TanquesCombustivel_Combustiveis]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD  CONSTRAINT [FK_Vendas_Combustiveis] FOREIGN KEY([IdCombustivel])
REFERENCES [dbo].[Combustiveis] ([Id])
GO
ALTER TABLE [dbo].[Vendas] CHECK CONSTRAINT [FK_Vendas_Combustiveis]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD  CONSTRAINT [FK_Vendas_Frentistas] FOREIGN KEY([IdFrentista])
REFERENCES [dbo].[Frentistas] ([Id])
GO
ALTER TABLE [dbo].[Vendas] CHECK CONSTRAINT [FK_Vendas_Frentistas]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD  CONSTRAINT [FK_Vendas_TanquesCombustivel] FOREIGN KEY([IdTanque])
REFERENCES [dbo].[TanquesCombustivel] ([Id])
GO
ALTER TABLE [dbo].[Vendas] CHECK CONSTRAINT [FK_Vendas_TanquesCombustivel]
GO
