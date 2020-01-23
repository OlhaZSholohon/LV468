USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingDates] FOR [TestDBStage].[staging].[DimDates]
GO