USE [TestDBStage]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_PopulateDimFeedbackDetails') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_PopulateDimFeedbackDetails]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [staging].[SP_PopulateDimFeedbackDetails]
	@NumberOfRows INT
AS

DECLARE @Loop INT,
		@InsertedRows INT,
		@RandValue INT,
		@RowsForWhile INT

SET @Loop = 1;
SET @RandValue = round( rand()*212,0)

;WITH CTE_TempDictionary as (
SELECT 'Hello! This is feedback to product_name1' Comment, '5' AS Raiting
union all
SELECT 'Hello! This is feedback to product_name2' Comment, '4' AS Raiting
union all
SELECT 'Hello! This is feedback to product_name3' Comment, '2' AS Raiting
union all
SELECT 'Hello! This is feedback to product_name4' Comment, '1' AS Raiting
)

INSERT INTO staging.DimFeedbackDatails(Comment,Rating)
SELECT c1.Comment + CAST(@RandValue as nvarchar(10)),
	c2.Raiting

FROM CTE_TempDictionary c1
CROSS JOIN 
CTE_TempDictionary c2

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
	INSERT INTO staging.DimFeedbackDatails(Comment,Rating)
	VALUES(
		'Comment-' + CAST(@Loop as nvarchar(10)),
		round(rand()*(5-1)+1,0)
		)
	SET @Loop = @Loop + 1
END
