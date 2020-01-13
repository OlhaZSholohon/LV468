USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimGaranties]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimGaranties](
	[GarantyID] [int] IDENTITY(1,1) NOT NULL,
	[NameGaranty] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[PriceGaranty] [nvarchar](255) NULL,
	[DescriptionGaranty] [nvarchar](255) NULL
) ON [PRIMARY]
GO