USE [TestDBDataMart]
GO

/****** Object:  Table [error].[DimFeedbackDetailsErrors]    Script Date: 2/7/2020 3:27:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [error].[DimFeedbackDetailsErrors](
	[FeedbackDetailID] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL,
	[ErrorDescription] [nvarchar](255) NULL,
	[ErrorTime] [datetime] NULL
) ON [PRIMARY]
GO


