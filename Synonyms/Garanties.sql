USE TestDBDataMart
GO

CREATE SYNONYM dbo.Garanties FOR TestDBStage.staging.DimGaranties
GO