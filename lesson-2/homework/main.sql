CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(1, 'Malika Tursunova', 5500.00),
(2, 'Javlonbek Akbarov', 6200.00);

select * from Employees

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;


Delete from Employees
Where EmpID = 2;

alter table Employees
alter column Name varchar(100);

alter table Employees
add Department varchar(50);

alter table Employees
alter column Salary float;

drop table Departments
create table Departments (
	DepartmentID int primary key,
	DepartmentName varchar(50)
);

select * from Departments

TRUNCATE TABLE Employees;
