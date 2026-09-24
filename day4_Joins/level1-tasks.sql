-- 1. Display customer ID, customer first name, last name, order ID and order date for all customers who have placed an order.
SELECT 
c.customer_id, 
c.first_name, 
c.last_name, 
o.order_id, 
o.order_date
FROM  customer c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id;

-- 2. Display customer name and order status for every order. 
SELECT 
c.first_name,
c.last_name,
o.order_status
FROM customer c 
INNER JOIN orders o 
ON o.customer_id = c.customer_id;

-- 3. Display customer name, city and order amount for all orders.
SELECT
c.first_name,
c.last_name,
c.city,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 4. Display customer name, payment method and order date.
SELECT
c.first_name,
c.last_name,
o.payment_method,
o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id; 

-- 5. Display customer email and order status.
SELECT
c.email,
o.order_status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 6. Display customer name and shipping city for every order.
SELECT
c.first_name,
c.last_name,
o.shipping_city
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 7. Display customer name, order ID and total amount for orders where the order status is Delivered.
SELECT
c.first_name,
c.last_name,
o.order_id,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered';

-- 8. Display customer name and order date for orders placed after 2026-02-01.
SELECT
c.first_name,
c.last_name,
o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date > '2026-02-01';

-- 9. Display customer name and order amount for orders where the amount is greater than 10000.
SELECT
c.first_name,
c.last_name,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount > 10000;

-- 10. Display customers from Maharashtra who have placed an order.
SELECT DISTINCT
c.customer_id,
c.first_name,
c.last_name,
c.state
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.state = 'Maharashtra';

-- 11. Display customer name and order details for customers whose order payment method is UPI.
SELECT
c.first_name,
c.last_name,
o.order_id,
o.order_date,
o.order_status,
o.payment_method,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.payment_method = 'UPI';

-- 12. Display customer name and order status for customers whose orders are currently Pending.
SELECT
c.first_name,
c.last_name,
o.order_status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Pending';

-- 13. Display customer name and order amount for cancelled orders.
SELECT
c.first_name,
c.last_name,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Cancelled';

-- 14. Display customer name and delivery date for delivered orders.
SELECT
c.first_name,
c.last_name,
o.delivery_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered';

-- 15. Display customer name and order date for customers from Pune.
SELECT
c.first_name,
c.last_name,
o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.city = 'Pune';

-- 16. Display order ID, product ID, quantity and item total.
SELECT
order_id,
product_id,
quantity,
item_total
FROM order_items;

-- 17. Display order ID, unit price and discount for every order item.
SELECT
order_id,
unit_price,
discount
FROM order_items;

-- 18. Display order ID and product ID for items where quantity is greater than 1.
SELECT
order_id,
product_id
FROM order_items
WHERE quantity > 1;

-- 19. Display order ID and item total where item status is Delivered.
SELECT
order_id,
item_total
FROM order_items
WHERE item_status = 'Delivered';

-- 20. Display order ID, product ID and tax for shipped items.
SELECT
order_id,
product_id,
tax
FROM order_items
WHERE item_status = 'Shipped';

-- 21. Display product name, category and quantity sold.
SELECT
p.product_name,
p.category,
oi.quantity
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- 22. Display product name, brand and unit price for products that have been ordered.
SELECT DISTINCT
p.product_name,
p.brand,
oi.unit_price
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- 23. Display product name and item status.
SELECT
p.product_name,
oi.item_status
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- 24. Display product name and quantity for products having quantity greater than 1.
SELECT
p.product_name,
oi.quantity
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.quantity > 1;

-- 25. Display product name, category, unit price and item total for every order item.
SELECT
p.product_name,
p.category,
oi.unit_price,
oi.item_total
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

