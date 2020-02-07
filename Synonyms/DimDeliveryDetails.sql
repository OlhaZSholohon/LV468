USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[DimDeliveryDetails] FOR [TestDBStage].[staging].[DimDeliveryDetails]
GO
