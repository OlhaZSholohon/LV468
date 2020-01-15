IF OBJECT_ID('staging.DimLocations') IS NOT NULL
	DROP TABLE staging.DimLocations


CREATE TABLE [staging].[DimLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Adress] [nvarchar](255) NULL,
	[PostNumber] [nvarchar](255) NULL,
	[DeliveryService] [nvarchar](255) NULL
) 