USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwClientSatisfaction_DimClients] AS 
SELECT q.ClientID
	,q.ClientKey
	,q.FirstName
	,q.LastName
	,q.Gender
	,DATEDIFF(YEAR, q.Birthday,'2020/10/01') AS Age
	,DATEDIFF(MONTH, q.RegistrationDate, '2020/10/01') AS MonthRegistrated
	,q.Country
	,q.City
	,q.Region
FROM (
		SELECT  c.ClientID
			,c.ClientKey
			,c.FirstName
			,c.LastName
			,c.Gender
			,c.Birthday
			,c.RegistrationDate
			,l.Country
			,l.Region
			,l.City
			,ROW_NUMBER() OVER (PARTITION BY c.ClientID ORDER BY c.ClientID) AS row_num
			,c.Enddate
		FROM datamart.DimClients c
		INNER JOIN datamart.FactDelivery d 
		ON c.ClientID = d.ClientID
		INNER JOIN datamart.DimLocations l
		ON d.LocationID = l.LocationID
	) q
WHERE q.Enddate IS NULL AND q.row_num=1
GO


