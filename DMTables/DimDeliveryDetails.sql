USE [TestDBDataMart];
DROP TABLE IF EXISTS [datamart].[DimDeliveryDetails];

CREATE TABLE [datamart].[DimDeliveryDetails](
	[DeliveryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDelivery] [bit] NULL
) 