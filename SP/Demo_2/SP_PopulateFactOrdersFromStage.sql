CREATE PROCEDURE [datamart].[SP_Populate_datamartFactOrders_fromStage]
AS
DELETE  d
FROM [TestDBDataMart].[datamart].[FactOrders] d
JOIN [TestDBStage].[staging].[FactOrders] s ON d.[OrderID] = s.[OrderID]

  INSERT INTO  [TestDBDataMart].[datamart].[FactOrders]([OrderID]
      ,[Date]
      ,[PaymentID]
      ,[GarantyID]
      ,[ClientID]
      ,[DiscountID]
      ,[ProductID]
      ,[AmountProducts]
      ,[TotalPrice]
      ,[TotalPriceDiscount]
      ,[EndGaranty])

	SELECT o.[OrderID]
	  ,o.[Date]
      ,o.[PaymentID]
      ,o.[GarantyID]
      ,o.[ClientID]
      ,o.[DiscountID]
      ,o.[ProductID]
      ,o.[AmountProducts]
      ,o.[TotalPrice]
      ,o.[TotalPriceDiscount]
      ,o.[EndGaranty]
	FROM [TestDBDataMart].[datamart].[Orders] o
	  INNER JOIN [datamart].[DimDates] d ON o.[Date] = d.[Date]
	  INNER JOIN [datamart].[DimPayments] p ON o.PaymentID = p.PaymentTypeID
	  INNER JOIN [datamart].[DimGaranties] g ON o.GarantyID = g.GarantyID
      INNER JOIN [datamart].[DimClients] c ON o.ClientID = c.ClientKey
	  INNER JOIN [datamart].[DimDiscounts] ds ON o.DiscountID = ds.DiscountID
	  INNER JOIN [datamart].[DimProducts_SCD] pr ON o.ProductID = pr.ProductID
	WHERE pr.[EndDate] IS NULL 
			AND 
			g.[EndDate] IS NULL 
			AND
			c.[EndDate] IS NULL 