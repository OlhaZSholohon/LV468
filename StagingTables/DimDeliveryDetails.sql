USE [TestDBStage]

IF OBJECT_ID('staging.DimDeliveryDetails') IS NOT NULL
	DROP TABLE staging.DimDeliveryDetails

CREATE TABLE [staging].[DimDeliveryDetails](
	[DeliveryDetailID] [nvarchar](255) NULL,
	[StatusDelivery] [nvarchar](255) NULL
) 