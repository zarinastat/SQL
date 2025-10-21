SELECT 
    Category, 
    COUNT(ProductID) AS TotalProducts
FROM Products
GROUP BY Category;

SELECT 
    Category, 
    AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics'
GROUP BY Category;

SELECT 
    CustomerName, 
    City
FROM Customers
WHERE City LIKE 'L%';

SELECT 
    ProductName
FROM Products
WHERE ProductName LIKE '%er';

SELECT 
    CustomerName, 
    Country
FROM Customers
WHERE Country LIKE '%A';

SELECT 
    MAX(Price) AS HighestPrice
FROM Products;

SELECT 
    ProductName,
    Quantity,
    CASE 
        WHEN Quantity < 30 THEN 'Low Stock'
        ELSE 'Sufficient'
    END AS StockStatus
FROM Products;

SELECT 
    Country, 
    COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Country;

SELECT 
    MIN(Quantity) AS MinQuantity, 
    MAX(Quantity) AS MaxQuantity
FROM Orders;


SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 
  AND MONTH(o.OrderDate) = 1
  AND o.CustomerID NOT IN (
      SELECT DISTINCT i.CustomerID
      FROM Invoices i
  );

  SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;


SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;


SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(OrderAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;


SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM Products;

SELECT *
INTO Population_Each_Year
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

SELECT *
INTO Population_Each_City
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;
