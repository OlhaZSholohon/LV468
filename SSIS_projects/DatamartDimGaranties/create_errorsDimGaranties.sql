USE TestDBDataMart;

IF OBJECT_ID('errors.DimGarantiesErrors', 'U') IS NOT NULL 
  DROP TABLE errors.DimGarantiesErrors; 

CREATE TABLE errors.DimGarantiesErrors(
   GarantyID INT  
 , NameGaranty NVARCHAR(255)
 , Duration NVARCHAR(255)
 , PriceGaranty NVARCHAR(255)
 , DescriptionGaranty NVARCHAR(255)
 , ErrorDescription NVARCHAR(255)
)