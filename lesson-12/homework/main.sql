SELECT 
    e.EmployeeName, 
    e.Salary, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;

SELECT 
    c.FirstName, 
    c.LastName, 
    o.OrderDate
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
LEFT JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID;

	SELECT 
    s.SupplierName, 
    p.ProductName
FROM Suppliers s
LEFT JOIN Products p 
    ON s.SupplierID = p.SupplierID;

	SELECT 
    o.OrderID, 
    o.OrderDate, 
    p.PaymentDate, 
    p.Amount
FROM Orders o
FULL OUTER JOIN Payments p 
    ON o.OrderID = p.OrderID;

	SELECT 
    e.EmployeeName AS EmployeeName, 
    m.EmployeeName AS ManagerName
FROM Employees e
LEFT JOIN Employees m 
    ON e.ManagerID = m.EmployeeID;

	SELECT 
    s.StudentName, 
    c.CourseName
FROM Enrollments e
INNER JOIN Students s 
    ON e.StudentID = s.StudentID
INNER JOIN Courses c 
    ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

SELECT 
    c.FirstName, 
    c.LastName, 
    o.Quantity
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;.


SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';


SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
INNER JOIN Employees e 
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;

SELECT 
    p.ProductID, 
    p.ProductName
FROM Products p
LEFT JOIN Sales s 
    ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

SELECT 
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID;


SELECT 
    e1.EmployeeName AS Employee1,
    e2.EmployeeName AS Employee2,
    e1.ManagerID
FROM Employees e1
INNER JOIN Employees e2 
    ON e1.ManagerID = e2.ManagerID
    AND e1.EmployeeID < e2.EmployeeID;


SELECT 
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName
FROM Orders o
INNER JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;


SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales'
  AND e.Salary > 60000;

SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM Orders o
INNER JOIN Payments p 
    ON o.OrderID = p.OrderID;

SELECT 
    p.ProductID, 
    p.ProductName
FROM Products p
LEFT JOIN Orders o 
    ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;


SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;

SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');


SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM Departments d
INNER JOIN Employees e 
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA'
  AND YEAR(o.OrderDate) = 2023;


  SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;


SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
INNER JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');


SELECT 
    c.CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;


SELECT 
    C.CustomerName,
    O.OrderTotal
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.OrderTotal > 500;

SELECT 
    P.ProductName,
    S.SaleDate,
    S.SaleAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE YEAR(S.SaleDate) = 2022 OR S.SaleAmount > 400;

SELECT 
    P.ProductName,
    SUM(S.SaleAmount) AS TotalSalesAmount
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
GROUP BY P.ProductName;

SELECT 
    E.EmployeeName,
    D.DepartmentName,
    E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'HR' AND E.Salary > 60000;


SELECT 
    P.ProductName,
    S.SaleDate,
    P.StockQuantity
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE YEAR(S.SaleDate) = 2023 AND P.StockQuantity > 100;

SELECT 
    E.EmployeeName,
    D.DepartmentName,
    E.HireDate
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales' OR YEAR(E.HireDate) > 2020;
