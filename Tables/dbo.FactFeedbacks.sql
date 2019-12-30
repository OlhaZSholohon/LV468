IF OBJECT_ID('dbo.FactFeedbacks', 'U') IS NOT NULL 
  DROP TABLE dbo.FactFeedbacks; 

CREATE TABLE FactFeedbacks(
 DateKey INT NOT NULL 
 , ClientID INT NOT NULL 
 , FeedbackDetailID INT NOT NULL
 , ProductID INT NOT NULL 
)