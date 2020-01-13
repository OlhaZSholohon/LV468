USE TestDBStage;
---exec SP_PopulateDimDiscounts 100
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_PopulateDimDiscounts') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_PopulateDimDiscounts]
  go

CREATE PROCEDURE staging.SP_PopulateDimDiscounts 
  @NumberOfRows INT
AS

DECLARE @Loop INT,
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT;

SET @Loop = 1;
SET @RandValue = round( rand()*123,0)

;WITH CTE_TempDictionary as (
SELECT 'DescriptionDiscount-1' AS DescriptionDiscount, round(rand()*50, 0) AS PercentDiscount
union all 
SELECT 'DescriptionDiscount-2' AS DescriptionDiscount, round(rand()*10, 0) AS PercentDiscount
union all 
SELECT 'DescriptionDiscount-3' AS DescriptionDiscount, round(rand()*40, 0) AS PercentDiscount
union all 
SELECT 'DescriptionDiscount-4' AS DescriptionDiscount, round(rand()*20, 0) AS PercentDiscount
)

INSERT INTO staging.DimDiscounts (StartDiscount, EndDiscount, PercentDiscount, DescriptionDiscount )
SELECT  

		GETDATE(),
		CAST (DATEADD (DAY , round(rand()*100, 0) , GETDATE()) AS DATE),
		c1.PercentDiscount +round(rand()*100, 0),
		c2.DescriptionDiscount +CAST(@RandValue as nvarchar(10))

FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2


SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
  INSERT INTO staging.DimDiscounts (StartDiscount, EndDiscount, PercentDiscount, DescriptionDiscount )
  VALUES ( CAST (DATEADD (DAY , -round(rand()*100, 0) , GETDATE()) AS DATE),
          CAST (DATEADD (DAY , round(rand()*100, 0) , GETDATE()) AS DATE),
          round(rand()*100, 0),
          'DescriptionDiscount-1' +CAST(round(rand()*100, 0) as nvarchar(10))
         )
  SET @Loop = @Loop + 1 
END
GO