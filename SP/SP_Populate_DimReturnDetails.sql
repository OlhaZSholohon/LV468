IF OBJECT_ID('dbo.DimReturnDetails', 'U') IS NOT NULL 
DROP TABLE dbo.DimReturnDetails;
CREATE TABLE DimReturnDetails(
 ReturnDetailID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , ReturnKind VARCHAR(100)
 , ReturnDescription VARCHAR(200)
)
--exec SP_Populate_DimReturnDetails 100
CREATE OR ALTER PROCEDURE SP_Populate_DimReturnDetails
  @NumberOfRows INT
AS

DECLARE @Loop INT, 
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT,
		@RandReturnKind NVARCHAR(30);


SET @Loop = 1;
SET @RandValue = round( rand()*123,0)

;WITH CTE_TempDictionary as (
SELECT 'Repair' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 1' AS [ReturnDescription]
union all 
SELECT 'Change product' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 2' AS [ReturnDescription]
union all 
SELECT 'Return money' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 3' AS [ReturnDescription]
)


INSERT INTO [DimReturnDetails] ([ReturnKind], [ReturnDescription])
SELECT   
       c1.[ReturnKind],
       c2.[ReturnDescription]+CAST(@RandValue as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

SELECT * 
INTO #TDimReturnDetails
FROM DimReturnDetails

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
SET @RandReturnKind = (SELECT TOP 1 ReturnKind FROM #TDimReturnDetails ORDER BY NEWID())
INSERT INTO [DimReturnDetails] ([ReturnKind], [ReturnDescription])
VALUES ( 
          @RandReturnKind,
          'Item arrives damaged, does not match the listing description, or is the wrong item - ' + CAST(round(rand()*300, 0) as nvarchar(10))
       )
SET @Loop = @Loop + 1 
END
