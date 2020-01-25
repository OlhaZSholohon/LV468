USE [TestDBDataMart];
IF OBJECT_ID('[datamart].[DimClients]', 'U') IS NOT NULL 
  DROP TABLE [datamart].[DimClients]; 

CREATE TABLE [datamart].[DimClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](20) NULL,
	[Phone] [nvarchar](14) NULL,
	[UserLogin] [nvarchar](20) NULL,
	[LoginPassword] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL
) 
