USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[datamart].[DimSupplierErrors]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimSuppliers]; 

CREATE TABLE [datamart].[DimSupplierErrors](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[SupplierEmail] [nvarchar](255) NULL,
	[SupplierPhone] [nvarchar](255) NULL,
	[SupplierDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO