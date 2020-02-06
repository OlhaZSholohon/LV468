USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[FactDelivery] FOR [TestDBStage].[staging].[FactDelivery]
GO