USE [TestDBStage]

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_Populate_DimReturnDetails') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_Populate_DimReturnDetails]

--exec SP_Populate_DimReturnDetails 100
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [staging].[SP_Populate_DimReturnDetails]   
 @NumberOfRows INT
AS

DECLARE @Loop INT, 
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT,
		@RandReturnKind NVARCHAR(50);


SET @Loop = 1;
SET @RandValue = round( rand()*123,0)

;WITH CTE_TempDictionary as (
SELECT '1' [ReturnDetailID], 'Repair' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 1' AS [ReturnDescription]
union all 
SELECT '2' [ReturnDetailID], 'Change product' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 2' AS [ReturnDescription]
union all 
SELECT '3' [ReturnDetailID], 'Return money' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 3' AS [ReturnDescription]
union all 
SELECT '4' [ReturnDetailID], 'Return money' [ReturnKind], 'Item arrives damaged, does not match the listing description, or is the wrong item - 3' AS [ReturnDescription]
)

INSERT INTO [staging].[DimReturnDetails] ([ReturnDetailID], [ReturnKind], [ReturnDescription])
SELECT   
       c1.[ReturnDetailID],
	   c1.[ReturnKind],
	   c2.[ReturnDescription]+CAST(@RandValue as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

SELECT * 
INTO #TempTable
FROM staging.DimReturnDetails

WHILE @Loop <= @RowsForWhile
BEGIN 
 
SET @RandReturnKind = (SELECT TOP 1 [ReturnKind] FROM #TempTable ORDER BY NEWID())

INSERT INTO [staging].[DimReturnDetails] ([ReturnDetailID], [ReturnKind], [ReturnDescription])
VALUES (  CAST(round(rand()*5000, 0) as nvarchar(255)),
          @RandReturnKind,
          'Item arrives damaged, does not match the listing description, or is the wrong item - ' + CAST(round(rand()*300, 0) as nvarchar(30))
       )
SET @Loop = @Loop + 1 
END

 

 