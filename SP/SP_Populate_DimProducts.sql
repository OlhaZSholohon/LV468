use ITASS;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
CREATE TABLE dbo.DimProducts(
 ProductID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , ProductName VARCHAR(100)
 , CategoryName VARCHAR(50)
 , SubcategoryName VARCHAR(50)
 , BrandName VARCHAR(50)
 , Thicknes DECIMAL
 , [Weight] DECIMAL
 , ProductDescription NVARCHAR(MAX)
 , DefaultGaranty INT
 , DefaultGarantyName VARCHAR(50)
 , Price DECIMAL
)
*/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_PopulateDimProducts
	@NumberOfRows INT
AS

DECLARE @Loop INT,
		@InsertedRows INT,
		@RandValue INT,
		@RowsForWhile INT

SET @Loop = 1;
SET @RandValue = round( rand()*264,0)

;WITH CTE_TempDictionary as (
SELECT 'Asus ROG STRIX 5' ProductName, 'New' CategoryName, 'Gaming' SubcategoryName, 'Asus' BrandName, '2.5' Thicknes, '2539' [Weight], 
'Some description about laptop Asus ROG STRIX 5' ProductDescription, '12' DefaultGaranty, 'Default Garanty Asus' DefaultGarantyName, '25000' AS Price
union all
SELECT 'HP 255 G7' ProductName, 'Used' CategoryName, 'For Cut Design' SubcategoryName, 'HP' BrandName, '2.34' Thicknes, '1790' [Weight], 
'Some description about laptop HP 255 G7' ProductDescription, '1' DefaultGaranty, 'Default Garanty Used laptops' DefaultGarantyName, '10500' AS Price
union all
SELECT 'Apple MacBook Pro' ProductName, 'New' CategoryName, 'Thin' SubcategoryName, 'Apple' BrandName, '1.24' Thicknes, '1245' [Weight], 
'Some description about laptop Apple MacBook Pro' ProductDescription, '6' DefaultGaranty, 'Default Garanty Apple' DefaultGarantyName, '35900' AS Price
)

INSERT INTO DimProducts(ProductName,CategoryName,SubcategoryName,BrandName,Thicknes,[Weight],ProductDescription,DefaultGaranty,DefaultGarantyName,Price)
SELECT c1.ProductName + CAST(@RandValue as nvarchar(10)),
			c2.CategoryName,
			c3.SubcategoryName,
			c4.BrandName,
			c5.Thicknes,
			c6.[Weight],
			c7.ProductDescription,
			c8.DefaultGaranty,
			c9.DefaultGarantyName,
			c10.Price + @RandValue
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2
CROSS JOIN
CTE_TempDictionary c3
CROSS JOIN
CTE_TempDictionary c4
CROSS JOIN
CTE_TempDictionary c5
CROSS JOIN
CTE_TempDictionary c6
CROSS JOIN
CTE_TempDictionary c7
CROSS JOIN
CTE_TempDictionary c8
CROSS JOIN
CTE_TempDictionary c9
CROSS JOIN
CTE_TempDictionary c10

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
	INSERT INTO DimProducts(ProductName,CategoryName,SubcategoryName,BrandName,Thicknes,[Weight],ProductDescription,DefaultGaranty,DefaultGarantyName,Price)
	VALUES(
		'ProductName-' + CAST(@Loop as nvarchar(10)),
		'CategoryName-' +  CAST(@Loop as nvarchar(10)),
		'SubcategoryName-' + CAST(@Loop as nvarchar(10)),
		'BrandName-' + CAST(@Loop as nvarchar(10)),
		round(rand()*100,0),
		round(rand()*200,0),
		'ProductDescription-' + CAST(@Loop as nvarchar(10)),
		round(rand()*(12-1)+2,0),
		'DefaultGarantyName-' + CAST(@Loop as nvarchar(10)),
		round(rand()*1000,0)
		)
	SET @Loop = @Loop + 1
END
