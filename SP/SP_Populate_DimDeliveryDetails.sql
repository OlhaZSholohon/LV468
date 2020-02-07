USE [TestDBStage]

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_Populate_DimDeliveryDetails') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_Populate_DimDeliveryDetails]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [staging].[SP_Populate_DimDeliveryDetails] 
@NumberOfRows INT
AS
DECLARE @Loop INT;   
SET @Loop = 1;
WHILE @Loop <= @NumberOfRows
BEGIN 
INSERT INTO staging.DimDeliveryDetails (DeliveryDetailID, StatusDelivery)
VALUES ( 
		 round( rand()*3000,0),
         round( rand()*1,0)
       )
SET @Loop = @Loop + 1 
END
  