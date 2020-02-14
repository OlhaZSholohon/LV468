USE TestDBStage;
GO

IF OBJECT_ID('staging.DimSuppliers') IS NOT NULL
	DROP TABLE staging.DimSuppliers

CREATE TABLE [staging].[DimSuppliers](
	[SupplierID] [nvarchar](255) NULL,
	[SupplierName] [nvarchar](255) NULL,
	[SupplierEmail] [nvarchar](255) NULL,
	[SupplierPhone] [nvarchar](255) NULL,
	[SupplierDescription] [nvarchar](255) NULL
) 