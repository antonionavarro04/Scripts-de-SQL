-- 1. Numero de libros que tratan de cada tema
USE pubs

SELECT type AS 'Tema', COUNT(*) AS 'Número de Libros'
FROM titles
GROUP BY type
ORDER BY COUNT(*) DESC

GO
