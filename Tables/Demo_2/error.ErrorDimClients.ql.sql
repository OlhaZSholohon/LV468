USE [TestDBDataMart]
GO

/****** Object:  Table [error].[ErrorDimClients]    Script Date: 2/7/2020 5:58:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [error].[ErrorDimClients](
	[ClientID] [int] NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Birthday] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[UserLogin] [nvarchar](255) NULL,
	[LoginPassword] [nvarchar](255) NULL,
	[RegistrationDate] [nvarchar](255) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[errorDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO


