USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[DimFeedbackDetailsCastedData]    Script Date: 2/7/2020 3:24:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimFeedbackDetailsCastedData](
	[FeedbackDetailID] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [int] NULL
) ON [PRIMARY]
GO


