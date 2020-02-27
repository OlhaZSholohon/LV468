USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_DimProducts] AS 
SELECT [ProductID]
	,[ProductName]
	,[CategoryName]
	,[SubcategoryName]
	,[BrandName]
	,[DefaultGaranty]
	,[Price]
FROM [datamart].[DimProducts_SCD]
WHERE EndDate IS NULL
GO


