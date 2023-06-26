SELECT products.product_name AS products, suppliers.company_name AS company 
FROM suppliers
INNER JOIN products ON products.supplier_id=suppliers.supplier_id 
GROUP BY products , company ORDER BY products ASC, company ASC ;

SELECT category_name AS category, 
COUNT(product_name) AS number_of_products
FROM products
INNER JOIN categories ON categories.category_id=products.category_id
GROUP BY category_name ORDER BY number_of_products DESC;

SELECT products.product_name, sum(order_details.quantity) AS sum
FROM products
INNER JOIN order_details 
ON products.product_id=order_details.product_id
GROUP BY product_name ORDER BY sum DESC, product_name ASC LIMIT 10;
