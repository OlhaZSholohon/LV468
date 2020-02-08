IF OBJECT_ID('staging.DimGuaranties') IS NOT NULL
	DROP TABLE staging.DimGuaranties



CREATE TABLE [staging].[DimGuaranties](
	[GuarantyID] [int]  NULL,
	[NameGuaranty] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[PriceGuaranty] [nvarchar](255) NULL,
	[DescriptionGuaranty] [nvarchar](255) NULL
) 