USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingDiscounts] FOR [TestDBStage].[staging].[DimDiscounts]
GO