SELECT products.product_name AS products, suppliers.company_name AS company 
FROM suppliers
INNER JOIN products ON products.supplier_id=suppliers.supplier_id 
GROUP BY products , company ORDER BY products ASC, company ASC ;

SELECT category_name AS category, 
COUNT(product_name) AS number_of_products
FROM products
INNER JOIN categories ON categories.category_id=products.category_id
GROUP BY category_name ORDER BY number_of_products DESC, category_name;

SELECT products.product_name, ROUND(sum(order_details.quantity*(order_details.unit_price*(1-discount)))) AS sum
FROM products
INNER JOIN order_details 
ON products.product_id=order_details.product_id
GROUP BY product_name ORDER BY sum ASC, product_name ASC LIMIT 10;

SELECT products.product_name, order_details.unit_price, order_details.quantity, sum(order_details.quantity*order_details.unit_price) AS sum1 FROM products
INNER JOIN order_details 
ON products.product_id=order_details.product_id WHERE product_name = 'Chocolade' GROUP BY products.product_name, order_details.unit_price, order_details.quantity;

SELECT * FROM CUSTOMERS;
SELECT * FROM orders;

SELECT customers.country, COUNT(customer_id) AS number_of_customers FROM customers GROUP BY customers.country HAVING COUNT(customer_id) > 5 ORDER BY COUNT(customer_id) DESC;




SELECT order_date, SUM(COUNT(order_details.order_id)) OVER (ORDER BY order_date) 
FROM orders 
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE order_date BETWEEN '1997-01-01' AND '1997-01-31'
GROUP BY order_date;


SELECT orders.order_date FROM orders;

-- TOTAL REVENUE - BONYOLÍTOTTUK:
SELECT date_part('year', order_date) AS year,
date_part('month', order_date) AS month,
Last_Value(megrendelesek) OVER (ORDER BY order_date) AS CUM_MEGRENDELT,
Last_Value(revenue) OVER (ORDER BY order_date) AS CUM_REVENUE
FROM (SELECT order_date, SUM(COUNT(order_details.order_id)) OVER (ORDER BY order_date) AS megrendelesek,
SUM(order_details.quantity*(order_details.unit_price*(1-discount))) OVER (ORDER BY order_date) AS revenue
FROM orders 
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE order_date BETWEEN '1997-01-01' AND '1997-01-31'
GROUP BY order_date, order_details.quantity, order_details.unit_price, discount
) AS bnagy_Tabla
GROUP BY bnagy_Tabla.order_date, bnagy_Tabla.megrendelesek, bnagy_Tabla.revenue
;

-- TOTAL REVENUE - JÓ MEGOLDÁS:
SELECT date_part('year', order_date) AS year, date_part('month', order_date) AS month, 
count(order_details.order_id) AS order_count, 
round(sum(order_details.unit_price * order_details.quantity * (1 - order_details.discount))::numeric,0) AS revenue
FROM order_details
INNER JOIN orders
ON order_details.order_id = orders.order_id
WHERE orders.order_date between '1997-01-01' and '1997-12-31'
GROUP BY year, month
ORDER BY month ASC;

SELECT customers.company_name, COUNT(distinct(order_details.order_id)) 
AS orders, 
string_agg(distinct(order_details.order_id)::text, ',') AS order_ids
FROM customers
INNER JOIN orders ON customers.customer_id= orders.customer_id
JOIN order_details ON orders.order_id=order_details.order_id
GROUP BY customers.company_name, customers.country 
HAVING customers.country='USA'
AND COUNT(distinct(order_details.order_id))<5
ORDER BY orders ASC;

