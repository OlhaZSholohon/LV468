USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[Dates] FOR [TestDBStage].[staging].[DimDates]
GO