USE [TestDBDataMart];

IF OBJECT_ID('datamart.DimGuaranties', 'U') IS NOT NULL 
  DROP TABLE datamart.DimGuaranties; 

CREATE TABLE datamart.DimGuaranties(
    GarantyNewID INT IDENTITY NOT NULL
	, [GuarantyID] [int]
	, [NameGuaranty] [nvarchar](50) NULL
	, [Duration] [int] NULL
	, [PriceGuaranty] numeric (18, 2) NULL
	, [DescriptionGuaranty] [nvarchar](255) NULL
	, StartDate DATETIME
	, EndDate DATETIME
) 