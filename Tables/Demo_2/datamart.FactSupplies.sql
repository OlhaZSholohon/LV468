USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[FactSupplies]    Script Date: 2/7/2020 5:59:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[FactSupplies](
	[SupplierID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateKey] [date] NOT NULL,
	[LocationID] [int] NOT NULL,
	[SumPrice] [decimal](18, 0) NULL,
	[AmountProducts] [int] NULL
) ON [PRIMARY]
GO


