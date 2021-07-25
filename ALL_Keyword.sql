-- Select invoices that are larger than all invoices of client 3

-- Solution # 1

USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total > (
	SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3
);


-- Solution # 2

SELECT *
FROM invoices
WHERE invoice_total > ALL (
	SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
);


-------
-- Whereever we have a ALL keyword, we can rewrite that query using a MAX aggregate function
-------



