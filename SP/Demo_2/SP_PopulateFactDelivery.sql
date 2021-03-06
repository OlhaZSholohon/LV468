USE [TestDBDataMart]
GO
/****** Object:  StoredProcedure [datamart].[SP_PopulateFactDelivery]    Script Date: 2/7/2020 3:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [datamart].[SP_PopulateFactDelivery]
@NumberOfRows INT
AS
DECLARE @Loop INT
		, @Date DATE
		, @DeliveryDetails INT
		, @LocationID INT
		, @ClientID INT
		, @SumWeight DECIMAL(18, 2)
		;

SET @Loop = 1;

WHILE @Loop <= @NumberOfRows
BEGIN 

	SET @Date = (SELECT TOP 1 [Date] FROM [TestDBDataMart].[datamart].[DimDates] ORDER BY NEWID())
	SET @DeliveryDetails = (SELECT TOP 1 [DeliveryDetailID] FROM [TestDBDataMart].[datamart].[DimDeliveryDetails] ORDER BY NEWID())
	SET @LocationID = (SELECT TOP 1 [LocationID] FROM [TestDBDataMart].[datamart].[DimLocations] ORDER BY NEWID())
	SET @ClientID = (SELECT TOP 1 [ClientID] FROM [TestDBDataMart].[datamart].[DimClients] ORDER BY NEWID())
	SET @SumWeight = round(rand()*520, 2)

INSERT INTO datamart.FactDelivery (
				[DateKey],
				[DeliveryDetailID],
				[LocationID],
				[ClientID],
				[SumWeight])
VALUES(
		  @Date
		, @DeliveryDetails
		, @LocationID
		, @ClientID
		, @SumWeight
		)

	SET @Loop = @Loop + 1
END