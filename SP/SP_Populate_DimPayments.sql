USE [Test2]
GO
/****** Object:  StoredProcedure [dbo].[SP_PopulateDimPayments]    Script Date: 02.01.2020 16:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_PopulateDimPayments]
	@NumRows INT
AS

DECLARE
	@Loop INT,
	@RandValue INT,
	@InsertedRows INT,
	@RowsForWhile INT;
SET @Loop = 1;
SET @RandValue = ROUND(RAND()*150,0)

;WITH CTE_TempDictionary AS (
SELECT 'Cash' PaymentType, 'Сash payment' AS PaymentDescription
UNION ALL
SELECT 'PayPal' PaymentType, 'PayPal payment' AS PaymentDescription
UNION ALL
SELECT 'EasyPay' PaymentType, 'EasyPay payment' AS PaymentDescription
UNION ALL
SELECT 'Magento' PaymentType, 'Magento payment' AS PaymentDescription
UNION ALL
SELECT 'OpenCart' PaymentType, 'OpenCart payment' AS PaymentDescription
UNION ALL
SELECT 'Bitrix' PaymentType, 'Bitrix payment' AS PaymentDescription
UNION ALL
SELECT 'JoomShopping' PaymentType, 'JoomShopping payment' AS PaymentDescription
UNION ALL
SELECT 'VirtueMart' PaymentType, 'VirtueMart payment' AS PaymentDescription
UNION ALL
SELECT 'Webasyst' PaymentType, 'Webasyst payment' AS PaymentDescription
UNION ALL
SELECT 'HostCMS' PaymentType, 'HostCMS payment' AS PaymentDescription
UNION ALL
SELECT 'CS-Cart' PaymentType, 'CS-Cart payment' AS PaymentDescription
UNION ALL
SELECT 'ShopOS' PaymentType, 'ShopOS payment' AS PaymentDescription
UNION ALL
SELECT 'Simpla' PaymentType, 'Simpla payment' AS PaymentDescription
UNION ALL
SELECT 'Drupal' PaymentType, 'Drupal payment' AS PaymentDescription
UNION ALL
SELECT 'Credit card' PaymentType, 'Credit card payment' AS PaymentDescription
) 

INSERT INTO DimPayments (PaymentType, PaymentDescription)
SELECT c1.PaymentType + CAST(@RandValue AS nvarchar(10)),
		c2.PaymentDescription + CAST(@RandValue AS nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2


SELECT @InsertedRows = @@ROWCOUNT
SET @RowsForWhile = @NumRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
	INSERT INTO DimPayments (PaymentType, PaymentDescription)
	VALUES (
			'Payment_type-' + CAST(@Loop as nvarchar(10)),
			'Payment_description-' + CAST(@Loop as nvarchar(10))
	
	)
SET @Loop = @Loop + 1
END