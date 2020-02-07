USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[FactSupplies] FOR [TestDBStage].[staging].[FactSupplies]
GO


