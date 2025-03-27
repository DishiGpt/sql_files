-- 1. Create a database 
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;
--  Create a Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200) NOT NULL,
    Age INT NOT NULL,
    Grade VARCHAR(5) NOT NULL,
    EnrollmentDate DATE NOT NULL
);

-- 2. Insert Sample Data 
INSERT INTO Students (Name, Age, Grade, EnrollmentDate) VALUES
('Ram', 18, 'A', '2022-07-27'),
('Bob', 19, 'B', '2021-07-27'),
('Alice', 20, 'A', '2020-07-09'),
('Simson', 22, 'C', '2019-07-17'),
('Jenny', 19, 'B', '2023-07-20');

-- 3. Retrieve all student details
SELECT * FROM Students;

--  Retrieve students who are older than 15
SELECT * FROM Students WHERE Age > 15;

--  Find the total number of students in each grade
SELECT Grade, COUNT(*) AS TotalStudents 
FROM Students 
GROUP BY Grade;

--  Update the Grade of a student whose StudentID = 2
UPDATE Students 
SET Grade = 'A' 
WHERE StudentID = 2;

--  Delete students enrolled before 2020
DELETE FROM Students 
WHERE EnrollmentDate < '2020-01-01';

--  Add Column email to the table and view all records.
ALTER TABLE Students 
ADD COLUMN Email Varchar(200);

--  Update all email IDs to abc@gmail.com
UPDATE Students 
SET Email = 'abc@gmail.com';

--  Update the email and grade where StudentID = 5
UPDATE Students 
SET Email = 'newemail@gmail.com', Grade = 'B+'
WHERE StudentID = 5;
