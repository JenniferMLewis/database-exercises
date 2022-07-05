USE mysql;
USE employees;
SHOW tables;
SELECT CONCAT(first_name, " " , last_name) AS full_name FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%';
-- That was not fun, let's NOT do that again |||orz
SELECT CONCAT(UPPER(first_name), " " , UPPER(last_name)) 
AS full_name 
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%';
-- I'm an idiot and didn't think to alter the inputs instead of the temp table.
SELECT DATEDIFF(CURDATE(),hire_date) AS days_worked, CONCAT(first_name, " " , last_name) AS full_name FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND(
birth_date LIKE '%-12-25'
);
-- Why ;;; Please... |||orz
SELECT MIN(salary) AS minimum_salary, MAX(salary) AS max_salary FROM salaries;
-- Thank you SHOW and DESCRIBE
SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username FROM employees;

