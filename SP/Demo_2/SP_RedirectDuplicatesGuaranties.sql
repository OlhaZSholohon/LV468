--USE TestDBDataMart;

SET NOCOUNT ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'datamart.SP_RedirectDuplicatesGuaranties') AND type in (N'P', N'PC'))
  DROP PROCEDURE datamart.SP_RedirectDuplicatesGuaranties

GO
CREATE PROCEDURE datamart.SP_RedirectDuplicatesGuaranties
AS
-------INSERT------------
SELECT GuarantyID, NameGuaranty, Duration, PriceGuaranty, DescriptionGuaranty
INTO #GuarantyDuplicates
FROM datamart.DimGuarantiesCastedData cd1
WHERE (SELECT COUNT(*)
       FROM datamart.DimGuarantiesCastedData cd2
       WHERE cd1.GuarantyID = cd2.GuarantyID) > 1
--------------------------

INSERT INTO error.DimGuarantyErrors(GuarantyID, NameGuaranty, Duration, PriceGuaranty, DescriptionGuaranty, ErrorDescription, ErrorDate)
SELECT GuarantyID, NameGuaranty, Duration, PriceGuaranty, DescriptionGuaranty, 'Error: duplicates in source file(s)', GETDATE() FROM #GuarantyDuplicates;

-----------DELETE------
DELETE cd 
	FROM datamart.DimGuarantiesCastedData cd
	INNER JOIN #GuarantyDuplicates td
	ON cd.GuarantyID = td.GuarantyID

GO
