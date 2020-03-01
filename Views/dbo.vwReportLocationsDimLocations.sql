USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[ReportLocationsDimLocations]    Script Date: 3/1/2020 1:35:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[ReportLocationsDimLocations]
AS
SELECT [LocationID]
      ,[Country]
      ,[Region]
	  ,SUBSTRING(Region, CHARINDEX('/', Region) + 1, LEN(Region)) AS Town
	  ,case when Region like '%America%' then 'America'
	        when Region like '%Asia%' then 'Asia'
			when Region like '%Africa%' then 'Africa'
			when Region like '%Europe%' then 'Europe'
			Else Null 
       End AS Continent
      ,[City]
      ,[Adress]
      ,[PostNumber]
      ,[DeliveryService]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [TestDBDataMart].[datamart].[DimLocations]
GO


