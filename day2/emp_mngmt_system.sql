-- Create Database
CREATE DATABASE emp_mngmt_system;

-- Switch to Database
USE emp_mngmt_system;

-- Create Table
CREATE TABLE employee (
    employee_id INT,
    employee_name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(50),
    joining_date DATE,
    is_active BOOLEAN
);

-- Insert Records
INSERT INTO employee (employee_id, employee_name, age, department, salary, email, joining_date, is_active) VALUES
(101, 'Aarav', 28, 'Java', 65000.00, 'aarav@company.com', '2024-03-01', TRUE),
(102, 'Diya', 26, 'Python', 62000.00, 'diya@company.com', '2024-04-10', TRUE),
(103, 'Rohan', 25, 'Testing', 45000.00, 'rohan@company.com', '2024-05-15', TRUE),
(104, 'Ananya', 30, 'HR', 55000.00, 'ananya@company.com', '2023-11-20', TRUE),
(105, 'Karan', 32, 'Finance', 70000.00, 'karan@company.com', '2023-08-12', TRUE),
(106, 'Simran', 27, 'Sales', 48000.00, 'simran@company.com', '2024-01-05', TRUE),
(107, 'Kabir', 29, 'Java', 68000.00, 'kabir@company.com', '2024-02-14', TRUE),
(108, 'Meera', 31, 'Python', 64000.00, 'meera@company.com', '2023-09-10', TRUE);

-- Update Salary
UPDATE employee 
SET salary = 72000.00 
WHERE employee_id = 101;

-- Delete Record
DELETE FROM employee 
WHERE employee_id = 105;

-- Query All Records
SELECT * FROM employee;

-- Add Column
ALTER TABLE employee 
ADD COLUMN experience DECIMAL(4,1);

-- Query All Records
SELECT * FROM employee;

-- Modify Column Data Type
ALTER TABLE employee 
MODIFY email VARCHAR(150);

-- Query Final Records
SELECT * FROM employee;
