USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [datamart].[SP_FindDublicateClients]
AS

IF OBJECT_ID('tempdb..#Dublicatedata') IS NOT NULL
    DROP TABLE #Dublicatedata 
IF OBJECT_ID('tempdb..#ErrorDublicatedata') IS NOT NULL
    DROP TABLE #ErrorDublicatedata

SELECT [ClientID], 
       [FirstName], [LastName], [Gender], [Birthday], [Email], [Phone], [UserLogin], [LoginPassword], [RegistrationDate],
       ROW_NUMBER () OVER (PARTITION BY [FirstName] ,[LastName] ,[Gender] ,[Birthday] ORDER BY [ClientID]) AS Rn
INTO #Dublicatedata 
FROM [TestDBDataMart].[datamart].[ValidateDimClients]

SELECT * 
INTO #ErrorDublicatedata
FROM #Dublicatedata
WHERE Rn > 1

INSERT INTO [error].[ErrorDimClients](
  [ErrorCode],
  [ErrorDescription],
  [ClientID],
  [FirstName],
  [LastName],
  [Gender],
  [Birthday],
  [Email],
  [Phone],
  [UserLogin],
  [LoginPassword],
  [RegistrationDate]
  )
SELECT
  '1',
  'Dublicated data',
  [ClientID],
  [FirstName],
  [LastName],
  [Gender],
  [Birthday],
  [Email],
  [Phone],
  [UserLogin],
  [LoginPassword],
  [RegistrationDate]
FROM #ErrorDublicatedata 


delete 
from [datamart].[ValidateDimClients] 
where Clientid in (select Clientid from #ErrorDublicatedata)

--exec FindDublicateClients

GO


