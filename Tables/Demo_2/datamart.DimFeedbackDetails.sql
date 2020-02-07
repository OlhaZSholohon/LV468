USE [TestDBDataMart]
GO

ALTER TABLE [datamart].[DimFeedbackDetails] DROP CONSTRAINT [DF__DimFeedba__Creat__038683F8]
GO

/****** Object:  Table [datamart].[DimFeedbackDetails]    Script Date: 2/7/2020 3:21:23 PM ******/
DROP TABLE [datamart].[DimFeedbackDetails]
GO

/****** Object:  Table [datamart].[DimFeedbackDetails]    Script Date: 2/7/2020 3:21:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimFeedbackDetails](
	[FeedbackKey] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackDetailID] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [datamart].[DimFeedbackDetails] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO


