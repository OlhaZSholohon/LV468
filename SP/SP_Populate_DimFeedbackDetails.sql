USE [TestDBStage]
GO
/****** Object:  StoredProcedure [staging].[SP_Populate_DimFeedbackDetails]    Script Date: 2/22/2020 10:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [staging].[SP_Populate_DimFeedbackDetails] 
	@NumberOfRows INT
AS
		
DECLARE @Loop INT,
		@InsertedRows INT,
		@RandValue INT,
		@RowsForWhile INT
		
SET @Loop = 1;
SET @RandValue = round( rand()*212,0)

;WITH CTE_TempDictionary as (
SELECT 1 as [FeedbackDetailID], 'Hello! This is feedback to product_name1' Comment, '6' AS Rating
union all
SELECT 2 as [FeedbackDetailID],'Hello! This is feedback to product_name2' Comment, '5' AS Rating
union all
SELECT 3 as [FeedbackDetailID],'Hello! This is feedback to product_name3' Comment, '4' AS Rating
union all
SELECT 4 as [FeedbackDetailID],'Hello! This is feedback to product_name4' Comment, '3' AS Rating
union all
SELECT 5 as [FeedbackDetailID],'Hello! This is feedback to product_name5' Comment, '2' AS Rating
union all
SELECT 6 as [FeedbackDetailID],'Hello! This is feedback to product_name6' Comment, '1' AS Rating
union all
SELECT 7 as [FeedbackDetailID],'Hello! This is feedback to product_name7' Comment, '0' AS Rating
)

INSERT INTO staging.DimFeedbackDetails(FeedbackDetailID,Comment,Rating)
SELECT c1.FeedbackDetailID, c1.Comment + CAST(@RandValue as nvarchar(10)),
	c2.Rating

FROM CTE_TempDictionary c1
CROSS JOIN 
CTE_TempDictionary c2

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
	INSERT INTO staging.DimFeedbackDetails([FeedbackDetailID], Comment,Rating)
	VALUES(
		1,
		'Comment-' + CAST(@Loop as nvarchar(10)),
		round(rand()*(6-1)+1,0)
		)
	SET @Loop = @Loop + 1
END
select * into #DimFeedbackDetails from staging.DimFeedbackDetails

truncate table [staging].[DimFeedbackDetails]

insert into staging.DimFeedbackDetails([FeedbackDetailID], [Comment], [Rating])
select abs(CHECKSUM([Rating], [Comment]))
      ,[Comment]
      ,[Rating]
  FROM #DimFeedbackDetails

