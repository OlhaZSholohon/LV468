USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[ValidateDimClients]    Script Date: 2/7/2020 5:55:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[ValidateDimClients](
	[ClientID] [int] NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Gender] [nvarchar](10) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[UserLogin] [nvarchar](20) NULL,
	[LoginPassword] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL
) ON [PRIMARY]
GO


