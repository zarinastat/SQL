WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers
    WHERE n < 1000
)
SELECT * FROM Numbers;

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID;

WITH AvgSalary AS (
    SELECT AVG(Salary) AS AverageSalary
    FROM Employees
)
SELECT * FROM AvgSalary;

SELECT 
    p.ProductID,
    p.ProductName,
    s.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) s ON p.ProductID = s.ProductID;

WITH Doubles AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n * 2 FROM Doubles
    WHERE n * 2 < 1000000
)
SELECT * FROM Doubles;


WITH EmployeeSales AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.FirstName, e.LastName, es.SaleCount
FROM Employees e
JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
WHERE es.SaleCount > 5;


WITH ProductSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM Products p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;


WITH AvgSalary AS (
    SELECT AVG(Salary) AS AverageSalary FROM Employees
)
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e, AvgSalary
WHERE e.Salary > AvgSalary.AverageSalary;


SELECT TOP 5 
    e.FirstName, e.LastName, s.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.OrderCount DESC;

SELECT 
    p.CategoryID,
    SUM(s.SalesAmount) AS TotalSales
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.CategoryID;

WITH Factorial AS (
    SELECT Number, Number AS Fact, 1 AS n
    FROM Numbers1
    UNION ALL
    SELECT f.Number, f.Fact * (f.n + 1), f.n + 1
    FROM Factorial f
    WHERE f.n + 1 <= f.Number
)
SELECT Number, MAX(Fact) AS FactorialValue
FROM Factorial
GROUP BY Number;

WITH SplitCTE AS (
    SELECT Id, LEFT(String, 1) AS CharPart, RIGHT(String, LEN(String)-1) AS Remainder
    FROM Example
    UNION ALL
    SELECT Id, LEFT(Remainder, 1), RIGHT(Remainder, LEN(Remainder)-1)
    FROM SplitCTE
    WHERE LEN(Remainder) > 0
)
SELECT Id, CharPart FROM SplitCTE;


WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS Year,
        MONTH(SaleDate) AS Month,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
)
SELECT 
    Year, Month, TotalSales,
    TotalSales - LAG(TotalSales) OVER (ORDER BY Year, Month) AS SalesDifference
FROM MonthlySales;

WITH Fibonacci AS (
    SELECT 1 AS n, 0 AS a, 1 AS b
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < 15
)
SELECT n, a AS FibonacciNumber FROM Fibonacci;

SELECT *
FROM FindSameCharacters
WHERE LEN(Vals) > 1
AND LEN(Vals) = LEN(REPLACE(Vals, LEFT(Vals,1), ''));

DECLARE @n INT = 5;
WITH Numbers AS (
    SELECT 1 AS num, CAST('1' AS VARCHAR(50)) AS seq
    UNION ALL
    SELECT num + 1, seq + CAST(num + 1 AS VARCHAR(10))
    FROM Numbers
    WHERE num + 1 <= @n
)
SELECT seq FROM Numbers;

WITH RecentSales AS (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
)
SELECT e.FirstName, e.LastName, r.TotalSales
FROM Employees e
JOIN RecentSales r ON e.EmployeeID = r.EmployeeID
ORDER BY r.TotalSales DESC;

SELECT 
    Pawan_slug_name,
    REPLACE(
        TRANSLATE(Pawan_slug_name, '0123456789', '0000000000'),
        '--', '-'
    ) AS CleanedString
FROM RemoveDuplicateIntsFromNames;
