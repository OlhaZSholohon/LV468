USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimDeliveryDetails]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimDeliveryDetails]; 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimDeliveryDetails](
	[DeliveryDetailID] [int] NULL,
	[StatusDelivery] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [datamart].[DimDeliveryDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO


