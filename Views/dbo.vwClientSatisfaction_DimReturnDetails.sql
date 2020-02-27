USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_DimReturnDetails] AS 
select [ReturnDetailID]
	,[ReturnKind]
FROM [datamart].[DimReturnDetails]
GO