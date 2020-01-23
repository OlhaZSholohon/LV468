USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimDeliveryDetails]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimDeliveryDetails]; 

CREATE TABLE [datamart].[DimDeliveryDetails](
	[DeliveryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDelivery] [bit] NULL
) 