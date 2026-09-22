-- Create Database
CREATE DATABASE prod_mngmt;

-- Switch to Database
USE prod_mngmt;

-- Create Table
CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    description TEXT,
    manufactured_date DATE,
    is_available BOOLEAN
);

-- Inspect Schema
DESC product;

-- Insert Records
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

-- Query All Records
SELECT * FROM product;

-- Update Price
UPDATE product 
SET price = 58000.00 
WHERE product_id = 101;

-- Query All Records
SELECT * FROM product;

-- Update Quantity
UPDATE product 
SET quantity = 15 
WHERE product_id = 103;

-- Query All Records
SELECT * FROM product;

-- Delete Record
DELETE FROM product 
WHERE product_id = 104;

-- Query All Records
SELECT * FROM product;

-- Alter Table Schema
ALTER TABLE product 
ADD COLUMN brand VARCHAR(50);

-- Query Final Records
SELECT * FROM product;
