USE [TestDBDataMart];
DROP TABLE IF EXISTS [datamart].[DimFeedbackDatails];

CREATE TABLE [datamart].[DimFeedbackDetails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [int] NULL
)