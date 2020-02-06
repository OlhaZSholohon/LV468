USE [TestDBStage]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[FactFeedbacks](
	[Date] [nvarchar](255) NULL,
	[ClientID] [nvarchar](255) NULL,
	[FeedbackDetailID] [nvarchar](255) NULL,
	[ProductID] [nvarchar](255) NULL,
	[MeanRatingProduct] [nvarchar](255) NULL
) ON [PRIMARY]
GO


