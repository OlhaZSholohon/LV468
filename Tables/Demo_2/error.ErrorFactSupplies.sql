USE [TestDBDataMart]
GO

/****** Object:  Table [error].[ErrorFactSupplies]    Script Date: 2/7/2020 6:01:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [error].[ErrorFactSupplies](
	[ErrorCode] [nvarchar](255) NULL,
	[ErrorDescription] [nvarchar](255) NULL,
	[SupplierID] [nvarchar](255) NULL,
	[ProductID] [nvarchar](255) NULL,
	[DateKey] [nvarchar](255) NULL,
	[LocationID] [nvarchar](255) NULL,
	[SumPrice] [nvarchar](255) NULL,
	[AmountProducts] [nvarchar](255) NULL
) ON [PRIMARY]
GO


