USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [datamart].[SP_FindDublicateFactSupplies]
AS

IF OBJECT_ID('tempdb..#Dublicatedata') IS NOT NULL
    DROP TABLE #Dublicatedata 
IF OBJECT_ID('tempdb..#ErrorDublicatedata') IS NOT NULL
    DROP TABLE #ErrorDublicatedata

SELECT [SupplierID], [ProductID], [DateKey], [LocationID], [SumPrice], [AmountProducts],
       ROW_NUMBER () OVER (PARTITION BY [SupplierID] ORDER BY [SupplierID]) AS Rn
INTO #Dublicatedata 
FROM [datamart].[ValidateFactSupplies]

SELECT * 
INTO #ErrorDublicatedata
FROM #Dublicatedata
WHERE Rn > 1

INSERT INTO [error].[ErrorFactSupplies] (
  [ErrorCode],
  [ErrorDescription],
  [SupplierID],
  [ProductID],
  [DateKey],
  [LocationID],
  [SumPrice],
  [AmountProducts]
  )
SELECT
  '1',
  'Dublicated data',
  [SupplierID],
  [ProductID],
  [DateKey],
  [LocationID],
  [SumPrice],
  [AmountProducts]

FROM #ErrorDublicatedata 


delete 
from [datamart].[ValidateFactSupplies] 
where [SupplierID] in (select [SupplierID] from #ErrorDublicatedata)

--exec FindDublicateFactSupplier

GO


