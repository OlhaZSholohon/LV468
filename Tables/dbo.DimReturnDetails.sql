IF OBJECT_ID('dbo.DimReturnDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.DimReturnDetails;

CREATE TABLE DimReturnDetails(
 ReturnDetailID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , ReturnKind VARCHAR(100)
 , ReturnDescription VARCHAR(200)
)