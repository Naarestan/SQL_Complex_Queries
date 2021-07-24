-- In SQL_HR Database:
-- Find employees who earn more than average
-- And, work in the office # 3

USE sql_hr;

SELECT *
FROM employees
WHERE salary > (
	SELECT AVG(salary)
    	FROM employees
)
AND
office_id = 3;
