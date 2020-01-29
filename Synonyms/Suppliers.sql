USE [TestDBDataMart]
GO


CREATE SYNONYM [dbo].[Suppliers] FOR [TestDBStage].[staging].[DimSuppliers]
GO


