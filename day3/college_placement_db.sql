-- COLLEGE PLACEMENT DATABASE

-- PART 1: DATABASE INITIALIZATION & SCHEMA SETUP

-- Create the college placement database
CREATE DATABASE IF NOT EXISTS college_placement_db;
USE college_placement_db;

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    department VARCHAR(50),
    year INT,
    cgpa DECIMAL(4,2) CHECK (cgpa >= 0 AND cgpa <= 10),
    city VARCHAR(50)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    duration_months INT,
    fee DECIMAL(10,2) CHECK (fee >= 0),
    mode VARCHAR(20),
    trainer_name VARCHAR(80),
    course_status VARCHAR(20) DEFAULT 'Active'
);

-- Create companies table
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    industry VARCHAR(60),
    job_role VARCHAR(80),
    package_lpa DECIMAL(5,2),
    company_status VARCHAR(20) DEFAULT 'Active'
);

-- Create applications table
CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    student_id INT,
    company_id INT,
    application_date DATE,
    round_name VARCHAR(50),
    application_status VARCHAR(25) DEFAULT 'Applied',
    interview_mode VARCHAR(20),
    offer_package DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Insert 8 records into students
INSERT INTO students (student_id, student_name, email, phone, department, year, cgpa, city) VALUES 
(101, 'Aditya Patil', 'aditya@gmail.com', '9876530001', 'Computer', 4, 8.2, 'Pune'),
(102, 'Sneha More', 'sneha@gmail.com', '9876530002', 'IT', 4, 7.8, 'Mumbai'),
(103, 'Rahul Jadhav', 'rahul@gmail.com', '9876530003', 'Computer', 4, 8.6, 'Nashik'),
(104, 'Pooja Kale', 'pooja@gmail.com', '9876530004', 'Data Science', 3, 9.1, 'Pune'),
(105, 'Vivek Shah', 'vivek@gmail.com', '9876530005', 'IT', 4, 7.2, 'Nagpur'),
(106, 'Neha Pawar', 'neha@gmail.com', '9876530006', 'Data Science', 3, 8.9, 'Pune'),
(107, 'Sanket Joshi', 'sanket@gmail.com', '9876530007', 'Computer', 4, 7.6, 'Satara'),
(108, 'Riya Deshmukh', 'riyad@gmail.com', '9876530008', 'IT', 4, 8.4, 'Kolhapur');

-- Insert 8 records into courses
INSERT INTO courses (course_id, course_name, department, duration_months, fee, mode, trainer_name, course_status) VALUES 
(201, 'Python Full Stack', 'Computer', 6, 30000, 'Offline', 'Amit Trainer', 'Active'),
(202, 'Data Analytics', 'Data Science', 4, 25000, 'Hybrid', 'Neha Trainer', 'Active'),
(203, 'Java Full Stack', 'IT', 6, 32000, 'Offline', 'Rahul Trainer', 'Active'),
(204, 'Machine Learning', 'Data Science', 5, 35000, 'Hybrid', 'Pooja Trainer', 'Active'),
(205, 'Web Development', 'Computer', 3, 18000, 'Online', 'Vikas Trainer', 'Active'),
(206, 'Cloud Computing', 'IT', 4, 28000, 'Online', 'Suresh Trainer', 'Active'),
(207, 'Power BI', 'Data Science', 2, 12000, 'Online', 'Sneha Trainer', 'Active'),
(208, 'SQL & Database', 'IT', 2, 10000, 'Offline', 'Rohit Trainer', 'Inactive');

-- Insert 8 records into companies
INSERT INTO companies (company_id, company_name, email, phone, industry, job_role, package_lpa, company_status) VALUES 
(301, 'TechNova', 'hr@technova.com', '9876540001', 'IT', 'Python Developer', 5.5, 'Active'),
(302, 'DataWorks', 'hr@dataworks.com', '9876540002', 'Analytics', 'Data Analyst', 6.0, 'Active'),
(303, 'CloudSoft', 'hr@cloudsoft.com', '9876540003', 'Cloud', 'Cloud Engineer', 7.2, 'Active'),
(304, 'WebCore', 'hr@webcore.com', '9876540004', 'IT', 'Frontend Developer', 5.0, 'Active'),
(305, 'FinTechPro', 'hr@fintechpro.com', '9876540005', 'Finance', 'IT Backend Developer', 6.5, 'Active'),
(306, 'AI Labs', 'hr@ailabs.com', '9876540006', 'AI', 'ML Engineer', 8.0, 'Active'),
(307, 'RetailHub', 'hr@retailhub.com', '9876540007', 'Retail', 'Software Developer', 5.8, 'Inactive'),
(308, 'HealthTech', 'hr@healthtech.com', '9876540008', 'Healthcare', 'Python Developer', 6.8, 'Active');

