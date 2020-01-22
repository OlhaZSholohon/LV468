USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[FactReturn];

CREATE TABLE [datamart].[FactReturn](
	[date_id] [int] NOT NULL,
	[garanty_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[clients_id] [int] NOT NULL,
	[return_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[is_garanty] [bit] NULL
)