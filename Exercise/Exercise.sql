USE dsaig6;
GO

/*Given a customer by an email address, returns the product ids that have been ordered and paid by this customer but not yet shipped.*/
SELECT p.ProductID
FROM Product p
    INNER JOIN OrderItem oi ON p.ProductID  = oi.ProductID
    INNER JOIN Orders o ON o.OrderID  = oi.OrderID
    INNER JOIN Customer c ON c.CustomerID  = o.CustomerID
    INNER JOIN Invoice i ON i.InvoiceNumber  = o.InvoiceNumber
WHERE oi.ItemStatus  <> 'shipped' AND i.InvoiceStatus = 'paid'
    AND o.CustomerID  = (SELECT CustomerID
    FROM Customer
    WHERE Email  = 'benedict85@hotmail.com')
;

/*Find the 3 bestselling product type ids in terms of product quantity sold. The products of concerned have to be ordered and paid. Whether they have been shipped is irrelevant.*/
SELECT TOP 3
    (oi.ProductID) , SUM(oi.Quantity) AS TotalQuantity
FROM ProductType pt
    INNER JOIN Product p ON p.ProductTypeID  = pt.ProductTypeID
    INNER JOIN OrderItem oi ON oi.ProductID = p.ProductID
    INNER JOIN Orders o ON o.OrderID  = oi.OrderID
    INNER JOIN Invoice i ON i.InvoiceNumber = o.InvoiceNumber
WHERE i.InvoiceStatus = 'paid'
GROUP BY oi.ProductID
ORDER BY TotalQuantity DESC
;

/*Return the descriptions of all the 2nd level product types. The product types with no parent will  be  regarded  as  1st  level  product  types  and  their  direct  child  product  types  will  be  regarded as 2nd level. */
SELECT pt.ProductTypeDesc
FROM ProductType pt
    INNER JOIN ProductType pt2 ON pt.ParentID = pt2.ProductTypeID
WHERE pt2.ParentID IS NULL
;

/*Find 2 product ids that are ordered together the most.*/
SELECT TOP 1
    (ProdMatches), ProductID1, ProductID2
FROM
    (SELECT COUNT(*) AS ProdMatches, ProductID1, ProductID2
    FROM
        (SELECT oi.ProductID AS ProductID1 , oi2.ProductID AS ProductID2
        FROM OrderItem oi
            INNER JOIN OrderItem oi2 ON oi2.OrderID  = oi.OrderID
        WHERE oi2.ProductID <> oi.ProductID AND oi2.OrderID  = oi.OrderID) AS d
    GROUP BY ProductID1, ProductID2) AS d2

/*Get 3 random customers and return their email addresses.*/
SELECT TOP 3
    Email
FROM Customer
ORDER BY NEWID()
;

/*Customers that have one paid for at least an item from each restricted shop*/
SELECT c.FullName
FROM Customer c
    JOIN Orders o ON o.CustomerID  = c.CustomerID
    JOIN CreditCard cc ON cc.CustomerID  = c.CustomerID
    JOIN OrderItem oi ON oi.OrderID  = o.OrderID
    JOIN Invoice i ON i.InvoiceNumber  = o.InvoiceNumber
    JOIN Product p ON p.ProductID  = oi.ProductID
    JOIN RestrictedShop rs ON rs.ProductTypeID  = p.ProductTypeID
WHERE i.InvoiceStatus = 'paid'
GROUP BY  c.FullName
HAVING count(distinct rs.ShopID)= 
    (SELECT count(*)
FROM RestrictedShop)
;

/*Gross sales for the shipped products of shops in the month of febuary*/
SELECT p.ShopID, SUM(oi.UnitPrice * oi.Quantity) AS GrossSale
FROM OrderItem AS oi
    JOIN Product AS p ON oi.ProductID = p.ProductID
    JOIN Orders AS o ON o.OrderID = oi.OrderID
WHERE month(OrderDate)='2' AND o.OrderStatus = 'shipped'
GROUP BY p.ShopID
ORDER BY GrossSale DESC
;