USE [TestDBDataMart]
GO

/****** Object:  View [dbo].[vwAnalyseReturnOfProducts_DimClients]    Script Date: 3/1/2020 1:44:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vwAnalyseReturnOfProducts_DimClients] as

select 
	   [ClientKey]
	  ,[ClientID]
      ,[FirstName]
      ,[LastName]
      ,[Gender]
      ,[Birthday]
      ,[Email]
      ,[Phone]
      ,[UserLogin]
      ,[LoginPassword]
      ,[RegistrationDate]
      ,[Startdate]
       [Enddate]
from datamart.DimClients
where Enddate is null
GO


