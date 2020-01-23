USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[FactOrder]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[FactOrder]; 

CREATE TABLE [datamart].[FactOrder](
	[numb_order] [int] NOT NULL,
	[date_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[garanty_id] [int] NOT NULL,
	[clients_id] [int] NOT NULL,
	[discount_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount_products] [int] NULL,
	[total_price] [decimal] NULL,
	[total_price_discount] [decimal] NULL,
	[end_garanty] [date] NULL
)
