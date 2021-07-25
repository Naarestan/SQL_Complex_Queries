-- for each employee
-- calculate the average salary for employee.office
-- return the employee if the salary > average

USE sql_hr;

SELECT *
FROM employees AS e
WHERE salary > (
	SELECT AVG(salary)
    	FROM employees
    	WHERE office_id = e.office_id
);

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- Get invoices that are larger than the client's average invoice amount

USE sql_invoicing;

SELECT *
from invoices AS i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
);

