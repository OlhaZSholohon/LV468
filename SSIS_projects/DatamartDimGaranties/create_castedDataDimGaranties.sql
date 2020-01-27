USE [TestDBDataMart];

IF OBJECT_ID('datamart.DimGarantiesCastedData', 'U') IS NOT NULL 
  DROP TABLE datamart.DimGarantiesCastedData; 

CREATE TABLE datamart.DimGarantiesCastedData(
    [GarantyID] [int],
	[NameGaranty] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[PriceGaranty] numeric (18, 2) NULL,
	[DescriptionGaranty] [nvarchar](255) NULL
	
) 