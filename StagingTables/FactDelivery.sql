IF OBJECT_ID('staging.FactDelivery') IS NOT NULL
	DROP TABLE staging.FactDelivery

CREATE TABLE [staging].[FactDelivery](
	[DeliveryDetailID] [nvarchar](255) NULL,
	[DateKey] [nvarchar](255) NULL,
	[LocationID] [nvarchar](255) NULL,
	[ClientId] [nvarchar](255) NULL,
	[SumWeight] [nvarchar](255) NULL
)