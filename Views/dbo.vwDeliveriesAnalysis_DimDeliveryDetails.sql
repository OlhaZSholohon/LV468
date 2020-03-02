USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwDeliveriesAnalysis_DimDeliveryDetails]    Script Date: 3/2/2020 4:05:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  CREATE VIEW [dbo].[vwDeliveriesAnalysis_DimDeliveryDetails] AS
SELECT [DeliveryDetailID], [StatusDelivery], [CreatedDate], [UpdatedDate]
FROM [TestDBDataMart].[datamart].[DimDeliveryDetails]
GO


