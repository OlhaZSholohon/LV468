USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[ReportLocationsDimDates]    Script Date: 3/1/2020 1:05:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[ReportLocationsDimDates]
AS
SELECT [Date]
      ,[Day]
      ,[Month]
      ,[MonthNum]
      ,[Year]
      ,[Week]
      ,[WeekDay]
      ,[Quarter]
      ,[IsWeekday]
  FROM [TestDBDataMart].[datamart].[DimDates]
GO


