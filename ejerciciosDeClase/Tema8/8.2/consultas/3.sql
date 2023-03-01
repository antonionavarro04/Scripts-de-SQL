-- 3. Nombre, apellidos, nivel y antigüedad en la empresa de los empleados con un nivel entre 100 y 150.
USE pubs

SELECT fname + ' ' + lname AS 'Nombre', job_lvl AS 'Level', CAST(DATEDIFF(YEAR, hire_date, GETDATE()) AS VARCHAR) + ' Años' AS 'Antigüedad'
FROM employee
WHERE job_lvl BETWEEN 100 AND 150
ORDER BY job_lvl DESC

GO
