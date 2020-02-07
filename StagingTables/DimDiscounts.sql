USE [TestDBStage]
GO

/****** Object:  Table [staging].[DimDiscounts]    Script Date: 2/7/2020 1:58:20 PM ******/
DROP TABLE [staging].[DimDiscounts]
GO

/****** Object:  Table [staging].[DimDiscounts]    Script Date: 2/7/2020 1:58:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[DimDiscounts](
	[DiscountID] [int]  NULL,
	[StartDiscount] [nvarchar](255) NULL,
	[EndDiscount] [nvarchar](255) NULL,
	[PercentDiscount] [nvarchar](255) NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) ON [PRIMARY]
GO


