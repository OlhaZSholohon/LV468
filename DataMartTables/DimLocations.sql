USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[DimLocations]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimLocations]; 

CREATE TABLE [datamart].[DimLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](45) NULL,
	[Region] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[PostNumber] [nvarchar](6) NULL,
	[DeliveryService] [nvarchar](50) NULL
) 