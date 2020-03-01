USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_DimPayments]    Script Date: 3/1/2020 1:45:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_DimPayments] as

select 
	   [PaymentTypeID]
	  ,[PaymentType]
      ,[PaymentDescription]
      ,[InsertData]
       [UpdateData]
from datamart.DimPayments
GO


