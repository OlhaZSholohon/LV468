USE TestDBDataMart
GO

CREATE SYNONYM dbo.Guaranties FOR TestDBStage.staging.DimGuaranties
GO