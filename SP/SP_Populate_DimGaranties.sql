--USE TestNoFK;

/*IF OBJECT_ID('dbo.DimGaranties') IS NOT NULL
	DROP TABLE dbo.DimGaranties
CREATE TABLE DimGaranties(
   GarantyID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , NameGaranty VARCHAR(50)
 , Duration INT
 , PriceGaranty INT
 , DescriptionGaranty VARCHAR(200)
)
*/


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

INSERT INTO DimGaranties (NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
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
FROM DimGaranties
-------------------------------

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows


WHILE @Loop <= @RowsForWhile
BEGIN 
	SET @WarrantyRandName = (SELECT TOP 1 NameGaranty FROM #TempDimGaranties ORDER BY NEWID())
  INSERT INTO DimGaranties (NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
  VALUES (
		@WarrantyRandName,
		round(rand()*150, 0),
		round(rand()*500, 0),
		'Some description of warranty - '+ CAST(round(rand()*150, 0) as nvarchar(10))
		)
  SET @Loop = @Loop + 1

END


