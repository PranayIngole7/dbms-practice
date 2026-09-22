-- SHOPMART E-COMMERCE DATABASE:

-- PART 1: DATABASE CREATION

-- Q1. Create the database
CREATE DATABASE IF NOT EXISTS shopsmart_db;
USE shopsmart_db;


-- PART 2: TABLE CREATION & SCHEMA CONSTRAINTS

-- Q5. Create the first table (customers) with eight fields, primary key, 
-- NOT NULL, UNIQUE, and DEFAULT constraints.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50),
    registration_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    credit_limit DECIMAL(10,2)
);

-- Q6. Create the second table (products) with eight fields and a suitable PRIMARY KEY.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_qty INT,
    sku VARCHAR(40),
    brand VARCHAR(50),
    product_status VARCHAR(20)
);

-- Q7. Add a CHECK constraint for a numeric value (price > 0).
ALTER TABLE products 
ADD CONSTRAINT chk_price CHECK (price > 0);

-- Q8. Add a DEFAULT value for a status column.
ALTER TABLE products 
MODIFY product_status VARCHAR(20) DEFAULT 'Available';

-- Q9. Create the third table (orders) with eight fields and FOREIGN KEY relationships.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(25),
    shipping_city VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Q10. Create the fourth table (payments) with eight fields and FOREIGN KEY relationships.
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(25),
    transaction_ref VARCHAR(60) UNIQUE NOT NULL,
    payment_status VARCHAR(20),
    currency VARCHAR(10),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- PART 3: DUMMY DATA INSERTION

-- Q11. Insert the first four dummy records into the customers table.
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES 
(101, 'Amit Patil', 'amit@gmail.com', '9876500001', 'Pune', '2026-08-01', 'Active', 50000),
(102, 'Neha Sharma', 'neha@gmail.com', '9876500002', 'Mumbai', '2026-08-03', 'Active', 40000),
(103, 'Rahul Joshi', 'rahul@gmail.com', '9876500003', 'Nashik', '2026-08-05', 'Active', 30000),
(104, 'Priya More', 'priya@gmail.com', '9876500004', 'Pune', '2026-08-07', 'Inactive', 20000);

-- Q12. Insert the remaining four dummy records into the customers table.
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES 
(105, 'Sagar Kulkarni', 'sagar@gmail.com', '9876500005', 'Nagpur', '2026-08-09', 'Active', 45000),
(106, 'Sneha Deshmukh', 'sneha@gmail.com', '9876500006', 'Aurangabad', '2026-08-11', 'Active', 35000),
(107, 'Vikas Jadhav', 'vikas@gmail.com', '9876500007', 'Kolhapur', '2026-08-13', 'Active', 25000),
(108, 'Pooja Kale', 'pooja@gmail.com', '9876500008', 'Pune', '2026-08-15', 'Active', 60000);

-- Q13. Insert all eight dummy records into the products table.
INSERT INTO products (product_id, product_name, category, price, stock_qty, sku, brand, product_status) 
VALUES 
(201, 'Laptop', 'Electronics', 65000, 20, 'SKU-LAP-01', 'Dell', 'Available'),
(202, 'Keyboard', 'Electronics', 1200, 100, 'SKU-KEY-01', 'Logitech', 'Available'),
(203, 'Mouse', 'Electronics', 700, 150, 'SKU-MOU-01', 'HP', 'Available'),
(204, 'Monitor', 'Electronics', 15000, 35, 'SKU-MON-01', 'Samsung', 'Available'),
(205, 'Backpack', 'Accessories', 1800, 80, 'SKU-BAG-01', 'Skybags', 'Available'),
(206, 'Headphones', 'Accessories', 2500, 60, 'SKU-HEAD-01', 'Boat', 'Available'),
(207, 'Printer', 'Electronics', 12000, 25, 'SKU-PRI-01', 'Canon', 'Available'),
(208, 'Webcam', 'Electronics', 3500, 45, 'SKU-WEB-01', 'Logitech', 'Available');

-- Q14. Insert all eight dummy records into the orders table.
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, total_amount, order_status, shipping_city) 
VALUES 
(301, 101, 201, '2026-09-01', 1, 65000, 'Placed', 'Pune'),
(302, 102, 202, '2026-09-02', 2, 2400, 'Shipped', 'Mumbai'),
(303, 103, 203, '2026-09-03', 3, 2100, 'Delivered', 'Nashik'),
(304, 105, 204, '2026-09-04', 1, 15000, 'Placed', 'Nagpur'),
(305, 106, 205, '2026-09-05', 2, 3600, 'Cancelled', 'Aurangabad'),
(306, 108, 206, '2026-09-06', 1, 2500, 'Delivered', 'Pune'),
(307, 107, 207, '2026-09-07', 1, 12000, 'Shipped', 'Kolhapur'),
(308, 104, 208, '2026-09-08', 2, 7000, 'Placed', 'Pune');

-- Q15. Insert all eight dummy records into the payments table.
INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method, transaction_ref, payment_status, currency) 
VALUES 
(401, 301, '2026-09-01', 65000, 'UPI', 'TXN1001', 'Success', 'INR'),
(402, 302, '2026-09-02', 2400, 'Card', 'TXN1002', 'Success', 'INR'),
(403, 303, '2026-09-03', 2100, 'UPI', 'TXN1003', 'Success', 'INR'),
(404, 304, '2026-09-04', 15000, 'NetBanking', 'TXN1004', 'Success', 'INR'),
(405, 305, '2026-09-05', 3600, 'UPI', 'TXN1005', 'Refunded', 'INR'),
(406, 306, '2026-09-06', 2500, 'Card', 'TXN1006', 'Success', 'INR'),
(407, 307, '2026-09-07', 12000, 'UPI', 'TXN1007', 'Success', 'INR'),
(408, 308, '2026-09-08', 7000, 'Card', 'TXN1008', 'Pending', 'INR');

-- Q16. Example of INSERT statement with an explicit column list.
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES (109, 'Demo User', 'demo@gmail.com', '9876500999', 'Mumbai', '2026-09-17', 'Active', 20000);


-- PART 4: CONSTRAINT ERROR HANDLING & VALIDATION TESTS

-- Q17. Test Primary Key Violation (Duplicate customer_id '101')
/*
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES (101, 'Duplicate User', 'dup@gmail.com', '9876500099', 'Pune', '2026-09-17', 'Active', 10000);
-- Error Expected: Error Code: 1062. Duplicate entry '101' for key 'customers.PRIMARY'
*/

-- Q18. Test UNIQUE Constraint Violation (Duplicate email 'amit@gmail.com')
/*
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES (109, 'New User', 'amit@gmail.com', '9876500099', 'Mumbai', '2026-09-17', 'Active', 15000);
-- Error Expected: Error Code: 1062. Duplicate entry 'amit@gmail.com' for key 'customers.email'
*/

-- Q19. Test NOT NULL Constraint Violation (Inserting NULL into full_name)
/*
INSERT INTO customers (customer_id, full_name, email, phone, city, registration_date, status, credit_limit) 
VALUES (109, NULL, 'user109@gmail.com', '9876500099', 'Pune', '2026-09-17', 'Active', 10000);
-- Error Expected: Error Code: 1048. Column 'full_name' cannot be null
*/

-- Q20. Test CHECK Constraint Violation (Negative price '-500')
/*
INSERT INTO products (product_id, product_name, category, price, stock_qty, sku, brand, product_status) 
VALUES (209, 'Smartwatch', 'Electronics', -500, 15, 'SKU-WAT-01', 'Noise', 'Available');
-- Error Expected: Error Code: 3819. Check constraint 'chk_price' is violated.
*/




