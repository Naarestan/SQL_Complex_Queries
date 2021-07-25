-- Find customers who have ordered Lettuce (id = 3)
-- Select Customer ID, First Name, and Last Name

--- Solution # 1

USE sql_store;

SELECT
	customer_id,
   	first_name,
    	last_name
FROM
	customers
WHERE
	customer_id IN
		(
		SELECT customer_id
		FROM orders
		WHERE order_id IN
			(SELECT order_id
			FROM order_items
			WHERE product_id = 3)
	);



--- Solution # 2

SELECT customer_id,
	first_name,
	last_name
FROM customers
WHERE customer_id IN (
	SELECT o.customer_id
	FROM order_items AS oi
	JOIN orders AS o USING (order_id)
	WHERE product_id = 3
);


--- Solution # 3

SELECT
	DISTINCT customer_id,
	first_name,
	last_name
FROM customers AS c
JOIN orders AS o USING (customer_id)
JOIN order_items AS oi USING (order_id)
WHERE oi.product_id = 3;

---











