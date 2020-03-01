CREATE VIEW [dbo].[vwMostPopularProducts_DimProducts] AS 
SELECT [ProductID]
, [ProductName]
, [CategoryName]
, [SubcategoryName]
, [BrandName]
, [Price]
FROM [datamart].[DimProducts_SCD]
WHERE Enddate is null



