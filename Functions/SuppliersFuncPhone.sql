USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [datamart].[NumPhoneFormat](@NumberPhone nvarchar(18))
RETURNS nvarchar(18)
AS
BEGIN

	DECLARE @LenghtNum INT;

	WHILE PATINDEX('%[^0-9]%', @NumberPhone) > 0
		BEGIN

			SET @NumberPhone = STUFF(@NumberPhone, PATINDEX('%[^0-9]%', @NumberPhone), 1, '')

		END

	SET @LenghtNum = LEN(@NumberPhone)

	IF @LenghtNum = 10
		BEGIN

			SET @NumberPhone = CAST('38' AS nvarchar(2)) + @NumberPhone
			SET @LenghtNum = 12

		END

	IF @LenghtNum BETWEEN 11 AND 13
		BEGIN

			SET @NumberPhone = '+' + SUBSTRING(@NumberPhone, 1, @LenghtNum - 10) + '-' +
								SUBSTRING(@NumberPhone, @LenghtNum - 9, 3) + '-' +
								SUBSTRING(@NumberPhone, @LenghtNum - 6, 3) + '-' +
								SUBSTRING(@NumberPhone, @LenghtNum - 3, 4)

		END

	ELSE
		BEGIN

			SET @NumberPhone = NULL

		END

	RETURN @NumberPhone
END
GO