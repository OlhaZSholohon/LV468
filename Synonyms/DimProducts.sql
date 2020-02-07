USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingProduct] FOR [TestDBStage].[staging].[DimSuppliers]
GO