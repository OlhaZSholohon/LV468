USE [TestDBDataMart]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [datamart].[SP_PopulateFactFeedbacks] @Date DATE, 
                                             @ClientID INT, 
                                             @FeedbackDetailID INT,
											 @ProductID INT,
											 @MeanRatingProduct INT

AS


DELETE 
FROM [datamart].[FactFeedbacks]
WHERE [DATE] = @Date
	  AND
	  [ClientID] = @ClientID
	  AND
	  FeedbackDetailID = @FeedbackDetailID
	  AND
	  ProductID = @ProductID

INSERT INTO [datamart].[FactFeedbacks]
VALUES (@Date, @ClientID, @FeedbackDetailID, @ProductID, @MeanRatingProduct)
GO

