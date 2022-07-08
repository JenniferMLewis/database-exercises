use mysql;
use employees;

SELECT first_name AS 'First Name', last_name AS 'Last Name', hire_date AS 'Date Hired' FROM employees e 
JOIN salaries s
USING (emp_no)
WHERE to_date >= NOW() AND hire_date = (SELECT hire_date FROM employees WHERE emp_no = 101010);
-- 69 results for all CURRENT employees Hired on the day Employee 101010 was hired.

SELECT t.title, a.last_name, a.first_name
FROM
(
SELECT *
FROM employees
WHERE first_name = "Aamod"
) as a
JOIN titles t
USING (emp_no)
JOIN salaries s
USING (emp_no)
WHERE s.to_date >= NOW();
-- All titles EVER held by CURRENT Employees named Aamod, and which Aamod they belong to. 251 Results.


SELECT COUNT(*) AS "Previous Employees"
FROM employees
WHERE emp_no NOT IN 
(
SELECT emp_no
FROM salaries
WHERE to_date >= NOW()
);
-- People are no longer working for the company.

SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM 
(
SELECT *
FROM dept_manager dm
JOIN employees e
USING (emp_no)
WHERE e.gender = 'F' AND dm.to_date >= NOW()
)fm;
-- Current Female Department Managers : Isamu Legleitner, Karsten Sigstam, Leon DasSarma, and Hilary Kambil

SELECT first_name AS 'First Name', last_name AS 'Last Name', salary AS 'Salary over Historic Average'
FROM 
(
SELECT *
FROM salaries s
JOIN employees e
USING (emp_no)
WHERE to_date >= NOW() AND salary > (
SELECT round(avg(salary))
FROM salaries))has;
-- All Employees who CURRENTLY have a higher salary then the company historic average.

SELECT COUNT(*)
FROM salaries
WHERE salary > 
(
SELECT MAX(salary) 
FROM salaries 
WHERE to_date >= NOW()
) - 
(
SELECT STDDEV(salary) 
FROM salaries 
WHERE to_date >= NOW()
) 
AND to_date >= NOW();

/* Number of Current salaries within 1 standard deviation of the current highest salary 
((That was tricky, have to remember to pull current on all data entered)).*/
