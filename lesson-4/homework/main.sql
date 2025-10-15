CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Ali', 'Karimov', 25, 3000.00, 'IT'),
(2, 'Dilshod', 'Rustamov', 30, 4500.00, 'Finance'),
(3, 'Aziza', 'Saidova', 28, 4000.00, 'HR'),
(4, 'Malika', 'Usmonova', 35, 6000.00, 'IT'),
(5, 'Javlon', 'Toirov', 22, 2500.00, 'Sales');

SELECT * FROM Employees
WHERE Age > 30;

SELECT * FROM Employees
ORDER BY Salary ASC;

SELECT * FROM Employees
ORDER BY Salary DESC;

SELECT TOP 3 * FROM Employees
ORDER BY Salary DESC;

SELECT * FROM Employees
ORDER BY EmployeeID
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY;

UPDATE Employees SET Salary = NULL WHERE EmployeeID = 5;

SELECT FirstName, ISNULL(Salary, 0) AS Salary_If_Null
FROM Employees;

SELECT FirstName, COALESCE(Salary, Age, 0) AS Result
FROM Employees;

SELECT * FROM Employees
WHERE FirstName LIKE 'A%';

SELECT * FROM Employees
WHERE FirstName LIKE '%a';


CREATE TABLE Salaries (
    MinSalary DECIMAL(10,2)
);

INSERT INTO Salaries VALUES (2000), (4000), (6000);

SELECT * FROM Employees
WHERE Salary > ANY (SELECT MinSalary FROM Salaries);

SELECT * FROM Employees
WHERE Salary > ALL (SELECT MinSalary FROM Salaries);

drop table Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES
('Laptop', 'Electronics', 1500, 25),
('Phone', 'Electronics', 900, 100),
('Tablet', 'Electronics', 800, 60),
('Printer', 'Office', 300, 40),
('Desk', 'Furniture', 200, 75),
('Chair', 'Furniture', 150, 120),
('Monitor', 'Electronics', 400, 50),
('Mouse', 'Accessories', 50, 300),
('Keyboard', 'Accessories', 70, 250),
('Headphones', 'Accessories', 120, 90),
('Camera', 'Electronics', 1100, 35),
('Speaker', 'Electronics', 600, 80);

select * from Products
drop table Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Age INT,
    DepartmentName VARCHAR(30),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (FirstName, LastName, Age, DepartmentName, Salary)
VALUES
('Ali', 'Karimov', 28, 'IT', 1200),
('Dilshod', 'Rasulov', 35, 'Marketing', 1500),
(NULL, 'Tursunov', 42, 'Finance', 1800),
('Gulnoza', 'Abdullaeva', 31, 'HR', 1400),
('Madina', NULL, 38, 'IT', 1600),
('Sherzod', 'Qodirov', 45, 'Sales', 2000),
('Aziz', 'Shukurov', 33, 'Marketing', 1550),
('Nilufar', 'Xolmatova', 29, 'HR', 1300),
('Jasur', 'Aliyev', 40, 'Finance', 1750),
('Bobur', 'Eshonov', 27, 'IT', 1100),
('Kamola', 'Karimova', 36, 'Finance', 1600),
('Umid', 'Soliev', 30, 'Marketing', 1500);

select * from Employees
drop table Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50),
    City VARCHAR(30),
    PostalCode INT
);

INSERT INTO Customers (CustomerName, City, PostalCode)
VALUES
('John Doe', 'Tashkent', 100100),
('Mary Smith', 'Samarkand', 140200),
('Ali Karim', 'Bukhara', 200300),
('Sardor Nasriddinov', 'Tashkent', 100150),
('Nodira Rustamova', 'Andijan', 170400),
('Zarina Akhmedova', 'Fergana', 190500),
('Akmal Karimov', 'Samarkand', 140100),
('Dilfuza Muminova', 'Tashkent', 100180);

select * from Customers

SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;

SELECT EmployeeID,
       COALESCE(FirstName, LastName) AS FullName
FROM Employees;

SELECT DISTINCT Category, Price
FROM Products;

SELECT *
FROM Employees
WHERE (Age BETWEEN 30 AND 40)
   OR DepartmentName = 'Marketing';

   SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT *
FROM Products
WHERE Price <= 1000
  AND StockQuantity > 50
ORDER BY StockQuantity ASC;

SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

drop table Products

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    SaleAmount DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, SaleAmount, StockQuantity) VALUES
('Laptop', 'Electronics', 1200.00, 50000.00, 20),
('Mouse', 'Electronics', 25.00, 800.00, 150),
('Desk', 'Furniture', 300.00, 2500.00, 40),
('Chair', 'Furniture', 120.00, 1800.00, 80),
('Phone', 'Electronics', 900.00, 45000.00, 25),
('Pen', 'Stationery', 2.50, 120.00, 500),
('Notebook', 'Stationery', 4.00, 220.00, 400),
('Monitor', 'Electronics', 350.00, 7000.00, 30),
('Headphones', 'Electronics', 80.00, 2000.00, 60),
('Cabinet', 'Furniture', 450.00, 3000.00, 15);

select * from Products
