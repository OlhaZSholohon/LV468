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
        @RowsForWhile INT;

SET @Loop = 1;
SET @RandValue = round( rand()*123,0)
 
 --select round(rand()*1,0)


;WITH CTE_TempDictionary as (
SELECT 'Expenditures Expenditures Expenditures' [ReturnDescription], 'Repair' AS [ReturnKind]
union all 
SELECT 'Revenue Expenditures Revenue' [ReturnDescription], 'Change product' AS [ReturnKind]
union all 
SELECT 'Revenue Revenue Revenue Expenditures Expenditures' [ReturnDescription], 'Return money' AS [ReturnKind]
union all 
SELECT 'Revenue Revenue Expenditures Expenditures Revenue' [ReturnDescription], 'Repair' AS [ReturnKind]
union all 
SELECT 'Revenue Expenditures Revenue Revenue' [ReturnDescription], 'Change product' AS [ReturnKind]
union all 
SELECT 'Revenue Expenditures Expenditures Revenue Revenue' [ReturnDescription], 'Return money' AS [ReturnKind]
)


INSERT INTO [DimReturnDetails] ([ReturnKind], [ReturnDescription])
SELECT   
        c1.[ReturnKind],
	      c2.[ReturnDescription]
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
INSERT INTO [DimReturnDetails] ([ReturnKind], [ReturnDescription])
  VALUES ( 
          'Repair',
          'Revenue Expenditures Expenditures Revenue Revenue' 
         )
  SET @Loop = @Loop + 1 

 END
