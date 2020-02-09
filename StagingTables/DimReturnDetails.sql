USE [TestDBStage]

IF OBJECT_ID('staging.DimReturnDetails') IS NOT NULL
	DROP TABLE staging.DimReturnDetails


CREATE TABLE [staging].[DimReturnDetails](
	[ReturnDetailID] [nvarchar](255) NULL,
	[ReturnKind] [nvarchar](255) NULL,
	[ReturnDescription] [nvarchar](255) NULL
) 