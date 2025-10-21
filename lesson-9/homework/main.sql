SELECT 
    p.ProductName, 
    s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;


SELECT 
    d.DepartmentName, 
    e.EmployeeName
FROM Departments d
CROSS JOIN Employees e;

SELECT 
    s.SupplierName, 
    p.ProductName
FROM Products p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID;

	SELECT 
    c.CustomerName, 
    o.OrderID
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;

	SELECT 
    s.StudentName, 
    c.CourseName
FROM Students s
CROSS JOIN Courses c;


SELECT 
    p.ProductName, 
    o.OrderID
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID;


SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;



SELECT 
    s.StudentName, 
    e.CourseID
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID;c


SELECT 
    o.OrderID, 
    p.PaymentID, 
    p.Amount
FROM Orders o
INNER JOIN Payments p
    ON o.OrderID = p.OrderID;

SELECT 
    o.OrderID, 
    p.ProductName, 
    p.Price
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.Price > 100;

SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;

SELECT 
    o.OrderID, 
    p.ProductName, 
    o.Quantity AS OrderedQty, 
    p.Quantity AS StockQty
FROM Orders o
INNER JOIN Products p 
    ON o.ProductID = p.ProductID
WHERE o.Quantity > p.Quantity;

SELECT 
    c.CustomerName, 
    s.ProductID, 
    s.SaleAmount
FROM Customers c
INNER JOIN Sales s 
    ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500;

SELECT 
    st.StudentName, 
    c.CourseName
FROM Enrollments e
INNER JOIN Students st 
    ON e.StudentID = st.StudentID
INNER JOIN Courses c 
    ON e.CourseID = c.CourseID;

SELECT 
    p.ProductName, 
    s.SupplierName
FROM Products p
INNER JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';


SELECT 
    o.OrderID, 
    o.TotalAmount, 
    p.PaymentAmount
FROM Orders o
INNER JOIN Payments p 
    ON o.OrderID = p.OrderID
WHERE p.PaymentAmount < o.TotalAmount;


SELECT 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID;


SELECT 
    p.ProductName, 
    c.CategoryName
FROM Products p
INNER JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

SELECT 
    c.CustomerName, 
    s.SaleID, 
    s.SaleAmount
FROM Sales s
INNER JOIN Customers c 
    ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

SELECT 
    o.OrderID, 
    c.CustomerName, 
    o.TotalAmount
FROM Orders o
INNER JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' 
  AND o.TotalAmount > 100;
