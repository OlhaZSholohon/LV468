USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_FactOrders]    Script Date: 3/1/2020 1:54:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_FactOrders] as

select 
		 [OrderID]
		,[Date]
		,[PaymentID]
		,[GuarantyID]
		,[ClientID]
		,[DiscountID]
		,[ProductID]
		,[AmountProducts]
		,[TotalPrice]	  
		,[TotalPriceDiscount]
		 [EndGaranty]
from datamart.FactOrders
GO


