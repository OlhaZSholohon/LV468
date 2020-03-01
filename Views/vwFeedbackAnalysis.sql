USE TestDBDataMart; 
GO 
------------------------------------------------------------

IF OBJECT_ID('dbo.vwFeedbackAnalysis_Fact', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_Fact;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_Fact   
--WITH SCHEMABINDING
AS 
SELECT l.LocationID
		, dfd.Rating
		, dfd.FeedbackDetailID
		, dfd.FeedbackKey
		, dfd.Comment
		, ff.[Date]
		, ff.ProductID
		, fo.ClientID
		, c.ClientKey
		
from [datamart].[DimLocations] l
join [datamart].[FactDelivery] fd
on l.LocationID = fd.LocationID
join [datamart].[DimClients] c
on fd.ClientID = c.ClientID
join [datamart].[FactOrders] fo
on c.ClientID = fo.ClientID
join [datamart].[DimProducts_SCD] p
on fo.ProductID = p.ProductID
join [datamart].[FactFeedbacks] ff
on p.ProductID = ff.ProductID
join [datamart].[DimFeedbackDetails] dfd
on ff.FeedbackDetailID = dfd.FeedbackKey
where c.Enddate is null and p.EndDate is null
;
GO
-----------------------------------------------------------

IF OBJECT_ID('dbo.vwFeedbackAnalysis_DimLocations', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_DimLocations;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_DimLocations   
--WITH SCHEMABINDING
AS 
SELECT
		l.LocationID
		, l.Country
		, l.City
		, l.Region
		, l.DeliveryService
FROM  [datamart].[DimLocations] l
; 
GO
------------------------------------------------------------

IF OBJECT_ID('dbo.vwFeedbackAnalysis_DimClients', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_DimClients;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_DimClients   
--WITH SCHEMABINDING
AS 
SELECT  c.ClientID
		, c.ClientKey
		, c.Gender
		, c.Birthday
		, c.RegistrationDate
from [datamart].[DimClients] c
where c.Enddate  is null
; 
GO
-----------------------------------------------------------------

IF OBJECT_ID('dbo.vwFeedbackAnalysis_DimProducts', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_DimProducts;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_DimProducts   
--WITH SCHEMABINDING
AS 
SELECT  p.ProductID
		,
		p.[ProductName]
		, p.[CategoryName]
		, p.[SubcategoryName]
		, p.[DefaultGaranty]
		, p.[DefaultGarantyName]
		, p.BrandName AS Brand
from [datamart].[DimProducts_SCD] p
where p.EndDate is null
; 
GO

------------------------------------------------------------
IF OBJECT_ID('dbo.vwFeedbackAnalysis_DimDates', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_DimDates;
GO 
CREATE VIEW dbo.vwFeedbackAnalysis_DimDates
AS 
SELECT * FROM [datamart].[DimDates]
GO
------------------------------------------------------------

IF OBJECT_ID('dbo.vwFeedbackAnalysis_FactOrders', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_FactOrders;
GO
CREATE VIEW dbo.vwFeedbackAnalysis_FactOrders   
--WITH SCHEMABINDING 
AS 
SELECT * FROM [TestDBDataMart].[datamart].[FactOrders] 

; 
GO

-----------------------------------------------------------------
IF OBJECT_ID('dbo.vwFeedbackAnalysis_FactDeliveries', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_FactDeliveries;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_FactDeliveries   
--WITH SCHEMABINDING
AS 
SELECT * FROM [datamart].[FactDelivery]
;
GO

-----------------------------------------------------------------
IF OBJECT_ID('dbo.vwFeedbackAnalysis_FactReturns', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_FactReturns;

GO
CREATE VIEW dbo.vwFeedbackAnalysis_FactReturns  
--WITH SCHEMABINDING
AS 
SELECT * FROM [datamart].[FactReturns]
;
GO
-----------------------------------------------------------------
IF OBJECT_ID('dbo.vwFeedbackAnalysis_FactOrders_Locations', 'V') IS NOT NULL    
DROP VIEW dbo.vwFeedbackAnalysis_FactOrders_Locations;
GO
CREATE VIEW dbo.vwFeedbackAnalysis_FactOrders_Locations   
--WITH SCHEMABINDING
AS 
SELECT l.LocationID
		, fo.OrderID
		, fo.[Date]
		, fo.ProductID
		, fo.ClientID
		, c.ClientKey
		
from [datamart].[DimLocations] l
join [datamart].[FactDelivery] fd
on l.LocationID = fd.LocationID
join [datamart].[DimClients] c
on fd.ClientID = c.ClientID
join [datamart].[FactOrders] fo
on c.ClientID = fo.ClientID
;