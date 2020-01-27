IF OBJECT_ID('staging.DimGaranties') IS NOT NULL
	DROP TABLE staging.DimGaranties



CREATE TABLE [staging].[DimGaranties](
	[GarantyID] [int],
	[NameGaranty] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[PriceGaranty] [nvarchar](255) NULL,
	[DescriptionGaranty] [nvarchar](255) NULL
) 