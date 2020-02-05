USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[StagingDates] FOR [TestDBStage].[staging].[DimDates]
GO