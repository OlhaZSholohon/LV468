/*
IF OBJECT_ID('dbo.DimSuppliers', 'U') IS NOT NULL 
  DROP TABLE dbo.DimSuppliers; 

CREATE TABLE DimSuppliers(
 SupplierID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , SupplierName VARCHAR(100)
 , SupplierEmail VARCHAR(100)
 , SupplierPhone VARCHAR(100)
 , SupplierDescription VARCHAR(100)
)
*/

CREATE OR ALTER PROCEDURE SP_PopulateDimSuppliers
	@NumberOfRows INT
AS

Declare @Loop INT,
		@RandValue1 INT,
		@RandValue2 INT,
		@InsertedRows INT,
		@RowsForWhile INT;

SET @RandValue1 = round(rand()*843, 0);			--rand value 843
SET @RandValue2 = round(rand()*943, 0);			--rand value 943
SET @Loop = 1

;WITH CTE_TempDictionary as (
SELECT 'Comfy' SupplierName, 'comfy@gmail.com' SupplierEmail, '01234567' SupplierPhone, 'My name is Comfy. I want to be your supplier!' AS SupplierDescription
union all
SELECT 'citrus' SupplierName, 'citrus@gmail.com' SupplierEmail, '98765432' SupplierPhone, 'My name is citrus. I want to be your supplier!' AS SupplierDescription
union all
SELECT 'eldorado' SupplierName, 'eldorado@gmail.com' SupplierEmail, '09688888' SupplierPhone, 'My name is eldorado. I want to be your supplier!' AS SupplierDescription
union all
SELECT 'rozetka' SupplierName, 'rozetka@gmail.com' SupplierEmail, '09677777' SupplierPhone, 'My name is rozetka. I want to be your supplier!' AS SupplierDescription
union all
SELECT 'foxtrot' SupplierName, 'foxtrot@gmail.com' SupplierEmail, '09666666' SupplierPhone, 'My name is foxtrot. I want to be your supplier!' AS SupplierDescription
)

INSERT INTO DimSuppliers (SupplierName, SupplierEmail, SupplierPhone, SupplierDescription)
SELECT c1.SupplierName + CAST(@RandValue1 as nvarchar(10)),
			c2.SupplierEmail + CAST(@RandValue1 as nvarchar(10)),
				c3.SupplierPhone + CAST(@RandValue1 as nvarchar(10)) + CAST(@RandValue2 as nvarchar(10)),
					c4.SupplierDescription + CAST(@RandValue1 as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2
CROSS JOIN
CTE_TempDictionary c3
CROSS JOIN
CTE_TempDictionary c4

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
Begin
	INSERT INTO DimSuppliers (SupplierName, SupplierEmail, SupplierPhone, SupplierDescription)
	VALUES ('SupplierName - ' + CAST(@Loop as nvarchar(10)),
			'SupplierEmail_' + CAST(@Loop as nvarchar(10)) + '@gmail.com',
			CAST(@Loop as nvarchar(10)) + CAST(@Loop+1 as nvarchar(10)) + CAST(@Loop+2 as nvarchar(10)) + CAST(@Loop+3 as nvarchar(10)),
			'SupplierDescription_SupplierDescription - ' + CAST(@Loop as nvarchar(10)
		)

	SET @Loop = @Loop + 1
End