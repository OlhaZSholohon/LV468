USE [TestDBDataMart]
GO
/****** Object:  StoredProcedure [datamart].[SP_ValidateDimReturnDetails]    Script Date: 2/9/2020 3:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [datamart].[SP_ValidateDimReturnDetails] 
AS

CREATE TABLE #temptable(
ReturnDetailID int,  
ReturnKind nvarchar(14), 
ReturnDescription nvarchar(255))

INSERT INTO  #temptable
    (ReturnDetailID,  
    ReturnKind, 
    ReturnDescription)
SELECT  ReturnDetailID,  
    ReturnKind, 
    ReturnDescription 
FROM dbo.DimReturnDetails 
WHERE (ISNUMERIC(ReturnDetailID)=1 
        AND 
       (ReturnDetailID not like '%[^0-9]%')
        AND 
        ReturnDetailID>  0 AND ReturnDetailID <= 2147483647
       ) 
    AND ReturnKind IN ('Repair','Change product','Return money')
    AND len(ReturnDescription)>=10 and len(ReturnDescription)<=255;

INSERT INTO error.ErrorDimReturnDetails
    (ReturnDetailID,  
    ReturnKind, 
    ReturnDescription,
    ErrorDescription)
SELECT  ReturnDetailID,  
    ReturnKind, 
    ReturnDescription,
    'Invalid data'
FROM dbo.DimReturnDetails 
WHERE NOT
     (ISNUMERIC(ReturnDetailID)=1 
        AND 
       (ReturnDetailID not like '%[^0-9]%')
        AND 
        ReturnDetailID>  0 AND ReturnDetailID <= 2147483647
       ) 
    AND ReturnKind IN ('Repair','Change product','Return money')
    AND len(ReturnDescription)>=10 and len(ReturnDescription)<=255;

SELECT ReturnDetailID, COUNT(*) AS Count
INTO #temptablecountduplicates
FROM #temptable
GROUP BY ReturnDetailID
Having Count(*)>1;

INSERT INTO error.ErrorDimReturnDetails (ReturnDetailID, ReturnKind, ReturnDescription, ErrorDescription)
SELECT ReturnDetailID, ReturnKind, ReturnDescription, 'Duplicate data' FROM #temptable
WHERE ReturnDetailID IN 
(SELECT ReturnDetailID 
FROM #temptablecountduplicates)

DELETE r 
  FROM #temptable r
  INNER JOIN #temptablecountduplicates t
  ON t.ReturnDetailID = r.ReturnDetailID

MERGE datamart.DimReturnDetails AS d
USING #temptable AS t ON
d.ReturnDetailID=t.ReturnDetailID

WHEN MATCHED 
AND 
(d.ReturnKind <> t.ReturnKind OR d.ReturnDescription <> t.ReturnDescription)

THEN UPDATE SET 
d.ReturnKind = t.ReturnKind,
d.ReturnDescription=t.ReturnDescription,
d.UpdatedDate = GetDate()

WHEN NOT MATCHED

THEN INSERT  VALUES (ReturnDetailID, 
					ReturnKind, 
			        ReturnDescription,
					getdate(),
					NULL);