IF OBJECT_ID('stage.DimClients') IS NOT NULL
DROP TABLE stage.DimClients
GO
CREATE TABLE [stage].[DimClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Birthday] [nvarchar] (255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[UserLogin] [nvarchar](255) NULL,
	[LoginPassword] [nvarchar](255) NULL,
	[RegistrationDate] [nvarchar] (255) NULL,
) 
ON [PRIMARY]
GO


