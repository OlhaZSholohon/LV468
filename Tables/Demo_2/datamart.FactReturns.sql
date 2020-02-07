IF OBJECT_ID('datamart.FactReturns') IS NOT NULL
	DROP TABLE datamart.FactReturns

CREATE TABLE [datamart].[FactReturns](
	[Date] [date] NOT NULL,
	[GarantyID] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ReturnDetailId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsGaranty] [bit] NOT NULL
)  
