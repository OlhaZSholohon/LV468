create database example
use example

drop procedure SP_PopulateFactLocation

/*CREATE TABLE DimLocations(
 LocationID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , Country VARCHAR(50)
 , Region VARCHAR(50)
 , City VARCHAR(50)
 , Adress VARCHAR(100)
 , PostNumber INT
 , DeliveryService VARCHAR(50)
)*/

CREATE PROCEDURE SP_PopulateFactLocation
	@NumberOfRows INT
AS
DECLARE @Loop  INT,
		@InsertedRows INT,
		@RandValue INT,
		@RowsForWhile INT;
SET @Loop = 1;
SET @RandValue = round( rand()*123, 0)


;WITH CTE_Temp_Dictionary as (
SELECT 'UkraineOne' Country, 'LvivshchynaOne' Region, 'LvivOne' City, 'GorodotskaOne' Adress, 1 PostNumber, 'UkrPoshtaOne' AS DeliveryService
UNION ALL
SELECT 'UkraineTwo' Country, 'LvivshchynaTwo' Region, 'LvivTwo' City, 'GorodotskaTwo' Adress, 2 PostNumber, 'UkrPoshtaTwo' AS DeliveryService
UNION ALL
SELECT 'UkraineThree' Country, 'LvivshchynaThree' Region, 'LvivThree' City, 'GorodotskaThree' Adress, 3 PostNumber, 'UkrPoshtaThree' AS DeliveryService
UNION ALL
SELECT 'UkraineFour' Country, 'LvivshchynaFour' Region, 'LvivFour' City, 'GorodotskaFour' Adress, 4 PostNumber, 'UkrPoshtaFour' AS DeliveryService
)

INSERT INTO DimLocations (Country, Region, City, Adress, PostNumber, DeliveryService)
SELECT c1.Country ,
			c2.Region,
				c3.City,
					c4.Adress,
						c4.PostNumber,
							c6.DeliveryService
	FROM CTE_Temp_Dictionary c1
cross join 
	CTE_Temp_Dictionary c2
cross join 
	CTE_Temp_Dictionary c3
cross join 
	CTE_Temp_Dictionary c4
cross join 
	CTE_Temp_Dictionary c5
cross join 
	CTE_Temp_Dictionary c6

SELECT @InsertedRows = @@ROWCOUNT
SET @RowsForWhile = @NumberOfRows - @InsertedRows

WHILE @Loop <= @RowsForWhile
BEGIN
INSERT INTO DimLocations (Country, Region, City, Adress, PostNumber, DeliveryService)
VALUES( 
		'NewCountry' + CAST(@Loop as nvarchar(10)),
		'NewRegin' + CAST(@Loop as nvarchar(10)),
		'NewCity' + CAST(@Loop as nvarchar(10)),
		'NewAdress' + CAST(@Loop as nvarchar(10)),
		 ROUND(RAND()*5, 0),
		'NewDeliveryService' + CAST(@Loop as nvarchar(10))
)
SET @Loop = @Loop + 1;
END

--exec SP_PopulateFactLocation 10000
 select * from DimLocations 