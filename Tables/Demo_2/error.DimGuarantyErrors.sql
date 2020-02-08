USE TestDBDataMart;

IF OBJECT_ID('error.DimGuarantyErrors', 'U') IS NOT NULL 
  DROP TABLE error.DimGuarantyErrors; 

CREATE TABLE error.DimGuarantyErrors(
   GuarantyID INT  
 , NameGuaranty NVARCHAR(255)
 , Duration NVARCHAR(255)
 , PriceGuaranty NVARCHAR(255)
 , DescriptionGuaranty NVARCHAR(255)
 , ErrorDescription NVARCHAR(255)
 , ErrorDate DATETIME
)