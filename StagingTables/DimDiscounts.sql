USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimDiscounts]    Script Date: 09-Jan-20 13:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimDiscounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[StartDiscount] [nvarchar](255) NULL,
	[EndDiscount] [nvarchar](255) NULL,
	[PercentDiscount] [nvarchar](255) NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) ON [PRIMARY]
GO