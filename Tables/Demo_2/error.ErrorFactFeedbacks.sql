USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [error].[ErrorFactFeedbacks](
	[Date] nvarchar(255)
	,[ClientID] nvarchar(255)
	,[FeedbackDetailID] nvarchar(255)
	,[ProductID] nvarchar(255)
	,[MeanRatingProduct] nvarchar(255)
	,[ErrorComment] nvarchar(255)
) ON [PRIMARY]
GO


