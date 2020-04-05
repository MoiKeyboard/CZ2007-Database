USE dsaig6;
GO

-- View database schema
SELECT *
FROM dsaig6.INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Select Customer table
SELECT *
FROM dsaig6.dbo.Customer;

-- Select CreditCard table
SELECT *
FROM dsaig6.dbo.CreditCard;

-- Select ProductType table
SELECT *
FROM dsaig6.dbo.ProductType;

-- Select Shop table
SELECT *
FROM dsaig6.dbo.Shop;

-- Select Product table
SELECT *
FROM dsaig6.dbo.Product;

-- Select Photo table
SELECT *
FROM dsaig6.dbo.Photo;

-- Select RestrictedShop table
SELECT *
FROM dsaig6.dbo.RestrictedShop;

-- Select Invoice table
SELECT *
FROM dsaig6.dbo.Invoice;

-- Select Payment table
SELECT *
FROM dsaig6.dbo.Payment;

-- Select Order table
SELECT *
FROM dsaig6.dbo.Orders;

-- Select Shipment table
SELECT *
FROM dsaig6.dbo.Shipment;

-- Select OrderItem table
SELECT *
FROM dsaig6.dbo.OrderItem;