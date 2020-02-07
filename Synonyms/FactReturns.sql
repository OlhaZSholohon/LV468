USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[FactReturns] FOR [TestDBStage].[staging].[FactReturns]
GO
