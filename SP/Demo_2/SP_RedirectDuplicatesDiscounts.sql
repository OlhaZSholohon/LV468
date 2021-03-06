USE [TestDBDataMart]
GO
/****** Object:  StoredProcedure [datamart].[SP_RedirectDuplicatesDiscounts]    Script Date: 2/7/2020 2:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [datamart].[SP_RedirectDuplicatesDiscounts]
AS
-------INSERT------------
SELECT DiscountID,StartDiscount,EndDiscount,PercentDiscount,DescriptionDiscount
INTO #DiscountsDuplicates
FROM DimDiscountsCastedData cd1
WHERE (SELECT COUNT(*)
       FROM datamart.DimDiscountsCastedData cd2
       WHERE cd1.DiscountID = cd2.DiscountID) > 1
--------------------------

INSERT INTO error.DimDiscountsErrors(DiscountID,StartDiscount,EndDiscount,PercentDiscount,DescriptionDiscount,ErrorDescription,ErrorTime)
SELECT DiscountID,StartDiscount,EndDiscount,PercentDiscount,DescriptionDiscount, 'Error: duplicates in source file(s)', GETDATE() FROM #DiscountsDuplicates;

-----------DELETE------
DELETE cd 
	FROM datamart.DimDiscountsCastedData cd
	INNER JOIN #DiscountsDuplicates td
	ON cd.DiscountID = td.DiscountID
	--exec [datamart].[SP_RedirectDuplicatesDiscounts]