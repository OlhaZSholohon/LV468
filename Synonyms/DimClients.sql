USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingClients] FOR [TestDBStage].[staging].[DimClients]
GO