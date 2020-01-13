USE [TestDBStage]
GO
/****** Object:  Table [staging].[DimClients]    Script Date: 09-Jan-20 13:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
) ON [PRIMARY]
GO