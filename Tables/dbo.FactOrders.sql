IF OBJECT_ID('dbo.FactOrders', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDates; 
  

CREATE TABLE FactOrders(
 OrderID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
 , DateKey INT NOT NULL 
 , PaymentID INT NOT NULL 
 , ClientID INT NOT NULL 
 , DiscountID INT NOT NULL
 , ProductID INT NOT NULL
 , ReturnDetailID INT 
 , DeliveryDetailID INT NOT NULL 
 , AmountProducts INT
 , StatusPayment BIT
 , TotalPrice DECIMAL
 , TotalTriceDiscount DECIMAL
)