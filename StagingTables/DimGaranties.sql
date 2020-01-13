USE [TestDBStage];
DROP TABLE IF EXISTS [staging].[DimGaranties];
CREATE TABLE [staging].[DimGaranties](
	[GarantyID] [int] IDENTITY(1,1) NOT NULL,
	[NameGaranty] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[PriceGaranty] [nvarchar](255) NULL,
	[DescriptionGaranty] [nvarchar](255) NULL
) 