USE mysql;
USE employees;
SHOW tables;
DESCRIBE employees;
SELECT distinct title FROM titles;
SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
LIMIT 10;
/* 'Zykh'
'Zyda'
'Zwicker'
'Zweizig'
'Zumaque'
'Zultner'
'Zucker'
'Zuberek'
'Zschoche'
'Zongker'
*/
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND (
birth_date LIKE '%12-25'
)
ORDER BY hire_date ASC
LIMIT 5;
/* Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup */
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND (
birth_date LIKE '%12-25'
)
ORDER BY hire_date ASC
LIMIT 5 OFFSET 50;
/* Christophe Baca, Moie Birsak, Chikako Ibel, Shounak Jansen, Zhigen, Boissier. 
Limit says how many items I can see at once making a "Page" Offset says where do 
I want the pages to start at, so for this I want the 10th page so I need the number 
of items on the page times the number of pages I want to go.*/

