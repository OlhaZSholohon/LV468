USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwClientSatisfaction_FactReturns] AS 
SELECT r.[Date]
	,r.[GarantyID]
	,r.[ClientId]
	,r.[ReturnDetailId]
	,r.[ProductId]
	,r.[IsGaranty]
FROM [datamart].[FactReturns] r
	INNER JOIN datamart.DimClients c
	ON r.ClientId = c.ClientKey
		INNER JOIN datamart.FactOrders o
		ON r.ProductId = o.ProductID
WHERE r.[Date] >= c.RegistrationDate
	--and
	--o.[Date] <= r.[Date]

GO


