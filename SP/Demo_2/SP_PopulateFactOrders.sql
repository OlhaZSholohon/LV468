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
		, @GuarantyID INT
		, @ClientID INT
		, @DiscountID INT
		, @ProductID INT
		, @AmountProducts INT
		
--------- Addition variables -----------------
		, @GuarantyPrice DECIMAL (18, 2)
		, @ProductPrice DECIMAL (18, 2)
		, @Discount INT
		, @GuarantyDuration INT
		;

SET @Loop = 1;

WHILE @Loop <= @NumberOfRows
BEGIN 
	--------- Main variables --------------------
	SET @Date = (SELECT TOP 1 [Date] FROM [TestDBDataMart].[datamart].[DimDates] ORDER BY NEWID())
	SET @PaymentID = (SELECT TOP 1 [PaymentTypeID] FROM [TestDBDataMart].[datamart].[DimPayments] ORDER BY NEWID())
	SET @GuarantyID = (SELECT TOP 1 [GuarantyID] FROM [TestDBDataMart].[datamart].[DimGuaranties] ORDER BY NEWID())
	SET @ClientID = (SELECT TOP 1 [ClientID] FROM [TestDBDataMart].[datamart].[DimClients] ORDER BY NEWID())
	SET @DiscountID = (SELECT TOP 1 [DiscountID] FROM [TestDBDataMart].[datamart].[DimDiscounts] ORDER BY NEWID())
	SET @ProductID = (SELECT TOP 1 [ProductID] FROM [TestDBDataMart].[datamart].[DimProducts] ORDER BY NEWID())
	SET @AmountProducts = round(rand()*120, 0)
	
	--------- Addition variables -----------------
	SET @GuarantyPrice = TRY_CAST((SELECT g.PriceGuaranty  FROM [TestDBDataMart].[datamart].[DimGuaranties] g WHERE g.GuarantyID = @GuarantyID AND g.EndDate IS NULL) AS DECIMAL (10, 2))
	SET @ProductPrice = TRY_CAST((SELECT top 1 p.Price FROM [TestDBDataMart].[datamart].[DimProducts_SCD] p WHERE p.ProductID = @ProductID and p.EndDate is null) AS DECIMAL (10, 2))
	SET @Discount = TRY_CAST((SELECT d.PercentDiscount FROM [TestDBDataMart].[datamart].[DimDiscounts] d WHERE d.DiscountID = @DiscountID) AS INT)
	SET @GuarantyDuration = TRY_CAST((SELECT g.Duration  FROM [TestDBDataMart].[datamart].[DimGuaranties] g WHERE g.GuarantyID = @GuarantyID AND g.EndDate IS NULL) AS INT)

	INSERT INTO datamart.FactOrders (OrderID
									, [Date]
									, PaymentID
									, GuarantyID
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
		, @GuarantyID
		, @ClientID
		, @DiscountID
		, @ProductID
		, @AmountProducts
		, TRY_CAST((@AmountProducts * @ProductPrice + @GuarantyPrice) AS DECIMAL (10,2))
		, TRY_CAST(((@AmountProducts * @ProductPrice + @GuarantyPrice) * @Discount *0.1)/100 as decimal (10, 2))
		, DATEADD (DAY, @GuarantyDuration, @Date)
		)

	SET @Loop = @Loop + 1
END

DELETE f1
FROM datamart.FactOrders f1
WHERE (SELECT COUNT(*)
       FROM datamart.FactOrders f2
       WHERE f1.OrderID = f2.OrderID) > 1


--execute datamart.SP_PopulateFactOrders 20
