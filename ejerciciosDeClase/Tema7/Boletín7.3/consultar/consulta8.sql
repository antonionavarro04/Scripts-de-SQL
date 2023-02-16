-- ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfabéticamente

GO
USE pubs

SELECT emp_id, job_lvl, fname + ' ' + lname AS 'Full Name'
FROM employee
WHERE job_lvl < 100
ORDER BY fname, lname
