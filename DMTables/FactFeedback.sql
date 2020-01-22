USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[FactFeedback];

CREATE TABLE [datamart].[FactFeedback](
	[date_id] [int] NOT NULL,
	[clients_id] [int] NOT NULL,
	[feedback_details_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[mean_raiting] [decimal] NULL
)
