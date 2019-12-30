IF OBJECT_ID('dbo.DimDeliveryDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDeliveryDetails;

CREATE TABLE DimDeliveryDetails(
 DeliveryDetailID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , StatusDelivery BIT
 )