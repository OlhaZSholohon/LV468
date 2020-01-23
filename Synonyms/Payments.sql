USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingPayments] FOR [TestDBStage].[staging].[DimPayments]
GO