USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[DimSuppliers];

CREATE TABLE [datamart].[DimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[SupplierEmail] [nvarchar](50) NULL,
	[SupplierPhone] [nvarchar](20) NULL,
	[SupplierDescription] [nvarchar](255) NULL
) 