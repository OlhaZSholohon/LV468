USE [TestDBDataMart]
DROP TABLE IF EXISTS [datamart].[DimPayments];

CREATE TABLE [datamart].[DimPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentDescription] [nvarchar](255) NULL
) 