WITH AllCombos AS (
    SELECT DISTINCT R.Region, D.Distributor
    FROM #RegionSales R
    CROSS JOIN (SELECT DISTINCT Distributor FROM #RegionSales) D
)
SELECT 
    A.Region,
    A.Distributor,
    ISNULL(S.Sales, 0) AS Sales
FROM AllCombos A
LEFT JOIN #RegionSales S 
    ON A.Region = S.Region AND A.Distributor = S.Distributor
ORDER BY A.Distributor, A.Region;


SELECT e.name
FROM Employee e
JOIN Employee m ON e.id = m.managerId
GROUP BY e.id, e.name
HAVING COUNT(*) >= 5;

SELECT 
    p.product_name, 
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE YEAR(o.order_date) = 2020 AND MONTH(o.order_date) = 2
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

SELECT CustomerID, Vendor
FROM (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY CustomerID, Vendor
) t
WHERE rnk = 1;

DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2, @flag BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @flag = 0;
        BREAK;
    END
    SET @i = @i + 1;
END

IF @flag = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';

SELECT 
    Device_id,
    COUNT(DISTINCT Locations) AS no_of_location,
    (SELECT TOP 1 Locations 
     FROM Device d2 
     WHERE d1.Device_id = d2.Device_id
     GROUP BY Locations
     ORDER BY COUNT(*) DESC) AS max_signal_location,
    COUNT(*) AS no_of_signals
FROM Device d1
GROUP BY Device_id;

SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptID = e.DeptID
);

SELECT 
    SUM(CASE 
        WHEN c.CountMatch = 3 THEN 100
        WHEN c.CountMatch BETWEEN 1 AND 2 THEN 10
        ELSE 0 END) AS Total_Winnings
FROM (
    SELECT 
        TicketID,
        COUNT(DISTINCT t.Number) AS CountMatch
    FROM Tickets t
    JOIN Numbers n ON t.Number = n.Number
    GROUP BY TicketID
) c;

WITH user_summary AS (
    SELECT 
        Spend_date, 
        User_id,
        SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS MobileSpend,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS DesktopSpend
    FROM Spending
    GROUP BY Spend_date, User_id
)
SELECT 
    Spend_date,
    'Mobile' AS Platform,
    SUM(MobileSpend) AS Total_Amount,
    COUNT(DISTINCT User_id) AS Total_Users
FROM user_summary
WHERE MobileSpend > 0 AND DesktopSpend = 0
GROUP BY Spend_date
UNION ALL
SELECT 
    Spend_date,
    'Desktop',
    SUM(DesktopSpend),
    COUNT(DISTINCT User_id)
FROM user_summary
WHERE DesktopSpend > 0 AND MobileSpend = 0
GROUP BY Spend_date
UNION ALL
SELECT 
    Spend_date,
    'Both',
    SUM(MobileSpend + DesktopSpend),
    COUNT(DISTINCT User_id)
FROM user_summary
WHERE MobileSpend > 0 AND DesktopSpend > 0
GROUP BY Spend_date
ORDER BY Spend_date, Platform;

WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 100
)
SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
ORDER BY g.Product;
