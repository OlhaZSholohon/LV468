USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_DimLocations] AS 
SELECT LocationID
	,Country
	,Region
	,City
FROM datamart.DimLocations
GO


