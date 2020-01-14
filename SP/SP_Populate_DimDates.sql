USE TestDBStage;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_Populate_DimDates') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_Populate_DimDates]
GO

CREATE PROCEDURE staging.SP_Populate_DimDates

@StartDate date,
@EndDate date

AS

;WITH CTE_DateSequence
  AS
  (
	  SELECT @StartDate AS DateValue
	
	UNION ALL

	  SELECT DATEADD(DAY, 1, DateValue)
	  FROM CTE_DateSequence
	  WHERE DateValue < @EndDate
  )
  INSERT INTO staging.DimDates([Date], [Day], [Month], [MonthNum], [Year], [Week], [WeekDay], [Quarter], [IsWeekday])
  SELECT DateValue,
		DATEPART(day,DateValue),
		DATENAME(month,DateValue),
		DATEPART(month,DateValue),
		DATEPART(year,DateValue),
		DATEPART(week,DateValue),
		DATENAME(weekday,DateValue),
		DATEPART(quarter,DateValue),
		0
FROM CTE_DateSequence
OPTION (MAXRECURSION 1000)

-- 1 - is weekday
-- 0 - isn't weekday
UPDATE DimDates
SET IsWeekday = 1
WHERE (WeekDay = 'Saturday' OR WeekDay = 'Sunday');

GO