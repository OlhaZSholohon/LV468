USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingSuppliers] FOR [TestDBStage].[staging].[DimSuppliers]
GO


