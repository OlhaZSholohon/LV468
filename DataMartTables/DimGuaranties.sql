USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimGuaranties]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimGuaranties]; 

CREATE TABLE [datamart].[DimGuaranties](
	[GuarantyID] [int] NULL,
	[NameGuaranty] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[PriceGuaranty] [int] NULL,
	[DescriptionGuaranty] [nvarchar](255) NULL
) 