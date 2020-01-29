USE TestDBDataMart;

SET NOCOUNT ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'datamart.SP_RedirectDuplicates') AND type in (N'P', N'PC'))
  DROP PROCEDURE datamart.SP_RedirectDuplicates

GO
CREATE PROCEDURE datamart.SP_RedirectDuplicates
AS
-------INSERT------------
;WITH GarantyDuplicates
AS
(
SELECT GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty FROM datamart.DimGarantiesCastedData T1
WHERE (SELECT COUNT(*)
       FROM datamart.DimGarantiesCastedData T2
       WHERE T1.GarantyID = T2.GarantyID) > 1
)

INSERT INTO errors.DimGarantiesErrors(GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty)
SELECT GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty FROM GarantyDuplicates;
-----------DELETE------
;WITH GarantyDuplicatesDEL
AS
(
SELECT GarantyID, NameGaranty, Duration, PriceGaranty, DescriptionGaranty FROM datamart.DimGarantiesCastedData T1
WHERE (SELECT COUNT(*)
       FROM datamart.DimGarantiesCastedData T2
       WHERE T1.GarantyID = T2.GarantyID) > 1
)

DELETE A1 
	FROM datamart.DimGarantiesCastedData A1
	INNER JOIN GarantyDuplicatesDEL cte
	ON A1.GarantyID = cte.GarantyID

GO
