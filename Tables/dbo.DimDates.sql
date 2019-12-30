IF OBJECT_ID('dbo.DimDates', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDates; 

CREATE TABLE dbo.DimDates(
DateKey INT NOT NULL PRIMARY KEY
 , [Date] DATETIME
 , [Day] INT
 , [Month] VARCHAR(50)
 , MonthNum INT
 , [Year] INT
 , [Week] INT
 , [WeekDay] varchar(50)
 , [Quarter] INT
 , IsWeekday BIT
)