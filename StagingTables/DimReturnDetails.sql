USE [TestDBStage]
DROP TABLE IF EXISTS [staging].[DimReturnDetails];
CREATE TABLE [staging].[DimReturnDetails](
	[ReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnKind] [nvarchar](255) NULL,
	[ReturnDescription] [nvarchar](255) NULL
) 