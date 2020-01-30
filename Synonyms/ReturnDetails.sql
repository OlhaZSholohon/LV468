USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[DimReturnDetails] FOR [TestDBStage].[staging].[DimReturnDetails]
GO
