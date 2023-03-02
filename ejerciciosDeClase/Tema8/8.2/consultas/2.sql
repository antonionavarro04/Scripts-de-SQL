-- 2. Número de autores diferentes en cada ciudad y estado
USE pubs

SELECT city AS 'Ciudad', state AS 'Estado', COUNT(*) AS 'Número de Autores'
FROM authors
GROUP BY city, state
ORDER BY COUNT(*) DESC

GO
