USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[FactDelivery];

CREATE TABLE [datamart].[FactDelivery](
	[date_id] [int] NOT NULL,
	[delivery_detail_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[clients_id] [int] NOT NULL,
	[sum_weight] [decimal] NULL
)
