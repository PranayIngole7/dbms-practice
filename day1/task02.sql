"""

-- SCENARIO 1: COLLEGE STUDENT MANAGEMENT SYSTEM

CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

-- Task 1 – Create Student Table
CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Pune',
    course VARCHAR(50) NOT NULL
);

-- Task 2 – Insert Students (Omitting city for some to trigger DEFAULT 'Pune')
INSERT INTO student (student_id, student_name, email, age, city, course) VALUES
(101, 'Aarav Sharma', 'aarav@gmail.com', 20, 'Mumbai', 'Java'),
(102, 'Priya Verma', 'priya@gmail.com', 19, 'Nashik', 'Python'),
(103, 'Rohan Das', 'rohan@gmail.com', 21, 'Nagpur', 'SQL'),
(104, 'Sneha Patel', 'sneha@gmail.com', 18, DEFAULT, 'Java'),
(105, 'Vikram Singh', 'vikram@gmail.com', 22, 'Pune', 'Java'),
(106, 'Ananya Iyer', 'ananya@gmail.com', 20, 'Mumbai', 'Python'),
(107, 'Karan Kapoor', 'karan@gmail.com', 23, DEFAULT, 'Web Dev'),
(108, 'Neha Joshi', 'neha@gmail.com', 19, 'Nashik', 'Data Science');

-- Task 3 – Test PRIMARY KEY (Expected error if executed: Duplicate entry)
INSERT INTO student (student_id, student_name, email, age, city, course) 
VALUES (101, 'Duplicate Student', 'dup@gmail.com', 20, 'Pune', 'Java');

-- Task 4 – Test NOT NULL (Expected error if executed: Column cannot be null)
INSERT INTO student (student_id, student_name, email, age, city, course) 
VALUES (109, NULL, 'noname@gmail.com', 20, 'Pune', 'Java');

-- Task 5 – Test UNIQUE (Expected error if executed: Duplicate entry for email)
INSERT INTO student (student_id, student_name, email, age, city, course) 
VALUES (110, 'Test User', 'aarav@gmail.com', 21, 'Pune', 'Python');

-- Task 6 – Test CHECK (Expected error for age 16, success for age 18)
INSERT INTO student (student_id, student_name, email, age, city, course) 
VALUES (111, 'Young Student', 'young@gmail.com', 16, 'Pune', 'Java');

-- Task 7 – Update Student City (Student 103 changes city to Mumbai)
UPDATE student 
SET city = 'Mumbai' 
WHERE student_id = 103;

-- Task 8 – Update Course (Student 105 changes course from Java to Python)
UPDATE student 
SET course = 'Python' 
WHERE student_id = 105;

-- Task 9 – Delete Student (Student 108 cancels admission)
DELETE FROM student 
WHERE student_id = 108;

-- Task 10 – Verify Data
SELECT * FROM student;


-- SCENARIO 2: COMPANY EMPLOYEE MANAGEMENT

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary >= 15000),
    city VARCHAR(50) DEFAULT 'Pune',
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee (emp_id, emp_name, email, salary, city, dept_id) VALUES
(101, 'Rahul', 'rahul.it@company.com', 45000.00, 'Mumbai', 1),
(102, 'Priya', 'priya.hr@company.com', 40000.00, DEFAULT, 2),
(103, 'Amit', 'amit.fin@company.com', 50000.00, 'Nashik', 3),
(104, 'Sneha', 'sneha.mkt@company.com', 38000.00, DEFAULT, 4),
(105, 'Rohit', 'rohit.sales@company.com', 35000.00, 'Nagpur', 5),
(106, 'Ananya', 'ananya.it@company.com', 48000.00, 'Pune', 1),
(107, 'Karan', 'karan.hr@company.com', 42000.00, 'Mumbai', 2),
(108, 'Neha', 'neha.fin@company.com', 52000.00, DEFAULT, 3),
(109, 'Vikram', 'vikram.mkt@company.com', 39000.00, 'Nashik', 4),
(110, 'Pooja', 'pooja.sales@company.com', 36000.00, 'Pune', 5);

UPDATE employee SET dept_id = 1 WHERE emp_id = 103;
UPDATE employee SET salary = salary + 5000.00 WHERE emp_id = 105;
UPDATE employee SET salary = salary + 3000.00 WHERE dept_id = 1;
DELETE FROM employee WHERE emp_id = 108;


-- SCENARIO 3: ONLINE SHOPPING SYSTEM

CREATE DATABASE IF NOT EXISTS shopping_db;
USE shopping_db;

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    price DECIMAL(10,2) CHECK (price > 0),
    quantity INT DEFAULT 0,
    status VARCHAR(50) DEFAULT 'Available',
    category VARCHAR(50)
);

INSERT INTO product (product_id, product_name, email, price, quantity, status, category) VALUES
(1, 'Laptop', 'contact@laptopstore.com', 55000.00, 15, DEFAULT, 'Electronics'),
(2, 'Mobile', 'contact@mobilestore.com', 25000.00, DEFAULT, DEFAULT, 'Electronics'),
(3, 'Keyboard', 'contact@keyboards.com', 1200.00, 40, 'Out of Stock', 'Accessories'),
(4, 'Mouse', 'contact@mouses.com', 800.00, DEFAULT, DEFAULT, 'Accessories'),
(5, 'Monitor', 'contact@monitors.com', 12000.00, 10, DEFAULT, 'Electronics'),
(6, 'Headphones', 'contact@headphones.com', 2500.00, 25, 'Available', 'Accessories'),
(7, 'Printer', 'contact@printers.com', 8500.00, 5, DEFAULT, 'Electronics'),
(8, 'Tablet', 'contact@tablets.com', 18000.00, DEFAULT, DEFAULT, 'Electronics'),
(9, 'Webcam', 'contact@webcams.com', 3000.00, 30, 'Available', 'Accessories'),
(10, 'Speaker', 'contact@speakers.com', 4500.00, 12, DEFAULT, 'Electronics');

UPDATE product SET price = price + 2000.00 WHERE product_id = 1;
UPDATE product SET quantity = 50 WHERE product_id = 4;
UPDATE product SET status = 'Out of Stock' WHERE product_id = 1;
DELETE FROM product WHERE product_id = 3;


-- SCENARIO 4: EMPLOYEE REGISTRATION SYSTEM

CREATE DATABASE IF NOT EXISTS reg_db;
USE reg_db;

CREATE TABLE employee_reg (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mobile VARCHAR(15),
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Pune'
);

INSERT INTO employee_reg (employee_id, name, email, mobile, age, city) VALUES
(1, 'Rahul Verma', 'rahul@reg.com', '9876543210', 25, 'Mumbai'),
(2, 'Priya Sharma', 'priya@reg.com', '9876543211', 22, DEFAULT),
(3, 'Amit Kumar', 'amit@reg.com', '9876543212', 30, 'Nashik'),
(4, 'Sneha Patel', 'sneha@reg.com', '9876543213', 24, DEFAULT),
(5, 'Rohit Singh', 'rohit@reg.com', '9876543214', 28, 'Nagpur'),
(6, 'Ananya Roy', 'ananya@reg.com', '9876543215', 26, 'Pune'),
(7, 'Karan Joshi', 'karan@reg.com', '9876543216', 32, 'Mumbai'),
(8, 'Neha Nair', 'neha@reg.com', '9876543217', 21, DEFAULT),
(9, 'Vikram Das', 'vikram@reg.com', '9876543218', 29, 'Nashik'),
(10, 'Pooja Iyer', 'pooja@reg.com', '9876543219', 23, 'Pune');

UPDATE employee_reg SET city = 'Nagpur' WHERE employee_id = 2;
UPDATE employee_reg SET email = 'priya.new@reg.com' WHERE employee_id = 2;
DELETE FROM employee_reg WHERE employee_id = 5;


-- SCENARIO 5: HOSPITAL MANAGEMENT SYSTEM

CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age > 0),
    gender VARCHAR(10),
    city VARCHAR(50) DEFAULT 'Pune',
    status VARCHAR(50) DEFAULT 'Admitted'
);

INSERT INTO patient (patient_id, patient_name, email, age, gender, city, status) VALUES
(101, 'Aarav Mehta', 'aarav@med.com', 45, 'Male', 'Mumbai', DEFAULT),
(102, 'Diya Sen', 'diya@med.com', 29, 'Female', DEFAULT, 'Admitted'),
(103, 'Kabir Khan', 'kabir@med.com', 55, 'Male', 'Nashik', 'Admitted'),
(104, 'Meera Rao', 'meera@med.com', 34, 'Female', DEFAULT, DEFAULT),
(105, 'Siddharth Roy', 'siddharth@med.com', 40, 'Male', 'Nagpur', 'Admitted'),
(106, 'Tanvi Joshi', 'tanvi@med.com', 26, 'Female', 'Pune', DEFAULT),
(107, 'Varun Dhawan', 'varun@med.com', 50, 'Male', 'Mumbai', 'Admitted'),
(108, 'Zoya Akhtar', 'zoya@med.com', 31, 'Female', DEFAULT, DEFAULT),
(109, 'Dev Patel', 'dev@med.com', 60, 'Male', 'Nashik', 'Admitted'),
(110, 'Rhea Kapoor', 'rhea@med.com', 24, 'Female', 'Pune', DEFAULT);

UPDATE patient SET status = 'Discharged' WHERE patient_id = 101;
UPDATE patient SET city = 'Pune' WHERE patient_id = 103;
DELETE FROM patient WHERE patient_id = 105;


-- SCENARIO 6: COURSE ENROLLMENT SYSTEM

CREATE DATABASE IF NOT EXISTS course_db;
USE course_db;

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    duration INT CHECK (duration > 0),
    fees DECIMAL(10,2) CHECK (fees > 0)
);

CREATE TABLE student_enr (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    course_id INT,
    city VARCHAR(50) DEFAULT 'Pune',
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO course (course_id, course_name, duration, fees) VALUES
(1, 'Java Programming', 3, 25000.00),
(2, 'Python Data Science', 4, 35000.00),
(3, 'Web Development', 3, 20000.00),
(4, 'UI/UX Design', 2, 15000.00),
(5, 'Cloud Computing', 4, 40000.00);

INSERT INTO student_enr (student_id, student_name, email, course_id, city) VALUES
(1, 'Rahul Verma', 'rahul@enr.com', 1, 'Mumbai'),
(2, 'Priya Sharma', 'priya@enr.com', 2, DEFAULT),
(3, 'Amit Kumar', 'amit@enr.com', 3, 'Nashik'),
(4, 'Sneha Patel', 'sneha@enr.com', 1, DEFAULT),
(5, 'Rohit Singh', 'rohit@enr.com', 4, 'Nagpur'),
(6, 'Ananya Roy', 'ananya@enr.com', 5, 'Pune'),
(7, 'Karan Joshi', 'karan@enr.com', 2, 'Mumbai'),
(8, 'Neha Nair', 'neha@enr.com', 3, DEFAULT),
(9, 'Vikram Das', 'vikram@enr.com', 4, 'Nashik'),
(10, 'Pooja Iyer', 'pooja@enr.com', 5, 'Pune');

UPDATE student_enr SET course_id = 3 WHERE student_id = 1;
UPDATE student_enr SET city = 'Pune' WHERE student_id = 2;
UPDATE course SET fees = 28000.00 WHERE course_id = 1;
DELETE FROM student_enr WHERE student_id = 10;


-- SCENARIO 7: BANKING CUSTOMER MANAGEMENT

CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Pune',
    account_status VARCHAR(50) DEFAULT 'Active'
);

INSERT INTO customer (customer_id, customer_name, email, age, city, account_status) VALUES
(1, 'Aarav Gupta', 'aarav@bank.com', 28, 'Mumbai', DEFAULT),
(2, 'Diya Sharma', 'diya@bank.com', 24, DEFAULT, 'Active'),
(3, 'Rohan Verma', 'rohan@bank.com', 35, 'Nashik', DEFAULT),
(4, 'Sneha Das', 'sneha@bank.com', 22, DEFAULT, DEFAULT),
(5, 'Vikram Roy', 'vikram@bank.com', 42, 'Nagpur', 'Active'),
(6, 'Ananya Sen', 'ananya@bank.com', 26, 'Pune', DEFAULT),
(7, 'Karan Patel', 'karan@bank.com', 30, 'Mumbai', 'Active'),
(8, 'Neha Joshi', 'neha@bank.com', 21, DEFAULT, DEFAULT),
(9, 'Amit Nair', 'amit@bank.com', 38, 'Nashik', 'Active'),
(10, 'Pooja Iyer', 'pooja@bank.com', 27, 'Pune', DEFAULT);

UPDATE customer SET city = 'Pune' WHERE customer_id = 1;
UPDATE customer SET account_status = 'Inactive' WHERE customer_id = 2;
DELETE FROM customer WHERE customer_id = 4;

"""


