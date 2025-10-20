drop table Employees

CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (FirstName, LastName, Salary)
VALUES
('Ali', 'Karimov', 2500),
('Zarina', 'Sattorova', 4800),
('Jasur', 'Qodirov', 5100);

drop table Products
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

select * from Employees
select * from Products

SELECT 
    e.FirstName AS Name,
    e.LastName AS Surname,
    e.Salary AS [Monthly Salary]
FROM Employees AS e;

SELECT ProductName AS Name FROM Products
UNION
SELECT FirstName AS Name FROM Employees;

SELECT ProductName AS Name FROM Products
UNION ALL
SELECT FirstName AS Name FROM Employees;

SELECT ProductName FROM Products
INTERSECT
SELECT FirstName FROM Employees;

SELECT FirstName FROM Employees
EXCEPT
SELECT ProductName FROM Products;

SELECT 
    FirstName,
    Salary,
    CASE 
        WHEN Salary > 5000 THEN 'High Income'
        WHEN Salary BETWEEN 3000 AND 5000 THEN 'Medium Income'
        ELSE 'Low Income'
    END AS SalaryLevel
FROM Employees;

IF (SELECT COUNT(*) FROM Employees) > 2
    PRINT 'More than 2 employees';
ELSE
    PRINT '2 or fewer employees';


DECLARE @i INT = 1;

WHILE @i <= 3
BEGIN
    PRINT 'Employee #' + CAST(@i AS VARCHAR);
    SET @i = @i + 1;
END;

SELECT ProductName AS Name
FROM Products;

SELECT Client.CustomerName, Client.Country
FROM Customers AS Client;

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;


SELECT DISTINCT CustomerName, Country
FROM Customers;


SELECT ProductName,
       Price,
       CASE
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;


SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;


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
