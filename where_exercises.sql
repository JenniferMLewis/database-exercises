USE mysql;
USE employees;
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya');
/* 709 Records returned for Irena, Vidya, and Maya in Current and Past employees. */
SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name='Maya';
/* 709 Records returned, same as Q2, apparently same syntax for a single column and IN is easier to use/more concise */
SELECT * FROM employees WHERE gender = 'M'
AND (
first_name = 'Irena' OR first_name = 'Vidya' OR first_name='Maya'
);
/* Returns 441 Rows */
SELECT * FROM employees WHERE last_name LIKE 'E%';
/* Returns 7330 Rows after changing Row limit to 10,000 */
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
/* Returns 30723 Rows after changing Row limit to 50,000 */
SELECT * FROM employees WHERE last_name LIKE 'E%' AND (
last_name LIKE '%E'
);
SELECT * FROM employees WHERE last_name LIKE 'E%';
/* 899 Rows for last names that start and end with E, 7,330 end with E regardless of what they start with */
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; 
/* 135,214 Rows returned for employees hired in the 90's */
SELECT * FROM employees WHERE birth_date LIKE '%-12-25';
SELECT * FROM employees WHERE birth_date LIKE '%-12-24';
/* 842 Employees born on Christmas Day. 791 Born on Christmas Eve. */
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND(
birth_date LIKE '%-12-25'
);
/* 362 rows returned for those hired in the 90s with a birthday on Christmas Day. */
SELECT * FROM employees WHERE last_name LIKE '%q%';
/* 1873 rows returned */
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
/* 547 rows for Employees with a Q in their last name but not a QU. */

