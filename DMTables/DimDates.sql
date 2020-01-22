USE [TestDBDataMart];
DROP TABLE IF EXISTS [datamart].[DimDates];

CREATE TABLE [datamart].[DimDates](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Day] [int] NULL,
	[Month] [nvarchar](20) NULL,
	[MonthNum] [int] NULL,
	[Year] [int] NULL,
	[Week] [int] NULL,
	[WeekDay] [nvarchar](15) NULL,
	[Quarter] [int] NULL,
	[IsWeekday] [bit] NULL
) 
