USE [TestDBStage]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [staging].[SP_PopulateDimSuppliers]
	@NumberOfRows INT
AS

Declare @Loop INT,
		@RandValue1 INT,
		@RandValue2 INT,
		@InsertedRows INT,
		@RowsForWhile INT,
		@NumberOfRowsLocal INT;

SET @RandValue1 = round(rand()*843, 0);			--rand value 843
SET @RandValue2 = round(rand()*943, 0);			--rand value 943
SET @Loop = 1
SET @NumberOfRowsLocal = round(@NumberOfRows * 0.5,0)
	

;WITH CTE_TempDictionary as (
SELECT cast(round(rand()*967, 0) as nvarchar(10)) as SupplierID, 'Comfy' SupplierName, 'comfy@gmail.com' SupplierEmail, '01234567' SupplierPhone, 'My name is Comfy. I want to be your supplier!' AS SupplierDescription
union all
SELECT cast(round(rand()*111111, 0) as nvarchar(10)) as SupplierID, 'citrus' SupplierName, 'citrus@gmail.com' SupplierEmail, '98765432' SupplierPhone, 'My name is citrus. I want to be your supplier!' AS SupplierDescription
union all
SELECT cast(round(rand()*1111, 0) as nvarchar(10)) as SupplierID, 'eldorado' SupplierName, 'eldorado@gmail.com' SupplierEmail, '09688888' SupplierPhone, 'My name is eldorado. I want to be your supplier!' AS SupplierDescription
union all
SELECT 'ii45' as SupplierID, 'rozetka' SupplierName, 'rozetka@gmail.com' SupplierEmail, '09677777' SupplierPhone, 'My name is rozetka. I want to be your supplier!' AS SupplierDescription
union all
SELECT cast(round(rand()*12345, 0) as nvarchar(10)) as SupplierID, 'foxtrot' SupplierName, 'foxtrot@gmail.com' SupplierEmail, '09666666' SupplierPhone, 'My name is foxtrot. I want to be your supplier!' AS SupplierDescription
)

INSERT INTO staging.DimSuppliers (SupplierID, SupplierName, SupplierEmail, SupplierPhone, SupplierDescription)
SELECT TOP (@NumberOfRowsLocal) c1.SupplierID + CAST(@RandValue1 as nvarchar(10)),
			c2.SupplierName + CAST(@RandValue1 as nvarchar(10)),
				c3.SupplierEmail + CAST(@RandValue1 as nvarchar(10)),
					c4.SupplierPhone + CAST(@RandValue1 as nvarchar(10)) + CAST(@RandValue2 as nvarchar(10)),
						c5.SupplierDescription + CAST(@RandValue1 as nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2
CROSS JOIN
CTE_TempDictionary c3
CROSS JOIN
CTE_TempDictionary c4
CROSS JOIN
CTE_TempDictionary c5
 

SELECT @InsertedRows = @@ROWCOUNT

SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
Begin
	INSERT INTO staging.DimSuppliers (SupplierID, SupplierName, SupplierEmail, SupplierPhone, SupplierDescription)
	VALUES (cast(round(rand()*54321, 0) as nvarchar(10)),
			'SupplierName - ' + CAST(@Loop as nvarchar(10)),
			'SupplierEmail_' + CAST(@Loop as nvarchar(10)) + '@gmail.com',
			CAST(@Loop as nvarchar(10)) + CAST(@Loop+1 as nvarchar(10)) + CAST(@Loop+2 as nvarchar(10)) + CAST(@Loop+3 as nvarchar(10)),
			'SupplierDescription_SupplierDescription - ' + CAST(@Loop as nvarchar(10))
		)

	SET @Loop = @Loop + 1
End
GO


