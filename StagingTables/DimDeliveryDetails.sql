USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimDeliveryDetails]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimDeliveryDetails](
	[DeliveryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDelivery] [nvarchar](255) NULL
) ON [PRIMARY]
GO