CREATE PROCEDURE [datamart].[SP_UpdatePaymentsType]
AS
UPDATE [datamart].[DestinationPayments]
SET [PaymentType] =
(
	CASE 
		WHEN [PaymentType] LIKE '%Cash%' THEN 'Cash'
		WHEN [PaymentType] LIKE '%PayPal%' THEN 'PayPal'
		WHEN [PaymentType] LIKE '%EasyPay%' THEN 'EasyPay'
		WHEN [PaymentType] LIKE '%Magento%' THEN 'Magento'
		WHEN [PaymentType] LIKE '%OpenCart%' THEN 'OpenCart'
		WHEN [PaymentType] LIKE '%Bitrix%' THEN 'Bitrix'
		WHEN [PaymentType] LIKE '%Simpla%' THEN 'Simpla'
		WHEN [PaymentType] LIKE '%Drupal%' THEN 'Drupal'
		ELSE [PaymentType]
	END
)