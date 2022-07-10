SHOW databases;

USE employees;
CREATE TEMPORARY TABLE leavitt_1876.employees_with_departments AS
SELECT * FROM employees JOIN dept_emp USING (emp_no) JOIN departments USING (dept_no);

USE leavitt_1876;
SELECT * FROM employees_with_departments
LIMIT 10;

ALTER TABLE employees_with_departments 
DROP dept_no, 
DROP emp_no, 
DROP birth_date, 
drop gender, 
drop hire_date, 
drop from_date, 
drop to_date;

SHOW CREATE TABLE employees_with_departments;
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);
ALTER TABLE employees_with_departments
drop first_name,
drop last_name;

/* This makes a pretty table that makes me happy -Rainbow here, thanks!- */
SELECT full_name AS 'Full Name', dept_name AS 'Department'
FROM employees_with_departments
ORDER BY dept_name, full_name
LIMIT 20;
-- Yes, I could probably have created the table and then pulled ONLY the data I wanted, 
-- but I wanted to play with dropping columns from tables and cleaning up tables.

CREATE temporary TABLE payment_copy AS
SELECT * , amount * 100 as amount_in_pennies from sakila.payment;
ALTER TABLE payment_copy DROP amount;
ALTER TABLE payment_copy CHANGE amount_in_pennies amount INT AFTER rental_id;

SELECT * from payment_copy
LIMIT 10;

DROP TABLE payment_copy;


