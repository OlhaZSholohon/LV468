USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingLocations] FOR [TestDBStage].[staging].[DimLocations]
GO