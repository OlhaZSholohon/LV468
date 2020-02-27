USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_DimGaranties] AS 
SELECT [GuarantyID], [Duration]
FROM [datamart].[DimGuaranties]
WHERE EndDate IS NUll
GO


