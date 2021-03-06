USE [TestDBDataMart]
GO
/****** Object:  StoredProcedure [datamart].[SP_RedirectDuplicatesFeedbacks]    Script Date: 2/7/2020 2:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [datamart].[SP_RedirectDuplicatesFeedbacks]
AS
-------INSERT------------
SELECT FeedbackDetailID, Comment, Rating 
INTO #FeedbacksDuplicates
FROM [datamart].[DimFeedbackDetailsCastedData] cd1
WHERE (SELECT COUNT(*)
       FROM datamart.DimFeedbackDetailsCastedData cd2
       WHERE cd1.FeedbackDetailID = cd2.FeedbackDetailID) > 1
--------------------------

INSERT INTO error.[DimFeedbackDetailsErrors] ([FeedbackDetailID],[Comment],[Rating],[ErrorDescription],[ErrorTime])
SELECT FeedbackDetailID, Comment, Rating, 'Error: duplicates in source file(s)', GETDATE() FROM #FeedbacksDuplicates;
-----------DELETE------
DELETE cd 
	FROM datamart.DimFeedbackDetailsCastedData cd
	INNER JOIN #FeedbacksDuplicates td
	ON cd.FeedbackDetailID = td.FeedbackDetailID
	--exec [datamart].[SP_RedirectDuplicatesFeedbacks]