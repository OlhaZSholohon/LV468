USE TestDBStage;

IF OBJECT_ID('staging.DimDiscounts') IS NOT NULL
	DROP TABLE staging.DimDiscounts

CREATE TABLE [staging].[DimDiscounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[StartDiscount] [nvarchar](255) NULL,
	[EndDiscount] [nvarchar](255) NULL,
	[PercentDiscount] [nvarchar](255) NULL,
	[DescriptionDiscount] [nvarchar](255) NULL
) 