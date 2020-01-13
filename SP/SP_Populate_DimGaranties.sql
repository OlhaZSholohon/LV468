--USE TestDBStage;

/*IF OBJECT_ID('staging.DimGaranties') IS NOT NULL
	DROP TABLE staging.DimGaranties
CREATE TABLE staging.DimGaranties(
   GarantyID INT NOT NULL IDENTITY(1,1)
 , NameGaranty NVARCHAR(255)
 , Duration NVARCHAR(255)
 , PriceGaranty NVARCHAR(255)
 , DescriptionGaranty NVARCHAR(MAX)
)
*/

USE TestDBStage;
GO
--exec SP_PopulateDimGaranties 100;

GO
CREATE OR ALTER PROCEDURE SP_PopulateDimGaranties 
  @NumberOfRows INT
AS

DECLARE @Loop INT,
        @InsertedRows INT,
        @RandValue INT,
        @RowsForWhile INT,
		@WarrantyRandName NVARCHAR(50);

SET @Loop = 1;
SET @RandValue = round( rand()*123, 0)



;WITH CTE_TempDictionary as (
SELECT 'Standard Manufacturer''s warranty' AS NameGaranty, 'Some description of warranty - 1' AS DescriptionGaranty
union all 
SELECT 'Full manufacturer''s warranty' AS NameGaranty, 'Some description of warranty - 2' AS DescriptionGaranty
union all 
SELECT 'Manufacturer''s special warranty' AS NameGaranty, 'Some description of warranty - 3' AS DescriptionGaranty
union all 
SELECT 'Additional reseller''s warranty' AS NameGaranty, 'Some description of warranty - 4' AS DescriptionGaranty
)

INSERT INTO staging.DimGaranties (NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
SELECT  c1.NameGaranty 
		, round( rand()*200, 0)
		, round( rand()*400, 0)
		, c2.DescriptionGaranty +CAST(@RandValue as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

-------------------------------
SELECT * 
INTO #TempDimGaranties
FROM staging.DimGaranties
-------------------------------

SET @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows


WHILE @Loop <= @RowsForWhile
BEGIN 
	SET @WarrantyRandName = (SELECT TOP 1 NameGaranty FROM #TempDimGaranties ORDER BY NEWID())
  INSERT INTO staging.DimGaranties (NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
  VALUES (
		@WarrantyRandName,
		round(rand()*150, 0),
		round(rand()*500, 0),
		'Some description of warranty - '+ CAST(round(rand()*150, 0) as nvarchar(10))
		)
  SET @Loop = @Loop + 1

END


