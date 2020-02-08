IF OBJECT_ID('dbo.DimGaranties', 'U') IS NOT NULL 
  DROP TABLE dbo.DimGaranties; 

CREATE TABLE DimGuaranties(
   GarantyID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , NameGaranty VARCHAR(50)
 , Duration INT
 , PriceGaranty INT
 , DescriptionGaranty VARCHAR(200)
)