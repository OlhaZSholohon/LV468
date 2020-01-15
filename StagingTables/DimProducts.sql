IF OBJECT_ID('staging.DimProducts') IS NOT NULL
	DROP TABLE staging.DimProducts

CREATE TABLE [staging].[DimProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[CategoryName] [nvarchar](255) NULL,
	[SubcategoryName] [nvarchar](255) NULL,
	[BrandName] [nvarchar](255) NULL,
	[Thicknes] [nvarchar](255) NULL,
	[Weight] [nvarchar](255) NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[DefaultGaranty] [nvarchar](255) NULL,
	[DefaultGarantyName] [nvarchar](255) NULL,
	[Price] [nvarchar](255) NULL
) 