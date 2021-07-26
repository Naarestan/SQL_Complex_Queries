-- Select the clients that have an invoice
-- Show three solutions to this question

-- Solution # 1
SELECT DISTINCT client_id, name, address, city, phone
FROM clients
JOIN invoices USING (client_id);

-- Solution # 2
SELECT *
FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
    	FROM invoices
);

-- Solution # 3
SELECT *
FROM clients AS c
WHERE EXISTS (
	SELECT client_id
    	FROM invoices
    	WHERE client_id = c.client_id
);



-- EXISTS Operator is the more efficient way because the more data we have, the longer time SQL needs to read through WHERE IN clause for each data in the list.
-- When we use EXISTS Operator, the subquery does not return a result to the outer query. 
-- Instead, it will return an indication of whether any rows in the subquery matches this search condition: WHERE client_id = c.client_id




-- Find the products that have never been ordered

USE sql_store;

-- Solution # 1
SELECT *
FROM products AS p
WHERE product_id NOT IN (
	SELECT product_id
    FROM order_items
);


-- Solution # 2
SELECT *
FROM products AS p
WHERE NOT EXISTS (
	SELECT product_id
    FROM order_items
    WHERE product_id = p.product_id
);
