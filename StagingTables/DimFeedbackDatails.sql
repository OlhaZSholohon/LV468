USE [TestDBStage]
GO

/****** Object:  Table [staging].[DimFeedbackDetails]    Script Date: 2/7/2020 1:56:55 PM ******/
DROP TABLE [staging].[DimFeedbackDetails]
GO

/****** Object:  Table [staging].[DimFeedbackDetails]    Script Date: 2/7/2020 1:56:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[DimFeedbackDetails](
	[FeedbackDetailID] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL
) ON [PRIMARY]
GO


