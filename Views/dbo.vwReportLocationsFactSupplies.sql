USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[ReportLocationsFactSupplies]    Script Date: 3/1/2020 1:41:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[ReportLocationsFactSupplies]
AS
SELECT [SupplierID]
      ,[ProductID]
      ,[DateKey]
      ,[LocationID]
      ,[SumPrice]
      ,[AmountProducts]
  FROM [TestDBDataMart].[datamart].[FactSupplies]
GO


