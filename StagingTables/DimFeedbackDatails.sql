USE [TestDBStage];
DROP TABLE IF EXISTS [staging].[DimFeedbackDatails];
CREATE TABLE [staging].[DimFeedbackDatails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL
) ON [PRIMARY]
GO