USE dsaig6;
GO

CREATE TABLE Customer(
    CustomerID  INT NOT NULL IDENTITY(1,1),
    FullName VARCHAR(50) NOT NULL,
    FullAddress VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PhoneNumber INT NOT NULL,
    UserName VARCHAR(20) NOT NULL,
    UserPass VARCHAR(20) NOT NULL,
    
	UNIQUE(Email),
	UNIQUE(UserName),

    PRIMARY KEY (CustomerID)
);

CREATE TABLE CreditCard (
	CreditCardNumber VARCHAR(20) NOT NULL,
	Expiry DATE	NOT NULL,
    CustomerID INT NOT NULL,

    PRIMARY KEY (CreditCardNumber),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ProductType(
    ProductTypeID INT NOT NULL IDENTITY(1,1),
    ProductTypeDesc VARCHAR(500),
    ParentID INT,
    
    PRIMARY KEY (ProductTypeID),
    FOREIGN KEY (ParentID) REFERENCES ProductType(ProductTypeID)
);
CREATE TABLE Shop (
    ShopID INT NOT NULL IDENTITY(1,1),
    ShopName VARCHAR(20) NOT NULL,

    PRIMARY KEY (ShopID)
);
CREATE TABLE Product (
    ProductID INT NOT NULL IDENTITY(1,1),
    ProductTypeID INT NOT NULL,
    ProductName VARCHAR(20) NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    ProductDesc VARCHAR(500),
    Colour VARCHAR(20),
    Size VARCHAR(20),
	ShopID INT NOT NULL,

    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID),
	FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)

);

CREATE TABLE Photo (
    PhotoID INT NOT NULL IDENTITY(1,1),
    Photo VARCHAR(20) NOT NULL,
    ProductID INT NOT NULL
    
    PRIMARY KEY (PhotoID, Photo),

    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE CASCADE ON UPDATE CASCADE,
);



CREATE TABLE RestrictedShop (
    ShopID INT NOT NULL,
    ProductTypeID INT NOT NULL,

    PRIMARY KEY (ShopID, ProductTypeID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID)

);

CREATE TABLE Invoice (
    InvoiceNumber INT NOT NULL IDENTITY(1,1),
    InvoiceDate DATE NOT NULL,
    InvoiceStatus VARCHAR(20) NOT NULL,

    PRIMARY KEY (InvoiceNumber)
);

CREATE TABLE Payment (
    PaymentID INT NOT NULL IDENTITY(1,1),
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(8,2) NOT NULL,
	InvoiceNumber INT NOT NULL,
	CreditCardNumber VARCHAR(20) NOT NULL,

    PRIMARY KEY (PaymentID),
	FOREIGN KEY (InvoiceNumber) REFERENCES Invoice(InvoiceNumber),
	FOREIGN KEY (CreditCardNumber) REFERENCES CreditCard(CreditCardNumber)
);

CREATE TABLE Orders (
    OrderID INT NOT NULL IDENTITY(1,1),
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CustomerID INT NOT NULL,
    InvoiceNumber INT NOT NULL,

    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InvoiceNumber) REFERENCES Invoice(InvoiceNumber)
);

CREATE TABLE Shipment (
    ShipmentID INT NOT NULL IDENTITY(1,1),
    TrackingNo INT,
    ShipmentDate DATE,
	
    PRIMARY KEY (ShipmentID)
);

CREATE TABLE OrderItem (
    OrderID INT NOT NULL,
    SequenceID INT NOT NULL IDENTITY(1,1),
    ProductID INT NOT NULL,
    ShipmentID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(8,2) NOT NULL,
    ItemStatus VARCHAR(20) NOT NULL,

    PRIMARY KEY (SequenceID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID)
    ON DELETE CASCADE ON UPDATE CASCADE
);
