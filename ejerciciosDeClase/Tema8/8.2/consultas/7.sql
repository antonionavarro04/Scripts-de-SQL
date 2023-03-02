-- 7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000, ordenado por tipo y título
USE pubs

SELECT title_id AS 'ID', title AS 'Título', type AS 'Tipo', price AS 'Precio'
FROM titles
WHERE advance > 7000
ORDER BY type, title

GO
