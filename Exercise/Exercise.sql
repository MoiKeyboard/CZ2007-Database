USE dsaig6;
GO
SELECT p.ProductID FROM Product p 
INNER JOIN OrderItem oi ON p.ProductID  = oi.ProductID 
INNER JOIN Orders o ON o.OrderID  = oi.OrderID 
INNER JOIN Customer c ON c.CustomerID  = o.CustomerID 
INNER JOIN Invoice i ON i.InvoiceNumber  = o.InvoiceNumber 
WHERE oi.ItemStatus  <> 'shipped' AND i.InvoiceStatus = 'paid'
AND o.CustomerID  = (SELECT CustomerID FROM Customer WHERE Email  = 'benedict85@hotmail.com')

SELECT TOP 3 (oi.ProductID) , SUM(oi.Quantity) AS TotalQuantity FROM ProductType pt
INNER JOIN Product p ON p.ProductTypeID  = pt.ProductTypeID 
INNER JOIN OrderItem oi ON oi.ProductID = p.ProductID 
INNER JOIN Orders o ON o.OrderID  = oi.OrderID 
INNER JOIN Invoice i ON i.InvoiceNumber = o.InvoiceNumber 
WHERE i.InvoiceStatus = 'paid'
GROUP BY oi.ProductID
ORDER BY TotalQuantity DESC

SELECT pt.ProductTypeDesc FROM ProductType pt 
WHERE pt.ParentID IS NOT NULL

SELECT TOP 1 (ProdMatches), ProductID1, ProductID2 FROM 
(SELECT COUNT(*) AS ProdMatches, ProductID1, ProductID2 FROM 
(SELECT oi.ProductID AS ProductID1 , oi2.ProductID AS ProductID2 FROM OrderItem oi 
INNER JOIN OrderItem oi2 ON oi2.OrderID  = oi.OrderID 
WHERE oi2.ProductID <> oi.ProductID AND oi2.OrderID  = oi.OrderID) AS d
GROUP BY ProductID1, ProductID2) AS d2

SELECT TOP 3 Email FROM Customer 
ORDER BY NEWID()

/*Customers that have one paid for from each restricted shop whose credit card expiries on year 2022*/
SELECT c.FullName FROM Customer c
JOIN Orders o ON o.CustomerID  = c.CustomerID 
JOIN CreditCard cc ON cc.CustomerID  = c.CustomerID 
JOIN OrderItem oi ON oi.OrderID  = o.OrderID 
JOIN Invoice i ON i.InvoiceNumber  = o.InvoiceNumber 
JOIN Product p ON p.ProductID  = oi.ProductID 
JOIN RestrictedShop rs ON rs.ProductTypeID  = p.ProductTypeID 
WHERE i.InvoiceStatus = 'paid' AND year(Expiry)='2022'
GROUP BY  c.FullName
HAVING count(distinct rs.ShopID)= 
    (SELECT count(*)
    FROM RestrictedShop);

/*Gross sales for the products each shop sells in the month of febuary*/
SELECT p.ShopID, SUM(oi.UnitPrice * oi.Quantity) AS totalPrice 
    FROM OrderItem AS oi
    JOIN Product AS p ON oi.ProductID = p.ProductID
	JOIN Orders AS o ON o.OrderID = oi.OrderID
WHERE month(OrderDate)='2'
GROUP BY p.ShopID
ORDER BY totalPrice DESC