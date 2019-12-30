IF OBJECT_ID('dbo.DimLocations', 'U') IS NOT NULL 
  DROP TABLE dbo.DimLocations; 

CREATE TABLE DimLocations(
 LocationID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , Country VARCHAR(50)
 , Region VARCHAR(50)
 , City VARCHAR(50)
 , Adress VARCHAR(100)
 , PostNumber INT
 , DeliveryService VARCHAR(50)
)