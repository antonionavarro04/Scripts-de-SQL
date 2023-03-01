-- 5. Número de unidades vendidas de cada libro en cada año (title_id, unidades y año).
USE pubs

SELECT title_id AS 'Título', SUM(qty) AS 'Unidades Vendidas', YEAR(ord_date) AS 'Año'
FROM sales
GROUP BY title_id, YEAR(ord_date)
ORDER BY SUM(qty) DESC

GO