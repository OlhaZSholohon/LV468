USE [TestDBStage];
DROP TABLE IF EXISTS [staging].[DimClients];

CREATE TABLE [staging].[DimClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Birthday] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[UserLogin] [nvarchar](255) NULL,
	[LoginPassword] [nvarchar](255) NULL,
	[RegistrationDate] [nvarchar](255) NULL
) 
