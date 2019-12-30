IF OBJECT_ID('dbo.DimDiscounts') IS NOT NULL
	DROP TABLE dbo.DimDiscounts

CREATE TABLE DimDiscounts(
 DiscountID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , StartDiscount DATE
 , EndDiscount DATE
 , PercentDiscount INT
 , DescriptionDiscount VARCHAR(200)
)