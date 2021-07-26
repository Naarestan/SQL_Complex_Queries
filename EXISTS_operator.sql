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



-- EXISTS Operator is the more efficient way because the more data we have, the longer time SQL needs to read through WHERE IN clause for each data in the list. When we
