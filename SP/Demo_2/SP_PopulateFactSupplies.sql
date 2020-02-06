USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [datamart].[SP_PopulateFactSupplies] as 

delete  d
from [TestDBDataMart].[datamart].[FactSupplies] d
join [TestDBStage].[staging].[FactSupplies] s on d.[SupplierID] = s.[SupplierID]

  insert into  [TestDBDataMart].[datamart].[FactSupplies](
      SupplierID,
   ProductID,
   DateKey,
   LocationID,
   SumPrice,
   AmountProducts)
   select
   o.SupplierID,
   o.ProductID,
   o.DateKey,
   o.LocationID,
   o.SumPrice,
   o.AmountProducts
   from [datamart].[ValidateFactSupplies] o
   join [datamart].[DimDates] d on o.[DateKey]  = d.[Date]
   Left join [datamart].[DimProducts_SCD] p on o.ProductID = p.ProductID
   Left join [datamart].[DimLocations] f on o.LocationID = f.LocationID
   --where p.[Enddate] is null
   --exec [dbo].[PopulateFactSupplies]
GO


