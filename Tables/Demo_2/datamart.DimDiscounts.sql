USE [TestDBDataMart]
GO

ALTER TABLE [datamart].[DimDiscounts] DROP CONSTRAINT [DF__DimDiscou__Creat__2057CCD0]
GO

/****** Object:  Table [datamart].[DimDiscounts]    Script Date: 2/7/2020 3:22:22 PM ******/
DROP TABLE [datamart].[DimDiscounts]
GO

/****** Object:  Table [datamart].[DimDiscounts]    Script Date: 2/7/2020 3:22:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimDiscounts](
	[DiscountID] [int] NULL,
	[StartDiscount] [date] NULL,
	[EndDiscount] [date] NULL,
	[PercentDiscount] [int] NULL,
	[DescriptionDiscount] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [datamart].[DimDiscounts] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO


