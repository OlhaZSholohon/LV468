
USE TestDBStage;

--exec staging.SP_PopulateDimGaranties 5;

SET NOCOUNT ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_PopulateDimGaranties') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_PopulateDimGaranties]
GO
CREATE PROCEDURE staging.SP_PopulateDimGaranties 
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
SELECT round(rand()*27090, 0) AS GarantyID, 'Standard Manufacturer''s warranty' AS NameGaranty, 'Some description of warranty - 1' AS DescriptionGaranty
union all 
SELECT round(rand()*24507, 0) AS GarantyID, 'Full manufacturer''s warranty' AS NameGaranty, 'Some description of warranty - 2' AS DescriptionGaranty
union all 
SELECT round(rand()*79230, 0) AS GarantyID, 'Manufacturer''s special warranty' AS NameGaranty, 'Some description of warranty - 3' AS DescriptionGaranty
union all 
SELECT round(rand()*98102, 0) AS GarantyID,'Additional reseller''s warranty' AS NameGaranty, 'Some description of warranty - 4' AS DescriptionGaranty
)

INSERT INTO staging.DimGaranties (GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
SELECT TOP (TRY_CAST(0.5*@NumberOfRows as INT))
		c1.GarantyID
		, c1.NameGaranty 
		, round( rand()*200, 0)
		, round( rand()*400, 2)
		, c2.DescriptionGaranty +CAST(@RandValue as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2

SET @InsertedRows = @@ROWCOUNT
SET @RowsForWhile = @NumberOfRows - @InsertedRows
-------------------------------
SELECT * 
INTO #TempDimGaranties
FROM staging.DimGaranties
-------------------------------

WHILE @Loop <= @RowsForWhile
BEGIN 
	SET @WarrantyRandName = (SELECT TOP 1 NameGaranty FROM #TempDimGaranties ORDER BY NEWID())
  INSERT INTO staging.DimGaranties (GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
  VALUES (
		round(rand()*90157, 0),
		@WarrantyRandName,
		round(rand()*150, 0),
		round(rand()*505, 2),
		'Some description of warranty - '+ CAST(round(rand()*150, 0) as nvarchar(10))
		)
  SET @Loop = @Loop + 1

END


