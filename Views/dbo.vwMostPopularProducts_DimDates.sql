CREATE VIEW [dbo].[vwMostPopularProducts_DimDates] AS 
SELECT [Date], [Day], [Month], [MonthNum], [Year], [Week], [WeekDay], [Quarter], [IsWeekday]
FROM [datamart].[DimDates]


