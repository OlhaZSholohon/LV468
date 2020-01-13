USE TestDBStage;

IF OBJECT_ID('staging.DimPayments') IS NOT NULL
	DROP TABLE staging.DimPayments

CREATE TABLE [staging].[DimPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](255) NULL,
	[PaymentDescription] [nvarchar](255) NULL
) 