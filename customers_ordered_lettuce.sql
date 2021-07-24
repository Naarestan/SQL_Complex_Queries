-- Find customers who have ordered Lettuce (id = 3)
-- Select Customer ID, First Name, and Last Name

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
		)
