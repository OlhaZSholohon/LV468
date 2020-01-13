USE [TestDBStage]
IF OBJECT_ID('[Staging].DimDeliveryDetails', 'U') IS NOT NULL 
DROP TABLE Staging.DimDeliveryDetails;
CREATE TABLE [Staging].DimDeliveryDetails(
DeliveryDetailID INT NOT NULL IDENTITY(1,1),  
StatusDelivery BIT
 )
--exec Staging.SP_Populate_DimDeliveryDetails 100
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Staging].[SP_Populate_DimDeliveryDetails]
  @NumberOfRows INT
AS
DECLARE @Loop INT;   
SET @Loop = 1;
WHILE @Loop <= @NumberOfRows
BEGIN 
INSERT INTO DimDeliveryDetails (StatusDelivery)
VALUES ( 
           round( rand()*1,0)
        )
SET @Loop = @Loop + 1 
END
  