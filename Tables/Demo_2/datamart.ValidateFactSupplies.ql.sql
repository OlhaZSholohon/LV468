USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[ValidateFactSupplies]    Script Date: 2/7/2020 6:00:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[ValidateFactSupplies](
	[SupplierID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateKey] [date] NOT NULL,
	[LocationID] [int] NOT NULL,
	[SumPrice] [decimal](18, 0) NULL,
	[AmountProducts] [int] NULL
) ON [PRIMARY]
GO


