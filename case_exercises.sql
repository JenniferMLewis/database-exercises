SHOW DATABASES;
use leavitt_1876;
use employees;
SHOW TABLES;
DESCRIBE dept_emp;

-- This won't return distinct values no matter how ordered, or using DISTINCT , and google doesn't have any answers of how to fix that.
SELECT concat(first_name, ' ', last_name) as 'Employee Name', de.dept_no, from_date, to_date,
IF (to_date > NOW(), TRUE, FALSE) AS is_current_employee
FROM employees e
JOIN dept_emp de
USING(emp_no)
GROUP BY dept_no, last_name, first_name, to_date, from_date;

-- Sorting by last_name A-H, I-Q, and R-Z

SELECT first_name, last_name, de.dept_no, from_date, to_date,
CASE
WHEN SUBSTRING(last_name, 1,1) BETWEEN 'A' AND 'H' THEN 'A-H'
WHEN SUBSTRING(last_name, 1,1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
WHEN SUBSTRING(last_name, 1,1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
END AS Alpha_Group
FROM employees e
JOIN dept_emp de
USING(emp_no)
GROUP BY dept_no, last_name, first_name, to_date, from_date
ORDER BY last_name, first_name;


SELECT first_name, last_name, birth_date, 
CASE
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1930 AND 1939 THEN '1930s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1940 AND 1940 THEN '1940s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1950 AND 1959 THEN '1950s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1960 AND 1969 THEN '1960s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1970 AND 1979 THEN '1970s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1980 AND 1989 THEN '1980s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 1990 AND 1999 THEN '1990s'
WHEN SUBSTRING(birth_date, 1,4) BETWEEN 2000 AND 2009 THEN '2000s'
END AS 'Birth Decade'
FROM employees
GROUP BY last_name, first_name, birth_date
ORDER BY birth_date, last_name, first_name;

-- Dept Average Salaries

SELECT CONCAT(first_name, ' ', last_name),
    CASE
        WHEN d.dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN d.dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finanace & HR'
        ELSE d.dept_name
    END AS dept_group, salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
JOIN employees e USING (emp_no)
WHERE s.to_date > NOW() AND de.to_date > NOW()
ORDER BY dept_name, salary;

