USE TestDBStage;

IF OBJECT_ID('staging.DimFeedbackDetails') IS NOT NULL
	DROP TABLE staging.DimFeedbackDetails


CREATE TABLE [staging].[DimFeedbackDetails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL
) ON [PRIMARY]
GO