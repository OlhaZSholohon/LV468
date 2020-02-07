USE [TestDBDataMart]
GO

/****** Object:  Table [error].[DimDiscountsErrors]    Script Date: 2/7/2020 3:27:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [error].[DimDiscountsErrors](
	[DiscountID] [int] NULL,
	[StartDiscount] [date] NULL,
	[EndDiscount] [date] NULL,
	[PercentDiscount] [int] NULL,
	[DescriptionDiscount] [nvarchar](255) NULL,
	[ErrorDescription] [nvarchar](255) NULL,
	[ErrorTime] [datetime] NULL
) ON [PRIMARY]
GO


