USE TestDBStage;

IF OBJECT_ID('staging.DimReturnDetails') IS NOT NULL
	DROP TABLE staging.DimReturnDetails


CREATE TABLE [staging].[DimReturnDetails](
	[ReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnKind] [nvarchar](255) NULL,
	[ReturnDescription] [nvarchar](255) NULL
) 