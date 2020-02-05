USE [TestDBDataMart];

IF OBJECT_ID('datamart.DimGaranties', 'U') IS NOT NULL 
  DROP TABLE datamart.DimGaranties; 

CREATE TABLE datamart.DimGaranties(
    GarantyNewID INT IDENTITY NOT NULL
	, [GarantyID] [int]
	, [NameGaranty] [nvarchar](50) NULL
	, [Duration] [int] NULL
	, [PriceGaranty] numeric (18, 2) NULL
	, [DescriptionGaranty] [nvarchar](255) NULL
	, StartDate DATETIME
	, EndDate DATETIME
) 