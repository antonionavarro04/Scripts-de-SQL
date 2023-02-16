-- Título, precio y notas de los libros (titles) que tratan de cocina, ordenados de mayor a menor precio.

GO
USE pubs

SELECT title, price, notes
FROM titles
WHERE type LIKE '%cook'
ORDER BY price DESC
