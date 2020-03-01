USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[ReportLocationsDimProducts_SCD]    Script Date: 3/1/2020 2:36:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[ReportLocationsDimProducts_SCD]
AS
SELECT  [ProductID]
      ,[ProductName]
      ,[CategoryName]
      ,[SubcategoryName]
      ,[BrandName]
      ,[Thicknes]
      ,[Weight]
      ,[ProductDescription]
      ,[DefaultGaranty]
      ,[DefaultGarantyName]
      ,[Price]
      ,[StartDate]
      ,[EndDate]
  FROM [TestDBDataMart].[datamart].[DimProducts_SCD]
  WHERE EndDate is Null
GO


