USE [TestDBStage]
DROP TABLE IF EXISTS [staging].[DimSuppliers];
CREATE TABLE [staging].[DimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[SupplierEmail] [nvarchar](255) NULL,
	[SupplierPhone] [nvarchar](255) NULL,
	[SupplierDescription] [nvarchar](255) NULL
) 