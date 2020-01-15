IF OBJECT_ID('staging.DimDates') IS NOT NULL
	DROP TABLE staging.DimDates

CREATE TABLE [staging].[DimDates](
	[DateKey] [int] IDENTITY NOT NULL,
	[Date] [nvarchar](255) NULL,
	[Day] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[MonthNum] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Week] [nvarchar](255) NULL,
	[WeekDay] [nvarchar](255) NULL,
	[Quarter] [nvarchar](255) NULL,
	[IsWeekday] [nvarchar](255) NULL
) 
