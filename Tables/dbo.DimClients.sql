IF OBJECT_ID('dbo.DimClients') IS NOT NULL
	DROP TABLE dbo.DimClients

CREATE TABLE DimClients(
 ClientID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , FirstName VARCHAR(50)
 , LastName VARCHAR(50)
 , Gender VARCHAR(50)
 , Birthday DATE
 , Email NVARCHAR(100)
 , Phone NVARCHAR(50)
 , UserLogin NVARCHAR(100)
 , LoginPassword VARCHAR(50)
 --- захешувати пароль
 , RegistrationDate DATE
)