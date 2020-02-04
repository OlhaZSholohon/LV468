USE [TestDBDataMart]
GO

IF OBJECT_ID('datamart.FactOrders') IS NOT NULL
	DROP TABLE datamart.FactOrders

CREATE TABLE [datamart].[FactOrders](
	[OrderID] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[GarantyID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[DiscountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[AmountProducts] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[TotalPriceDiscount] [decimal](18, 2) NULL,
	[EndGaranty] [date] NULL
) ON [PRIMARY]
GO