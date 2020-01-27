USE TestDBDataMart;

IF OBJECT_ID('errors.DimGarantiesErrors', 'U') IS NOT NULL 
  DROP TABLE errors.DimGarantiesErrors; 

CREATE TABLE errors.DimGarantiesErrors(
	GarantyNewID INT IDENTITY
 , GarantyID INT  
 , NameGaranty NVARCHAR(255)
 , Duration NVARCHAR(255)
 , PriceGaranty NVARCHAR(255)
 , DescriptionGaranty NVARCHAR(255)
)