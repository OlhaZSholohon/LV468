USE [TestDBDataMart];

DROP TABLE IF EXISTS [datamart].[DimDiscounts];

CREATE TABLE [datamart].[DimDiscounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[StartDiscount] [date] NULL,
	[EndDiscount] [date] NULL,
	[PercentDiscount] [int] NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) 