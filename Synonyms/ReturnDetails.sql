USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingReturnDetails] FOR [TestDBStage].[staging].[DimReturnDetails]
GO