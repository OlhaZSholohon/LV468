USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwClientSatisfaction_DimFeedbackDetails] AS 
SELECT [FeedbackKey], [FeedbackDetailID], [Rating]
FROM [datamart].[DimFeedbackDetails]
GO


