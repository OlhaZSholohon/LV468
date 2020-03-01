USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_DimReturnDetails]    Script Date: 3/1/2020 1:53:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_DimReturnDetails] as

select 
	   [ReturnDetailID]
      ,[ReturnKind]
      ,[ReturnDescription]
      ,[CreatedDate]
       [UpdatedDate]
from datamart.DimReturnDetails
where UpdatedDate is null
GO


