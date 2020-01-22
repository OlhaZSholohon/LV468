USE [TestDBDataMart]
DROP TABLE IF EXISTS [dm].[DimPayments];

CREATE TABLE [dm].[DimPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentDescription] [nvarchar](255) NULL
) 