USE [TestDBDataMart];
DROP TABLE IF EXISTS [dm].[DimDates];

CREATE TABLE [dm].[DimDates](
	[DateKey] [int] IDENTITY(1, 1) NOT NULL,
	[Date] [datetime] NULL,
	[Day] [int] NULL,
	[Month] [nvarchar](10) NULL,
	[MonthNum] [int] NULL,
	[Year] [int] NULL,
	[Week] [int] NULL,
	[WeekDay] [nvarchar](10) NULL,
	[Quarter] [int] NULL,
	[IsWeekday] [bit] NULL
) 
