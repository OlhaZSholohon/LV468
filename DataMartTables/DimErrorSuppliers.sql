USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[ErrorDimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL
	,[SupplierKey] [int] NOT NULL
	,[SupplierName] [nvarchar](255) NULL
	,[SupplierEmail] [nvarchar](255) NULL
	,[SupplierPhone] [nvarchar](255) NULL
	,[SupplierDescription] [nvarchar](255) NULL
	,[ErrorComment] nvarchar(50) NULL
) ON [PRIMARY]
GO