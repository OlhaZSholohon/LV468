IF OBJECT_ID('dbo.FactReturns') IS NOT NULL
	DROP TABLE dbo.FactReturns

CREATE TABLE FactReturns(
 DateKey INT NOT NULL 
 , GarantyID INT NOT NULL
 , PaymentID INT NOT NULL 
 , ClientID INT NOT NULL 
 , ReturnDetailID INT NOT NULL 
 , ProductID INT NOT NULL 
)