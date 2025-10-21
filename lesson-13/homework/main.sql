SELECT CONCAT(EMPLOYEE_ID, '-', FIRST_NAME, ' ', LAST_NAME) AS EmployeeInfo
FROM Employees
WHERE EMPLOYEE_ID = 100;

UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');

SELECT EMPLOYEE_ID, PHONE_NUMBER FROM Employees
WHERE PHONE_NUMBER LIKE '%999%';

SELECT 
    FIRST_NAME AS [First Name],
    LEN(FIRST_NAME) AS [Name Length]
FROM Employees
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;


SELECT 
    MANAGER_ID,
    SUM(SALARY) AS TotalSalary
FROM Employees
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID;


SELECT 
    Year,
    GREATEST(Max1, Max2, Max3) AS HighestValue
FROM TestMax;

SELECT 
    Year,
    CASE 
        WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
        WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
        ELSE Max3
    END AS HighestValue
FROM TestMax;

SELECT * 
FROM cinema
WHERE Id % 2 = 1
AND description NOT LIKE '%boring%';


SELECT * 
FROM SingleOrder
ORDER BY 
    CASE WHEN Id = 0 THEN 1 ELSE 0 END, Id;

	SELECT COALESCE(col1, col2, col3, col4) AS FirstNonNull
FROM person;


ELECT 
    LEFT(FullName, CHARINDEX(' ', FullName)-1) AS FirstName,
    SUBSTRING(FullName, CHARINDEX(' ', FullName)+1, 
        CHARINDEX(' ', FullName, CHARINDEX(' ', FullName)+1) - CHARINDEX(' ', FullName)-1) AS MiddleName,
    RIGHT(FullName, LEN(FullName) - CHARINDEX(' ', FullName, CHARINDEX(' ', FullName)+1)) AS LastName
FROM Students;


SELECT * 
FROM Orders
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders WHERE DeliveryState = 'California'
)
AND DeliveryState = 'Texas';

SELECT STRING_AGG(ValueColumn, ', ') AS ConcatenatedValues
FROM DMLTable;

SELECT *
FROM Employees
WHERE LEN(REPLACE(CONCAT(FIRST_NAME, LAST_NAME), 'a', '')) <= 
      LEN(CONCAT(FIRST_NAME, LAST_NAME)) - 3;


SELECT 
    DEPARTMENT_ID,
    COUNT(*) AS TotalEmployees,
    100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*) 
        AS PercentageOver3Years
FROM Employees
GROUP BY DEPARTMENT_ID;


SELECT 
    StudentID,
    Score,
    SUM(Score) OVER (ORDER BY StudentID) AS RunningTotal
FROM Students;

SELECT BirthDate, COUNT(*) AS StudentCount
FROM Student
GROUP BY BirthDate
HAVING COUNT(*) > 1;

SELECT 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;


	WITH chars AS (
    SELECT value AS ch 
    FROM STRING_SPLIT('tf56sd#%OqH', '')
)
SELECT 
    STRING_AGG(CASE WHEN ch LIKE '[A-Z]' THEN ch END, '') AS Uppercase,
    STRING_AGG(CASE WHEN ch LIKE '[a-z]' THEN ch END, '') AS Lowercase,
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
    STRING_AGG(CASE WHEN ch NOT LIKE '[A-Za-z0-9]' THEN ch END, '') AS Others
FROM chars;
