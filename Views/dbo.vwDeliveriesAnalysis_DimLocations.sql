USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwDeliveriesAnalysis_DimLocations]    Script Date: 3/2/2020 4:06:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vwDeliveriesAnalysis_DimLocations] AS
SELECT [LocationID], [Country], [Region], [City], [Adress]
FROM [datamart].[DimLocations]
GO


