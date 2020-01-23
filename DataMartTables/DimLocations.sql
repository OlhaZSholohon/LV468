USE [TestDBDataMart]
IF OBJECT_ID('[datamart].[DimLocations]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimLocations]; 

CREATE TABLE [datamart].[DimLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[Region] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Adress] [nvarchar](100) NULL,
	[PostNumber] [int] NULL,
	[DeliveryService] [nvarchar](50) NULL
) 