-- Insert 8 records into applications
INSERT INTO applications (application_id, student_id, company_id, application_date, round_name, application_status, interview_mode, offer_package) VALUES 
(401, 101, 301, '2026-09-01', 'Aptitude', 'Selected', 'Online', 5.5),
(402, 102, 302, '2026-09-02', 'Technical', 'In Progress', 'Online', 0.0),
(403, 103, 303, '2026-09-03', 'HR', 'Selected', 'Offline', 7.2),
(404, 104, 306, '2026-09-04', 'Technical', 'Rejected', 'Online', 0.0),
(405, 105, 304, '2026-09-05', 'Aptitude', 'Applied', 'Online', 0.0),
(406, 106, 302, '2026-09-06', 'HR', 'Selected', 'Offline', 6.0),
(407, 107, 305, '2026-09-07', 'Technical', 'In Progress', 'Online', 0.0),
(408, 108, 308, '2026-09-08', 'HR', 'Applied', 'Online', 0.0);



-- Q41. Add a CHECK constraint to an existing column.
ALTER TABLE students ADD CONSTRAINT chk_year CHECK (year BETWEEN 1 AND 4);

-- Q42. Add a FOREIGN KEY constraint to an existing table.
-- (Example syntax shown if linking an unlinked column post-creation)
-- ALTER TABLE applications ADD CONSTRAINT fk_app_student FOREIGN KEY (student_id) REFERENCES students(student_id);

-- Q43. Drop an existing constraint after checking its constraint name.
ALTER TABLE students DROP CHECK chk_year;

-- Q44. Rename one table using ALTER TABLE ... RENAME TO.
ALTER TABLE companies RENAME TO recruiting_companies;

-- Q45. Add a new column with a DEFAULT value and test it with INSERT.
ALTER TABLE students ADD COLUMN placement_opted VARCHAR(5) DEFAULT 'Yes';
INSERT INTO students (student_id, student_name, email, phone, department, year, cgpa, city, placement_opted) 
VALUES (109, 'Kiran More', 'kiran@gmail.com', '9876530009', 'Computer', 4, 8.0, 'Pune', DEFAULT);

-- Q46. Add a new NOT NULL column safely to a table containing rows.
ALTER TABLE students ADD COLUMN verified_status VARCHAR(15) NOT NULL DEFAULT 'Pending';

-- Q47. Create a temporary practice table and use TRUNCATE on it.
CREATE TABLE temp_practice (id INT, note VARCHAR(50));
INSERT INTO temp_practice VALUES (1, 'Test Note');
TRUNCATE TABLE temp_practice;

-- Q48. Create a backup-style copy table using CREATE TABLE ... AS SELECT.
CREATE TABLE students_backup AS SELECT * FROM students;

-- Q49. Drop the backup/practice table using DROP TABLE.
DROP TABLE temp_practice;

-- Q50. Rename a renamed table back to its original name.
ALTER TABLE recruiting_companies RENAME TO companies;

-- Q51. Write one complete CREATE TABLE statement using PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT and CHECK where appropriate.
CREATE TABLE placement_drives (
    drive_id INT PRIMARY KEY,
    drive_title VARCHAR(100) NOT NULL,
    company_name VARCHAR(80) UNIQUE NOT NULL,
    drive_date DATE,
    min_cgpa DECIMAL(4,2) DEFAULT 6.0 CHECK (min_cgpa >= 0 AND min_cgpa <= 10),
    drive_status VARCHAR(20) DEFAULT 'Scheduled'
);

-- Q52. Insert a new parent record and then insert a related child record.
INSERT INTO students (student_id, student_name, email, phone, department, year, cgpa, city, placement_opted, verified_status) 
VALUES (110, 'Sameer Khan', 'sameer@gmail.com', '9876530010', 'Computer', 4, 8.1, 'Pune', 'Yes', 'Verified');
INSERT INTO applications (application_id, student_id, company_id, application_date, round_name, application_status, interview_mode, offer_package) 
VALUES (409, 110, 301, '2026-09-15', 'Aptitude', 'Applied', 'Online', 0.0);

-- Q53. Update a parent record's non-key field and verify related child rows remain valid.
UPDATE students SET city = 'Mumbai' WHERE student_id = 110;
SELECT * FROM applications WHERE student_id = 110;

-- Q54. Update multiple rows in one statement.
UPDATE students SET city = 'Pune-Hub' WHERE department = 'Computer';

-- Q55. Delete multiple rows using a carefully chosen WHERE condition.
DELETE FROM applications WHERE application_status = 'Applied';

-- Q56. Create a second temporary table for DDL testing.
CREATE TABLE temp_ddl_test (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(50)
);

-- Q57. Add two columns to the temporary table using ALTER TABLE.
ALTER TABLE temp_ddl_test ADD COLUMN score INT, ADD COLUMN remarks VARCHAR(100);

-- Q58. Remove one temporary column using ALTER TABLE ... DROP COLUMN.
ALTER TABLE temp_ddl_test DROP COLUMN remarks;

-- Q59. Empty the temporary table using TRUNCATE TABLE.
TRUNCATE TABLE temp_ddl_test;


