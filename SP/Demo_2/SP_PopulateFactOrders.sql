--USE [TestDBDataMart]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'datamart.SP_PopulateFactOrders') AND type in (N'P', N'PC'))
  DROP PROCEDURE [datamart].[SP_PopulateFactOrders]
GO

CREATE PROCEDURE datamart.SP_PopulateFactOrders 
  @NumberOfRows INT
AS

DECLARE @Loop INT,
        @RandValue INT,
		@TotalPriceDiscount DECIMAL(18, 2);

SET @Loop = 1;

WHILE @Loop <= @NumberOfRows
BEGIN 
	SET @TotalPriceDiscount = TRY_CAST (round(rand()*190, 2) AS decimal (18,2))
	INSERT INTO datamart.FactOrders (OrderID
									, DateKey
									, PaymentID
									, GarantyID
									, ClientID
									, DiscountID
									, ProductID
									, AmountProducts
									, TotalPrice
									, TotalPriceDiscount
									, EndGaranty)
  VALUES (
		round(rand()*70157, 0)
		, (SELECT TOP 1 [DateKey] FROM [TestDBStage].[staging].[DimDates] ORDER BY NEWID())
		, (SELECT TOP 1 [PaymentID] FROM [TestDBStage].[staging].[DimPayments] ORDER BY NEWID())
		, (SELECT TOP 1 [GarantyID] FROM [TestDBStage].[staging].[DimGaranties] ORDER BY NEWID())
		, (SELECT TOP 1 [ClientID] FROM [TestDBStage].[staging].[DimClients] ORDER BY NEWID())
		, (SELECT TOP 1 [DiscountID] FROM [TestDBStage].[staging].[DimDiscounts] ORDER BY NEWID())
		, (SELECT TOP 1 [ProductID] FROM [TestDBStage].[staging].[DimProducts] ORDER BY NEWID())
		, round(rand()*120, 0)
		, TRY_CAST(round(rand()*8700, 2) AS decimal (18,2)) + @TotalPriceDiscount
		, @TotalPriceDiscount
		, DATEADD (YEAR, 3, TRY_CAST((SELECT TOP 1 [Date] FROM [TestDBStage].[staging].[DimDates] ORDER BY NEWID()) AS date))
		)
  SET @Loop = @Loop + 1

END

--execute datamart.SP_PopulateFactOrders 200
