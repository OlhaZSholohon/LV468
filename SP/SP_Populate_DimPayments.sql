USE [TestDBStage]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'staging.SP_PopulateDimPayments') AND type in (N'P', N'PC'))
  DROP PROCEDURE [staging].[SP_PopulateDimPayments]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [staging].[SP_PopulateDimPayments]
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

INSERT INTO staging.DimPayments (PaymentType, PaymentDescription)
SELECT c1.PaymentType + CAST(@RandValue AS nvarchar(10)),
		c2.PaymentDescription + CAST(@RandValue AS nvarchar(10))
FROM CTE_TempDictionary c1
CROSS JOIN
CTE_TempDictionary c2


SELECT @InsertedRows = @@ROWCOUNT
SET @RowsForWhile = @NumRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
	INSERT INTO staging.DimPayments (PaymentType, PaymentDescription)
	VALUES (
			'Payment_type-' + CAST(@Loop as nvarchar(10)),
			'Payment_description-' + CAST(@Loop as nvarchar(10))
	
	)
SET @Loop = @Loop + 1
END