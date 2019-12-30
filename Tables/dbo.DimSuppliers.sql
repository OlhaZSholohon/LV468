IF OBJECT_ID('dbo.DimSuppliers', 'U') IS NOT NULL 
  DROP TABLE dbo.DimSuppliers; 

CREATE TABLE DimSuppliers(
 SupplierID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , SupplierName VARCHAR(100)
 , SupplierEmail VARCHAR(100)
 , SupplierPhone VARCHAR(100)
 , SupplierDescription VARCHAR(100)
)
 