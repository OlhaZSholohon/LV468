USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimReturnDetails]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimReturnDetails](
	[ReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnKind] [nvarchar](255) NULL,
	[ReturnDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO