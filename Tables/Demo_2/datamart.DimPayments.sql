USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[DimPayments]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimPayments]; 

CREATE TABLE [datamart].[DimPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentDescription] [nvarchar](255) NULL
) 
