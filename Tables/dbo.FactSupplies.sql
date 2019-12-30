IF OBJECT_ID('dbo.FactSupplies', 'U') IS NOT NULL 
  DROP TABLE dbo.FactSupplies; 

CREATE TABLE FactSupplies(
 SupplierID INT NOT NULL 
 , ProductID INT NOT NULL 
 , DateKey INT NOT NULL
 , LocationID INT NOT NULL 
 , SumPrice DECIMAL
 , AmountProducts INT
);