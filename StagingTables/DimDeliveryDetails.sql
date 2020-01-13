USE [TestDBStage];
DROP TABLE IF EXISTS [staging].[DimDeliveryDetails];

CREATE TABLE [staging].[DimDeliveryDetails](
	[DeliveryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDelivery] [nvarchar](255) NULL
) 