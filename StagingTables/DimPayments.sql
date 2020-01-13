USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimPayments]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](255) NULL,
	[PaymentDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO