--CREATE TABLE DimClients(
 --ClientID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 --, FirstName VARCHAR(50)
 --, LastName VARCHAR(50)
 --, Gender VARCHAR(50)
 --, Birthday DATE
 --, Email NVARCHAR(100)
 --, Phone NVARCHAR(50)
 --, UserLogin NVARCHAR(100)
 --, LoginPassword VARCHAR(50)
 --- захешувати пароль
 --, RegistrationDate DATE
--)

CREATE  PROCEDURE SP_Clients 
  @NumberOfRows INT

  AS

  DECLARE @Loop INT, 
  			@RandValue INT;
  			@InsertedRows INT;
  			@GenderRandom INT;

  SET @loop = 1;
  SET @RandValue = round(rand()*700, 0)

  ;WITH CTE_TempDictionary AS (
   	SELECT 'Artur' FirstName, 'Tymoshenko' LastName, 'Male' Gender, '16/07/1992' Birthday, 'Arturtymoshenko92@gmail.com' Email,
   								'0687655220' Phone, 'Motc' UserLogin, '1123456' LoginPassword, '12/06/2017' AS RegistrationDate
  	Union All
  	SELECT 'Ivan' FirstName, 'Ivanovych' LastName, 'Male' Gender, '12/07/2000' Birthday, 'badman777@gmail.com' Email, 
  	                            '0687654770' Phone, 'Cree' UserLogin, '1123114' LoginPassword, '17/08/2019' AS RegistrationDate
  	Union All
  	SELECT 'John' FirstName, 'Wick' LastName, 'Male' Gender, '01/09/1983' Birthday, 'John113@gmail.com' Email, 
  	                            '0934654770' Phone, 'John113' UserLogin, '17777' LoginPassword, '22/02/2019' AS RegistrationDate
  	Union All
  	SELECT 'Sem' FirstName, 'Jones' LastName, 'Male' Gender, '15/09/1995' Birthday, 'Log111@gmail.com' Email, 
  	                            '0687655656' Phone, 'Semboss' UserLogin, 'user111' LoginPassword, '24/04/2018' AS RegistrationDate
  	Union All
  	SELECT 'Fibi' FirstName, 'Jones' LastName, 'Female' Gender, '11/02/1999' Birthday, 'Fibipost@gmail.com' Email, 
  	                            '0974655656' Phone, 'Fibikiss' UserLogin, 'kiss777' LoginPassword, '07/05/2018' AS RegistrationDate 
  	                                                                                                               
   )

  INSERT INTO DimClients (FirstName,LastName,Gender,Birthday,Email,Phone,UserLogin,LoginPassword,RegistrationDate)
  SELECT c1.FirstName + CAST(@RandValue as NVARCHAR(10)),
  			c2.LastName + CAST(@RandValue as NVARCHAR(10)),
  				c3.Gender ,
  					c4.Birthday,
  						c5.Email + CAST(@RandValue as NVARCHAR(20)),
  							c6.Phone + CAST(@RandValue as NVARCHAR(20)),
  								c7.UserLogin + CAST(@RandValue as NVARCHAR(20)),
  									c8.LoginPassword + CAST(@RandValue as NVARCHAR(20)),
  										c9.RegistrationDate
  )
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

             
  SELECT @InsertedRows = @@ROWCOUNT
  
  SET @RowsForWhile = @NumberOfRows - @InsertedRows

  WHILE @Loop <= @RowsForWhile 

  BEGIN 

  SET @GenderRandom = round (rand()*(1-0)+1,0)

  INSERT INTO DimClients (FirstName,LastName,Gender,Birthday,Email,Phone,UserLogin,LoginPassword,RegistrationDate)
  Values ('Max' + CAST(@Loop AS NVARCHAR(10)),
  			'Sydor'+ CAST(@Loop AS NVARCHAR(10)),
               CASE 
               When @GenderRandom = 0 then
                'Male'
               else
                'Female' 
               END,
               DateAdd(Day, Rand() * DateDiff(Day, '01/01/1980', '01/01/1990'), '01/01/1980'),
               'ClientEmail_' + CAST(@Loop AS NVARCHAR(20)) + '@gmail.com',
               CAST(@Loop as nvarchar(20)) + CAST(@Loop+1 as nvarchar(20)) + CAST(@Loop+2 as nvarchar(20)) + CAST(@Loop+3 as nvarchar(20)),
               'UserLogin' + CAST (@Loop AS NVARCHAR(20)),
               'LoginPassword' + CAST (@Loop AS NVARCHAR(20)),
               DateAdd(Day, Rand() * DateDiff(Day, '01/01/2019', '01/01/2020'), '01/01/2019')
)

SET @Loop = @Loop +1;
  END

  
