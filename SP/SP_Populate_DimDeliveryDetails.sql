IF OBJECT_ID('dbo.DimDeliveryDetails', 'U') IS NOT NULL 
DROP TABLE dbo.DimDeliveryDetails;
CREATE TABLE DimDeliveryDetails(
DeliveryDetailID INT NOT NULL PRIMARY KEY IDENTITY(1,1),  StatusDelivery BIT
 )
--exec SP_Populate_DimDeliveryDetails 100
CREATE OR ALTER PROCEDURE SP_Populate_DimDeliveryDetails
  @NumberOfRows INT
AS
DECLARE @Loop INT; -- ітератор   
SET @Loop = 1;
WHILE @Loop <= @NumberOfRows
BEGIN 
INSERT INTO DimDeliveryDetails (StatusDelivery)
VALUES ( 
           round( rand()*1,0)
        )
SET @Loop = @Loop + 1 
END
select * from DimDeliveryDetails