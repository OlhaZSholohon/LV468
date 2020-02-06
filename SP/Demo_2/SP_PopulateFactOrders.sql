--USE [TestDBDataMart]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'datamart.SP_PopulateFactOrders') AND type in (N'P', N'PC'))
  DROP PROCEDURE [datamart].[SP_PopulateFactOrders]
GO

CREATE PROCEDURE datamart.SP_PopulateFactOrders 
  @NumberOfRows INT
AS
--------- Main variables --------------------
DECLARE @Loop INT
		, @Date DATE
		, @PaymentID INT
		, @GarantyID INT
		, @ClientID INT
		, @DiscountID INT
		, @ProductID INT
		, @AmountProducts INT
		
--------- Addition variables -----------------
		, @GarantyPrice DECIMAL (18, 2)
		, @ProductPrice DECIMAL (18, 2)
		, @Discount INT
		, @GarantyDuration INT
		;

SET @Loop = 1;

WHILE @Loop <= @NumberOfRows
BEGIN 
	--------- Main variables --------------------
	SET @Date = (SELECT TOP 1 [Date] FROM [TestDBDataMart].[datamart].[DimDates] ORDER BY NEWID())
	SET @PaymentID = (SELECT TOP 1 [PaymentTypeID] FROM [TestDBDataMart].[datamart].[DimPayments] ORDER BY NEWID())
	SET @GarantyID = (SELECT TOP 1 [GarantyID] FROM [TestDBDataMart].[datamart].[DimGaranties] g ORDER BY NEWID())
	SET @ClientID = (SELECT TOP 1 [ClientID] FROM [TestDBStage].[staging].[DimClients] ORDER BY NEWID())
	SET @DiscountID = (SELECT TOP 1 [DiscountID] FROM [TestDBStage].[staging].[DimDiscounts] ORDER BY NEWID())
	SET @ProductID = (SELECT TOP 1 [ProductID] FROM [TestDBDataMart].[datamart].[DimProducts] ORDER BY NEWID())
	SET @AmountProducts = round(rand()*120, 0)
	
	--------- Addition variables -----------------
	SET @GarantyPrice = TRY_CAST((SELECT g.PriceGaranty  FROM [TestDBDataMart].[datamart].[DimGaranties] g WHERE g.GarantyID = @GarantyID AND g.EndDate IS NULL) AS DECIMAL (18, 2))
	SET @ProductPrice = TRY_CAST((SELECT TOP 1 p.Price FROM [TestDBDataMart].[datamart].[DimProducts] p WHERE p.ProductID = @ProductID) AS DECIMAL (18, 2))
	SET @Discount = TRY_CAST((SELECT d.PercentDiscount FROM [TestDBDataMart].[datamart].[DimDiscounts] d WHERE d.DiscountID = @DiscountID) AS INT)
	SET @GarantyDuration = TRY_CAST((SELECT g.Duration  FROM [TestDBDataMart].[datamart].[DimGaranties] g WHERE g.GarantyID = @GarantyID AND g.EndDate IS NULL) AS INT)

	INSERT INTO datamart.FactOrders (OrderID
									, [Date]
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
		, @Date
		, @PaymentID
		, @GarantyID
		, @ClientID
		, @DiscountID
		, @ProductID
		, @AmountProducts
		, TRY_CAST((@AmountProducts * @ProductPrice + @GarantyPrice) AS DECIMAL (18,2))
		, TRY_CAST(((@AmountProducts * @ProductPrice + @GarantyPrice) * @Discount)/100 as decimal (18, 2))
		, DATEADD (DAY, @GarantyDuration, @Date)
		)

	SET @Loop = @Loop + 1
END

--execute datamart.SP_PopulateFactOrders 200
