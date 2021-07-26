-- SELECT client_id, name, total_sales, average, difference
---- total_sales: the sum of all invoices issued for each client
---- average: the average of all invoice_totals
---- difference: total_sales - average

SELECT
	DISTINCT client_id,
    name,
		(SELECT SUM(invoice_total)
		FROM invoices
        WHERE client_id = c.client_id) AS total_sales,
		(SELECT AVG(invoice_total)
		FROM invoices) AS average,
    (SELECT total_sales - average) AS difference
FROM clients AS c;