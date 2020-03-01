CREATE VIEW [dbo].[vwMostPopularProducts_LocationsProd] 
AS 

SELECT DimClients.ClientID,[Gender],[Birthday],[Country], [Region], [City], [Adress] FROM [datamart].[DimClients]
left JOIN (SELECT [ClientID],[Country], [Region], [City], [Adress] FROM [datamart].[FactDelivery] 
left JOIN [datamart].[DimLocations]
ON FactDelivery.[LocationID]=DimLocations.LocationID) h
ON DimClients.ClientID=h.ClientID
WHERE Enddate is null



