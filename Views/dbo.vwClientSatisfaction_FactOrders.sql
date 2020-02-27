USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_FactOrders] AS 
SELECT o.[OrderID]
	,o.[Date]
	,o.[GuarantyID]
	,o.[ClientID]
	,o.[DiscountID]
	,o.[ProductID]
FROM [datamart].[FactOrders] AS o
INNER JOIN datamart.DimClients AS c
ON o.ClientID = c.ClientID
WHERE o.[Date] >= c.RegistrationDate
GO