USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwClientSatisfaction_DimDates] AS 
SELECT *
FROM [datamart].[DimDates]
GO


