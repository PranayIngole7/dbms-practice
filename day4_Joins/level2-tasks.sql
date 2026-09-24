-- 26. Display customer name, order ID, product ID and quantity.
SELECT
c.first_name,
c.last_name,
o.order_id,
oi.product_id,
oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- 27. Display customer name, order date, product ID and item total.
SELECT
c.first_name,
c.last_name,
o.order_date,
oi.product_id,
oi.item_total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- 28. Display customer name, order status and item status.
SELECT
c.first_name,
c.last_name,
o.order_status,
oi.item_status
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- 29. Display customer name, payment method, product ID and quantity.
SELECT
c.first_name,
c.last_name,
o.payment_method,
oi.product_id,
oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- 30. Display customer name, city, order ID and product ID for all delivered orders.
SELECT
c.first_name,
c.last_name,
c.city,
o.order_id,
oi.product_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- 31. Display customer name, email, order date and item total for orders above 10,000.
SELECT
c.first_name,
c.last_name,
c.email,
o.order_date,
oi.item_total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.total_amount > 10000;

-- 32. Display customer name, order status, product ID and quantity for shipped orders.
SELECT
c.first_name,
c.last_name,
o.order_status,
oi.product_id,
oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Shipped';

-- 33. Display customers from Maharashtra and their ordered product IDs.
SELECT DISTINCT
c.first_name,
c.last_name,
c.state,
oi.product_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.state = 'Maharashtra';

-- 34. Display customer name, order date, product ID and unit price for orders placed after 2026-02-01.
SELECT
c.first_name,
c.last_name,
o.order_date,
oi.product_id,
oi.unit_price
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_date > '2026-02-01';

-- 35. Display customer name, order ID, quantity and discount for every order item.
SELECT
c.first_name,
c.last_name,
o.order_id,
oi.quantity,
oi.discount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- 36. Display order ID, product name, category and quantity.
SELECT
o.order_id,
p.product_name,
p.category,
oi.quantity
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- 37. Display order ID, product name, brand and unit price.
SELECT
o.order_id,
p.product_name,
p.brand,
oi.unit_price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- 38. Display order date, product name and item total.
SELECT
o.order_date,
p.product_name,
oi.item_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- 39. Display order status, product name and quantity.
SELECT
o.order_status,
p.product_name,
oi.quantity
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- 40. Display order ID, product name and discount for discounted products.
SELECT
o.order_id,
p.product_name,
oi.discount
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.discount > 0;

-- 41. Display order ID, product category and item total for delivered items.
SELECT
o.order_id,
p.category,
oi.item_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.item_status = 'Delivered';

-- 42. Display order ID, product name and quantity where quantity is greater than 1.
SELECT
o.order_id,
p.product_name,
oi.quantity
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.quantity > 1;

-- 43. Display order date, product name and product price for orders placed in February 2026.
SELECT
o.order_date,
p.product_name,
p.price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date BETWEEN '2026-02-01' AND '2026-02-28';

-- 44. Display order ID, product name and brand for orders paid using UPI.
SELECT
o.order_id,
p.product_name,
p.brand
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.payment_method = 'UPI';

-- 45. Display order ID, product name and item status for cancelled items.
SELECT
o.order_id,
p.product_name,
oi.item_status
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.item_status = 'Cancelled';

-- 46. Find the total quantity of products ordered by each customer.
SELECT
c.customer_id,
c.first_name,
c.last_name,
SUM(oi.quantity) AS total_quantity_ordered
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 47. Find the total amount spent by each customer using SUM().
SELECT
c.customer_id,
c.first_name,
c.last_name,
SUM(oi.item_total) AS total_amount_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 48. Find the number of products purchased by each customer using COUNT().
SELECT
c.customer_id,
c.first_name,
c.last_name,
COUNT(oi.product_id) AS total_products_purchased
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 49. Find the total sales amount for each product.
SELECT
p.product_id,
p.product_name,
SUM(oi.item_total) AS total_sales_amount
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- 50. Find the average selling price of products that have been ordered.
SELECT
p.product_id,
p.product_name,
AVG(oi.unit_price) AS avg_selling_price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


