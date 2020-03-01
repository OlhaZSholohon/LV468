USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_FactSupplies]    Script Date: 3/1/2020 1:55:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[vwAnalyseReturnOfProducts_FactSupplies] as

select 
		[SupplierID]
	   ,[ProductID]
       ,[DateKey]
       ,[LocationID]
       ,[SumPrice]
        [AmountProducts]
from datamart.FactSupplies
GO


