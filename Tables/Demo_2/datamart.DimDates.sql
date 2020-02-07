USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimDates]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimDates]; 

CREATE TABLE [datamart].[DimDates](
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
