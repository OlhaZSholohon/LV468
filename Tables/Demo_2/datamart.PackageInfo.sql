USE TestDBDataMart;

IF OBJECT_ID('datamart.PackageInfo', 'U') IS NOT NULL 
  DROP TABLE datamart.PackageInfo; 

CREATE TABLE datamart.PackageInfo(
   PackageInfoID INT IDENTITY
 , PackageName NVARCHAR(50)
 , StartTime DATETIME
 , EndTime DATETIME
 , PackageStatus NVARCHAR(50)
 )

/*INSERT INTO datamart.DimGarantyHandlerInfo(
   PackageName, StartTime, ErrorCode, IDescription)
	VALUES('PName', '15', '1542', 'description')*/

	/*
	Щодо івент хендлерів.
	Вони мають заповнювати загальну таблицю PackageInfo. 
	Нехай в цій таблиці будуть такі колонки: id, PackageName, StartTime, EndTime, Status.
Хендлер OnPreExecute має всталяти дані в таблицю PackageInfo і статус Started. 
Хендлер OnPostExecute оновлює дані для поточного пакету і змінює status на Finished.*/