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


-- AVG salary at company vs. AVG salary per dept

CREATE temporary Table salary_avgs AS 
(
SELECT avg(salary) as avg_salary, stddev(salary) as sd_salary FROM employees.salaries WHERE to_date > now()
);
SELECT * FROM salary_avgs;

CREATE TEMPORARY TABLE departments_average_salary AS 
(
SELECT dept_name, avg(salary) as dept_salary_avg
FROM employees.salaries es
JOIN employees.dept_emp ede USING (emp_no)
JOIN employees.departments ed USING (dept_no)
WHERE ede.to_date > NOW() AND es.to_date > NOW()
GROUP BY dept_name
);
SELECT * FROM departments_average_salary;

SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;


