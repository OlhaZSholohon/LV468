IF OBJECT_ID('[staging].[FactOrders]', 'U') IS NOT NULL 
  DROP TABLE [staging].[FactOrders]; 

CREATE TABLE [staging].[FactOrders](
	[OrderID] int IDENTITY NOT NULL,
	[Date] nvarchar (255) NOT NULL,
	[PaymentID] nvarchar (255) NULL,
	[GarantyID] nvarchar (255) NULL,
	[ClientID] nvarchar (255) NULL,
	[DiscountID] nvarchar (255) NULL,
	[ProductID] nvarchar (255) NULL,
	[AmountProducts] nvarchar (255) NULL,
	[TotalPrice] nvarchar (255) NULL,
	[TotalPriceDiscount] nvarchar (255) NULL,
	[EndGaranty] nvarchar (255) NULL)

