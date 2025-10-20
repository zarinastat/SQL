CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductName, Price)
VALUES
('Laptop', 1200),
('Mouse', 50),
('Keyboard', 150),
('Monitor', 450);
drop table Products_Discounted
-- 2. Products_Discounted jadvali
CREATE TABLE Products_Discounted (
    ProductID INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(50),
    Discount DECIMAL(5,2)
);

INSERT INTO Products_Discounted (ProductName, Discount)
VALUES
('Laptop', 0.10),
('Monitor', 0.15),
('Tablet', 0.20);
drop table Employees
-- 3. Employees jadvali
CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department NVARCHAR(50)
);

INSERT INTO Employees (Name, Age, Salary, Department)
VALUES
('Ali', 22, 30000, 'Finance'),
('Zarina', 27, 45000, 'HR'),
('Jasur', 35, 70000, 'IT'),
('Laylo', 24, 28000, 'HR'),
('Aziz', 40, 65000, 'Sales');

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

SELECT 
    ProductName,
    Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;


UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;

SELECT * FROM Employees;

CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);

INSERT INTO InputTbl (col1, col2)
VALUES 
('a','b'),
('a','b'),
('b','a'),
('c','d'),
('c','d'),
('m','n'),
('n','m');


SELECT DISTINCT col1, col2
FROM InputTbl;

SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

	SELECT *
FROM TestMultipleZero
WHERE (A <> 0 OR B <> 0 OR C <> 0 OR D <> 0);

SELECT *
FROM TestMultipleZero
WHERE CASE WHEN (A=0 AND B=0 AND C=0 AND D=0) THEN 0 ELSE 1 END = 1;

SELECT *
FROM TestMultipleZero
WHERE (A <> 0 OR B <> 0 OR C <> 0 OR D <> 0);

CREATE TABLE section1(
    id INT,
    name VARCHAR(20)
);

INSERT INTO section1 VALUES
(1, 'Been'),
(2, 'Roma'),
(3, 'Steven'),
(4, 'Paulo'),
(5, 'Genryh'),
(6, 'Bruno'),
(7, 'Fred'),
(8, 'Andro');

SELECT *
FROM section1
WHERE id % 2 <> 0;

SELECT TOP 1 *
FROM section1
ORDER BY id ASC;


SELECT *
FROM section1
WHERE id = (SELECT MAX(id) FROM section1);

SELECT *
FROM section1
WHERE name LIKE 'B%';

CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

