USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[DimSuppliers]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimSuppliers]; 

CREATE TABLE [datamart].[DimSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL
	,[SupplierKey] INT
	,[SupplierName] [nvarchar](20) NULL
	,[SupplierEmail] [nvarchar](40) NULL
	,[SupplierPhone] [nvarchar](18) NULL
	,[SupplierDescription] [nvarchar](255) NULL
	,ValidDateFrom DATETIME NOT NULL
	,ValidateTo DATETIME NULL
) 