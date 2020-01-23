USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimFeedbackDatails]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimFeedbackDatails]; 

CREATE TABLE [datamart].[DimFeedbackDetails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [int] NULL
)