-- Q60. Final challenge: rebuild the complete four-table database, apply important constraints, 
-- insert eight records into every table, perform at least five operations, and document DDL/DML.
CREATE DATABASE IF NOT EXISTS college_placement_challenge_db;
USE college_placement_challenge_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY, student_name VARCHAR(80) NOT NULL, email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE, department VARCHAR(50), year INT, cgpa DECIMAL(4,2), city VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY, course_name VARCHAR(100) NOT NULL, department VARCHAR(50),
    duration_months INT, fee DECIMAL(10,2), mode VARCHAR(20), trainer_name VARCHAR(80), course_status VARCHAR(20) DEFAULT 'Active'
);
CREATE TABLE companies (
    company_id INT PRIMARY KEY, company_name VARCHAR(100) NOT NULL, email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE, industry VARCHAR(60), job_role VARCHAR(80), package_lpa DECIMAL(5,2), company_status VARCHAR(20) DEFAULT 'Active'
);
CREATE TABLE applications (
    application_id INT PRIMARY KEY, student_id INT, company_id INT, application_date DATE, round_name VARCHAR(50),
    application_status VARCHAR(25) DEFAULT 'Applied', interview_mode VARCHAR(20), offer_package DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id), FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

INSERT INTO students VALUES 
(101, 'Aditya Patil', 'aditya@gmail.com', '9876530001', 'Computer', 4, 8.2, 'Pune'),
(102, 'Sneha More', 'sneha@gmail.com', '9876530002', 'IT', 4, 7.8, 'Mumbai'),
(103, 'Rahul Jadhav', 'rahul@gmail.com', '9876530003', 'Computer', 4, 8.6, 'Nashik'),
(104, 'Pooja Kale', 'pooja@gmail.com', '9876530004', 'Data Science', 3, 9.1, 'Pune'),
(105, 'Vivek Shah', 'vivek@gmail.com', '9876530005', 'IT', 4, 7.2, 'Nagpur'),
(106, 'Neha Pawar', 'neha@gmail.com', '9876530006', 'Data Science', 3, 8.9, 'Pune'),
(107, 'Sanket Joshi', 'sanket@gmail.com', '9876530007', 'Computer', 4, 7.6, 'Satara'),
(108, 'Riya Deshmukh', 'riyad@gmail.com', '9876530008', 'IT', 4, 8.4, 'Kolhapur');

INSERT INTO courses VALUES 
(201, 'Python Full Stack', 'Computer', 6, 30000, 'Offline', 'Amit Trainer', 'Active'),
(202, 'Data Analytics', 'Data Science', 4, 25000, 'Hybrid', 'Neha Trainer', 'Active'),
(203, 'Java Full Stack', 'IT', 6, 32000, 'Offline', 'Rahul Trainer', 'Active'),
(204, 'Machine Learning', 'Data Science', 5, 35000, 'Hybrid', 'Pooja Trainer', 'Active'),
(205, 'Web Development', 'Computer', 3, 18000, 'Online', 'Vikas Trainer', 'Active'),
(206, 'Cloud Computing', 'IT', 4, 28000, 'Online', 'Suresh Trainer', 'Active'),
(207, 'Power BI', 'Data Science', 2, 12000, 'Online', 'Sneha Trainer', 'Active'),
(208, 'SQL & Database', 'IT', 2, 10000, 'Offline', 'Rohit Trainer', 'Inactive');

INSERT INTO companies VALUES 
(301, 'TechNova', 'hr@technova.com', '9876540001', 'IT', 'Python Developer', 5.5, 'Active'),
(302, 'DataWorks', 'hr@dataworks.com', '9876540002', 'Analytics', 'Data Analyst', 6.0, 'Active'),
(303, 'CloudSoft', 'hr@cloudsoft.com', '9876540003', 'Cloud', 'Cloud Engineer', 7.2, 'Active'),
(304, 'WebCore', 'hr@webcore.com', '9876540004', 'IT', 'Frontend Developer', 5.0, 'Active'),
(305, 'FinTechPro', 'hr@fintechpro.com', '9876540005', 'Finance', 'IT Backend Developer', 6.5, 'Active'),
(306, 'AI Labs', 'hr@ailabs.com', '9876540006', 'AI', 'ML Engineer', 8.0, 'Active'),
(307, 'RetailHub', 'hr@retailhub.com', '9876540007', 'Retail', 'Software Developer', 5.8, 'Inactive'),
(308, 'HealthTech', 'hr@healthtech.com', '9876540008', 'Healthcare', 'Python Developer', 6.8, 'Active');

INSERT INTO applications VALUES 
(401, 101, 301, '2026-09-01', 'Aptitude', 'Selected', 'Online', 5.5),
(402, 102, 302, '2026-09-02', 'Technical', 'In Progress', 'Online', 0.0),
(403, 103, 303, '2026-09-03', 'HR', 'Selected', 'Offline', 7.2),
(404, 104, 306, '2026-09-04', 'Technical', 'Rejected', 'Online', 0.0),
(405, 105, 304, '2026-09-05', 'Aptitude', 'Applied', 'Online', 0.0),
(406, 106, 302, '2026-09-06', 'HR', 'Selected', 'Offline', 6.0),
(407, 107, 305, '2026-09-07', 'Technical', 'In Progress', 'Online', 0.0),
(408, 108, 308, '2026-09-08', 'HR', 'Applied', 'Online', 0.0);

-- Challenge DML Operations
INSERT INTO students (student_id, student_name, email, phone, department, year, cgpa, city) 
VALUES (109, 'Tanvi Kulkarni', 'tanvi@gmail.com', '9876530009', 'Computer', 4, 9.0, 'Pune');
UPDATE students SET cgpa = 8.5 WHERE student_id = 102;
UPDATE companies SET package_lpa = 6.0 WHERE company_id = 301;
DELETE FROM applications WHERE application_id = 405;
DELETE FROM courses WHERE course_status = 'Inactive';

