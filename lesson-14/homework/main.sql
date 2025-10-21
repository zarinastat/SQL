SELECT 
    LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
    LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS Surname
FROM TestMultipleColumns;


SELECT *
FROM TestPercent
WHERE StringColumn LIKE '%[%]%';


SELECT 
    PARSENAME(REPLACE(ValueColumn, '.', '.'), 3) AS Part1,
    PARSENAME(REPLACE(ValueColumn, '.', '.'), 2) AS Part2,
    PARSENAME(REPLACE(ValueColumn, '.', '.'), 1) AS Part3
FROM Splitter;

SELECT value AS SplitPart
FROM Splitter
CROSS APPLY STRING_SPLIT(ValueColumn, '.');

SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

SELECT 
    Vals,
    LEN(Vals) - LEN(REPLACE(Vals, ' ', '')) AS SpaceCount
FROM CountSpaces;


SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Salary,
    m.FirstName AS ManagerName,
    m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m 
    ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;


SELECT 
    EmployeeID,
    FirstName,
    LastName,
    HireDate,
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 11 AND 14;

SELECT w1.Id, w1.RecordDate, w1.Temperature
FROM weather w1
JOIN weather w2
  ON DATEDIFF(day, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

SELECT TRIM(value) AS third_fruit
FROM STRING_SPLIT((SELECT fruit_list FROM fruits), ',')
WHERE ordinal = 3;

WITH FruitCTE AS (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn,
         value
  FROM STRING_SPLIT((SELECT fruit_list FROM fruits), ',')
)
SELECT value AS third_fruit
FROM FruitCTE
WHERE rn = 3;


SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS Employment_Stage
FROM Employees;

SELECT 
    Id,
    VALS,
    LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'x') - 1) AS StartInteger
FROM GetIntegers
WHERE VALS IS NOT NULL AND VALS LIKE '[0-9]%';


SELECT 
    Id,
    Vals,
    CONCAT(
        SUBSTRING(Vals, CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1) - 1, 1), ',',
        LEFT(Vals, 1), ',',
        SUBSTRING(Vals, 3, LEN(Vals))
    ) AS SwappedVals
FROM MultipleVals;

WITH Numbers AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131'))
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS character
FROM Numbers;

WITH FirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT 
    a.player_id,
    a.device_id
FROM Activity a
JOIN FirstLogin f
  ON a.player_id = f.player_id
 AND a.event_date = f.first_login;

 WITH cte AS (
    SELECT value AS ch
    FROM STRING_SPLIT('rtcfvty34redt', '')
)
SELECT 
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
    STRING_AGG(CASE WHEN ch LIKE '[A-Za-z]' THEN ch END, '') AS Letters
FROM cte;
