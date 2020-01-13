USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimSuppliers]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[DimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[SupplierEmail] [nvarchar](255) NULL,
	[SupplierPhone] [nvarchar](255) NULL,
	[SupplierDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO