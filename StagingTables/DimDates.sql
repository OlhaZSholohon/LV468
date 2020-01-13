USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimDates]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimDates](
	[DateKey] [int] NOT NULL,
	[Date] [nvarchar](255) NULL,
	[Day] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[MonthNum] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Week] [nvarchar](255) NULL,
	[WeekDay] [nvarchar](255) NULL,
	[Quarter] [nvarchar](255) NULL,
	[IsWeekday] [nvarchar](255) NULL
) ON [PRIMARY]
GO