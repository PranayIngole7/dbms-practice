-- 1. Database Creation 
CREATE DATABASE ecommerce_join_db; 
USE ecommerce_join_db; 

-- 2.1 Table: customers 
CREATE TABLE customers (    
	customer_id INT PRIMARY KEY,    
	first_name VARCHAR(50),    
	last_name VARCHAR(50),    
	email VARCHAR(100),    
	phone VARCHAR(15),    
	city VARCHAR(50),    
	state VARCHAR(50),    
	registration_date DATE,    
	customer_status VARCHAR(20) 
);

-- 2.2 Table: products 
CREATE TABLE products (
	    product_id INT PRIMARY KEY,    
		product_name VARCHAR(100),    
		category VARCHAR(50),    
		brand VARCHAR(50),    
		price DECIMAL(10,2),    
		stock_quantity INT,    s
		upplier_name VARCHAR(100),    
		rating DECIMAL(3,1),    
		product_status VARCHAR(20) 
); 

-- 2.3 Table: orders 
CREATE TABLE orders (
	    order_id INT PRIMARY KEY,    
		customer_id INT,    
		order_date DATE,    
		order_status VARCHAR(30),    
		payment_method VARCHAR(30),    
		shipping_city VARCHAR(50),    
		shipping_state VARCHAR(50),    
		total_amount DECIMAL(10,2),    
		delivery_date DATE,    
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
); 

