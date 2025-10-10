create database lesson01

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'Ali Karimov', 20),
(2, 'Dilnoza Rashidova', 19),
(3, 'Javlonbek Tursunov', 21);

select * from Students
