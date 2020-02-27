USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_FactFeedbacks] AS 
select [Date]
	,[ClientID]
	,[FeedbackDetailID]
	,[ProductID]
FROM [datamart].[FactFeedbacks]
GO


