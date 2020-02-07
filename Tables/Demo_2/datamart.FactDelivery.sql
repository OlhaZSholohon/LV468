USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[FactDelivery]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[FactDelivery]; 

CREATE TABLE [datamart].[FactDelivery](
	[DeliveryDetailID] [int] NOT NULL,
	[DateKey] [date] NOT NULL,
	[LocationID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[SumWeight] [decimal](18, 0) NULL
)
