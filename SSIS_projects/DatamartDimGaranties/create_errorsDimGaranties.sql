USE TestDBDataMart;

IF OBJECT_ID('error.DimGarantyErrors', 'U') IS NOT NULL 
  DROP TABLE error.DimGarantyErrors; 

CREATE TABLE error.DimGarantyErrors(
   GarantyID INT  
 , NameGaranty NVARCHAR(255)
 , Duration NVARCHAR(255)
 , PriceGaranty NVARCHAR(255)
 , DescriptionGaranty NVARCHAR(255)
 , ErrorDescription NVARCHAR(255)
 , ErrorDate DATETIME
)