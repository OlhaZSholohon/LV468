USE [TestDBDataMart];
DROP TABLE IF EXISTS [datamart].[DimClients];

CREATE TABLE [datamart].[DimClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NULL,
	[UserLogin] [nvarchar](100) NULL,
	[LoginPassword] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL
) 
