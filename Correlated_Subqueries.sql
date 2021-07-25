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



