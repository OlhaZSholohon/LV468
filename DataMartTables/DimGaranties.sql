USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimGaranties]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimGaranties]; 

CREATE TABLE [datamart].[DimGaranties](
	[GarantyID] [int] IDENTITY(1,1) NOT NULL,
	[NameGaranty] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[PriceGaranty] [int] NULL,
	[DescriptionGaranty] [nvarchar](255) NULL
) 