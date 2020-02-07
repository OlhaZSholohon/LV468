USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[FactSuply]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[FactSuply]; 

CREATE TABLE [datamart].[FactSuply](
	[date_id] [int] NOT NULL,
	[suplier_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[sum_price] [decimal] NULL,
	[amount_products] [int] NULL
)
