USE dsaig6;
GO

INSERT INTO dsaig6.dbo.Customer
	(
	FullName, FullAddress, Email,PhoneNumber,UserName,UserPass
	)
VALUES
	('WM', 'Blk 123 Sunshine Avenue', 'wm@gmail.com', '87650283', 'WMWM', 'wmwm123'),
	('Ford', 'Blk 225 North East CDC', 'ford225@gmail.com', '99657402', 'Ford225', '99657402' ),
	('Tom', 'Blk 112 Singapore', 'tom22@gmail.com', '95748396', 'Tom212', 's996728f'),
	('Benedict', 'Blk 556 Serangoon Drive', 'benedict85@hotmail.com', '96533542', 'ben85', 's8522312a');


INSERT INTO dsaig6.dbo.CreditCard
	(
	CreditCardNumber,Expiry,CustomerID
	)
VALUES
	('5775311057578442', '20250113', 1 ),
	('5775311334578442', '20220412', 1),
	('5775324333458435', '20220415', 2),
	('5775344234618782', '20220417', 3),
	('5723534664123452', '20220517', 4);

INSERT INTO dsaig6.dbo.Shop
	(
	ShopName
	)
VALUES
	('Tech Fit'),
	('Cetaphil'),
	('Nescafe'),
	('Creative');


INSERT INTO dsaig6.dbo.ProductType
	(
	ProductTypeDesc, ParentID
	)
VALUES
	('Affliated store of Cetaphil', NULL),
	('Official online store for Nescafe', NULL),
	('Mazer Official Store', NULL),
	('Mazer Affliated Partner', 3),
	('Creative Technology', NULL),
	('Mazer Affliated Partner Sub Affliation', 4);

INSERT INTO dsaig6.dbo.Product
	(
	ProductTypeID, ProductName, Price, ProductDesc, Colour, Size, ShopID
	)
VALUES
	(2, '3 in 1 Milo', 5.2, 'Enjoy 3 in 1 Milo in a brand new packaging!', NULL, '500g', 3),
	(1, 'Baby lotion', 16.5, 'Unscented baby lotion for the skin', NULL, '1 litre', 2),
	(3, 'USB Type C cable', 30.7, 'Charge fast with this 5A type c cable', 'Blue', '100cm', 1),
	(3, 'USB Type C cable', 30.7, 'Charge fast with this 5A type c cable', 'Green', '100cm', 1),
	(3, 'USB Type C cable', 30.7, 'Charge fast with this 5A type c cable', 'Black', '100cm', 1),
	(4, 'Micro USB cable', 13.3, 'Brand new nylon braided cable for enhanced usage', 'Black', '30cm', 1),
	(4, 'Micro USB cable', 13.3, 'Brand new nylon braided cable for enhanced usage', 'Black', '100cm', 1),
	(5, 'Bluetooth speaker', 50.2, 'Smallest form factor bluetooth speaker', 'Black', NULL, 4);

INSERT INTO dsaig6.dbo.RestrictedShop
	(
	ShopID, ProductTypeID
	)
VALUES
	(1, 4),
	(2, 1),
	(3, 2);

INSERT INTO dsaig6.dbo.Photo
	(
	Photo,ProductID)
VALUES
	('Mazerblueusbc1.png', 3),
	('Mazerblueusbc2.png', 3),
	('Mazerblueusbc3.png', 3),
	('Mazergreenusbc1.png', 4),
	('Mazergreenusbc2.png', 4),
	('Mazergreenusbc3.png', 4),
	('Mazerblackusbc1.png', 5),
	('3in1milo.png', 1),
	('Cetaphilbabylot1.png', 2),
	('Cetaphilbabylot2.png', 2),
	('TFMazerMicro30.png', 6),
	('TFMazerMicro100.png', 7),
	('CreativeSpeaker.png', 8);


INSERT INTO dsaig6.dbo.Invoice
	(
	InvoiceDate,InvoiceStatus)
VALUES
	('20200215', 'paid'),
	('20200331', 'paid'),
	('20200405', 'issued');


INSERT INTO dsaig6.dbo.Orders
	(
	OrderDate,OrderStatus,InvoiceNumber,CustomerID)
VALUES
	('20200215', 'shipped', 1, 2),
	('20200331', 'processing', 2, 4),
	('20200405', 'invoice issued', 2, 1);


INSERT INTO dsaig6.dbo.Payment
	(
	PaymentDate,Amount,InvoiceNumber,CreditCardNumber)
VALUES
	('20200215', 66.6, 1, '5775324333458435'),
	('20200331', 53.2, 2, '5723534664123452'),
	('20200331', 66.6, 2, '5723534664123452'),
	('20200331', 16.5, 2, '5723534664123452');

INSERT INTO dsaig6.dbo.Shipment
	(
	TrackingNo,ShipmentDate)
VALUES
	(201, '20200225'),
	(205, '20200229'),
	(225, '20200331'),
	(231, '20200331'),
	(234, '20200331');


INSERT INTO dsaig6.dbo.OrderItem
	(
	OrderID,ProductID,ShipmentID,Quantity,UnitPrice,ItemStatus)
VALUES
	(1, 1, 1, 1, 13.3, 'shipped'),
	(1, 3, 2, 2, 30.7, 'shipped'),
	(2, 6, 3, 4, 13.3, 'shipped'),
	(2, 7, 3, 3, 30.7, 'shipped'),
	(2, 1, NULL, 1, 5.2, 'processing'),
	(2, 2, 5, 5, 16.5, 'shipped'),
	(3, 8, NULL, 1, 50.2, 'out of stock');




Select *
from dbo.Customer
Select *
from dbo.CreditCard
Select *
from dbo.Shop
Select *
from dbo.ProductType
Select *
from dbo.Product
Select *
from dbo.RestrictedShop
Select *
from dbo.Photo
Select *
from dbo.Invoice
Select *
from dbo.Orders
Select *
from dbo.OrderItem
Select *
from dbo.Shipment
Select *
from dbo.Payment