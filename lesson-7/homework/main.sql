drop table Sales
CREATE TABLE Sales (
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales VALUES
('Laptop', 'Electronics', 5, 1200),
('Phone', 'Electronics', 10, 800),
('Headphones', 'Electronics', 15, 150),
('T-Shirt', 'Clothing', 20, 30),
('Jeans', 'Clothing', 10, 50),
('Shoes', 'Clothing', 5, 80),
('Fridge', 'Home', 3, 900),
('Oven', 'Home', 2, 700);

SELECT COUNT(*) AS TotalProducts
FROM Sales;

SELECT SUM(Quantity) AS TotalQuantity
FROM Sales;

SELECT AVG(Price) AS AveragePrice
FROM Sales;

SELECT 
    MIN(Price) AS MinPrice,
    MAX(Price) AS MaxPrice
FROM Sales;

SELECT 
    Category,
    SUM(Quantity) AS TotalQty,
    AVG(Price) AS AvgPrice
FROM Sales
GROUP BY Category;

SELECT 
    Category,
    SUM(Quantity) AS TotalQty
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 20;

SELECT 
    Category,
    AVG(Price) AS AvgPrice,
    MAX(Price) AS MaxPrice
FROM Sales
GROUP BY Category;

SELECT 
    Category,
    AVG(Price) AS AvgPrice
FROM Sales
GROUP BY Category
HAVING AVG(Price) > 500;

SELECT 
    Category,
    COUNT(ProductName) AS ProductCount
FROM Sales
GROUP BY Category;

SELECT MIN(Price) AS MinPrice
FROM Products;

SELECT MAX(Salary) AS MaxSalary
FROM Employees;

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT AVG(Age) AS AverageAge
FROM Employees;


SELECT TOP 5 *
FROM Sales;

SELECT 
    Category,
    SUM(Amount) AS TotalSales,
    AVG(Amount) AS AvgSales
FROM Sales
GROUP BY Category;
