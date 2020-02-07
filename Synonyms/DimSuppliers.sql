USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[DimSuppliers] FOR [TestDBStage].[staging].[DimSuppliers]
GO


