USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwDeliveriesAnalysis_FactDeliveries]    Script Date: 3/2/2020 4:02:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwDeliveriesAnalysis_FactDeliveries] AS
SELECT [DeliveryDetailID], [DateKey], [LocationID]
FROM [TestDBDataMart].[datamart].[FactDelivery] 
WHERE [DateKey] BETWEEN (SELECT MIN(DATE) FROM datamart.DimDates) AND (SELECT MAX(DATE) FROM datamart.DimDates)
GO


