USE TestDBDataMart
GO

CREATE SYNONYM datamart.StagingGaranties FOR TestDBStage.staging.DimGaranties
GO