USE [TestDBDataMart]
GO

CREATE SYNONYM [datamart].[StagingFeedbackDetails] FOR [TestDBStage].[staging].[DimFeedbackDetails]
GO