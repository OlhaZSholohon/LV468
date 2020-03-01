USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_FactReturns]    Script Date: 3/1/2020 1:54:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_FactReturns] as

select 
	   [ClientID]
      ,[Date]
      ,[ProductID]
      ,[ReturnDetailId]
from datamart.FactReturns
GO


