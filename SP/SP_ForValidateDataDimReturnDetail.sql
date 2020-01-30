USE [TestDBDataMart]
GO
/****** Object:  StoredProcedure [datamart].[SP_ValidateDimReturnDetails]    Script Date: 1/30/2020 8:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [datamart].[SP_ValidateDimReturnDetails] 
AS

SET IDENTITY_INSERT datamart.DimReturnDetails ON
INSERT INTO datamart.DimReturnDetails 
		(ReturnDetailID,  
		ReturnKind, 
		ReturnDescription)
SELECT  ReturnDetailID,  
		ReturnKind, 
		ReturnDescription 
FROM dbo.DimReturnDetails 
WHERE  (ISNUMERIC(ReturnDetailID)=1 
        AND 
       (ReturnDetailID not like '%[^0-9]%')
        AND 
        RIGHT('00000000000'+ReturnDetailID,10) <= '2147483647'
       ) 
		AND ReturnKind IN ('Repair','Change product','Return money');

INSERT INTO datamart.ErrorDimReturnDetails
SELECT * 
FROM dbo.DimReturnDetails  
WHERE 
NOT	   (ISNUMERIC(ReturnDetailID)=1 
        AND 
       (ReturnDetailID NOT LIKE '%[^0-9]%')
        AND 
        RIGHT('00000000000'+ReturnDetailID,10) <= '2147483647'
       ) 
        AND
        ReturnKind NOT IN ('Repair','Change product','Return money');

SELECT ReturnDetailID, COUNT(*) AS Count
INTO #temptablecountduplicates
FROM datamart.DimReturnDetails
GROUP BY ReturnDetailID
Having Count(*)>1;

INSERT INTO datamart.ErrorDimReturnDetails 
SELECT * FROM datamart.DimReturnDetails
WHERE ReturnDetailID IN 
(SELECT ReturnDetailID 
FROM #temptablecountduplicates)

DELETE 
FROM datamart.ErrorDimReturnDetails
WHERE ReturnDetailID IN 
(SELECT ReturnDetailID 
FROM #temptablecountduplicates)

SET IDENTITY_INSERT datamart.DimReturnDetails OFF

