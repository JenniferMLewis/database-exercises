USE mysql;
USE employees;
SELECT DISTINCT title FROM titles;
-- 7 Unique Titles
SELECT last_name FROM employees WHERE last_name LIKE 'E%E'
GROUP BY last_name;
-- 5 Unique Last Names
SELECT CONCAT(first_name,' ', last_name) AS Unique_Names FROM employees WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;
-- 846 Unique Combinations of Full Names where the last name is ending and starting in E
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- 3 Unique Last Name with q but not qu
SELECT last_name, count(*) AS n_same_last_name
FROM employees
WHERE last_name LIKE '%q%' AND  last_name NOT LIKE '%qu%'
GROUP BY last_name
HAVING n_same_last_name;
/* Chleq has 189 people, Lindqvist has 190, and Qiwen has 168 */
SELECT count(gender),gender, first_name FROM employees WHERE first_name in ( 'Irena' , 'Vidya' , 'Maya') group by gender,first_name;
/* There are 151 Male Vidya, 146 Male Maya, 144 Male Irena, 97 Female Irena, 90 Female Maya and, 81 Female Vidya */
SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username, COUNT(*) AS unique_username FROM employees GROUP BY username HAVING unique_username >1;
/* There are duplicates, There are 13,251 usernames with at least two employees who share the name */ 