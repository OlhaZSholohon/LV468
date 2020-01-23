USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[DimProducts]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimProducts]; 

CREATE TABLE [datamart].[DimProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](50) NULL,
	[SubcategoryName] [nvarchar](100) NULL,
	[BrandName] [nvarchar](50) NULL,
	[Thicknes] [decimal] NULL,
	[Weight] [decimal] NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[DefaultGaranty] [int] NULL,
	[DefaultGarantyName] [nvarchar](50) NULL,
	[Price] [decimal] NULL
) 