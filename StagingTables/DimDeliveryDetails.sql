

IF OBJECT_ID('staging.DimDeliveryDetails') IS NOT NULL
	DROP TABLE staging.DimDeliveryDetails

CREATE TABLE [staging].[DimDeliveryDetails](
	[DeliveryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDelivery] [nvarchar](255) NULL
) 