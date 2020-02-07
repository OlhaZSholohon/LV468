USE [TestDBDataMart]

IF OBJECT_ID('[datamart].[DimReturnDetails]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimReturnDetails]; 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimReturnDetails](
	[ReturnDetailID] [int] NOT NULL,
	[ReturnKind] [nvarchar](30) NULL,
	[ReturnDescription] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [datamart].[DimReturnDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO