USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_DimProducts_SCD]    Script Date: 3/1/2020 1:53:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_DimProducts_SCD]
as 
select 
     p.[ProductID]
    ,p.[ProductName]
      ,p.[CategoryName]
      ,p.[SubcategoryName]
      ,p.[BrandName]
      ,p.[Price]
      ,fs.LocationID
    ,l.Country
    ,l.City
    ,l.Region

from datamart.DimProducts_SCD p
join datamart.FactSupplies fs on fs.ProductID = p.ProductID
join datamart.DimLocations l on l.LocationID = fs.LocationID
where Enddate is null
GO


