
--CREATE TABLE [dbo].[DimAccount](
--	[AccountID] [int] IDENTITY(1,1) NOT NULL,
--  [AccountCodeAlternateKey] int NULL,
--	[AccountType] [nvarchar](50) NULL,
--	[AccountDescription] [nvarchar](50) NULL,
--  CreationDate [Date] NULL
-- CONSTRAINT [PK_DimAccount] PRIMARY KEY CLUSTERED  ([AccountID] ASC) 
--)

--exec SP_PopulateDimAccount 100
CREATE OR ALTER PROCEDURE SP_PopulateDimAccount 
  @NumberOfRows INT
AS

DECLARE @Loop INT,
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT;

SET @Loop = 1;
SET @RandValue = round( rand()*123,0)



;WITH CTE_TempDictionary as (
SELECT 'Expenditures' AccountType, 'Vehicles' AS AccountDescription
union all 
SELECT 'Revenue' AccountType, 'Interest Income' AS AccountDescription
union all 
SELECT 'Revenue' AccountType, 'Interest Expense' AS AccountDescription
union all 
SELECT 'Balances' AccountType, 'Average Unit Price' AS AccountDescription
)


INSERT INTO DimAccount (AccountCodeAlternateKey, AccountType, AccountDescription, CreationDate )
SELECT  round( rand()*200,0), 
        c1.AccountType +CAST(@RandValue as nvarchar(10)),
	      c2.AccountDescription +CAST(@RandValue as nvarchar(10)),
        GETDATE()
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
  INSERT INTO DimAccount (AccountCodeAlternateKey, AccountType, AccountDescription, CreationDate )
  VALUES ( round( rand()*100,0),
          'Revenue - ' + CAST(@Loop as nvarchar(10)),
          'Discount ¹'+ CAST(@RandValue as nvarchar(10)),
           DateAdd(Day, Rand() * DateDiff(Day, '01/01/2019', '01/01/2020'), '01/01/2019')
         )
  SET @Loop = @Loop + 1 
END



