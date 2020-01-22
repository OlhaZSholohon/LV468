USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[DimReturnDetails];

CREATE TABLE [datamart].[DimReturnDetails](
	[ReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnKind] [nvarchar](50) NULL,
	[ReturnDescription] [nvarchar](255) NULL
) 