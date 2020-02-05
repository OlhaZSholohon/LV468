USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[Payments] FOR [TestDBStage].[staging].[DimPayments]
GO