-- 2.4 Table: order_items 
CREATE TABLE order_items (
	    order_item_id INT PRIMARY KEY,    
		order_id INT,    
		product_id INT,    
		quantity INT,    
		unit_price DECIMAL(10,2),    
		discount DECIMAL(5,2),    
		tax DECIMAL(5,2), 
		item_total DECIMAL(10,2),    
		item_status VARCHAR(20),    
		FOREIGN KEY (order_id) REFERENCES orders(order_id),    
		FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Add data to customers
INSERT INTO customers (customer_id, first_name, last_name, email, phone, city, state, registration_date, customer_status) 
VALUES 
(1,'Amit','Sharma','amit@gmail.com','9876500001','Pune','Maharashtra','2025-01-10','Active'), 
(2,'Priya','Patil','priya@gmail.com','9876500002','Mumbai','Maharashtra','2025-01-15','Active'), 
(3,'Rahul','Verma','rahul@gmail.com','9876500003','Delhi','Delhi','2025-02-01','Active'), 
(4,'Sneha','Joshi','sneha@gmail.com','9876500004','Nashik','Maharashtra','2025-02-10','Active'), 
(5,'Rohan','Deshmukh','rohan@gmail.com','9876500005','Nagpur','Maharashtra','2025-02-15','Inactive'), 
(6,'Neha','Kulkarni','neha@gmail.com','9876500006','Pune','Maharashtra','2025-03-01','Active'), 
(7,'Vikas','Mehta','vikas@gmail.com','9876500007','Ahmedabad','Gujarat','2025-03-05','Active'), 
(8,'Pooja','Shah','pooja@gmail.com','9876500008','Surat','Gujarat','2025-03-10','Active'), 
(9,'Akash','Gupta','akash@gmail.com','9876500009','Jaipur','Rajasthan','2025-03-15','Inactive'), 
(10,'Kiran','Jadhav','kiran@gmail.com','9876500010','Pune','Maharashtra','2025-04-01','Active'), 
(11,'Snehal','Pawar','snehal@gmail.com','9876500011','Kolhapur','Maharashtra','2025-04-05','Active'), 
(12,'Manish','Yadav','manish@gmail.com','9876500012','Lucknow','Uttar Pradesh','2025-04-10','Active'), 
(13,'Anjali','Singh','anjali@gmail.com','9876500013','Delhi','Delhi','2025-04-15','Active'), 
(14,'Saurabh','More','saurabh@gmail.com','9876500014','Aurangabad','Maharashtra','2025-05-01','Inactive'), 
(15,'Komal','Kale','komal@gmail.com','9876500015','Pune','Maharashtra','2025-05-05','Active'), 
(16,'Nikhil','Rane','nikhil@gmail.com','9876500016','Thane','Maharashtra','2025-05-10','Active'), 
(17,'Riya','Chavan','riya@gmail.com','9876500017','Satara','Maharashtra','2025-05-15','Active'), 
(18,'Vivek','Mishra','vivek@gmail.com','9876500018','Bhopal','Madhya Pradesh','2025-06-01','Active'), 
(19,'Swati','Nair','swati@gmail.com','9876500019','Kochi','Kerala','2025-06-05','Active'), 
(20,'Arjun','Malhotra','arjun@gmail.com','9876500020','Chandigarh','Chandigarh','2025-06-10','Inactive'), 
(21,'Meera','Iyer','meera@gmail.com','9876500021','Chennai','Tamil Nadu','2025-06-15','Active'), 
(22,'Kunal','Bhosale','kunal@gmail.com','9876500022','Pune','Maharashtra','2025-07-01','Active'), 
(23,'Divya','Reddy','divya@gmail.com','9876500023','Hyderabad','Telangana','2025-07-05','Active'), 
(24,'Sameer','Khan','sameer@gmail.com','9876500024','Bengaluru','Karnataka','2025-07-10','Active'), 
(25,'Tanvi','Gawande','tanvi@gmail.com','9876500025','Amravati','Maharashtra','2025-07-15','Active');

-- Add data to products
INSERT INTO products (product_id, product_name, category, brand, price, stock_quantity, supplier_name, rating, product_status) 
VALUES 
(1,'Laptop Pro 14','Laptop','Dell',65000,20,'Dell India',4.5,'Available'), 
(2,'Laptop Air 13','Laptop','HP',58000,15,'HP India',4.3,'Available'), 
(3,'Gaming Laptop','Laptop','Lenovo',85000,10,'Lenovo India',4.7,'Available'), 
(4,'Galaxy S25','Mobile','Samsung',72000,25,'Samsung India',4.6,'Available'), 
(5,'iPhone 16','Mobile','Apple',79000,18,'Apple India',4.8,'Available'), 
(6,'Pixel 9','Mobile','Google',65000,12,'Google India',4.5,'Available'), 
(7,'Bluetooth Mouse','Accessories','Logitech',1200,100,'Logitech India',4.2,'Available'), 
(8,'Wireless Keyboard','Accessories','Dell',2500,70,'Dell India',4.1,'Available'), 
(9,'Mechanical Keyboard','Accessories','Redragon',4500,40,'Redragon India',4.4,'Available'), 
(10,'Smart Watch','Wearable','Boat',3500,50,'Boat India',4.0,'Available'), 
(11,'Fitness Band','Wearable','Mi',2200,60,'Xiaomi India',4.1,'Available'), 
(12,'Tablet S9','Tablet','Samsung',42000,20,'Samsung India',4.4,'Available'), 
(13,'iPad Air','Tablet','Apple',65000,14,'Apple India',4.7,'Available'), 
(14,'USB-C Hub','Accessories','Anker',3500,35,'Anker India',4.3,'Available'), 
(15,'Power Bank','Accessories','Mi',1800,80,'Xiaomi India',4.2,'Available'), 
(16,'External SSD 1TB','Storage','Samsung',8500,30,'Samsung India',4.6,'Available'), 
(17,'External HDD 2TB','Storage','Seagate',6200,25,'Seagate India',4.4,'Available'), 
(18,'Webcam HD','Accessories','Logitech',3200,45,'Logitech India',4.1,'Available'), 
(19,'Gaming Headset','Audio','JBL',5500,20,'JBL India',4.5,'Available'), 
(20,'Bluetooth Speaker','Audio','Boat',2800,55,'Boat India',4.0,'Available'), 
(21,'Monitor 24 Inch','Monitor','LG',12000,25,'LG India',4.3,'Available'), 
(22,'Monitor 27 Inch','Monitor','Samsung',18000,18,'Samsung India',4.5,'Available'), 
(23,'Printer','Printer','Canon',15000,12,'Canon India',4.2,'Available'), 
(24,'WiFi Router','Networking','TP-Link',3000,40,'TP-Link India',4.1,'Available'), 
(25,'Smart TV 43 Inch','Television','Sony',42000,8,'Sony India',4.6,'Available');

-- Add data to orders
INSERT INTO orders (order_id, customer_id, order_date, order_status, payment_method, shipping_city, shipping_state, total_amount, delivery_date)
VALUES 
(101,1,'2026-01-05','Delivered','UPI','Pune','Maharashtra',65000,'2026-01-09'), 
(102,2,'2026-01-08','Delivered','Card','Mumbai','Maharashtra',72000,'2026-01-12'), 
(103,3,'2026-01-10','Shipped','UPI','Delhi','Delhi',1200,NULL), 
(104,4,'2026-01-12','Delivered','Cash','Nashik','Maharashtra',2500,'2026-01-16'), 
(105,5,'2026-01-15','Cancelled','Card','Nagpur','Maharashtra',85000,NULL), 
(106,6,'2026-01-18','Delivered','UPI','Pune','Maharashtra',79000,'2026-01-22'), 
(107,7,'2026-01-20','Shipped','Card','Ahmedabad','Gujarat',65000,NULL), 
(108,8,'2026-01-22','Delivered','UPI','Surat','Gujarat',3500,'2026-01-25'), 
(109,9,'2026-01-25','Pending','UPI','Jaipur','Rajasthan',2200,NULL), 
(110,10,'2026-01-27','Delivered','Card','Pune','Maharashtra',42000,'2026-01-31'), 
(111,11,'2026-02-01','Delivered','UPI','Kolhapur','Maharashtra',65000,'2026-02-05'), 
(112,12,'2026-02-03','Shipped','Card','Lucknow','Uttar Pradesh',8500,NULL), 
(113,13,'2026-02-05','Delivered','UPI','Delhi','Delhi',6200,'2026-02-09'), 
(114,14,'2026-02-07','Cancelled','Card','Aurangabad','Maharashtra',3200,NULL), 
(115,15,'2026-02-10','Delivered','UPI','Pune','Maharashtra',5500,'2026-02-14'), 
(116,16,'2026-02-12','Delivered','Card','Thane','Maharashtra',2800,'2026-02-16'), 
(117,17,'2026-02-15','Shipped','UPI','Satara','Maharashtra',12000,NULL), 
(118,18,'2026-02-17','Delivered','Card','Bhopal','Madhya Pradesh',18000,'2026-02-21'), 
(119,19,'2026-02-20','Pending','UPI','Kochi','Kerala',15000,NULL), 
(120,20,'2026-02-22','Delivered','Card','Chandigarh','Chandigarh',3000,'2026-02-26'), 
(121,21,'2026-02-25','Delivered','UPI','Chennai','Tamil Nadu',42000,'2026-03-01'), 
(122,22,'2026-02-27','Shipped','Card','Pune','Maharashtra',3500,NULL), 
(123,23,'2026-03-01','Delivered','UPI','Hyderabad','Telangana',8500,'2026-03-05'), 
(124,24,'2026-03-03','Delivered','Card','Bengaluru','Karnataka',5500,'2026-03-07'), 
(125,25,'2026-03-05','Pending','UPI','Amravati','Maharashtra',2800,NULL);

--Add data to order_items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price, discount, tax, item_total, item_status) 
VALUES 
(1,101,1,1,65000,5,18,73125,'Delivered'), 
(2,102,4,1,72000,5,18,81000,'Delivered'), 
(3,103,7,1,1200,0,18,1416,'Shipped'), 
(4,104,8,1,2500,0,18,2950,'Delivered'), 
(5,105,3,1,85000,10,18,90270,'Cancelled'), 
(6,106,5,1,79000,5,18,88955,'Delivered'), 
(7,107,6,1,65000,5,18,73125,'Shipped'), 
(8,108,10,1,3500,0,18,4130,'Delivered'), 
(9,109,11,1,2200,0,18,2596,'Pending'), 
(10,110,12,1,42000,5,18,47124,'Delivered'), 
(11,111,13,1,65000,5,18,73125,'Delivered'), 
(12,112,16,1,8500,0,18,10030,'Shipped'), 
(13,113,17,1,6200,0,18,7316,'Delivered'), 
(14,114,18,1,3200,0,18,3776,'Cancelled'), 
(15,115,19,1,5500,5,18,6180,'Delivered'), 
(16,116,20,1,2800,0,18,3304,'Delivered'), 
(17,117,21,1,12000,5,18,13452,'Shipped'), 
(18,118,22,1,18000,5,18,20178,'Delivered'), 
(19,119,23,1,15000,0,18,17700,'Pending'), 
(20,120,24,1,3000,0,18,3540,'Delivered'), 
(21,121,25,1,42000,5,18,47124,'Delivered'), 
(22,122,14,1,3500,0,18,4130,'Shipped'), 
(23,123,16,1,8500,0,18,10030,'Delivered'), 
(24,124,19,1,5500,0,18,6490,'Delivered'), 
(25,125,20,1,2800,0,18,3304,'Pending');

