USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[DimDiscountsCastedData]    Script Date: 2/7/2020 3:24:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimDiscountsCastedData](
	[DiscountID] [int] NULL,
	[StartDiscount] [date] NULL,
	[EndDiscount] [date] NULL,
	[PercentDiscount] [int] NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) ON [PRIMARY]
GO


