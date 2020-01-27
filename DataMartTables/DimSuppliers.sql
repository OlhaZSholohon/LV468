USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[datamart].[DimSuppliers]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimSuppliers]; 
GO

CREATE TABLE [datamart].[DimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierKey] [int] NOT NULL,
	[SupplierName] [nvarchar](20) NULL,
	[SupplierEmail] [nvarchar](40) NULL,
	[SupplierPhone] [nvarchar](18) NULL,
	[SupplierDescription] [nvarchar](255) NULL,
	[ValidDateFrom] [datetime] NOT NULL,
	[ValidDateTo] [datetime] NULL
) ON [PRIMARY]
GO