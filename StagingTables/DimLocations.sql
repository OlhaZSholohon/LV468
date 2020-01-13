USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimLocations]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Adress] [nvarchar](255) NULL,
	[PostNumber] [nvarchar](255) NULL,
	[DeliveryService] [nvarchar](255) NULL
) ON [PRIMARY]
GO