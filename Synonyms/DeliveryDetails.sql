USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingDeliveryDetails] FOR [TestDBStage].[staging].[DimDeliveryDetails]
GO