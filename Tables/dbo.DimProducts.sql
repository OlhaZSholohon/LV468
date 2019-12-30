IF OBJECT_ID('dbo.DimProducts', 'U') IS NOT NULL 
  DROP TABLE dbo.DimProducts; 

  CREATE TABLE dbo.DimProducts(
 ProductID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , ProductName VARCHAR(100)
 , CategoryName VARCHAR(50)
 , SubcategoryName VARCHAR(50)
 , BrandName VARCHAR(50)
 , Thicknes DECIMAL
 , [Weight] DECIMAL
 , ProductDescription NVARCHAR(MAX)
 , DefaultGaranty INT
 , DefaultGarantyName VARCHAR(50)
 , Price DECIMAL
)