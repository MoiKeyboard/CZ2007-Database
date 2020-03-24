CREATE TABLE Customer(
    CustomerID  INT NOT NULL,
    FullAddress VARCHAR(50) NOT NULL,
    PhoneNumber INT NOT NULL,
    UserName VARCHAR(20) NOT NULL,
    UserPass VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (CustomerID)
);

CREATE TABLE CreditCard (
	CreditCardID INT NOT NULL,
	Expiry    DATE	NOT NULL,
    CustomerID INT NOT NULL,
    
    PRIMARY KEY (CreditCardID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ProductType(
    ProductTypeID INT NOT NULL,
    ProductTypeDesc VARCHAR(500),
    ParentID INT,
    
    PRIMARY KEY (ProductTypeID),
    FOREIGN KEY (ParentID) REFERENCES ProductType(ProductTypeID)
);

CREATE TABLE Product (
    ProductID INT NOT NULL,
    ProductTypeID INT NOT NULL,
    ProductName VARCHAR(20) NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    ProductDesc VARCHAR(500),
    Colour VARCHAR(20),
    Size VARCHAR(20),

    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID)
);

CREATE TABLE Shop (
    ShopID INT NOT NULL,
    ShopName VARCHAR(20) NOT NULL,

    PRIMARY KEY (ShopID)
);

CREATE TABLE RestrictedShop (
    ShopID INT NOT NULL,
    ProductTypeID INT NOT NULL,

    PRIMARY KEY (ShopID, ProductTypeID)
);

CREATE TABLE Invoice (
    InvoiceID INT NOT NULL,
    InvoiceDate DATE NOT NULL,
    InvoiceStatus VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (InvoiceID)
);

CREATE TABLE Payment (
    PaymentID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(8,2) NOT NULL,

    PRIMARY KEY (PaymentID)
);

CREATE TABLE Orders (
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CreditCardID INT NOT NULL,
    InvoiceID INT NOT NULL,

    PRIMARY KEY (OrderID),
    FOREIGN KEY (CreditCardID) REFERENCES CreditCard(CreditCardID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);

CREATE TABLE Shipment (
    ShipmentID INT NOT NULL,
    TrackingNo INT,
    ShipmentDate DATE,

    PRIMARY KEY (ShipmentID)
);

CREATE TABLE OrderItem (
    OrderID INT NOT NULL,
    SequenceID INT NOT NULL,
    ProductID INT NOT NULL,
    ShipmentID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(8,2) NOT NULL,
    ItemStatus VARCHAR(20) NOT NULL,

    PRIMARY KEY (OrderID, SequenceID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID)
);