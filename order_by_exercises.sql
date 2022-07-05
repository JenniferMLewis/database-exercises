USE mysql;
USE employees;
SHOW TABLES;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
/* Sorted, first name "Irena Reutenauer", last name "Vidya Simmen"*/
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
/* Sorted, first name "Irena Acton", Last Name "Vidya Zweizig" */
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;
/* Sorted, First Name "Irena Acton", Last Name "Maya Zyda" */
SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no ASC;
/* 899 Rows, First Entry: 10021 Ramzi Erde, Last Entry: 499648 Tadairo Erde */
SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY hire_date DESC;
/* 899 Rows, First Entry : Teiji Eldridge, Last Entry: Sergi Erde */
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND (
birth_date LIKE '%12-25'
)
ORDER BY hire_date DESC, birth_date ASC;
/* 362 Rows, Oldest last hire "Khun Bernini" 1952-12-25 hire_date: 1999 08-31
Youngest, Firt Hire "Alselm Cappello" 1962-12-25 hire date_1990-01-01 */