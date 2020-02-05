USE [TestDBDataMart]
GO

CREATE SYNONYM [dbo].[FactOrders] FOR [TestDBStage].[staging].[FactOrders]
GO