IF OBJECT_ID('dbo.DimFeedbackDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDates; 
  
  
 CREATE TABLE DimFeedbackDetails(
 FeedbackDetailID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , Comment VARCHAR(MAX)
 , Rating INT
)