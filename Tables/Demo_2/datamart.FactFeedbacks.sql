USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[FactFeedbacks](
	[Date] [date] NOT NULL
	,[ClientID] [int] NOT NULL
	,[FeedbackDetailID] [int] NOT NULL
	,[ProductID] [int] NOT NULL
	,[MeanRatingProduct] [int] NOT NULL
) ON [PRIMARY]
GO


