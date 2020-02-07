USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimDiscounts]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimDiscounts]; 

CREATE TABLE [datamart].[DimDiscounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[StartDiscount] [date] NULL,
	[EndDiscount] [date] NULL,
	[PercentDiscount] [int] NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) 