"""
-- SCENARIO 1: STUDENT MANAGEMENT SYSTEM

-- Task 1 — Create Database
CREATE DATABASE IF NOT EXISTS training_institute;
USE training_institute;

-- Task 2 — Create Student Table
CREATE TABLE IF NOT EXISTS student (
    student_id INT,
    name VARCHAR(100),
    age INT,
    course VARCHAR(50),
    fees DECIMAL(10,2),
    email VARCHAR(100),
    admission_date DATE,
    is_active BOOLEAN
);

-- Task 3 — Check Table Structure
DESC student;

-- Task 4 — Insert Student Records
INSERT INTO student (student_id, name, age, course, fees, email, admission_date, is_active) VALUES
(101, 'Rahul', 21, 'Java', 50000.00, 'rahul@gmail.com', '2026-01-10', TRUE),
(102, 'Priya', 22, 'Python', 45000.00, 'priya@gmail.com', '2026-01-12', TRUE),
(103, 'Amit', 20, 'SQL', 30000.00, 'amit@gmail.com', '2026-01-15', TRUE),
(104, 'Sneha', 23, 'Web Dev', 40000.00, 'sneha@gmail.com', '2026-01-18', TRUE),
(105, 'Vikram', 24, 'Data Science', 60000.00, 'vikram@gmail.com', '2026-01-20', TRUE),
(106, 'Ananya', 21, 'Java', 50000.00, 'ananya@gmail.com', '2026-01-22', TRUE),
(107, 'Karan', 22, 'Python', 45000.00, 'karan@gmail.com', '2026-01-25', TRUE),
(108, 'Pooja', 20, 'SQL', 30000.00, 'pooja@gmail.com', '2026-01-28', TRUE),
(109, 'Rohit', 25, 'Web Dev', 40000.00, 'rohit@gmail.com', '2026-02-01', TRUE),
(110, 'Neha', 23, 'Data Science', 60000.00, 'neha@gmail.com', '2026-02-03', TRUE);

-- Task 5 — Display All Students
SELECT * FROM student;

-- Task 6 — Display Selected Information
SELECT student_id, name, course, fees FROM student;

-- Task 7 — Update Student Fees (Rahul's fees: 50000 -> 55000)
UPDATE student 
SET fees = 55000.00 
WHERE student_id = 101;

-- Task 8 — Change Student Course (Amit's course: SQL -> Java)
UPDATE student 
SET course = 'Java' 
WHERE student_id = 103;

-- Task 9 — Delete a Student (Student 105 cancels admission)
DELETE FROM student 
WHERE student_id = 105;

-- Task 10 — Add New Column (phone VARCHAR(15))
ALTER TABLE student 
ADD COLUMN phone VARCHAR(15);



-- SCENARIO 2: EMPLOYEE MANAGEMENT SYSTEM

-- Task 11 — Create Employee Table
CREATE TABLE IF NOT EXISTS employee (
    employee_id INT,
    employee_name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(50),
    joining_date DATE,
    is_active BOOLEAN
);

-- Task 12 — Insert Employees
INSERT INTO employee (employee_id, employee_name, age, department, salary, email, joining_date, is_active) VALUES
(101, 'Aarav', 28, 'Java', 65000.00, 'aarav@company.com', '2024-03-01', TRUE),
(102, 'Diya', 26, 'Python', 62000.00, 'diya@company.com', '2024-04-10', TRUE),
(103, 'Rohan', 25, 'Testing', 45000.00, 'rohan@company.com', '2024-05-15', TRUE),
(104, 'Ananya', 30, 'HR', 55000.00, 'ananya@company.com', '2023-11-20', TRUE),
(105, 'Karan', 32, 'Finance', 70000.00, 'karan@company.com', '2023-08-12', TRUE),
(106, 'Simran', 27, 'Sales', 48000.00, 'simran@company.com', '2024-01-05', TRUE),
(107, 'Kabir', 29, 'Java', 68000.00, 'kabir@company.com', '2024-02-14', TRUE),
(108, 'Meera', 31, 'Python', 64000.00, 'meera@company.com', '2023-09-10', TRUE);

-- Task 13 — Update Salary (Employee 101 increment)
UPDATE employee 
SET salary = 72000.00 
WHERE employee_id = 101;

-- Task 14 — Employee Resignation (Delete employee 105)
DELETE FROM employee 
WHERE employee_id = 105;

-- Task 15 — Add Experience Column
ALTER TABLE employee 
ADD COLUMN experience DECIMAL(4,1);

-- Task 16 — Increase Email Size (VARCHAR(50) -> VARCHAR(150))
ALTER TABLE employee 
MODIFY email VARCHAR(150);


-- SCENARIO 3: E-COMMERCE PRODUCT MANAGEMENT

-- Task 17 — Create Product Table
CREATE TABLE IF NOT EXISTS product (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    description TEXT,
    manufactured_date DATE,
    is_available BOOLEAN
);

-- Task 18 — Insert Products
INSERT INTO product (product_id, product_name, category, price, quantity, description, manufactured_date, is_available) VALUES
(101, 'Laptop', 'Electronics', 55000.00, 15, 'High-performance laptop', '2025-11-10', TRUE),
(102, 'Mobile', 'Electronics', 25000.00, 30, 'Smartphone with dual camera', '2025-12-01', TRUE),
(103, 'Headphones', 'Electronics', 2500.00, 20, 'Wireless Bluetooth headphones', '2026-01-05', TRUE),
(104, 'Chair', 'Furniture', 7500.00, 10, 'Ergonomic office chair', '2025-10-15', TRUE),
(105, 'Desk', 'Furniture', 12000.00, 8, 'Wooden study desk', '2025-09-20', TRUE),
(106, 'Shoes', 'Fashion', 3500.00, 50, 'Running sports shoes', '2026-02-10', TRUE),
(107, 'Backpack', 'Fashion', 1800.00, 40, 'Waterproof laptop backpack', '2026-01-18', TRUE),
(108, 'Watch', 'Accessories', 5000.00, 25, 'Analog stainless steel watch', '2025-12-15', TRUE),
(109, 'Blender', 'Home Appliance', 4000.00, 12, 'Electric kitchen blender', '2025-11-25', TRUE),
(110, 'Water Bottle', 'Accessories', 800.00, 100, 'Stainless steel insulated bottle', '2026-02-01', TRUE);

-- Task 19 — Update Product Price (Laptop: 55000 -> 58000)
UPDATE product 
SET price = 58000.00 
WHERE product_id = 101;

-- Task 20 — Update Product Quantity (Product 103: sold 5 items, quantity 20 -> 15)
UPDATE product 
SET quantity = 15 
WHERE product_id = 103;

-- Task 21 — Remove Product (Product 104 discontinued)
DELETE FROM product 
WHERE product_id = 104;

-- Task 22 — Add Product Brand
ALTER TABLE product 
ADD COLUMN brand VARCHAR(50);


-- SCENARIO 4: HOSPITAL MANAGEMENT SYSTEM

-- Task 23 — Create Patient Table
CREATE TABLE IF NOT EXISTS patient (
    patient_id INT,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    disease VARCHAR(100),
    admission_date DATE,
    admission_time TIME,
    doctor_name VARCHAR(100),
    is_discharged BOOLEAN
);

-- Task 24 — Insert Patients
INSERT INTO patient (patient_id, patient_name, age, gender, phone, disease, admission_date, admission_time, doctor_name, is_discharged) VALUES
(101, 'Aarav Sharma', 45, 'Male', '9876543210', 'Hypertension', '2026-03-01', '09:30:00', 'Dr. Mehta', FALSE),
(102, 'Priya Verma', 30, 'Female', '9876543211', 'Asthma', '2026-03-02', '10:15:00', 'Dr. Gupta', FALSE),
(103, 'Rohan Das', 50, 'Male', '9876543212', 'Diabetes', '2026-03-03', '11:00:00', 'Dr. Sharma', FALSE),
(104, 'Sneha Patel', 25, 'Female', '9876543213', 'Migraine', '2026-03-04', '12:45:00', 'Dr. Roy', FALSE),
(105, 'Vikram Singh', 60, 'Male', '9876543214', 'Fever', '2026-03-05', '14:20:00', 'Dr. Mehta', FALSE),
(106, 'Ananya Iyer', 35, 'Female', '9876543215', 'Thyroid', '2026-03-06', '08:10:00', 'Dr. Gupta', FALSE),
(107, 'Karan Kapoor', 40, 'Male', '9876543216', 'Fracture', '2026-03-07', '15:30:00', 'Dr. Sharma', FALSE),
(108, 'Neha Joshi', 28, 'Female', '9876543217', 'Infection', '2026-03-08', '16:00:00', 'Dr. Roy', FALSE),
(109, 'Amit Kumar', 55, 'Male', '9876543218', 'Cardiac Arrest', '2026-03-09', '18:15:00', 'Dr. Mehta', FALSE),
(110, 'Pooja Nair', 32, 'Female', '9876543219', 'Allergy', '2026-03-10', '09:00:00', 'Dr. Gupta', FALSE);

-- Task 25 — Update Patient Information (Patient 103 changes doctor)
UPDATE patient 
SET doctor_name = 'Dr. Kapoor' 
WHERE patient_id = 103;

-- Task 26 — Patient Discharge (Patient 105 is discharged)
UPDATE patient 
SET is_discharged = TRUE 
WHERE patient_id = 105;

-- Task 27 — Add Discharge Date
ALTER TABLE patient 
ADD COLUMN discharge_date DATE;


-- SCENARIO 5: RESTAURANT MANAGEMENT SYSTEM

-- Task 28 — Create Menu Table
CREATE TABLE IF NOT EXISTS menu (
    item_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    description TEXT,
    available BOOLEAN
);

-- Task 29 — Insert Menu Items
INSERT INTO menu (item_id, item_name, category, price, description, available) VALUES
(1, 'Spring Rolls', 'Starter', 120.00, 'Crispy vegetable rolls', TRUE),
(2, 'Paneer Tikka', 'Starter', 220.00, 'Spicy grilled cottage cheese', TRUE),
(3, 'Garlic Bread', 'Starter', 140.00, 'Toasted bread with garlic butter', TRUE),
(4, 'Butter Chicken', 'Main Course', 350.00, 'Rich and creamy chicken curry', TRUE),
(5, 'Paneer Butter Masala', 'Main Course', 300.00, 'Cottage cheese in tomato gravy', TRUE),
(6, 'Dal Makhani', 'Main Course', 250.00, 'Slow-cooked black lentils', TRUE),
(7, 'Veg Fried Rice', 'Main Course', 200.00, 'Wok-tossed rice with vegetables', TRUE),
(8, 'Gulab Jamun', 'Dessert', 90.00, 'Sweet milk dumplings in syrup', TRUE),
(9, 'Brownie with Ice Cream', 'Dessert', 180.00, 'Chocolate brownie with vanilla scoop', TRUE),
(10, 'Cold Coffee', 'Beverage', 150.00, 'Blended chilled coffee', TRUE),
(11, 'Fresh Lime Soda', 'Beverage', 80.00, 'Refreshing citrus drink', TRUE),
(12, 'Pizza Margherita', 'Pizza', 299.00, 'Classic cheese pizza', TRUE),
(13, 'Farmhouse Pizza', 'Pizza', 399.00, 'Loaded with fresh vegetables', TRUE),
(14, 'Veg Burger', 'Burger', 150.00, 'Crispy potato patty burger', TRUE),
(15, 'Cheese Burger', 'Burger', 190.00, 'Burger with extra cheese slice', TRUE);

-- Task 30 — Update Price (Veg Burger ₹150 -> ₹180)
UPDATE menu 
SET price = 180.00 
WHERE item_name = 'Veg Burger';

-- Task 31 — Make Item Unavailable (Pizza Margherita available = FALSE)
UPDATE menu 
SET available = FALSE 
WHERE item_name = 'Pizza Margherita';

-- Task 32 — Remove Item (Permanently delete garlic bread item_id 3)
DELETE FROM menu 
WHERE item_id = 3;


-- SCENARIO: TRANSACTION — ONLINE BANKING

-- Task 35 — Create Accounts Table & Insert Data
CREATE TABLE IF NOT EXISTS account (
    account_id INT,
    customer_name VARCHAR(100),
    balance DECIMAL(10,2)
);

INSERT INTO account (account_id, customer_name, balance) VALUES
(1, 'Account A', 50000.00),
(2, 'Account B', 20000.00);

-- Task 36 & 37 — Start & Commit Successful Transaction (A -> B: ₹5,000)
START TRANSACTION;

UPDATE account 
SET balance = balance - 5000.00 
WHERE customer_name = 'Account A';

UPDATE account 
SET balance = balance + 5000.00 
WHERE customer_name = 'Account B';

COMMIT;

-- Task 38 — Rollback Transaction Demonstration (Erroneous transfer and rollback)
START TRANSACTION;

UPDATE account 
SET balance = balance - 100000.00 
WHERE customer_name = 'Account A';

ROLLBACK;

-- Final Verification of Account Balances
SELECT * FROM account;

"""


