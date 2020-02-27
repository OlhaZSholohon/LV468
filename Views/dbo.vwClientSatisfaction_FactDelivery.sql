USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_FactDelivery] AS 
SELECT f.DateKey
	,f.LocationID
	,f.ClientID
FROM datamart.FactDelivery f
INNER JOIN datamart.DimClients c
ON f.ClientID = c.ClientID
WHERE f.DateKey >= c.RegistrationDate
GO


