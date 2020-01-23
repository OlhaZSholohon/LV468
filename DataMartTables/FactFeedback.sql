USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[FactFeedback]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[FactFeedback]; 

CREATE TABLE [datamart].[FactFeedback](
	[date_id] [int] NOT NULL,
	[clients_id] [int] NOT NULL,
	[feedback_details_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[mean_raiting] [decimal] NULL
)
