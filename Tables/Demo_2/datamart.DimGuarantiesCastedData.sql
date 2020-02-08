USE [TestDBDataMart];

IF OBJECT_ID('datamart.DimGuarantiesCastedData', 'U') IS NOT NULL 
  DROP TABLE datamart.DimGuarantiesCastedData; 

CREATE TABLE datamart.DimGuarantiesCastedData(
    [GuarantyID] [int],
	[NameGuaranty] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[PriceGuaranty] numeric (18, 2) NULL,
	[DescriptionGuaranty] [nvarchar](255) NULL
	
) 