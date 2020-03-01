CREATE VIEW [dbo].[vwMostPopularProducts_FactOrders] AS 
SELECT [OrderID]
, [Date]
, [ClientID]
, [ProductID]
, [AmountProducts]
, [TotalPrice]
, [TotalPriceDiscount]
FROM [datamart].[FactOrders]
WHERE [TotalPrice] >= [TotalPriceDiscount]


