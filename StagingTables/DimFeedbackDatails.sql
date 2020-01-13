USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimFeedbackDatails]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimFeedbackDatails](
	[FeedbackDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL
) ON [PRIMARY]
GO