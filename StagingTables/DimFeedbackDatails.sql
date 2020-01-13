USE TestDBStage;

IF OBJECT_ID('staging.DimFeedbackDatails') IS NOT NULL
	DROP TABLE staging.DimFeedbackDatails


CREATE TABLE [staging].[DimFeedbackDatails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL
) ON [PRIMARY]
GO