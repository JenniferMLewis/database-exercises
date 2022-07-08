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
/* WHERE **HATES** non-tangible numbers, you have to turn formulas into a 'number' with a subquery before
running them through WHERE or mathmatic formulas in WHERE */
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

/* WHAT?!?! I DON'T HAVE TO DO ANYTHING EXCEPT SELECT?? ....is SELECT their verion of PRINT()? 
I think I vaguely remember that being mentioned. World on it's head again.*/

SELECT
(
SELECT COUNT(*)
FROM salaries
WHERE salary > 
(
SELECT MAX(salary) 
FROM salaries 
WHERE to_date >= NOW()
)
 - 
(
SELECT STDDEV(salary) 
FROM salaries 
WHERE to_date >= NOW()
) 
AND to_date >= NOW()
)
/
(
SELECT COUNT(*)
FROM salaries
WHERE to_date >= NOW()
)
*100;

/* Number of Current salaries within 1 standard deviation of the current highest salary 
((That was tricky, have to remember to pull current on all data entered)).*/

-- BONUS 1:
-- Find the department names for departments that have female managers.
SELECT dept_name AS 'Department', first_name AS 'First Name', last_name AS 'Last Name'
FROM 
(
SELECT *
FROM dept_manager dm
JOIN employees e
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE e.gender = 'F' AND dm.to_date >= NOW()
)fm;

-- BONUS 2:
-- Name of the employee with highest Salary
SELECT CONCAT (first_name, ' ', last_name) AS 'Highest Paid Employee'
FROM employees
JOIN salaries
USING (emp_no)
WHERE salary = (SELECT Max(salary) FROM salaries WHERE to_date >= NOW());

-- BONUS 3:
-- Find the department name that the employee with the higest salary works in

SELECT d.dept_name AS "Department of Highest Salary Employee"
FROM dept_emp de
JOIN departments d
USING (dept_no)
JOIN employees
USING (emp_no)
JOIN salaries s
USING (emp_no)
WHERE salary = (SELECT Max(salary) FROM salaries WHERE to_date >= NOW());