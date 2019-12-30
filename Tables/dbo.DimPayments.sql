IF OBJECT_ID('dbo.DimPayments', 'U') IS NOT NULL 
  DROP TABLE dbo.DimPayments; 

CREATE TABLE DimPayments(
   PaymentID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , PaymentType VARCHAR(50)
 , PaymentDescription VARCHAR(200)
)