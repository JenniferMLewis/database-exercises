USE employees;
SHOW TABLES;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

-- FINISH INDEXES START JOINS

-- Departments and CURRENT managers
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name'
FROM salaries s
JOIN dept_manager dm
USING (emp_no)
JOIN departments d
USING (dept_no)
JOIN employees e
USING (emp_no)
WHERE s.to_date >= NOW() AND dm.to_date >=NOW();

-- Find the name of all departments currently managed by women.
SELECT dept_name AS 'Department Name',CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM departments d 
JOIN dept_manager dm 
USING(dept_no) 
LEFT JOIN employees e 
USING(emp_no)
WHERE dm.to_date >= NOW()and gender like '%F%';

 select * from departments;
-- Find the current titles of employees currently working in the customer service department
/* My longer code, not as pretty as the code the table worked on together
SELECT t.title AS 'Title', COUNT(*) AS Count
FROM titles t
JOIN dept_emp de
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE d.dept_name = 'Customer Service' and de.to_date >= NOW()
AND t.to_date >= NOW()
GROUP BY t.title; */

-- It's so pretty and concise.
SELECT title AS Title, COUNT(*)
FROM titles t
JOIN dept_emp de
USING (emp_no)
WHERE de.to_date >= NOW() AND t.to_date >= NOW()
AND de.dept_no = 'd009'
GROUP BY t.title;

-- Each Department manager and their CURRENT salary
/*WHAT?? The first item in SELECT doesn't have to be the table being pulled from the FROM database?! 
This makes life so much easier, I've been trying to juggle everything. */
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Name', d.dept_name AS 'Department Name', salary AS "Salary"
FROM salaries s
JOIN dept_manager dm
USING (emp_no)
JOIN departments d
USING (dept_no)
JOIN employees e
USING (emp_no)
WHERE s.to_date >= NOW() AND dm.to_date >=NOW();

-- Current employees in Each Department
SELECT de.dept_no, d.dept_name, COUNT(*) AS num_employees
FROM employees e
JOIN dept_emp de
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE de.to_date >= NOW()
GROUP BY de.dept_no, d.dept_name;

-- Department with highest average salary
SELECT dept_name AS 'Department Name', AVG(s.salary) AS 'Average Salary'
FROM departments d
JOIN dept_emp de
USING (dept_no)
JOIN salaries s
USING (emp_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW()
GROUP BY d.dept_name
ORDER BY AVG(s.salary)
DESC /*Descending!!!*/ LIMIT 1;

-- Highest Paid Employee in Marketing Department
SELECT first_name, last_name
FROM employees e
JOIN dept_emp de
USING (emp_no)
JOIN salaries s
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW() AND d.dept_name = "Marketing"
GROUP BY e.last_name, e.first_name
ORDER BY MAX(s.salary)
DESC LIMIT 1;

-- Highest paid current department manager
SELECT first_name, last_name, s.salary, d.dept_name
FROM employees e
JOIN dept_emp de
USING (emp_no)
JOIN salaries s
USING (emp_no)
JOIN departments d
USING (dept_no)
JOIN titles t
USING (emp_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW() AND t.to_date >= NOW() AND t.title = "Manager"
GROUP BY e.last_name, e.first_name, s.salary, d.dept_name
ORDER BY MAX(s.salary)
DESC LIMIT 1;

-- Average salary for each department rounded up.
SELECT d.dept_name, round(avg(salary), 0)
FROM salaries s
JOIN dept_emp de
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW()
GROUP BY d.dept_name;

-- 11.
Select concat(managers.first_name, " ", managers.last_name) as "manager_name", dept_name, concat(employees.first_name, " ", employees.last_name) AS "employee Name"
FROM employees AS managers
JOIN dept_manager using (emp_no)
join departments using (dept_no)
Join dept_emp using (dept_no)
Join employees on dept_emp.emp_no = employees.emp_no
WHERE dept_manager.to_date >= NOW();

-- 12
/* Yay.... Subqueries. */
SELECT dmock.dept_name, dmock.sal, salmock.namebo FROM

(SELECT d.dept_name, d.dept_no, MAX(s.salary) AS sal
FROM salaries s
JOIN dept_emp de 
Using(emp_no)
JOIN departments d
Using(dept_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW()
GROUP BY dept_name) dmock

LEFT JOIN
(SELECT CONCAT(e.first_name, " ", e.last_name) namebo, s.salary, d.dept_name
FROM employees e
Join salaries s Using (emp_no)
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no)
WHERE de.to_date > NOW()
AND s.to_date > NOW()) salmock

ON dmock.dept_name = salmock.dept_name AND dmock.sal = salmock.salary;