USE mysql;
SHOW DATABASES;
USE employees;
SHOW TABLES;
-- Which Table(s) do you think contain a numberic type column? Salaries
-- Which Table(s) do you think contain a string type column? Departments, Titles, Employees
-- Which Table(s) do you think contain a date type column?  dept_emp, dept_manager
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE salaries;
DESCRIBE departments;
DESCRIBE titles;
DESCRIBE employees;
-- Answers to previous questions after examining the Tables:
-- Which Table(s) do you think contain a numberic type column? Salaries, dept_emp, dept_manager, Titles, Employees
-- Which Table(s) do you think contain a string type column? Departments, Titles, Employees, dept_emp, dept_manager
-- Which Table(s) do you think contain a date type column?  dept_emp, dept_manager, Salaries, Titles, Employees

-- What is the relationship between the employees and the departments tables? All Employees are in a department.
SHOW CREATE TABLE dept_manager;
-- CREATE TABLE `dept_manager` ( `emp_no` int NOT NULL,  `dept_no` char(4) NOT NULL,  `from_date` date NOT NULL,  `to_date` date NOT NULL,  PRIMARY KEY (`emp_no`,`dept_no`),  KEY `dept_no` (`dept_no`),  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT ) ENGINE=InnoDB DEFAULT CHARSET=latin1'
-- OR
-- CREATE TABLE `dept_manager` (
--  `emp_no` int NOT NULL,
--  `dept_no` char(4) NOT NULL,
--  `from_date` date NOT NULL,
--  `to_date` date NOT NULL,
-- PRIMARY KEY (`emp_no`,`dept_no`),
--  KEY `dept_no` (`dept_no`),
--  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1
