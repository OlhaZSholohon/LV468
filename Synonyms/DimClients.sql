USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[DimClients] FOR [TestDBStage].[staging].[DimClients]
GO


