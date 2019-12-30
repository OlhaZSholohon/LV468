IF OBJECT_ID('dbo.FactDeliveries') IS NOT NULL
	DROP TABLE dbo.FactDeliveries

CREATE TABLE FactDeliveries(
 DateKey INT NOT NULL 
 , DeliveryDetailID INT NOT NULL 
 , ProductID INT NOT NULL
 , LocationID INT NOT NULL 
 , ClientID INT NOT NULL
 , SumWeight DECIMAL
)