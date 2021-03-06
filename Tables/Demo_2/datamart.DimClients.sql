USE [TestDBDataMart]
GO

/****** Object:  Table [datamart].[DimClients]    Script Date: 2/7/2020 5:50:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [datamart].[DimClients](
	[ClientKey] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Gender] [nvarchar](10) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[UserLogin] [nvarchar](20) NULL,
	[LoginPassword] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL,
	[Startdate] [datetime] NULL,
	[Enddate] [datetime] NULL
) ON [PRIMARY]
GO


