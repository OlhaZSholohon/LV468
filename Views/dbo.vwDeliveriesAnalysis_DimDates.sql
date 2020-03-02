USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwDeliveriesAnalysis_DimDates]    Script Date: 3/2/2020 4:05:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwDeliveriesAnalysis_DimDates]
AS SELECT Date, Day, Month, MonthNum, Year, Week, WeekDay, Quarter, IsWeekday
FROM datamart.DimDates
GO


