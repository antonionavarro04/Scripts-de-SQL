-- 1. Numero de libros que tratan de cada tema
USE pubs

SELECT type AS 'Tema', COUNT(*) AS 'Número de Libros'
FROM titles
GROUP BY type
ORDER BY COUNT(*) DESC

GO

-- 2. Número de autores diferentes en cada ciudad y estado
USE pubs

SELECT city AS 'Ciudad', state AS 'Estado', COUNT(*) AS 'Número de Autores'
FROM authors
GROUP BY city, state
ORDER BY COUNT(*) DESC

GO

-- 3. Nombre, apellidos, nivel y antigüedad en la empresa de los empleados con un nivel entre 100 y 150.
USE pubs

SELECT fname + ' ' + lname AS 'Nombre', job_lvl AS 'Level', CAST(DATEDIFF(YEAR, hire_date, GETDATE()) AS VARCHAR) + ' Años' AS 'Antigüedad'
FROM employee
WHERE job_lvl BETWEEN 100 AND 150
ORDER BY job_lvl DESC

GO

-- 4. Número de editoriales en cada país. Incluye el país.
USE pubs

SELECT country AS 'País', COUNT(*) AS 'Número de Editoriales'
FROM publishers
GROUP BY country
ORDER BY COUNT(*) DESC

GO

-- 5. Número de unidades vendidas de cada libro en cada año (title_id, unidades y año).
USE pubs

SELECT title_id AS 'Título', SUM(qty) AS 'Unidades Vendidas', YEAR(ord_date) AS 'Año'
FROM sales
GROUP BY title_id, YEAR(ord_date)
ORDER BY SUM(qty) DESC

GO

-- 6. Número de autores que han escrito cada libro (title_id y numero de autores).
USE pubs

SELECT title_id AS 'Título', COUNT(*) AS 'Número de Autores'
FROM titleauthor
GROUP BY title_id
ORDER BY COUNT(*) DESC

GO

-- 7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000, ordenado por tipo y título
USE pubs

SELECT title_id AS 'ID', title AS 'Título', type AS 'Tipo', price AS 'Precio'
FROM titles
WHERE advance > 7000
ORDER BY type, title

GO

-- ! Antonio Navarro