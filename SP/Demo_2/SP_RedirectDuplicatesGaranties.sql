--USE TestDBDataMart;

SET NOCOUNT ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'datamart.SP_RedirectDuplicatesGaranties') AND type in (N'P', N'PC'))
  DROP PROCEDURE datamart.SP_RedirectDuplicatesGaranties

GO
CREATE PROCEDURE datamart.SP_RedirectDuplicatesGaranties
AS
-------INSERT------------
SELECT GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty
INTO #GarantyDuplicates
FROM datamart.DimGarantiesCastedData cd1
WHERE (SELECT COUNT(*)
       FROM datamart.DimGarantiesCastedData cd2
       WHERE cd1.GarantyID = cd2.GarantyID) > 1
--------------------------

INSERT INTO error.DimGarantyErrors(GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty, ErrorDescription, ErrorDate)
SELECT GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty, 'Error: duplicates in source file(s)', GETDATE() FROM #GarantyDuplicates;

-----------DELETE------
DELETE cd 
	FROM datamart.DimGarantiesCastedData cd
	INNER JOIN #GarantyDuplicates td
	ON cd.GarantyID = td.GarantyID

GO
