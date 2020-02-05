IF OBJECT_ID('staging.FactReturns') IS NOT NULL
	DROP TABLE staging.FactReturns

CREATE TABLE [staging].[FactReturns](
	[Date] [nvarchar](255),
	[GarantyID] [nvarchar](255),
	[PaymentTypeId] [nvarchar](255),
	[ClientId] [nvarchar](255),
	[ReturnDetailId] [nvarchar](255),
	[ProductId] [nvarchar](255),
	[IsGaranty] [nvarchar](255)
)  
