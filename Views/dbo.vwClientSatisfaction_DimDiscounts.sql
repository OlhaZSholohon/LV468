USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwClientSatisfaction_DimDiscounts] AS 
SELECT [DiscountID],[PercentDiscount]
FROM [datamart].[DimDiscounts]
GO


