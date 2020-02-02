USE [TestDBDataMart]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [datamart].[EmailFormat] (@Email nvarchar(40))
RETURNS nvarchar(40)
AS
BEGIN

	DECLARE @ValidEmail nvarchar(40)

	IF (@Email LIKE '___%@__%.__%'								--Valid format
		AND @Email NOT LIKE '%[ &'',":;!+=\/()<>]%'				--Invalid symbols
		AND @Email NOT LIKE '[-._]%'							--Can't start from this symbols
		AND @Email NOT LIKE '%[-._]'							--Can't end with this symbols
		AND @Email NOT LIKE '%..%'								--Can't include .. by sequence
		AND @Email NOT LIKE '%@%@%'								--Can't include two @ symbol in a row
		AND @Email NOT LIKE '%.@%'								--Can't include '.@' pattern 
		AND @Email NOT LIKE '%@.%'								--Can't include '@.' pattern
		AND @Email NOT LIKE '%[0-9]'							--Can't end on numbers
		)						
		BEGIN

			SET @ValidEmail = @Email

		END

	ELSE
		BEGIN
			
			SET @ValidEmail = NULL

		END

	RETURN @ValidEmail

END

--select [datamart].[EmailFormat]('sogttftserne@nddndn.ua')