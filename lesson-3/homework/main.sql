CREATE TABLE Department (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,  
    DeptName VARCHAR(50) NOT NULL,          
    Location VARCHAR(50) NULL               
);

INSERT INTO Department (DeptName, Location)
VALUES ('IT', 'Tashkent'),
       ('HR', 'Samarkand'),
       ('Finance', NULL);

select * from Department


CREATE TABLE Product (
    ProductID INT PRIMARY KEY,               
    ProductName VARCHAR(100) UNIQUE,         
    Price DECIMAL(10,2) CHECK (Price > 0),
    CategoryID INT
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

ALTER TABLE Product
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


SELECT * FROM Department;
SELECT * FROM Product;
SELECT * FROM Categories;

drop table Department
drop table Product
drop table Categories

CREATE TABLE Product(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Product (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.00);

select * from Product

CREATE TABLE ExampleTable (
    Name VARCHAR(50) NOT NULL,  
    Email VARCHAR(100) NULL     
);


CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,  -- 1 dan boshlaydi, har safar 1 ga oshadi
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Employee (FirstName, LastName)
VALUES ('Ali', 'Karimov'),
       ('Dilnoza', 'Yuldasheva');

SELECT * FROM Employee;

SELECT * FROM Product
SELECT * FROM Employee;

IF OBJECT_ID('Categories', 'U') IS NOT NULL
    DROP TABLE Categories;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);

IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NULL,
    CategoryID INT NULL
);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

INSERT INTO Categories (CategoryName)
VALUES ('Electronics'), ('Clothing'), ('Food');

INSERT INTO Products (ProductName, Price, CategoryID, Stock)
VALUES
('Phone', 500.00, 1, 10),
('T-shirt', 25.00, 2, 50),
('Bread', 2.00, 3, 100),
('Laptop', NULL, 1, 5);


SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price, Stock
FROM Products;

SELECT * FROM Categories;
SELECT * FROM Products;

IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),   
    Email VARCHAR(100)
);

IF OBJECT_ID('Invoices', 'U') IS NOT NULL
    DROP TABLE Invoices;

	CREATE TABLE Invoices (
    InvoiceID INT IDENTITY(100,10) PRIMARY KEY,  -- Start at 100, increment by 10
    InvoiceDate DATE DEFAULT GETDATE(),
    Amount DECIMAL(10,2)
);

IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL
    DROP TABLE OrderDetails;

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (OrderID, ProductID)  -- Composite primary key (2 columns)
);

IF OBJECT_ID('Employees', 'U') IS NOT NULL
    DROP TABLE Employees;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,      -- UNIQUE KEY: no duplicate emails
    HireDate DATE DEFAULT GETDATE()
);

IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATE DEFAULT GETDATE()
);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO Customers (FullName, Age, Email) VALUES ('Ali Karimov', 25, 'ali@example.com');
INSERT INTO Orders (CustomerID) VALUES (1);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 101, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 102, 3);


SELECT * FROM Orders;
SELECT * FROM OrderDetails;
