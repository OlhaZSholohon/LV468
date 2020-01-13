USE [TestDBStage]

IF OBJECT_ID('Staging.DimReturnDetails', 'U') IS NOT NULL 
DROP TABLE [Staging].DimReturnDetails;
CREATE TABLE [Staging].DimReturnDetails(
 ReturnDetailID INT NOT NULL  IDENTITY(1,1)
 , ReturnKind NVARCHAR(255)
 , ReturnDescription NVARCHAR(255)
)
--exec SP_Populate_DimReturnDetails 100
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER PROCEDURE [Staging].SP_Populate_DimReturnDetails
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


SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
 
SET @RandReturnKind = (
SELECT c1--AS [text()]
FROM( SELECT TOP (1) c1 FROM (VALUES ('Repair'), ('Change product'), ('Return money') ) AS S1(c1)
	ORDER BY ABS(CHECKSUM(NEWID()))
	) AS S2
--FOR XML PATH('')
);

 
INSERT INTO [DimReturnDetails] ([ReturnKind], [ReturnDescription])
VALUES ( 
          @RandReturnKind,
          'Item arrives damaged, does not match the listing description, or is the wrong item - ' + CAST(round(rand()*300, 0) as nvarchar(10))
       )
SET @Loop = @Loop + 1 
END

 