USE [TestDBStage]
GO
/****** Object:  StoredProcedure [staging].[SP_Populate_DimDiscounts]    Script Date: 2/21/2020 12:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [staging].[SP_Populate_DimDiscounts] 
  @NumberOfRows INT
AS

DECLARE @Loop INT,
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT;

SET @Loop = 1;
SET @RandValue = round( rand()*123,0)

;WITH CTE_TempDictionary as (
SELECT 1 as [DiscountID], 'DescriptionDiscount-1' AS DescriptionDiscount, round(rand()*50, 0) AS PercentDiscount
union all 
SELECT 2 as [DiscountID], 'DescriptionDiscount-2' AS DescriptionDiscount, round(rand()*10, 0) AS PercentDiscount
union all 
SELECT 3 as [DiscountID],'DescriptionDiscount-3' AS DescriptionDiscount, round(rand()*40, 0) AS PercentDiscount
union all 
SELECT 4 as [DiscountID],'DescriptionDiscount-4' AS DescriptionDiscount, round(rand()*20, 0) AS PercentDiscount
)

INSERT INTO staging.DimDiscounts (DiscountID, StartDiscount, EndDiscount, PercentDiscount, DescriptionDiscount )
SELECT  
		round(rand()*75000, 0),
		GETDATE(),
		CAST (DATEADD (DAY , round(rand()*100, 0) , GETDATE()) AS DATE),
		c1.PercentDiscount +round(rand()*120, 0),
		c2.DescriptionDiscount +CAST(@RandValue as nvarchar(10))

FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2


SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN 
  INSERT INTO staging.DimDiscounts (DiscountID, StartDiscount, EndDiscount, PercentDiscount, DescriptionDiscount )
  VALUES ( 
		  round(rand()*75000, 0),
		  CAST (DATEADD (DAY , -round(rand()*100, 0) , GETDATE()) AS DATE),
          CAST (DATEADD (DAY , round(rand()*100, 0) , GETDATE()) AS DATE),
          round(rand()*100, 0),
          'DescriptionDiscount-1' +CAST(round(rand()*100, 0) as nvarchar(10))
         )
  SET @Loop = @Loop + 1 
END
